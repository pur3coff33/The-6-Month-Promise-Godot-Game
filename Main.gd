extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"



# Called when the node enters the scene tree for the first time.
func _ready():
	if not MusicController.get_node("MusicPlayer").playing:
		MusicController.playMain()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_play_released():
	MusicController.click()
	get_tree().change_scene("res://Scenes/LevelSelection.tscn")


func _on_settings_released():
	get_tree().change_scene("res://Scenes/Settings.tscn")
	MusicController.click()
	


func _on_quit_released():
	get_tree().quit()
	
