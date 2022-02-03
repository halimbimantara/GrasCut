extends Node

class_name OneSignal , "res://lib/onesignal-plugin-api/onesignal.png"


export var app_key : String = "babf2d6f-4543-4556-919c-ad773abe6b42"
export var is_debug : bool = true

var _onesignal : Object = null

func _enter_tree() -> void:
	if Engine.has_singleton("GodotOneSignal"):
		_onesignal = Engine.get_singleton("GodotOneSignal")
	else:
		printerr("GodotOneSignal Plugin not found, Android Only")

# Initialize OneSignal and log the device
# set is debug to true to log errors 

func _ready():
	initialize()
	
func initialize():
	if _onesignal != null:
		_onesignal.initialize(app_key,is_debug)
		print("onesignal debug")


func setLastLevel(value) -> void:
	if _onesignal != null:
		_onesignal.setLastLevel(value)
	
func getLastLevel() -> int:
	if _onesignal != null:
		return _onesignal.getLastLevel()
	return 1
