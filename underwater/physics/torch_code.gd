extends CharacterBody2D

var torch: PointLight2D

# Called when the node enters the scene tree for the first time.
func _ready():
	#currently experimenting to see what these do
	torch.range = 256
	torch.energy = 1.0 
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$torch.global_position = global_position
