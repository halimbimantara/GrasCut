extends Node

var fader
var player
var grassPoint := 0
var totalGrassLevel := 0

var current_level:= 1
var max_level = 20

var current_scene: Node
var loaded_scene: Node = null

# Change Scene
func change_scene():
	current_scene.free()
	get_tree().get_root().add_child(current_scene)
	get_tree().set_current_scene(current_scene)

func _goto_scene() -> void:
	get_tree().get_root().add_child(current_scene)
	get_tree().set_current_scene(current_scene)

