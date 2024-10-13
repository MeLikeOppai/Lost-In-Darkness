extends RayCast3D

@onready var sprite_2d = $"../../../Control/CenterContainer/Sprite2D"
@onready var detect_generator = $"."
@onready var label = $"../../../Control/CenterContainer/Label"

signal got_it
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	
	if detect_generator.is_colliding() and Input.is_action_pressed("e") :
		emit_signal("got_it")
		
	
	if detect_generator.is_colliding():
		sprite_2d.visible = true
		label.visible = true
	else :
		sprite_2d.visible = false
		label.visible = false