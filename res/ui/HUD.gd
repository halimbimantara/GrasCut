extends Control

onready var labelPoint = $HBoxContainer/Control/Point
onready var levelInfo = $HBoxContainer/Center/LevelInfo
# Called when the node enters the scene tree for the first time.


func _ready():
	Event.connect("update_level",self,"_on_updateLevel")
	levelInfo.text="LEVEL "+str(GamePlay.current_level)
	
# "LEVEL "+str(GamePlay.current_level)
func _process(delta):
	labelPoint.text = str(Engine.get_frames_per_second())

func _on_updateLevel():
	levelInfo.text="LEVEL "+str(GamePlay.current_level)
#		
func _on_Grass_update_point():
	pass
