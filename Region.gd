extends MeshInstance

onready var MapData = $MapData
var entities:Dictionary = {} #Holds the spawned entities of this region

#Handles spawning stuff on this region
func add_entity(pack:PackedScene, pos:Vector3)->bool:
	if entities.has(ClickManager.to_grid(pos)):
		return false
	var entity = pack.instance()
	entity.translation = ClickManager.to_grid(pos)
	entities[ClickManager.to_grid(pos)] = entity
	return true

func remove_entity(pos:Vector3)->bool:
	if not entities.has(ClickManager.to_grid(pos)):
		return false
	var entity = entities[ClickManager.to_grid(pos)]
	entity.queue_free()
	entities.erase(ClickManager.to_grid(pos))
	return true

func _ready():
	pass

func _on_StaticBody_input_event(camera, event, click_position, click_normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == 1 and event.is_pressed():
			ClickManager.emit_click(click_position)
