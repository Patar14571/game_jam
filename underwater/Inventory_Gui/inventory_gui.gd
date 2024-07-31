extends Control

var is_open = false

func _ready():
	# Create a CanvasLayer and add it as the last child of the Control node
	var canvas_layer = CanvasLayer.new()
	add_child(canvas_layer)
	move_child(canvas_layer, get_child_count() - 1)

	var grid_container = $CanvasLayer/NinePatchRect/GridContainer
	if grid_container == null:
		print("GridContainer node not found")
		return

	var menu_bar = $MenuBar
	if menu_bar == null:
		print("MenuBar node not found")
		return

	# Move GridContainer and MenuBar into the CanvasLayer
	grid_container.get_parent().remove_child(grid_container)
	canvas_layer.add_child(grid_container)
	
	menu_bar.get_parent().remove_child(menu_bar)
	canvas_layer.add_child(menu_bar)
	
	# Connect signals for grid_container children
	for child in grid_container.get_children():
		if child is Panel:
			child.connect("item_interacted", Callable(self, "_on_item_interacted"))
	
	# Connect signals for menu_bar children
	for panel in menu_bar.get_children():
		if panel is Panel:
			for button in panel.get_children():
				if button is Button and button.has_signal("button_clicked"):
					button.connect("button_clicked", Callable(self, "_on_button_clicked"))

	# Ensure the CanvasLayer is hidden initially
	canvas_layer.visible = false
	print("Initial CanvasLayer visibility:", canvas_layer.visible)  # Debugging

func _process(delta):
	if Input.is_action_just_pressed("i"):
		if is_open:
			close()
		else:
			open()
			
func _on_button_clicked(button):
	print("Button clicked:", button.name)

func open():
	print("Opening Inventory GUI")
	$CanvasLayer.visible = true
	is_open = true

func close():
	print("Closing Inventory GUI")
	$CanvasLayer.visible = false
	is_open = false
