extends Area2D

@export var bounce = -250


func _ready():
	$AnimationPlayer.play("spikes_on")


func _on_body_entered(body):
	if body.is_in_group("player"):
		body.velocity.y = bounce
		if Globals.player_health > 0:
			Globals.player_health =  Globals.player_health - 10
			print(Globals.player_health)
			body.health_update()
		else:
			queue_free()
			get_tree().reload_current_scene()
