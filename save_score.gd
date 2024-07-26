extends Node

const FILE_NAME: String = "user://save.dat"

func create_save_file() -> void:
	if !FileAccess.file_exists(FILE_NAME):
		FileAccess.open(FILE_NAME, FileAccess.WRITE)

func save(content: String = "0") -> void:
	var file = FileAccess.open(FILE_NAME, FileAccess.WRITE)
	file.store_string(content)
	
func load() -> int:
	var file = FileAccess.open(FILE_NAME, FileAccess.READ)
	var content = file.get_as_text()
	return int(content)
