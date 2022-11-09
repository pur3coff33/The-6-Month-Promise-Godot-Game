extends PathFollow2D

var type = "enemy"

var hp = 2000
var movement_speed = 25
var dmg_dealt = 5

var hero 

# Called when the node enters the scene tree for the first time.
func _ready():
	hero = get_parent().get_parent().hero
	$hp_bar.max_value = hp
	$hp_bar.value = hp

func _process(delta):
	
	z_index = position.y
	
	var last_x = position.x
	
	set_offset(get_offset() + movement_speed * delta)
	
	$AnimatedSprite.flip_h = last_x - position.x > 0.1
	
	if (unit_offset >= 1):
		get_parent().get_parent().get_node("GameUI/heart").text = str(int(get_parent().get_parent().get_node("GameUI/heart").text)-dmg_dealt)
		if int(get_parent().get_parent().get_node("GameUI/heart").text) <= 0:
			Globals.score = int(get_parent().get_parent().get_node("GameUI/gold").text)
			get_tree().change_scene("res://Scenes/Defeat.tscn")
		get_parent().get_parent().enemies.erase(self)
		queue_free()
		

func on_hit(dmg):
	
	# pre calculate weakness and str
	
	if (hero == "sinovac"):
		dmg += dmg * 0.15
	
	hp -= dmg
	
	$hp_bar.value = hp
	
	if (hp <= 0):
		get_parent().get_parent().get_node("GameUI/gold").text = str(int(get_parent().get_parent().get_node("GameUI/gold").text) + 25)
		get_parent().get_parent().enemies.erase(self)
		queue_free()


