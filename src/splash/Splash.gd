extends Control

export var max_load_time = 3
var loading_bar
onready var tween = $Tween

func _ready():
	loading_bar = $VBoxContainer/Control3/MarginContainer/Control4/ProgressBar
	tween.interpolate_property(loading_bar,"value",0,100,max_load_time,Tween.TRANS_LINEAR,Tween.EASE_OUT)
	tween.start()

func _on_Tween_tween_all_completed():
#	GamePlay.fader.fade_out()
	assert(get_tree().change_scene("res://res/level/Level_" + str(GamePlay.current_level) +".tscn") == OK)

