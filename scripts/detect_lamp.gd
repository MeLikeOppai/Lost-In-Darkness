extends RayCast3D

@onready var detect_lamp = $"."
@onready var sprite_2d = $"../../../Control/CenterContainer/Sprite2D"
@onready var label = $"../../../Control/CenterContainer/Label"

signal got_lamp
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	
	if detect_lamp.is_colliding() and Input.is_action_pressed("e") :
		emit_signal("got_lamp")
	
	if detect_lamp.is_colliding():
		sprite_2d.visible = true
		label.visible = true
