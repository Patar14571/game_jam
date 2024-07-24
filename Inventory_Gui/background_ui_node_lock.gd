
extends Node2D  # or extends Spatial for 3D

var locked_position: Vector2  # Use Vector3 for 3D

func _ready():
	locked_position = position  # Set the initial position

func _process(delta):
	position = locked_position  # Lock the position
	# For 3D use: transform.origin = locked_position

## Called when the node enters the scene tree for the first time.
#func _ready():
	#pass # Replace with function body.
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass
