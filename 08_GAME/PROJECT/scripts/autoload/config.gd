extends Node
## Config — preferências e mapeamento de entrada.
## Registra as ações lógicas em runtime para que o INPUT_MAP.md seja a única verdade
## documental, sem serializar InputEvent no project.godot.

## Mapeamento provisório de desenvolvimento (teclado). NÃO é o mapeamento de release:
## no Quest 2 os eixos vêm dos controles VR (ver INPUT_MAP.md).
const DEV_ACTIONS: Dictionary = {
	"pitch_up": [KEY_W, KEY_UP],
	"pitch_down": [KEY_S, KEY_DOWN],
	"roll_left": [KEY_A, KEY_LEFT],
	"roll_right": [KEY_D, KEY_RIGHT],
	"yaw_left": [KEY_Q],
	"yaw_right": [KEY_E],
	"throttle_up": [KEY_F],
	"throttle_down": [KEY_G],
	"recenter_view": [KEY_R],
	"pause": [KEY_P],
}

## Idioma corrente do jogo. PT-BR é o padrão do projeto.
var locale: String = "pt_BR"


func _ready() -> void:
	_register_dev_actions()
	Log.info("Config", "pronto (%d ações registradas)" % DEV_ACTIONS.size())


func _register_dev_actions() -> void:
	for action_name: String in DEV_ACTIONS:
		if not InputMap.has_action(action_name):
			InputMap.add_action(action_name)
		for keycode: int in DEV_ACTIONS[action_name]:
			var event := InputEventKey.new()
			event.physical_keycode = keycode
			if not InputMap.action_has_event(action_name, event):
				InputMap.action_add_event(action_name, event)
