extends Path2D

var timer = 0
var spawn_time = 1

var test_enemy = preload("res://Enemies/TestEnemy.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timer = timer + delta
	
	if (timer >= spawn_time):
		add_child(test_enemy.instance())
		timer = 0
		spawn_time = rand_range(1,2)
