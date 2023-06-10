extends CharacterBody2D


@export var speed = 40.0
@onready var rayslime := $RaySlime as RayCast2D
@onready var rayleft := $RayLeft as RayCast2D
@export var slime_margin = Vector2(-25,0)
var move_direction = -1
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _ready():
	$AnimationPlayer.play("run")

func _physics_process(_delta):
	velocity.x = speed * move_direction
	if not rayleft.is_colliding() || rayslime.is_colliding():
		rayslime.target_position = slime_margin * move_direction
		move_direction *= -1
		rayleft.position *= -1
	if move_direction < 0:
		$Sprite2D.flip_h = false
	else:
		$Sprite2D.flip_h = true
	move_and_slide()
