extends Node

#Tree House Enter Door System
var stage = "No Map Loaded"
var inside_buildings = false
var player_position = Vector2(0,0)

#HP Player Control
var player_health = 100


#Tree House Door System
func set_data(plx, ply):
	player_position = Vector2(plx, ply)
