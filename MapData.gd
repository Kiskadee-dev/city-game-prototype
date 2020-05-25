extends Node

signal loaded_data
#Every region must have this, intended to manage its own data
#Map key is [Vector3] and data is JSON encoded

var MapData:Dictionary

func get_encoded_at(key:Vector3)->Node:
	if MapData.has(key):
		return MapData[key]
	else:
		return null

func get_all_encoded_entities()->Array:
	if MapData.empty():
		return []
	var entities:Array = []
	var MapKeys = MapData.keys()
	for k in MapKeys:
		var p = JSON.parse(MapKeys[k])
		if p.error == OK:
			entities.append(p.result)
		else:
			printerr("Error decoding: "+str(MapKeys[k]))
	return entities
