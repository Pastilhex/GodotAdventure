extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("spikes_on")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.is_in_group("player"):
		Globals.player_health -= 1
		print(Globals.player_health)
	pass # Replace with function body.
