extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var tower

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func place_tower(tower_name):
	tower = load("res://Towers/" + tower_name + ".tscn").instance()
	tower.position = position
	get_parent().add_child(tower)
	
func build_tower():
	
	
	if int(get_parent().get_node("GameUI/gold").text) >= tower.price:
		$build_success.play()
		get_parent().get_node("GameUI/gold").text = str(int(int(get_parent().get_node("GameUI/gold").text)) - tower.price)
		tower.attack_ready = true
		tower.get_node("tower_btn").show()
		tower.get_node("attack_area/range").hide()
		tower.get_node("attack_time").start()
		tower.platform = self
		get_parent().tower_list.push_back(tower)
	else:
		$cancel_build.play()
		cancel()
	
func show_platform():
	$area/CollisionShape2D.disabled = false
	show()	
	
func hide_platform():
	$area/CollisionShape2D.disabled = true
	hide()

func cancel():

	if tower != null:
		tower.queue_free()
		


func _on_build_success_finished():
	hide_platform()
