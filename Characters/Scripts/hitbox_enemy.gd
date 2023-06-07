extends Area2D

@export var bounce = -250
 
func _on_body_entered(body):
	if body.name == "MaskDude":
		print("Bateu bateu")
		body.velocity.y = bounce
		owner.bomb_guy_anim.play("hit")
	
