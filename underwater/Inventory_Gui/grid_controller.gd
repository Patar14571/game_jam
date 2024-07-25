extends Node

# This function will handle item interactions
func _on_item_interacted(item):
	print("Item interacted:", item.name)

# This function will handle panel interactions
func _on_panel_interacted(panel):
	print("Panel interacted:", panel.name)

func _ready():
	# Correct the path to GridContainer node
	var grid_container = get_node("/root/InventoryGui/NinePatchRect/GridContainer")
	# Verify that the node exists
	if grid_container == null:
		print("GridContainer node not found")
		return

	# Iterate through children to connect their signals
	for child in grid_container.get_children():
		if child is Panel:
			if child.has_signal("item_interacted"):
				child.connect("item_interacted", Callable(self, "_on_item_interacted"))
			else:
				print("Signal 'item_interacted' not found on", child.name)
				
	var menu_bar = get_node("/root/InventoryGui/MenuBar/GridContainer")
	
	if menu_bar == null:
		print("MenuBar node not found")
		return

	# Iterate through MenuBar's children (Panels)
	for panel in menu_bar.get_children():
		if panel is Panel:
			if panel.has_signal("panel_interacted"):
				print("Connecting signal for:", panel.name)
				panel.connect("panel_interacted", Callable(self, "_on_panel_interacted"))
			else:
				print("Signal 'panel_interacted' not found on", panel.name)
