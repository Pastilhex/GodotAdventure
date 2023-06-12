extends Area2D

@export var bounce = -250
 
func _on_body_entered(body):
	if body.name == "MaskDude" && owner.name != "Chicken":
		body.velocity.y = bounce
		owner.get_node("AnimationPlayer").play("hit")
		owner.get_node("Dead").play()
		var tween = get_tree().create_tween()
		var tween1 = get_tree().create_tween()
		tween.tween_property(owner, "position", owner.position - Vector2(0,-20), 0.25)
		tween1.tween_property(owner, "modulate:a", 0, 0.25)
		tween.tween_callback(owner.queue_free)
	elif body.name == "MaskDude" && owner.name == "Chicken":
		queue_free()
		get_tree().change_scene_to_file("res://main_menu.tscn")
