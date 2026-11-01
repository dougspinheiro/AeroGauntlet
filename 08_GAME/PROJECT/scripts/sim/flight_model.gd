class_name FlightModel
extends RefCounted
## Modelo de voo simplificado, determinístico e testável sem engine gráfica.
##
## Não é CFD nem simulação de ficha histórica: é força-resultante calibrada por
## desempenho conhecido (documento mestre §4.1). Integração explícita de Euler com
## passo fixo; sem aleatoriedade, para permitir testes headless reproduzíveis.
##
## Convenções de eixo (Godot): -Z para frente, +Y para cima, +X para a direita.

const GRAVITY := 9.81
const RHO_SEA_LEVEL := 1.225
## Altura de escala da atmosfera (m); rho cai exponencialmente com a altitude.
const ATMOSPHERE_SCALE_HEIGHT := 8500.0
## Abaixo desta velocidade o ar não gera sustentação utilizável.
const MIN_AIRFLOW_SPEED := 1.0
## Perda de sustentação por radiano de excesso sobre o estol.
const POST_STALL_CL_FALLOFF := 4.0
## Arrasto extra em estol (portas abertas de um avião que "bate").
const POST_STALL_CD_PENALTY := 0.15
## Velocidade mínima para a curva coordenada fazer sentido.
const TURN_COORD_MIN_SPEED := 20.0

var def: AircraftDef

var position := Vector3.ZERO
var velocity := Vector3.ZERO
var orientation := Basis.IDENTITY

var throttle := 0.0
var pitch_input := 0.0
var roll_input := 0.0
var yaw_input := 0.0

## Telemetria (somente leitura para o resto do jogo).
var airspeed_ms := 0.0
var alpha_rad := 0.0
var bank_rad := 0.0
var altitude_m := 0.0
var lift_n := 0.0
var drag_n := 0.0
var thrust_n := 0.0
var load_factor := 1.0
var stalled := false


func _init(aircraft_def: AircraftDef) -> void:
	assert(aircraft_def != null, "FlightModel exige um AircraftDef")
	assert(aircraft_def.is_valid(), "AircraftDef inválido: revise mass/wing/cl_alpha")
	def = aircraft_def
	velocity = -orientation.z * def.cruise_speed_ms


## Define o estado inicial (posição no mundo e atitude).
func set_state(new_position: Vector3, new_orientation: Basis, initial_speed: float) -> void:
	position = new_position
	orientation = new_orientation.orthonormalized()
	velocity = -orientation.z * initial_speed


## Comandos em [-1, 1]; throttle em [0, 1].
## pitch > 0 = nariz para cima · roll > 0 = rolagem para a direita ·
## yaw > 0 = guinada para a esquerda (convenção do eixo +Y do Godot).
func set_controls(new_pitch: float, new_roll: float, new_yaw: float, new_throttle: float) -> void:
	pitch_input = clampf(new_pitch, -1.0, 1.0)
	roll_input = clampf(new_roll, -1.0, 1.0)
	yaw_input = clampf(new_yaw, -1.0, 1.0)
	throttle = clampf(new_throttle, 0.0, 1.0)


## Avança a simulação em `delta` segundos. Passo fixo é responsabilidade do chamador.
func integrate(delta: float) -> void:
	if delta <= 0.0:
		return

	var forward: Vector3 = -orientation.z
	var up: Vector3 = orientation.y
	airspeed_ms = velocity.length()
	altitude_m = position.y
	var rho: float = RHO_SEA_LEVEL * exp(-maxf(altitude_m, 0.0) / ATMOSPHERE_SCALE_HEIGHT)

	# Ângulo de ataque: positivo quando o vento relativo vem de baixo do nariz.
	if airspeed_ms > MIN_AIRFLOW_SPEED:
		var velocity_body: Vector3 = orientation.transposed() * velocity
		var forward_speed: float = maxf(-velocity_body.z, 0.1)
		alpha_rad = atan2(-velocity_body.y, forward_speed)
	else:
		alpha_rad = 0.0

	var cl: float = def.cl0 + def.cl_alpha * alpha_rad
	stalled = absf(alpha_rad) > def.alpha_stall_rad
	var cd: float = def.cd0
	if stalled:
		var excess: float = absf(alpha_rad) - def.alpha_stall_rad
		cl *= clampf(1.0 - excess * POST_STALL_CL_FALLOFF, 0.0, 1.0)
		cd += POST_STALL_CD_PENALTY
	cd += def.cd_induced_k * cl * cl

	var dynamic_pressure: float = 0.5 * rho * airspeed_ms * airspeed_ms
	lift_n = dynamic_pressure * def.wing_area_m2 * cl
	drag_n = dynamic_pressure * def.wing_area_m2 * cd
	thrust_n = throttle * def.max_thrust_n
	load_factor = lift_n / (def.mass_kg * GRAVITY)

	var force: Vector3 = Vector3.DOWN * def.mass_kg * GRAVITY
	force += up * lift_n
	force += forward * thrust_n
	if airspeed_ms > MIN_AIRFLOW_SPEED:
		force += -velocity.normalized() * drag_n

	velocity += force / def.mass_kg * delta
	position += velocity * delta

	_update_attitude(delta)


func _update_attitude(delta: float) -> void:
	# Autoridade de comando proporcional ao fluxo de ar: parado, o avião não gira.
	var authority: float = clampf(airspeed_ms / def.cruise_speed_ms, 0.0, 1.5)
	var pitch_rate: float = pitch_input * def.max_pitch_rate_rad * authority
	# +Z no Godot rola para a esquerda; o comando positivo é direita.
	var roll_rate: float = -roll_input * def.max_roll_rate_rad * authority
	var yaw_rate: float = yaw_input * def.max_yaw_rate_rad * authority

	# Curva coordenada: inclinar o avião gera guinada, como no voo real.
	bank_rad = atan2(-orientation.x.y, orientation.y.y)
	if airspeed_ms > TURN_COORD_MIN_SPEED:
		var coordinated: float = -GRAVITY * tan(clampf(bank_rad, -1.2, 1.2)) / airspeed_ms
		yaw_rate += coordinated * def.turn_coordination

	orientation = orientation * Basis.from_euler(Vector3(pitch_rate, yaw_rate, roll_rate) * delta)
	orientation = orientation.orthonormalized()
