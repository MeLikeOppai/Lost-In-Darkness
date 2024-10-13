extends OmniLight3D
@onready var omni_light_3d = $"."
@onready var flash = $SpotLight3D/flash


# Called when the node enters the scene tree for the first time.
func _ready():
	omni_light_3d.light_energy = 1

func _process(delta):
	# Decrease light energy, ensuring it stays between 0 and 5
	if omni_light_3d.light_energy > 0:
		omni_light_3d.light_energy -= 0.003
		omni_light_3d.light_energy = clamp(omni_light_3d.light_energy, 0, 3)
		

func _on_detect_lamp_got_lamp():
	# Increase light energy when the lamp is detected, ensuring it stays between 0 and 5
	if omni_light_3d.light_energy >= 0 and omni_light_3d.light_energy <= 5:
		omni_light_3d.light_energy += 0.1
		omni_light_3d.light_energy = clamp(omni_light_3d.light_energy, 0, 2)
		
	
