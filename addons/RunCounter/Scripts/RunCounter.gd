extends Node

const DESTINATION = "user://"
const FILE_NAME = "RunCounter.txt"

var _file_path : String


func _init() -> void:
	_file_path = DESTINATION + FILE_NAME


func _ready() -> void:	
	if OS.has_feature("editor"):
		_increment_runs()


func _increment_runs():
	var file := FileAccess.open(_file_path, FileAccess.READ_WRITE)
	
	if file:
		var count : = file.get_as_text().to_int() + 1
		file.store_string(str(count))
	else:	
		file = FileAccess.open(_file_path, FileAccess.WRITE_READ)
		file.store_string(str(1))
