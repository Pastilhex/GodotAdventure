extends CharacterBody2D


var speed = 50.0
var move_direction = -1
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var raybat := $RayBat as RayCast2D

func _ready():
	$AnimationPlayer.play("fly")

func _physics_process(delta):
	if raybat.is_colliding():
		move_direction *= -1
		raybat.scale *= -1
	if move_direction < 0:
		$Sprite2D.flip_h = false
	else:
		$Sprite2D.flip_h = true
		
	velocity.x = speed * move_direction
	
	move_and_slide()
