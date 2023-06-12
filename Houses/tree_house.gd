extends Node2D

var readyToOpen = false
@onready var player = $MaskDude


func _ready():
	Globals.inside_buildings = true

func _process(_delta):
	if Input.is_action_pressed("enter") && readyToOpen == true:
		get_tree().change_scene_to_file(Globals.stage)
	$Candle.play("candle")

func _on_tree_house_door_body_entered(body):
	if body.name == "MaskDude":
		readyToOpen = true
