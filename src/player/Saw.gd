extends KinematicBody

var speed = 80
var acceleration = 15
var air_acceleration = 5
var gravity = 0.98
var max_velocity = 54
var jump_force = 20
var moved = false

var mouse_sensitivity = 0.3
var min_p = -90
var max_p = 90

var velocity : Vector3
var y_velocity : float

func _ready():
	GamePlay.player = self
#func _process(delta):
#	handle_movement(delta)

func _physics_process(delta):
	handle_movement(delta)

func handle_movement(delta):
	var direction = Vector3()
	
	if Input.is_action_pressed("ui_up"):
		direction -= transform.basis.z * delta

	if Input.is_action_pressed("ui_down"):
		direction += transform.basis.z

	if Input.is_action_pressed("ui_left"):
		direction -= transform.basis.x

	if Input.is_action_pressed("ui_right"):
		direction += transform.basis.x

	direction = direction.normalized()
	var accel = acceleration if is_on_floor() else air_acceleration
	
#	velocity = velocity.linear_interpolate(direction * speed,accel * delta)
	
	y_velocity = -0.01
		
	velocity.y = y_velocity
	print(velocity)
	velocity = move_and_slide(velocity,Vector3.UP)


func _on_SwipeDetector_swiped(gesture):
	var mpos = gesture.get_direction()
	if not moved:
		if mpos == "right":
			velocity.x = speed
		if mpos == "left":
			velocity.x = - speed
		if mpos == "up":
			velocity.z = -speed
		if mpos == "down":
			velocity.z = speed

func _on_Grass_endLevel():
	queue_free()
