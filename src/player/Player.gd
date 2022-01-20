extends KinematicBody2D

var newDeltaX
var newDeltaY
var deltaX
var deltaY
var touchPos = Vector2()
var areaEnt = false
var rayCast

var velocity = Vector2()
export (int) var speed

func _ready():
	rayCast = $Ray
#func _input(event):
#	if areaEnt == true:
#		if event is InputEventScreenTouch and event.is_pressed():
#			touchPos = event.get_position()
#			deltaX = touchPos.x - position.x
#			deltaY = touchPos.y - position.y
#		elif event is InputEventScreenDrag:
#			touchPos = event.get_position()
#			newDeltaX = touchPos.x - deltaX
#			newDeltaY = touchPos.y - deltaY
#			set_position(Vector2(newDeltaX,newDeltaY))

	
func _physics_process(delta):
	print(velocity)
	checkRayCast(delta)
	move_and_slide(velocity)

#func _on_TouchScreenButton_pressed():
#	areaEnt = true
#
#
#func _on_TouchScreenButton_released():
#	areaEnt = false

func checkRayCast(delta):
	for i in rayCast.get_children():
		var ry = i as RayCast2D
		if ry.is_colliding():
			print("colli")

func _on_SwipeDetector_swiped(gesture):
	var mpos = gesture.get_direction()
	if mpos == "right":
		velocity.x = speed
	if mpos == "left":
		velocity.x = - speed
	if mpos == "up":
		velocity.y = speed
	if mpos == "down":
		velocity.y = -speed
