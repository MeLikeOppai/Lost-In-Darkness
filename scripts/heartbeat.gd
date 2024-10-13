extends AudioStreamPlayer3D

@onready var heartbeat = $"."

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	heartbeat.playing = false


func _on_progress_bar_can_play():
	heartbeat.playing = true
	
