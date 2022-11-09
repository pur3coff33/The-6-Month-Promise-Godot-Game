extends PathFollow2D

var type = "enemy"

var hp = 400
var movement_speed = 30
var dmg_dealt = 1

var hero

var last_x = position.x

# Called when the node enters the scene tree for the first time.
func _ready():
	hero = get_parent().get_parent().hero
	$hp_bar.max_value = hp
	$hp_bar.value = hp

func _process(delta):
	
	last_x = position.x
	
	set_offset(get_offset() + movement_speed * delta)
	
	$AnimatedSprite.flip_h = last_x - position.x > 0.1
	
	z_index = position.y
	
	
	if (unit_offset >= 1):
		get_parent().get_parent().get_node("GameUI/heart").text = str(int(get_parent().get_parent().get_node("GameUI/heart").text)-dmg_dealt)
		get_parent().get_parent().enemies.erase(self)
		if int(get_parent().get_parent().get_node("GameUI/heart").text) <= 0:
			Globals.score = int(get_parent().get_parent().get_node("GameUI/gold").text)
			get_tree().change_scene("res://Scenes/Defeat.tscn")
			
		queue_free()
		

func on_hit(dmg):
	
	# pre calculate weakness and str
	
	if (hero == "lugaw"):
		dmg += dmg * 0.15

	
	hp -= dmg
	
	$hp_bar.value = hp
	
	if (hp <= 0):
		get_parent().get_parent().get_node("GameUI/gold").text = str(int(get_parent().get_parent().get_node("GameUI/gold").text) + 20)
		get_parent().get_parent().enemies.erase(self)
		queue_free()



