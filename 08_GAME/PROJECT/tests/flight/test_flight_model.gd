extends SceneTree
## Testes headless do modelo de voo. Determinísticos, sem engine gráfica.
## Execução:
##   godot --headless --path 08_GAME/PROJECT --script res://tests/flight/test_flight_model.gd
## Saída: "PASS ..." por verificação; código de saída != 0 em caso de falha.

const DT := 1.0 / 72.0
const DEF_PATH := "res://data/aircraft/test_trainer.tres"

var _failures := 0
var _checks := 0


func _initialize() -> void:
	var def: AircraftDef = load(DEF_PATH) as AircraftDef
	if def == null:
		_fail("nao foi possivel carregar %s" % DEF_PATH)
		_finish()
		return

	_test_def(def)
	_test_cruise_lift(def)
	_test_throttle_accelerates(def)
	_test_stall_detected(def)
	_test_determinism(def)
	_test_no_nan(def)
	_finish()


func _test_def(def: AircraftDef) -> void:
	_expect(def.is_valid(), "AircraftDef carregado e valido")
	_expect(def.aircraft_id != "", "aircraft_id preenchido")
	_expect(def.mass_kg > 0.0 and def.wing_area_m2 > 0.0, "massa e area alar positivas")


func _test_cruise_lift(def: AircraftDef) -> void:
	var model := FlightModel.new(def)
	model.set_state(Vector3(0, 3000, 0), Basis.IDENTITY, def.cruise_speed_ms)
	model.set_controls(0.0, 0.0, 0.0, 0.55)
	for i in 288:  # 4 s a 72 Hz
		model.integrate(DT)
	_expect(model.load_factor > 0.3 and model.load_factor < 3.0,
		"fator de carga plausivel em cruzeiro (%.2f g)" % model.load_factor)
	_expect(model.airspeed_ms > 30.0, "velocidade nao colapsa em 4 s (%.1f m/s)" % model.airspeed_ms)


func _test_throttle_accelerates(def: AircraftDef) -> void:
	var fast := FlightModel.new(def)
	var slow := FlightModel.new(def)
	fast.set_state(Vector3(0, 3000, 0), Basis.IDENTITY, 90.0)
	slow.set_state(Vector3(0, 3000, 0), Basis.IDENTITY, 90.0)
	fast.set_controls(0.0, 0.0, 0.0, 1.0)
	slow.set_controls(0.0, 0.0, 0.0, 0.0)
	for i in 720:  # 10 s
		fast.integrate(DT)
		slow.integrate(DT)
	_expect(fast.airspeed_ms > slow.airspeed_ms + 5.0,
		"manete cheia acelera mais que manete zero (%.1f vs %.1f m/s)" % [fast.airspeed_ms, slow.airspeed_ms])


func _test_stall_detected(def: AircraftDef) -> void:
	var model := FlightModel.new(def)
	model.set_state(Vector3(0, 3000, 0), Basis.IDENTITY, 40.0)
	# Vento relativo vindo de baixo: angulo de ataque acima do estol.
	model.velocity = Vector3(0.0, -20.0, -40.0)
	model.integrate(DT)
	_expect(model.stalled, "estol detectado em angulo alto (alpha %.1f graus)" % rad_to_deg(model.alpha_rad))
	# A sustentacao deve cair em relacao ao mesmo CL fora do estol.
	_expect(model.lift_n < 0.5 * def.mass_kg * FlightModel.GRAVITY * 2.0,
		"sustentacao degradada em estol (%.0f N)" % model.lift_n)


func _test_determinism(def: AircraftDef) -> void:
	var a := FlightModel.new(def)
	var b := FlightModel.new(def)
	for model in [a, b]:
		model.set_state(Vector3(0, 2500, 0), Basis.IDENTITY, 95.0)
		model.set_controls(0.2, -0.3, 0.1, 0.8)
	for i in 360:
		a.integrate(DT)
		b.integrate(DT)
	_expect(a.position.is_equal_approx(b.position), "posicao identica com entradas identicas")
	_expect(a.velocity.is_equal_approx(b.velocity), "velocidade identica com entradas identicas")


func _test_no_nan(def: AircraftDef) -> void:
	var model := FlightModel.new(def)
	model.set_state(Vector3(0, 2000, 0), Basis.IDENTITY, 80.0)
	var rng := RandomNumberGenerator.new()
	rng.seed = 1234
	for i in 1080:  # 15 s com comandos variaveis, com semente fixa
		model.set_controls(rng.randf_range(-1.0, 1.0), rng.randf_range(-1.0, 1.0),
			rng.randf_range(-1.0, 1.0), rng.randf_range(0.0, 1.0))
		model.integrate(DT)
	_expect(model.position.is_finite() and model.velocity.is_finite()
		and is_finite(model.airspeed_ms), "sem NaN/infinito em 15 s de comandos variaveis")


func _expect(condition: bool, description: String) -> void:
	_checks += 1
	if condition:
		print("PASS  ", description)
	else:
		_failures += 1
		print("FAIL  ", description)


func _fail(message: String) -> void:
	_checks += 1
	_failures += 1
	print("FAIL  ", message)


func _finish() -> void:
	print("---")
	print("check: %d | falhas: %d" % [_checks, _failures])
	quit(1 if _failures > 0 else 0)
