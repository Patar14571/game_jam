extends Panel

# Signal to notify when the item is interacted with
signal item_interacted(item)

func _ready():
	# Enable input handling
	mouse_filter = Control.MOUSE_FILTER_PASS

func _gui_input(event):
	# Check if the event is a mouse button click
	if event is InputEventMouseButton and event.pressed:
		emit_signal("item_interacted", self)
