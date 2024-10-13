extends CharacterBody3D

@onready var camera_3d = $Camera3D
@onready var detect = $Camera3D/detect
@onready var spot_light_3d = $SpotLight3D
@onready var foots = $sounds/foots

const SPEED = 5.0
const JUMP_VELOCITY = 4.5
var MOUSE_SENSITIVITY = 0.2
const SPRINT = 10.0
const ACCELERATION = 8.0  # Speed up for smoother transitions
const CAMERA_MIN_ANGLE = deg_to_rad(-85)
const CAMERA_MAX_ANGLE = deg_to_rad(85)

# Head bobbing parameters
const BOB_INTENSITY_VERTICAL = 0.1
const BOB_INTENSITY_HORIZONTAL = 0.05
const BOB_FREQUENCY = 5.0
const BOB_TRANSITION_SPEED = 3.0

var pitch = 0.0
var bobbing_amount = 0.0
var bob_timer = 0.0
var original_camera_position = Vector3()
var is_in_area = false  # Track whether the player is inside the area

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	original_camera_position = camera_3d.transform.origin
	
func _input(event):
	if event is InputEventMouseMotion:
		rotate_y(-event.relative.x * MOUSE_SENSITIVITY * 0.01)
		pitch -= event.relative.y * MOUSE_SENSITIVITY * 0.01
		pitch = clamp(pitch, CAMERA_MIN_ANGLE, CAMERA_MAX_ANGLE)
		camera_3d.rotation.x = pitch

func _physics_process(delta):
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	if Input.is_action_just_pressed("esc"):
		get_tree().change_scene_to_file("res://scene/menu.tscn")
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		

	var input_dir = Input.get_vector("left", "right", "forward", "backward")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()

	var target_speed = SPEED
	if Input.is_action_pressed("sprint"):
		target_speed = SPRINT
		foots.pitch_scale = 1.3
	else:
		foots.pitch_scale = 1.0

	if direction:
		velocity.x = lerp(velocity.x, direction.x * target_speed, ACCELERATION * delta)
		velocity.z = lerp(velocity.z, direction.z * target_speed, ACCELERATION * delta)

		if is_on_floor() and not foots.playing:
			foots.play()

		if is_on_floor():
			bob_timer += delta * BOB_FREQUENCY
			bobbing_amount = lerp(bobbing_amount, 1.0, delta * BOB_TRANSITION_SPEED)

			var vertical_bob = sin(bob_timer) * BOB_INTENSITY_VERTICAL * bobbing_amount
			var horizontal_bob = cos(bob_timer * 2.0) * BOB_INTENSITY_HORIZONTAL * bobbing_amount
			var bob_offset = Vector3(horizontal_bob, vertical_bob, 0)
			camera_3d.transform.origin = original_camera_position + bob_offset
	else:
		velocity.x = lerp(velocity.x, 0.0, ACCELERATION * delta)
		velocity.z = lerp(velocity.z, 0.0, ACCELERATION * delta)

		if foots.playing and (not is_on_floor() or direction == Vector3()):
			foots.stop()

		bobbing_amount = lerp(bobbing_amount, 0.0, delta * BOB_TRANSITION_SPEED)
		camera_3d.transform.origin = original_camera_position

	move_and_slide()

# Function called when a body enters the Area3D
func _on_area_3d_body_entered(body):
	if body is CharacterBody3D:
		get_tree().change_scene_to_file("res://scene/u_won.tscn")
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

func _on_h_slider_value_changed(value):
	MOUSE_SENSITIVITY = value
