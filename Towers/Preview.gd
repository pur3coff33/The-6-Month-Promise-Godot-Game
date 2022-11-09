extends Area2D


var tower_name


var list = []

var platform

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if platform == null and list.size() > 0:
		platform = list.front()
		platform.get_parent().place_tower(tower_name)
	


func _on_Preview_area_entered(area):
	list.push_back(area)
	

func _on_Preview_area_exited(area):
	if area == platform and get_parent().t1_pressed:
		platform.get_parent().cancel()
		platform = null
		
	list.erase(area)
