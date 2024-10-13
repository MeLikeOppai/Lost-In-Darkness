extends SpotLight3D

@onready var spot_light_3d = $"."
@onready var detect = $CharacterBody3D/Camera3D/detect




var energy = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	spot_light_3d.light_energy = 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if spot_light_3d.light_energy > 0 and spot_light_3d.light_energy <= 10:
		spot_light_3d.light_energy -= 0.001


func _on_detect_got_it():
	if spot_light_3d.light_energy < 2:
		spot_light_3d.light_energy += 0.1

		
