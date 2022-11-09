extends Timer


export var minTime = 1.0
export var maxTime = 5.0
export var wave = 1

export var enemy_type = "Judicial"
var enemy

var is_start = false
var is_stop = false


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	set_wait_time(rand_range(minTime,maxTime))
	enemy = load("res://Enemies/" + enemy_type + ".tscn")
	
func _process(delta):
	if get_parent().get_parent().get_node("GameUI").current == wave:
		if is_start == false:
			start()
			is_start = true
			is_stop = false
	else:
		if is_stop == false:
			stop()
			is_start = false
			is_stop = true
			
	if get_parent().get_parent().get_node("GameUI/progress").value == get_parent().get_parent().get_node("GameUI/progress").max_value:
		if is_stop == false:
			stop()
			is_start = false
			is_stop = true
		


func _on_Spawner_timeout():
	var entity = enemy.instance()
	get_parent().add_child(entity)
	set_wait_time(rand_range(minTime,maxTime))
	get_parent().get_parent().enemies.push_back(entity)
