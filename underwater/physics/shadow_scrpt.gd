extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	var canvas_modulate = CanvasModulate.new()
	canvas_modulate.color = Color(0,0,0,10) #Dark color giving some blue
	add_child(canvas_modulate) 
