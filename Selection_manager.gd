extends Node

var entityDB = load("res://PackedEntitiesManager.gd").new()
var selected:String = "" #Entity ID
var previewObject:Node = null

func create_preview_obj(ID:String)->Node:
	if not entityDB.entities.has(ID):
		return null
	var root = get_tree().root
	previewObject = load(entityDB.entities[ID]).instance()
	root.add_child(previewObject)
	return previewObject

func remove_preview_obj()->bool:
	if not previewObject:
		return false
	previewObject.queue_free()
	return true
	

