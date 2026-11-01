extends Node
## Loc — localização por chave, sem texto de interface hardcoded no código.
## Carrega `res://localization/strings.csv` em runtime (não exige import de tradução).

const STRINGS_PATH := "res://localization/strings.csv"

var _translations: Dictionary = {}
var _ready_ok: bool = false


func _ready() -> void:
	_ready_ok = _load_strings()
	if not _ready_ok:
		push_warning("Loc: não foi possível carregar %s" % STRINGS_PATH)


## Retorna o texto da chave no idioma atual; cai para inglês e depois para a chave.
func t(key: String) -> String:
	if _translations.has(key):
		var row: Dictionary = _translations[key]
		var lang: String = Config.locale
		if row.has(lang):
			return str(row[lang])
		if row.has("en"):
			return str(row["en"])
	return key


func _load_strings() -> bool:
	if not FileAccess.file_exists(STRINGS_PATH):
		return false
	var file := FileAccess.open(STRINGS_PATH, FileAccess.READ)
	if file == null:
		return false
	var header: PackedStringArray = []
	while not file.eof_reached():
		var line: String = file.get_line().strip_edges()
		if line.is_empty() or line.begins_with("#"):
			continue
		var cells: PackedStringArray = line.split(",")
		if header.is_empty():
			header = cells
			continue
		if cells.size() < 2:
			continue
		var row: Dictionary = {}
		for index: int in range(1, cells.size()):
			row[header[index]] = cells[index]
		_translations[cells[0]] = row
	return not _translations.is_empty()
