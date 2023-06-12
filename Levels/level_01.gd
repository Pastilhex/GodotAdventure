extends Node2D

var readyToOpen = false
@onready var player = $Characters/MaskDude

# Called when the node enters the scene tree for the first time.
func _ready():
#	$BackgroundSound.play()
	if Globals.inside_buildings == true:
		get_node("Characters/MaskDude").position = Globals.player_position
		Globals.inside_buildings = false

func _process(_delta):
	if Input.is_action_just_pressed("enter") && readyToOpen == true:
		Globals.set_data(player.position.x, player.position.y)
		Globals.stage = "res://Levels/level_01.tscn"
		get_tree().change_scene_to_file("res://Houses/tree_house.tscn")

func _on_tree_house_door_body_entered(_body):
	if Globals.fruit >= 10:
		readyToOpen = true

func _on_tree_house_door_body_exited(_body):
		readyToOpen = false

