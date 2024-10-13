extends CenterContainer

@onready var center_container = $"."

# Called when the node enters the scene tree for the first time.
func _ready():
	center_container.modulate.a = 100


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if center_container.modulate.a > 0 :
		center_container.modulate.a -= 0.55
	


func _on_detect_generator_got_it():
	if center_container.modulate.a < 100 :
		center_container.modulate.a += 10
		
