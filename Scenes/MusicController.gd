extends Node2D



var menu_music = load("res://src/sound/MainMenuMusic.ogg")
var game_music = load("res://src/sound/GameMusic.ogg")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	

func click():
	$click.play()

func playMain():
	$MusicPlayer.stream = menu_music
	$MusicPlayer.play()

func playGame():
	$MusicPlayer.stream = game_music
	$MusicPlayer.stream.loop_offset = 0.47

	$MusicPlayer.play()
	
func stopMusic():
	$MusicPlayer.stop()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
