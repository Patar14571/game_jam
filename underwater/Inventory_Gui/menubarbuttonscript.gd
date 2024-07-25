extends Panel

# Signal to notify when the panel is interacted with
signal panel_interacted
signal start_drag

var dragging = false

func _ready():
	# Enable input handling for the panel
	mouse_filter = Control.MOUSE_FILTER_PASS
	# setup signals for dragging 
	connect("gui_input", Callable(self, "_on_gui_input"))

func _process(delta):
	if dragging: 
		# update the postion of the panel to follow the mouse 
		global_position = get_global_mouse_position()

func _gui_input(event):
	if event is InputEventMouseButton and event.pressed:
		emit_signal("panel_interacted", self)
		
func _on_gui_input(event):
	if event is InputEventMouseButton: 
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				emit_signal("start_drag", self)
				dragging = true
			else:
				dragging = false
