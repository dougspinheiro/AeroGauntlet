class_name AircraftDef
extends Resource
## Contrato de dados de uma aeronave (documento mestre §3.3).
## Todos os campos usam unidades do SI: metros, segundos, newton, radiano.
## Parâmetros aqui são de GAMEPLAY calibrado, não dados de ficha histórica validada.

@export var aircraft_id: String = "test_trainer"
@export var display_name: String = "Test Trainer"
@export var era: String = "proto"

@export_group("Massa e asa")
@export var mass_kg: float = 1100.0
@export var wing_area_m2: float = 16.0

@export_group("Sustentação")
## Coeficiente de sustentação com ângulo de ataque zero.
@export var cl0: float = 0.15
## Inclinação da curva CL(alpha), por radiano.
@export var cl_alpha: float = 5.0
## Ângulo de estol em radianos (~15°).
@export var alpha_stall_rad: float = 0.26

@export_group("Arrasto")
@export var cd0: float = 0.028
## Fator de arrasto induzido: CD = cd0 + k * CL^2.
@export var cd_induced_k: float = 0.05

@export_group("Propulsão")
@export var max_thrust_n: float = 6000.0

@export_group("Comandos")
@export var max_pitch_rate_rad: float = 1.2
@export var max_roll_rate_rad: float = 2.6
@export var max_yaw_rate_rad: float = 0.5
## 0 = sem curva coordenada; 1 = curva totalmente automática ao inclinar.
@export_range(0.0, 1.0) var turn_coordination: float = 0.8

@export_group("Referência de voo")
@export var cruise_speed_ms: float = 100.0


func is_valid() -> bool:
	return mass_kg > 0.0 and wing_area_m2 > 0.0 and max_thrust_n >= 0.0 \
		and cl_alpha > 0.0 and alpha_stall_rad > 0.05 and cruise_speed_ms > 1.0
