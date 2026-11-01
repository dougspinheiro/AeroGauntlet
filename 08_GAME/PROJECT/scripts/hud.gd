extends Control
## HUD mínimo de desenvolvimento: lê telemetria do EventBus, nunca da simulação.
## Todo texto vem de chave de localização (nada hardcoded).

@onready var _speed_label: Label = $Speed
@onready var _altitude_label: Label = $Altitude
@onready var _stall_label: Label = $Stall
@onready var _help_label: Label = $Help

const MPS_TO_KNOTS := 1.94384
const M_TO_FEET := 3.28084


func _ready() -> void:
	_stall_label.visible = false
	_help_label.text = Loc.t("hud.help")
	EventBus.telemetry_updated.connect(_on_telemetry_updated)
	EventBus.aircraft_stalled.connect(_on_aircraft_stalled)


func _on_telemetry_updated(data: Dictionary) -> void:
	var knots: float = float(data.get("airspeed_ms", 0.0)) * MPS_TO_KNOTS
	var feet: float = float(data.get("altitude_m", 0.0)) * M_TO_FEET
	_speed_label.text = "%s %d %s" % [Loc.t("hud.speed"), roundi(knots), Loc.t("unit.knots")]
	_altitude_label.text = "%s %d %s" % [Loc.t("hud.altitude"), roundi(feet), Loc.t("unit.feet")]


func _on_aircraft_stalled(is_stalled: bool) -> void:
	_stall_label.visible = is_stalled
	_stall_label.text = Loc.t("hud.stall")
