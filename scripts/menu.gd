extends Control


func _on_start_pressed():
	get_tree().change_scene_to_file("res://scene/main.tscn")


func _on_exit_pressed():
	get_tree().quit()


func _on_instructions_pressed():
	get_tree().change_scene_to_file("res://scene/instructions.tscn")


func _on_option_pressed():
	get_tree().change_scene_to_file("res://scene/options.tscn")
