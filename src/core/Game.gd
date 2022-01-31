extends Node

var fader
var player
var grassPoint := 0
var totalGrassLevel := 0

var current_level:= 1
var max_level = 20

var current_scene: Node
var loaded_scene: Node = null


func save_level():
	var data = Addonsave.edit_data("save_grass")
	#save information in data
	print("save level %i",current_level)
	data.last_level = current_level
	#save data
	Addonsave.save_data(data, "save_grass")

func get_last_level():
	var data = Addonsave.edit_data("save_grass")
	
	#Verify if the data is null, if it's null, give it a value
	if !data.has("last_level"):
		print("null last ")
		data.last_level = 1
	print(data.last_level)
	current_level = data.last_level
	#save data, cause maybe the data was modified
	Addonsave.save_data(data, "save_grass")

# Change Scene
func change_scene():
	current_scene.free()
	get_tree().get_root().add_child(current_scene)
	get_tree().set_current_scene(current_scene)

func _goto_scene() -> void:
	get_tree().get_root().add_child(current_scene)
	get_tree().set_current_scene(current_scene)

