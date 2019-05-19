extends Node

const SAVE_PATH_VAR = "res://save.bin"

func _ready():
	pass


func _on_SaveGameButton_pressed():
 	# Store data as variant
	var save_file = File.new()
	save_file.open(SAVE_PATH_VAR, File.WRITE)
	
	save_file.store_var([4, 7])
	save_file.close()
	print("file saved")


func _on_LoadGameButton_pressed():
	# Load data saved as variant
	var save_file = File.new()
	if not save_file.file_exists(SAVE_PATH_VAR):
		print("Save file does not exist")
		return
	save_file.open(SAVE_PATH_VAR, File.READ)

	var data = save_file.get_var()
	print(data)
