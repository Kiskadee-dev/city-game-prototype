extends Spatial

var entity_id:int
export var width = 1
export var length = 1

func get_type():
	return DB.Entidade[entity_id]["tipo"]
