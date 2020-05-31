extends Camera

export (PackedScene) var testBuilding:PackedScene = load("res://Entities/Unit/UnitEntity.tscn")
var movement_vect: Vector3
var zoom_vect = 0 #local z of camera
var zoom: float = 0
export var speed = 200
var current_speed = 0.0
var current_zoom_speed = 0.0
var accel = .01
var zoom_accel = .1
var zoom_maxpeed = 50
var maxzoom = 20

var process_click:bool = false
var evpos:Vector2

var last_from:Vector3 = Vector3()
var last_to:Vector3 = Vector3()

# Called when the node enters the scene tree for the first time.

func _ready():
	call_deferred("setup")

func setup():
	ClickManager.connect("clicked", self, "spawnTest")
	SelectionManager.create_preview_obj("constructor")
	SelectionManager.previewObject.name = "preview"


func _input(event):
	if event is InputEventMouse:
		last_from = project_ray_origin(event.position)
		last_to = last_from + project_ray_normal(event.position) * 100

func _physics_process(delta):
	var space_state = get_world().direct_space_state
	var result = space_state.intersect_ray(last_from, last_to)
	if result.has('position') and SelectionManager.previewObject:
		ClickManager.set_hover_pos(result.position)
	
func spawnTest(pos:Vector3):
	var newObj:Spatial = testBuilding.instance()
	get_parent().add_child(newObj)
	newObj.translation = pos

func _process(delta):
	if SelectionManager.previewObject:
		SelectionManager.previewObject.translation = ClickManager.last_hover_pos
	movement_vect = Vector3()
	zoom_vect = 0
	if Input.is_action_pressed("ui_up"):
		movement_vect.z -= 1
	if Input.is_action_pressed("ui_down"):
		movement_vect.z += 1
	if Input.is_action_pressed("ui_left"):
		movement_vect.x -= 1
	if Input.is_action_pressed("ui_right"):
		movement_vect.x += 1
	if Input.is_action_pressed("ui_page_down"):
		zoom_vect -= 1
	if Input.is_action_pressed("ui_page_up"):
		zoom_vect += 1
	
	var moving:Vector3 = movement_vect
	moving.x = abs(movement_vect.x)
	moving.y = abs(movement_vect.y)
	moving.z = abs(movement_vect.z)
	
	if(moving > Vector3()):
		current_speed = lerp(current_speed, speed, accel)
	else:
		current_speed = 0
	
	if abs(zoom_vect) > 0:
		current_zoom_speed = lerp(current_zoom_speed, zoom_maxpeed, zoom_accel)
		global_translate(Vector3(0,zoom_vect*current_zoom_speed*delta, 0))
		translation.y = clamp(translation.y, 5, 20)
	else:
		current_zoom_speed = 0
	
	global_translate((movement_vect*current_speed*delta))
