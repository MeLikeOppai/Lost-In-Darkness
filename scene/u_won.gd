extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_pressed():
	get_tree().change_scene_to_file("res://scene/main.tscn")
	

func _on_instructions_pressed():
	get_tree().change_scene_to_file("res://scene/instructions.tscn")


func _on_option_pressed():
	get_tree().change_scene_to_file("res://scene/options.tscn")
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

func _on_exit_pressed():
	get_tree().quit()
