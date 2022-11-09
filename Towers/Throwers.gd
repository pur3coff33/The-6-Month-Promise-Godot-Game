extends Sprite

var type = "tower"
var platform

var damage = 40
var price = 50

var targets = []
var attack_ready = true
const bullet = preload("res://Bullets/Pebble.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


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


func _on_Area2D_area_entered(area):
	var enemy = area.get_parent()
	
	if (enemy.type == "enemy"):
		targets.push_back(enemy)

func _on_attack_area_area_exited(area):
	var enemy = area.get_parent()
	
	if (enemy.type == "enemy"):
		targets.erase(enemy)

func _on_attack_time_timeout():
	attack_ready = true
	
func _on_click_timer_timeout():
	$attack_area/range.hide()
	$sell_btn.hide()


func _on_sell_btn_pressed():
	get_parent().get_node("GameUI/gold").text = str(int(get_parent().get_node("GameUI/gold").text) + price * 0.5)
	get_parent().tower_list.erase(self)
	platform.show()
	queue_free()


func _on_tower_btn_pressed():
	$attack_area/range.show()
	$sell_btn.show()



