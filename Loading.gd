extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var count = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	$hp_bar.max_value = randi() % 10 + 10
	$brgy.text = "Barangay " + str(Globals.next_level)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	
	count = count + 1
	$hp_bar.value = count
	if count == $hp_bar.max_value + 1:
		$completed.text = "COMPLETED"
		$Start.show()
		$hp_bar/Timer.stop()


func _on_Start_pressed():
	get_tree().change_scene("res://Scenes/Level" + str(Globals.next_level) + ".tscn")
