extends Node

signal clicked(pos)

var last_click_pos:Vector3
var last_hover_pos:Vector3

var grid_step = 1.0
func emit_click(pos:Vector3):
	emit_signal("clicked", to_grid(pos))

func set_click_pos(pos):
	last_click_pos = to_grid(pos)
	
func set_hover_pos(pos:Vector3)->void:
	last_hover_pos = to_grid(pos)

func to_grid(pos:Vector3)->Vector3:
	var x = round(pos.x / grid_step)*grid_step
	var y = round(pos.y / grid_step)*grid_step
	var z = round(pos.z / grid_step)*grid_step
	return Vector3(x,y,z)
