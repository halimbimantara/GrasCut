extends Spatial

onready var particleFinishLevel = $particle_congrate
onready var mPlayer = $Player

func _ready():
	$AdMob.init()
	$AdMob.load_banner()
	
func _input(event):
	if Input.is_action_pressed("ui_accept"):
		GamePlay.totalGrassLevel = 0
		GamePlay.grassPoint = 0
		get_tree().reload_current_scene()
		
		
func _on_Grass_endLevel():
	Audio.playLevelComplete()
	particleFinishLevel.emitting = true
	yield(get_tree().create_timer(1), "timeout")
	particleFinishLevel.emitting = false
	Audio.stopLevelComplete()
	complete_level()

func complete_level():
	GamePlay.totalGrassLevel = 0
	GamePlay.grassPoint = 0
	GamePlay.current_level += 1
	GamePlay.fader.fade_out()
	
	


func _on_AdMob_banner_loaded():
	pass # Replace with function body.


func _on_AdMob_banner_failed_to_load(error_code):
	 print("Failed Load Banner")
