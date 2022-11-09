extends Node2D


var enemies = []
var tower_list = []

var hero = "lugaw"

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var game_times = [10, 20, 40, 60]
var gold = 120
var enemy_count = 0


var game_over = false


func _process(delta):
	if $GameUI.current == game_times.size() - 1 and enemies.empty() and game_over == false and $GameUI/progress.value == $GameUI/progress.max_value:
		game_over = true
		Globals.score = int($GameUI/gold.text)
		Globals.levels[2] = true
		Globals.saveData()
		get_tree().change_scene("res://Scenes/Victory.tscn")
		
		
	


# Called when the node enters the scene tree for the first time.
func _ready():
	pass



func _on_lugaw_released():
	$HeroSelection.hide()
	$GameUI.show()
	$GameUI.game()


func _on_magno_released():
	$HeroSelection.hide()
	$GameUI.show()
	hero = "magno"
	$GameUI.game()


func _on_sinovac_released():
	$HeroSelection.hide()
	$GameUI.show()
	hero = "sinovac"
	$GameUI.game()
