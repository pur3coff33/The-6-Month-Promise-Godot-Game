extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var type = "bullet"
var speed = 80
var target
var damage


var dir

const explosion = preload("res://Bullets/Explosion.tscn")



# Called when the node enters the scene tree for the first time.
func _ready():
	dir = position.direction_to(target.position)
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	rotation_degrees += 10

		
	move_and_collide(dir * delta * speed)
		

	
		
	
func _on_hitbox_area_entered(area):
	
	if (area.get_parent().type == "enemy"):
		
		var expl = explosion.instance()
		expl.damage = damage
		expl.position = position
		get_parent().add_child(expl)
		speed = 0
		$Sprite.hide()


func _on_duration_timeout():
	queue_free()
