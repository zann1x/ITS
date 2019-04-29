extends Control

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_LocalTestButton_pressed():
	bytes2var(PoolByteArray([20, 0, 0, 0, 0, 0, 0, 255]))


func _on_ListenerButton_pressed():
	get_tree().change_scene("res://scene/listener.tscn")


func _on_SenderButton_pressed():
	get_tree().change_scene("res://scene/sender.tscn")
