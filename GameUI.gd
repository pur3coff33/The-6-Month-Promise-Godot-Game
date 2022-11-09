extends Node2D




# Called when the node enters the scene tree for the first time.
func _ready():
	$pause_menu/CheckButton.pressed = Globals.is_fullscreen
	$pause_menu/music_slider.value = Globals.music_vol
	$pause_menu/fx_slider.value = Globals.fx_vol


var prev = preload("res://Towers/Preview.tscn")
var obj


var t1_pressed = false

func preview(tower_name):
	obj = prev.instance()
	obj.tower_name = tower_name
	obj.get_node(tower_name).show()
	add_child(obj)
	
func cancel_preview():
	if obj.platform != null:
		obj.platform.get_parent().build_tower()
	obj.queue_free()
	
###############################################
func _on_t1_btn_pressed():
	t1_pressed = true
	preview("Throwers")
	

func _on_t1_btn_released():
	t1_pressed = false
	cancel_preview()
	
#################################
	

func _on_t2_btn_pressed():
	t1_pressed = true
	preview("SlingShotters")


func _on_t2_btn_released():
	t1_pressed = false
	cancel_preview()
	
func _on_t3_btn_pressed():
	t1_pressed = true
	preview("Molotovers")


func _on_t3_btn_released():
	t1_pressed = false
	cancel_preview()
	
func _input(event):
	
	if t1_pressed:
		
		if event is InputEventScreenTouch:
			obj.position = event.get_position()
			
		if event is InputEventScreenDrag:
			obj.position = event.get_position()


var max_wave
var current

func game():
	max_wave = get_parent().game_times.size()
	current = 0
	$progress.max_value = get_parent().game_times[0]
	$progress/timer.start()
	$gold.text = str(get_parent().gold)
	MusicController.stopMusic()
	MusicController.playGame()

	

func game_end():
	$progress/timer.stop()
	


func _on_timer_timeout():
	
	$gold.text = str(int($gold.text) + 1)
	
	$progress.value = $progress.value + 1
	
	if $progress.value == $progress.max_value:
		
		if current < max_wave-1:
			if get_parent().enemies.empty():
				$progress.value = 0
				
				var array = get_parent().tower_list
				
				for item in array:
					if get_parent().hero == "lugaw":
						item.damage += item.damage * 0.01
					elif get_parent().hero == "magno":
						item.get_node("attack_time").set_wait_time(item.get_node("attack_time").get_wait_time() - (item.get_node("attack_time").get_wait_time() * 0.01))
					else:
						item.get_node("attack_area").scale += item.get_node("attack_area").scale * 0.1
			
				
				current += 1
				
				if current == 1:
					get_parent().get_node("PathArrows").hide()
				
		else:
			game_end()
			print(current)
			return
			
		$progress.max_value = get_parent().game_times[current]
		$wave.text = "Wave " + str(current) + " / " + str(max_wave-1)
		
	
		
			
		
		
		


func _on_ff_released():
	if Engine.time_scale == 1.0:
		Engine.time_scale = 2.0
		$slow_on.play()
		$x2.show()
	else:
		Engine.time_scale = 1.0
		$slow_off.play()
		$x2.hide()


func _on_btn_pause_pressed():
	$pause_menu.show()
	get_tree().paused = true


func _on_resume_pressed():
	$pause_menu.hide()
	get_tree().paused = false


func _on_quit_pressed():
	Globals.score = int($gold.text)
	get_tree().paused = false
	get_tree().change_scene("res://Scenes/Defeat.tscn")
	

func _on_CheckButton_toggled(button_pressed):
	Globals.change_screen_mode(button_pressed)


func _on_music_slider_value_changed(value):
	Globals.change_music_vol(value)


func _on_fx_slider_value_changed(value):
	Globals.change_fx_vol(value)
	MusicController.click()
