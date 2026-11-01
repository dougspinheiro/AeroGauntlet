extends Node3D
class_name GauntletManager

@onready var gates: Node3D = $Gates
@onready var timer_label: Label3D = get_node_or_null("TimerDisplay/Timer")

var _time := 0.0
var _started := false
var _finished := false
var _next_gate := 0
var _gate_count := 0


func _ready() -> void:
	_gate_count = gates.get_child_count()
	for i in range(_gate_count):
		var g = gates.get_child(i)
		if g.has_signal("gate_passed"):
			g.gate_passed.connect(_on_gate_passed)
		if "gate_id" in g:
			g.gate_id = i
	# Add player to group
	var player = get_tree().get_first_node_in_group("player")
	if player == null:
		player = find_child("Aircraft", true, false)
		if player and not player.is_in_group("player"):
			player.add_to_group("player")
	_started = true
	Log.info("Gauntlet started with %d gates" % _gate_count)


func _process(delta: float) -> void:
	if not _started or _finished:
		return
	_time += delta
	if timer_label:
		timer_label.text = "%.2f" % _time


func _on_gate_passed(gate_id: int) -> void:
	if _finished:
		return
	if gate_id == _next_gate:
		_next_gate += 1
		Log.info("Gate %d passed" % gate_id)
		if _next_gate >= _gate_count:
			_finish()


func _finish() -> void:
	_finished = true
	if timer_label:
		timer_label.text = "FINISH: %.2f" % _time
	Log.info("Gauntlet complete in %.3f s" % _time)
