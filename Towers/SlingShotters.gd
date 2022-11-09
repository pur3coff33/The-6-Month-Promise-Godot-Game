extends Sprite

var hero
var platform
var type = "tower"

var damage = 20
var price = 80

var targets = []
var attack_ready = false
const bullet = preload("res://Bullets/Bullet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	$sell/sell_btn.text = "SELL " + str(price * 0.5) + "G"
	hero = get_parent().hero
	if hero == "lugaw":
		$attack_time.set_wait_time(0.4)
		$attack_area.scale = Vector2(1.25, 1.25)
	elif hero == "magno":
		damage += damage * 0.5
	else:
		price = price / 2


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	
	if (targets.size() > 0 and attack_ready):
		
		
		# fire bullet
		var pebble = bullet.instance()
		pebble.damage = damage
		pebble.position = position
		pebble.target = get_target()
		get_parent().add_child(pebble)
		attack_ready = false
		$attack_time.start()

func get_target():
	var targets_progress = []
		
	for target in targets:
		targets_progress.push_back(target.offset)
		
	return targets[targets_progress.find(targets_progress.max())]



func _on_attack_area_area_exited(area):
	var enemy = area.get_parent()
	
	if (enemy.type == "enemy"):
		targets.erase(enemy)

func _on_attack_time_timeout():
	attack_ready = true



func _on_attack_area_area_entered(area):
	var enemy = area.get_parent()
	
	if (enemy.type == "enemy"):
		targets.push_back(enemy)

func _on_click_timer_timeout():
	$attack_area/range.hide()
	$sell/sell_btn.hide()


func _on_sell_btn_pressed():
	get_parent().get_node("GameUI/gold").text = str(int(get_parent().get_node("GameUI/gold").text) + price * 0.5)
	get_parent().tower_list.erase(self)
	platform.show_platform()
	queue_free()


func _on_tower_btn_pressed():
	$attack_area/range.show()
	$sell/sell_btn.show()
	$click_timer.start()

