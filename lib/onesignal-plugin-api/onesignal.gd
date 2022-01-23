extends Node

class_name OneSignal , "res://lib/onesignal-plugin-api/onesignal.png"


export var app_key : String = "87fec3b3-1a1d-4e39-9245-55fd0212cb98"
export var is_debug : bool = true

var _onesignal : Object

func _enter_tree() -> void:
	if Engine.has_singleton("GodotOneSignal"):
		_onesignal = Engine.get_singleton("GodotOneSignal")
	else:
		printerr("GodotOneSignal Plugin not found, Android Only")


# Initialize OneSignal and log the device
# set is debug to tru to log errors 
func _ready():
	initialize()
	
func initialize():
	if _onesignal != null:
		_onesignal.initialize(app_key,is_debug)
		print("onesignal debug")
