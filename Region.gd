extends Spatial

export var RegionID:Vector3 = Vector3()
onready var MapData = $MapData
var entities:Array = [] #Holds the spawned entities of this region

#Handles spawning stuff on this region
func add_entity(pack:PackedScene, pos:Vector3)->bool:
	var entity = pack.instance()
	add_child(entity)
	entity.translation = ClickManager.to_grid(pos)
	var index = len(entities)
	entities.append({"id":index+1, "position":ClickManager.to_grid(pos), "entity":entity})
	return true

func remove_entity(id:int)->bool:
	for i in entities:
		if i["id"] == id:
			i["entity"].queue_free()
			entities.erase(i)
			return true
	return false

func _ready():
	pass

func _on_StaticBody_input_event(camera, event, click_position, click_normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == 1 and event.is_pressed():
			ClickManager.emit_click(click_position)
