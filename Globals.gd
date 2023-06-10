extends Node

#Tree House Enter Door System
var stage = "No Map Loaded"
var inside_buildings = false
var player_position = Vector2(0,0)

#HP Player Control
var player_health = 100
var player_max_healt = 100.0
var player_health_recovery = 1.0
var player_mana = 100.0
var player_max_mana = 100.0
var player_mana_recovery = 1.0

#Tree House Door System
func set_data(plx, ply):
	player_position = Vector2(plx, ply)
