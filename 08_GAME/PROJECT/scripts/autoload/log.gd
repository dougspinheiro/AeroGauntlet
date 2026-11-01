extends Node
## Log — log estruturado mínimo.
## Regra do projeto: nenhum dado pessoal no log; nenhum `print` solto no código.

enum Level { DEBUG, INFO, WARN, ERROR }

var min_level: Level = Level.INFO


func debug(tag: String, message: String) -> void:
	_write(Level.DEBUG, tag, message)


func info(tag: String, message: String) -> void:
	_write(Level.INFO, tag, message)


func warn(tag: String, message: String) -> void:
	_write(Level.WARN, tag, message)


func error(tag: String, message: String) -> void:
	_write(Level.ERROR, tag, message)


func _write(level: Level, tag: String, message: String) -> void:
	if level < min_level:
		return
	var label: String = ["DEBUG", "INFO", "WARN", "ERROR"][level]
	print("[%s] %s: %s" % [label, tag, message])
