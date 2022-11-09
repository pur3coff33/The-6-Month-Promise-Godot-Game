extends StaticBody2D

var type = "tower"

var targets = []

var attack_ready = true

const bullet = preload("res://Bullets/Pebble.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	if (targets.size() > 0 and attack_ready):
		attack(targets.front())
		attack_ready = false
		$attack_cd.start()

func attack(target):
	# turn character to enemy correctly
	$Sprite.flip_h = target.position.x < position.x
	
	# fire bullet
	var pebble = bullet.instance()
	pebble.position = $bullet_position.global_position
	pebble.target = target
	get_parent().add_child(pebble)
	
	
	
	

func _on_attack_area_area_entered(area):
	
	var enemy = area.get_parent()
	
	if (enemy.type == "enemy"):
		targets.push_back(enemy)



func _on_attack_area_area_exited(area):
	
	var enemy = area.get_parent()
	
	if (enemy.type == "enemy"):
		targets.erase(enemy)


func _on_attack_cd_timeout():
	attack_ready = true
	
