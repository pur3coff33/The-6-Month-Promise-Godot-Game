extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$CheckButton.pressed = Globals.is_fullscreen
	$music_slider.value = Globals.music_vol
	$fx_slider.value = Globals.fx_vol


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_CheckButton_toggled(button_pressed):
	Globals.change_screen_mode(button_pressed)


func _on_music_slider_value_changed(value):
	Globals.change_music_vol(value)


func _on_fx_slider_value_changed(value):
	Globals.change_fx_vol(value)
	MusicController.click()


func _on_Back_pressed():
	get_tree().change_scene("res://Main.tscn")
