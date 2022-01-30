extends Spatial

onready var particleFinishLevel = $particle_congrate
onready var LevelNow = GamePlay.current_level
onready var currentLevel = $Spatial/LevelScene
var next_level = null
signal game_over

func _ready():
	Audio.playBGMusic()
	$AdMob.init()
	$AdMob.load_banner()
	$AdMob.load_interstitial()
	Event.connect("change_scene",self,"_on_SceneFade_scene_changed")
	Event.connect("level_passed",self,"_on_Grass_endLevel")
	
	
func _input(event):
	if Input.is_action_pressed("ui_accept"):
		Audio.stopLevelComplete()
		GamePlay.totalGrassLevel = 0
		GamePlay.grassPoint = 0
		GamePlay.current_level = LevelNow
		get_tree().reload_current_scene()
	
	if Input.is_action_pressed("ui_home"):
		GamePlay.current_level =1
		GamePlay.totalGrassLevel = 0
		GamePlay.grassPoint = 0
		Audio.stopFlowerPop()
		get_tree().change_scene("res://res/ui/MainMenu.tscn")
		
func _on_Grass_endLevel():
	Audio.playLevelComplete()
	particleFinishLevel.emitting = true
	yield(get_tree().create_timer(2.70), "timeout")
	Audio.stopLevelComplete()
#	Audio.pauseBGMusic()
	Audio.volumeBGMusic(0)
	complete_level()
	
	particleFinishLevel.emitting = false
	
	
func complete_level():
	GamePlay.totalGrassLevel = 0
	GamePlay.grassPoint = 0
	GamePlay.current_level += 1
	var isNextLevels = GamePlay.current_level % 2 > 0
	if GamePlay.current_level > 0 and  isNextLevels:
		$AdMob.show_interstitial()
#	if currentLevel not null :
		
	
#	cek if max level 
	if GamePlay.current_level <= GamePlay.max_level:
		
		Event.emit_signal("update_level")
		next_level = load("res://res/level/LevelScene_"+str(GamePlay.current_level)+".tscn").instance()
		currentLevel.queue_free()
		GamePlay.fader.fade_out()
	else:
		emit_signal("game_over")
#	$unity_ads.show_interstitial()
	

func _on_AdMob_banner_loaded():
	pass # Replace with function body.


func _on_AdMob_banner_failed_to_load(error_code):
	 print("Failed Load Banner")


func _on_unity_ads_banner_loaded():
	print("banner loaded")
#	$unity_ads.show_banner()
#	pass # Replace with function body.z


func _on_unity_ads_interstitial_loaded():
	print("unity ads inter load")


func _on_SceneFade_scene_changed():
	_onNextLevel()
	
func _onNextLevel():
	add_child(next_level)
	currentLevel = next_level
	next_level = null
	for i in 30:
		Audio.volumeBGMusic(i)

func _on_AdMob_interstitial_closed():
#	_onNextLevel()
	pass


func _on_AdMob_interstitial_loaded():
	pass # Replace with function body.

