extends Area2D

@onready var item_name = str(owner.name)

func _on_body_entered(body):
	print(item_name)
	if body.is_in_group("player"):
		if (item_name.contains("Health")) && Globals.player_health < Globals.player_max_health:
			Globals.player_health += 10
			body.health_update()
			print(Globals.player_health)
			
		elif owner.is_in_group("fruits"):
			Globals.fruit += 1
			owner.get_node("AnimatedSprite2D").play("collected")
		var tween = get_tree().create_tween()
		var tween1 = get_tree().create_tween()
		tween.tween_property(owner, "position", owner.position - Vector2(0,50), 1)
		tween1.tween_property(owner, "modulate:a", 0, 0.5)
		tween.tween_callback(owner.queue_free)
