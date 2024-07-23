extends Area2D

signal water_state_changed(is_in_water : bool)
@onready var water_tilemap = get_node("res://game.tscn")
var is_in_water : bool = false;

func _on_area_2d_body_entered(_body):
	
	if(is_in_water == false):
		var overlapping_bodies = get_overlapping_bodies()
		
		if(overlapping_bodies.size() > 1):
			is_in_water = true
			emit_signal("water_state_changed", is_in_water)

func _on_area_2d_body_exited(_body):
	var overlapping_bodies = overlaps_body(water_tilemap)
	
	if(overlapping_bodies == false):
		is_in_water = false
		emit_signal("water_state_changed", is_in_water)
