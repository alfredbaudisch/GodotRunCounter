@tool
extends EditorPlugin

const DESTINATION = "user://"
const FILE_NAME = "RunCounter.txt"

var _file_path : String
var _runs : int


func _init() -> void:
	name = "RunCounterPlugin"
	_file_path = DESTINATION + FILE_NAME


func _enter_tree() -> void:
	_runs = 0
	_save_to_file(true)


func _build() -> bool:
	_runs += 1
	_save_to_file()
	return true


func _save_to_file(is_init := false) -> void:
	var file := FileAccess.open(_file_path, FileAccess.READ_WRITE)
	
	# File does not exist, create it
	if not file:
		file = FileAccess.open(_file_path, FileAccess.WRITE_READ)
	
	# Get existing run count
	elif file and is_init:
		_runs = file.get_as_text().to_int()
		file.close()
		return

	if file:
		file.store_string(str(_runs))
		file.close()

