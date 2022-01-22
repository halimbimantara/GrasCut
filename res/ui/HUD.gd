extends Control

onready var labelPoint = $HBoxContainer/Center/LevelInfo
# Called when the node enters the scene tree for the first time.
func _ready():
	labelPoint.text = "LEVEL "+str(GamePlay.current_level)

func _on_Grass_update_point():
#	labelPoint.text = str(GamePlay.grassPoint)
	pass
