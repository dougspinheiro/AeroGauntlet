extends Area3D
class_name GauntletGate

signal gate_passed(gate_id: int)

@export var gate_id: int = 0
@export var next_gate_path: NodePath

var _passed := false


func _ready() -> void:
	body_entered.connect(_on_body_entered)


func _on_body_entered(body: Node) -> void:
	if _passed:
		return
	if not body.is_in_group("player"):
		return
	_passed = true
	gate_passed.emit(gate_id)
