extends Node2D

var readyToOpen = false
@onready var player = $MaskDude

# Called when the node enters the scene tree for the first time.
func _ready():
	Globals.inside_buildings = true
	pass


func _process(delta):
	if Input.is_action_pressed("enter") && readyToOpen == true:
		get_tree().change_scene_to_file(Globals.stage)


func _on_tree_house_door_body_entered(body):
	if body.name == "MaskDude":
		readyToOpen = true
