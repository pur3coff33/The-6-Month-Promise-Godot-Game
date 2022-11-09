extends Node


var levels = [true, false, false, false, false]

var score
var next_level

var music_vol = 0
var fx_vol = 0
var is_fullscreen = false

var save_path = "user://save.dat"
var settings_path = "user://settings.dat"


# Called when the node enters the scene tree for the first time.
func _ready():
	loadSettings()
	loadData()
	OS.window_fullscreen = is_fullscreen
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), music_vol)	
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Sound"), fx_vol)	
	
	
	

func loadSettings():
	var file = File.new()
	if file.file_exists(settings_path):
		var err = file.open(settings_path, File.READ)
		if err == OK:
			var data = file.get_var()
			file.close()
			is_fullscreen = data["is_fullscreen"]
			music_vol = data["music_vol"]
			fx_vol = data["fx_vol"]
	else:
		saveSettings()
		loadSettings()

func saveSettings():
	var data = {
		"is_fullscreen":is_fullscreen,
		"music_vol":music_vol,
		"fx_vol":fx_vol,
	}
	
	var file = File.new()
	var err = file.open(settings_path, File.WRITE)
	if err == OK:
		file.store_var(data)
		file.close()


func loadData():
	var file = File.new()
	if file.file_exists(save_path):
		var err = file.open(save_path, File.READ)
		if err == OK:
			var player_data = file.get_var()
			file.close()
			levels[0] = player_data["level1"]
			levels[1] = player_data["level2"]
			levels[2] = player_data["level3"]
			levels[3] = player_data["level4"]
			levels[4] = player_data["level5"]
	else:
		saveData()
		loadData()

func saveData():
	var data = {
		"level1" : levels[0],
		"level2" : levels[1],
		"level3" : levels[2],
		"level4" : levels[3],
		"level5" : levels[4],
	}
	
	
	var file = File.new()
	var err = file.open(save_path, File.WRITE)
	if err == OK:
		file.store_var(data)
		file.close()

func change_music_vol(val):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), val)	
	music_vol = val
	saveSettings()
	

func change_fx_vol(val):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Sound"), val)
	fx_vol = val
	saveSettings()	
	
func change_screen_mode(flag):
	OS.window_fullscreen = flag
	is_fullscreen = flag
	saveSettings()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
