extends Area2D

onready var grassEmit:Particles2D = $Explotion
# Called when the node enters the scene tree for the first time.
onready var mTimer = $Timer

signal update_point
func _ready():
	pass # Replace with function body.

func _on_Grass_body_entered(body):
	if body.name == "Player":
		grassEmit.emitting = true
		$Sprite.visible = false
		GamePlay.grassPoint += 1
		mTimer.start(0.5)
		emit_signal("update_point")
	
func _on_Timer_timeout():
	queue_free()
