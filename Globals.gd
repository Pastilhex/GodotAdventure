extends Node

var stage = "No Map Loaded"
var inside_buildings = false
var player_position = Vector2(0,0)

func set_data(plx, ply):
	player_position = Vector2(plx, ply)
