extends ProgressBar
@onready var progress_bar = $"."
@onready var camera_3d = $"../../CharacterBody3D/Camera3D"
@onready var heartbeat = $heartbeat

signal can_play
# Called when the node enters the scene tree for the first time.
func _ready():
	progress_bar.value = 100
	camera_3d.fov = 75


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if progress_bar.value >= 0:
		progress_bar.value -= 1
	if progress_bar.value < 75 and progress_bar.value > 0: 
		camera_3d.fov += 0.5
		
	if progress_bar.value == 0:
		get_tree().change_scene_to_file("res://scene/u_lost.tscn")
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		

func _on_detect_generator_got_it():
	progress_bar.value += 10
	if progress_bar.value < 75 :
		camera_3d.fov -= 5
		emit_signal("can_play")
		
		
