extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var type = "bullet"
var speed = 100
var target
var damage


var dir



# Called when the node enters the scene tree for the first time.
func _ready():
	dir = position.direction_to(target.position)
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	rotation_degrees += 10

	if (target != null):
		move_and_collide(dir * delta * speed)
		
	
func _on_hitbox_area_entered(area):
	
	if (area.get_parent().type == "enemy"):
		area.get_parent().on_hit(damage)
		$fx.play()


func _on_duration_timeout():
	queue_free()


func _on_fx_finished():
	queue_free()
