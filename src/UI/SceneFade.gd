extends CanvasLayer

# warning-ignore:unused_signal
signal scene_changed()

onready var animationPlayer: AnimationPlayer = $AnimationPlayer
onready var screen = $Control/TextureRect

func _ready() -> void:
	GamePlay.fader = self
	
func fade_out()->void:
	animationPlayer.play("fade_out")

func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	if anim_name == "fade_out":
		animationPlayer.play("fade_in")
#		emit_signal("scene_changed")
		Event.emit_signal("change_scene")
#		if get_tree().change_scene("res://res/level/Level_" + str(GamePlay.current_level) +".tscn") == OK:
##			assert(get_tree().change_scene("res://res/level/LevelTestPerform.tscn") == OK)
#
#			assert(get_tree().change_scene("res://res/level/Level_" + str(GamePlay.current_level) +".tscn") == OK)
#		else:
#			print("Gameover")

