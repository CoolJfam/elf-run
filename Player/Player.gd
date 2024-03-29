extends KinematicBody

var gravity = 9.8
var jump = 5
var capncrunch = Vector3()


export var _mouse_sensitivity := 0.25
export var _move_speed := 3.0

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _input(event):
	aim(event)
	if Input.is_action_just_pressed("cursor"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	if Input.is_action_just_pressed("crosshair"):
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	if Input.is_action_just_pressed("jump"):
		capncrunch.y = jump


func _physics_process(delta):
	movement()
	if not is_on_floor():
		capncrunch.y -= gravity * delta
	move_and_slide(capncrunch, Vector3.UP)


func aim(event: InputEvent):
	var mouse_motion = event as InputEventMouseMotion
	
	if mouse_motion:
		rotation_degrees.y -= mouse_motion.relative.x * _mouse_sensitivity
		
		var current_tilt: float = $Camera.rotation_degrees.x
		current_tilt -= mouse_motion.relative.y * _mouse_sensitivity
		
		$Camera.rotation_degrees.x = clamp(current_tilt, -142, 30)


func movement():
	var movement_vector: Vector3
	var forward_movement: Vector3
	var sideways_movement: Vector3
	
	if Input.is_action_pressed("move_forward"):
		forward_movement = -transform.basis.y
	elif Input.is_action_pressed("move_backward"):
		forward_movement = transform.basis.y
	
	if Input.is_action_pressed("move_left"):
		sideways_movement = -transform.basis.x
	elif Input.is_action_pressed("move_right"):
		sideways_movement = transform.basis.x
	
	movement_vector = forward_movement + sideways_movement
	movement_vector = movement_vector.normalized()
	move_and_slide(movement_vector * _move_speed)



