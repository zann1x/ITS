extends Node

const SAVE_PATH = "res://save.json"

func _ready():
	pass


func _on_SaveGameButton_pressed():
	var save_file = File.new()
	save_file.open(SAVE_PATH, File.WRITE);
	
	var save_dict = {}
	save_dict["data1"] = "what is love"
	save_dict["data2"] = "baby don't hurt me"
	save_dict["data3"] = 42
	
	save_file.store_line(to_json(save_dict))
	save_file.close()
	print("file saved")


func _on_LoadGameButton_pressed():
	var save_file = File.new()
	if not save_file.file_exists(SAVE_PATH):
		print("Save file does not exist")
		return
	save_file.open(SAVE_PATH, File.READ)
	
	var data = parse_json(save_file.get_as_text())
	print(data)
