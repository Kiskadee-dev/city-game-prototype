extends Node


var Region:Array = [Vector3(0,0,0)] #Vector3 = region

var Grid:Array = [
	{
	"id":0,
	"position":Vector3(0,0,0),
	"fk_region":Vector3(0,0,0)
	},
	{
	"id":1,
	"position":Vector3(0,0,0),
	"fk_region":Vector3(0,0,0)
	}
]

var Entidade:Array = [
	{
		"id":0,
		"position":Vector3(2,0,2),
		"fk_grid":0
	},
	{
		"id":1,
		"position":Vector3(30,0,2),
		"fk_grid":1
	}
]
var Cidade:Array = [
	{
		"fk_eid":0,
		"name":"cacatua",
		"population":0,
		"gold":0,
		"wood":0,
		"iron":0,
		"copper":0,
		"food":1000
	}
]
var Unidade:Array = [
	{
		"fk_eid":1,
		"life":200,
		"damage":100,
		"defence":10,
		"speed":2,
		"payment":2
	}
]
var Actions:Array = [
	{
		"id":1,
		"start_time":0,
		"duration":200,
		"fk_unit":1
	}
]
