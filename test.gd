extends Spatial

var dict = {"Type":"City", "Position":[10,0,-10], "Player":"ST"}
func _ready():
	print("a")
	
	print(JSON.print(dict))
