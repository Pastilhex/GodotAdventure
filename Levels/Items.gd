extends Node2D

var cherry = preload("res://Items/health.tscn")

func _on_timer_timeout():
	var cherry_tmp = cherry.instantiate()
	var rng = RandomNumberGenerator.new()
	var ranint = rng.randf_range(100, 1550)
	cherry_tmp.position = Vector2(ranint, 437)
	add_child(cherry_tmp)
