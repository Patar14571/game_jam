extends Control

#@onready var Inv: Inv = preload(res://Invent) #where inventorey 
var is_open = false

func _ready():
	close()

func _process(delta):
	if Input.is_action_just_pressed("i"):
		if is_open: 
			close()
		else :
			open()

func open():
	visible = true
	is_open = false

func close():
	visible = false
	is_open = false

