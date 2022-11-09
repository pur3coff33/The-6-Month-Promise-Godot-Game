extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"



# Called when the node enters the scene tree for the first time.
func _ready():
	
	if Globals.levels[1]:
		$lvl2.show()
		$lock2.hide()
		
	if Globals.levels[2]:
		$lvl3.show()
		$lock3.hide()
		
	if Globals.levels[3]:
		$lvl4.show()
		$lock4.hide()
		
	if Globals.levels[4]:
		$lvl5.show()
		$lock5.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_back_released():
	MusicController.click()
	get_tree().change_scene("res://Main.tscn")
	


func _on_lvl1_released():
	MusicController.click()
	Globals.next_level = 1
	get_tree().change_scene("res://Loading.tscn")
	


func _on_lvl2_released():
	MusicController.click()
	Globals.next_level = 2
	get_tree().change_scene("res://Loading.tscn")
	




func _on_lvl3_released():
	MusicController.click()
	Globals.next_level = 3
	get_tree().change_scene("res://Loading.tscn")
	


func _on_lvl4_released():
	MusicController.click()
	Globals.next_level = 4
	get_tree().change_scene("res://Loading.tscn")


func _on_lvl5_released():
	MusicController.click()
	Globals.next_level = 5
	get_tree().change_scene("res://Loading.tscn")
