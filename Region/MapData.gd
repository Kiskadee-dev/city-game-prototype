extends Node

signal loaded_data
#Every region must have this, intended to manage its own data
#Map key is [Vector3] and data is JSON encoded

var MapData:Dictionary
onready var Region = get_parent()

func _ready():
	if Region is Viewport:
		return
	call_deferred("load_region_data")

func load_region_data():
	if DB.Region.has(Region.RegionID):
		for grids in DB.Grid:
			if DB.Grid[grids]["fk_region"] == Region.RegionID:
				for Entidade in DB.EntidadeReside:
					if DB.EntidadeReside[Entidade]["gid"] == grids:
						match DB.Entidade[Entidade]["tipo"]:
							"cidade":
								print("City in DB!")
								var city = load(SelectionManager.entityDB["city"])
								var position = DB.Entidade[Entidade]["position"]
								Region.add_entity(city, position)
								pass #Spawn city
							"unidade":
								var Unit = load(SelectionManager.entityDB["constructor"])
								var position = DB.Entidade[Entidade]["position"]
								Region.add_entity(Unit, position)
								print("Unit in DB!")
								pass #Spawn Unit
							_:
								printerr("Coisa de tipo invalido")

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
