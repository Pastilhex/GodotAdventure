extends CharacterBody2D


@onready var raycast := $RayCast2D as RayCast2D
@onready var bomb_guy_anim := $AnimationPlayer as AnimationPlayer
@export var ray_margin = Vector2(50,0)
const speed = 50.0
var direction = 1
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var player = null
var bomb_guy_chase = false

func _physics_process(delta):
	# Add the gravity.
	velocity.y += gravity * delta
	
	if raycast.is_colliding():
		direction *= -1
	
	# Add RayCast direction
	raycast.target_position = ray_margin * direction
	
	# Add movement
	velocity.x = direction * speed
	$AnimationSprites.play("run")
	
	# Flip Sprite with direction
	if (direction > 0):
		$AnimationSprites.flip_h = false
	elif (direction < 0):
		$AnimationSprites.flip_h = true
		
	move_and_slide()
