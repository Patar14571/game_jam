extends Control

#@onready var Inv: Inv = preload(res://Invent) #where inventorey 
var is_open = false

func _ready():
	var grid_container = $NinePatchRect/GridContainer
	print("GridContainer found:", grid_container)
	if grid_container == null:
		print("GridContainer node not found")
		return

	for child in grid_container.get_children():
		if child is Panel:
			child.connect("item_interacted", Callable(self, "_on_item_interacted"))
			
	var menu_bar = $MenuBar
	if menu_bar == null:
		print("MenuBar node not found")
		return
	# Iterate through MenuBar's children (Panels)
	for panel in menu_bar.get_children():
		if panel is Panel:
			# Iterate through each panel's children (Buttons)
			for button in panel.get_children():
				if button is Button:
					if button.has_signal("button_clicked"):
						print("Connecting signal for:", button.name)
						button.connect("button_clicked", Callable(self, "_on_button_clicked"))
					else:
						print("Signal 'button_clicked' not found on", button.name)
	close()



func _process(delta):
	if Input.is_action_just_pressed("i"):
		if is_open: 
			close()
		else :
			open()
			
# This function will handle button clicks
func _on_button_clicked(button):
	print("Button clicked:", button.name)

func open():
	visible = true
	is_open = false

func close():
	visible = false
	is_open = false


