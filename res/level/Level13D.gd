extends Spatial

onready var particleFinishLevel = $particle_congrate
onready var mPlayer = $Player

func _input(event):
	if Input.is_action_pressed("ui_accept"):
		GamePlay.totalGrassLevel = 0
		GamePlay.grassPoint = 0
		get_tree().reload_current_scene()
		
		
func _on_Grass_endLevel():
	particleFinishLevel.emitting = true
	yield(get_tree().create_timer(1), "timeout")
	particleFinishLevel.emitting = false
	complete_level()

func complete_level():
	GamePlay.totalGrassLevel = 0
	GamePlay.grassPoint = 0
	GamePlay.current_level += 1
	GamePlay.fader.fade_out()
	
	
