extends Node


var Region:Array = [Vector3(0,0,0)] #Vector3 = region

var Grid:Dictionary = {
	0:{
		"position":Vector3(0,0,0),
		"fk_region":Vector3(0,0,0)
	},
	1:{
		"position":Vector3(0,0,0),
		"fk_region":Vector3(0,0,0)
	}
}

var Entidade:Dictionary = {
	0:{
		"position":Vector3(2,0,2),
		"tipo":"cidade",
	},
	1:{
		"position":Vector3(30,0,2),
		"tipo":"unidade",
	}
}

var EntidadeReside:Dictionary = {
	0:{
		"gid":0
	},
	1:{
		"gid":1
	}
}

var Cidade:Dictionary = {
	0:{
		"name":"cacatua",
		"population":0,
		"gold":0,
		"wood":0,
		"iron":0,
		"copper":0,
		"food":1000
	}
}

var Unidade:Dictionary = {
	1:{
		"life":200,
		"damage":100,
		"defence":10,
		"speed":2,
		"payment":2
	}
}

var Actions:Dictionary = {
	1:{
		"start_time":0,
		"duration":200,
		"fk_unit":1
	}
}

func GetEntity(id):
	for key in Entidade:
		match Entidade[key]["tipo"]:
			"cidade":
				return Cidade[key]
			"unidade":
				return Unidade[key]
			_:
				printerr("Unexpected "+str(Entidade[key]["tipo"]))
		return true
