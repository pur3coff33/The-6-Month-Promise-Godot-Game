extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$score.text = str(Globals.score)
	Engine.time_scale = 1
	MusicController.stopMusic()
	MusicController.playMain()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_TouchScreenButton_released():
	get_tree().change_scene("res://Scenes/LevelSelection.tscn")
