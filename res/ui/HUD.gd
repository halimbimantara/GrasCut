extends Control

onready var labelPoint = $Point
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _on_Grass_update_point():
	labelPoint.text = str(GamePlay.grassPoint)
