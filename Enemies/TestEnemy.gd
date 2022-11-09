extends PathFollow2D

var type = "enemy"

var hp = 800

var movement_speed = 50

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	set_offset(get_offset() + movement_speed * delta)
	
	if (unit_offset >= 1):
		queue_free()
		

func on_hit(dmg):
	hp -= dmg
	
	if (hp <= 0):
		queue_free()




func _on_TouchScreenButton_pressed():
	queue_free()
