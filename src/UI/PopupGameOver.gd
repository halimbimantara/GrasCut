extends CanvasLayer

onready var centerContainer = $CenterContainer
onready var tween = $Tween

#func _ready():
#	popUpDialog()
	
func popUpDialog():
	tween.interpolate_property($CenterContainer,"rect_position",Vector2(0,-1280),Vector2(0,0),3,Tween.TRANS_ELASTIC,Tween.EASE_OUT)
	tween.start()

func _on_MainLevel_game_over():
	popUpDialog()


func _on_ButtonExit_pressed():
	GamePlay.current_level =1
	GamePlay.totalGrassLevel = 0
	GamePlay.grassPoint = 0
	Audio.stopFlowerPop()
	get_tree().change_scene("res://res/ui/MainMenu.tscn")
	
func _on_ButtonRate_pressed():
	pass # Replace with function body.
