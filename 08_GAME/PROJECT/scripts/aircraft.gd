class_name Aircraft
extends Node3D
## Aeronave jogável: lê comandos, avança o modelo de voo e publica telemetria.
##
## Camada de jogo. Não desenha HUD e não conhece a apresentação: apenas emite no
## EventBus (documento mestre §3.1).

@export var def: AircraftDef
## Manete inicial em [0, 1].
@export_range(0.0, 1.0) var start_throttle: float = 0.7
## Velocidade inicial em m/s.
@export var start_speed_ms: float = 90.0

@onready var _camera: Camera3D = $CockpitCamera

var model: FlightModel

var _start_position := Vector3.ZERO
var _start_orientation := Basis.IDENTITY
var _throttle := 0.7
var _look_yaw := 0.0
var _look_pitch := 0.0
var _telemetry_accumulator := 0.0
var _was_stalled := false


func _ready() -> void:
	assert(def != null, "Aircraft exige um AircraftDef")
	_start_position = global_position
	_start_orientation = global_transform.basis.orthonormalized()
	model = FlightModel.new(def)
	model.set_state(_start_position, _start_orientation, start_speed_ms)
	_throttle = start_throttle
	model.throttle = _throttle
	if DisplayServer.get_name() != "headless":
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	EventBus.flight_started.emit(def.aircraft_id)
	Log.info("Aircraft", "%s pronto a %.0f m/s" % [def.display_name, start_speed_ms])


func _physics_process(delta: float) -> void:
	_read_controls(delta)
	model.integrate(delta)
	global_transform = Transform3D(model.orientation, model.position)
	_publish_telemetry(delta)
	_check_ground_contact()


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		var motion := event as InputEventMouseMotion
		_look_yaw = clampf(_look_yaw - motion.relative.x * 0.002, -1.2, 1.2)
		_look_pitch = clampf(_look_pitch - motion.relative.y * 0.002, -0.8, 0.8)
	elif event.is_action_pressed("recenter_view"):
		_look_yaw = 0.0
		_look_pitch = 0.0
	elif event.is_action_pressed("ui_cancel"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	if _camera != null:
		_camera.rotation = Vector3(_look_pitch, _look_yaw, 0.0)


func _read_controls(delta: float) -> void:
	var pitch: float = Input.get_axis("pitch_down", "pitch_up")
	var roll: float = Input.get_axis("roll_left", "roll_right")
	var yaw: float = Input.get_axis("yaw_right", "yaw_left")
	if Input.is_action_pressed("throttle_up"):
		_throttle = minf(_throttle + 0.5 * delta, 1.0)
	if Input.is_action_pressed("throttle_down"):
		_throttle = maxf(_throttle - 0.5 * delta, 0.0)
	model.set_controls(pitch, roll, yaw, _throttle)


func _publish_telemetry(delta: float) -> void:
	_telemetry_accumulator += delta
	if _telemetry_accumulator >= 0.1:
		_telemetry_accumulator = 0.0
		EventBus.telemetry_updated.emit({
			"airspeed_ms": model.airspeed_ms,
			"altitude_m": model.altitude_m,
			"throttle": model.throttle,
			"alpha_deg": rad_to_deg(model.alpha_rad),
			"load_factor": model.load_factor,
			"stalled": model.stalled,
		})
	if model.stalled != _was_stalled:
		_was_stalled = model.stalled
		EventBus.aircraft_stalled.emit(model.stalled)
		if model.stalled:
			Log.warn("Aircraft", "estol a %.0f m/s" % model.airspeed_ms)


func _check_ground_contact() -> void:
	if model.position.y < 1.0:
		Log.warn("Aircraft", "contato com o solo: reiniciando o voo")
		reset_flight()


## Volta ao estado inicial. Não recria o modelo, para preservar os contratos.
func reset_flight() -> void:
	_look_yaw = 0.0
	_look_pitch = 0.0
	_throttle = start_throttle
	model.set_controls(0.0, 0.0, 0.0, _throttle)
	model.set_state(_start_position, _start_orientation, start_speed_ms)
	global_transform = Transform3D(model.orientation, model.position)
	EventBus.flight_started.emit(def.aircraft_id)
