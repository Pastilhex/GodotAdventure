extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite2D/AnimationPlayer.play("idle")

func _on_button_pressed():
			get_tree().change_scene_to_file("res://Levels/level_01.tscn")
