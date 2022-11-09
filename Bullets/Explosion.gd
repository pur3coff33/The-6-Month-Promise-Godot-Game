extends CPUParticles2D

var type = "aoe"

var damage
var par 


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_aoe_area_entered(area):
	
	if(area.get_parent().type == "enemy"):
		area.get_parent().on_hit(damage)
		$fx.play()
		


func _on_duration_timeout():
	queue_free()
