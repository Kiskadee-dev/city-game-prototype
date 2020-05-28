extends Node

var entityDB:Dictionary = {
"city":"res://VillageEntity.tscn",
"constructor":"res://UnitEntity.tscn"
}

var selected:String = "" #Entity ID
var previewObject:Node = null

func create_preview_obj(ID:String)->Node:
	if not entityDB.has(ID):
		return null
	var root = get_tree().root
	previewObject = load(entityDB[ID]).instance()
	root.add_child(previewObject)
	return previewObject

func remove_preview_obj()->bool:
	if not previewObject:
		return false
	previewObject.queue_free()
	return true
	

