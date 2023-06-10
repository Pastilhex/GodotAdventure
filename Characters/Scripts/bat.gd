extends CharacterBody2D


@onready var raybat := $RayBat as RayCast2D
@export var bat_margin = Vector2(-25,0)
var speed = 25.0
var chase_speed = 1
var move_direction = -1
var bat_chase = false
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var player = null


func _ready():
	$AnimationPlayer.play("fly")
	$BatSound.play()

func _physics_process(_delta):
	velocity.x = speed * move_direction
	if raybat.is_colliding():
		raybat.target_position = bat_margin * move_direction
		move_direction *= -1
	if bat_chase && player.position < self.position:
		position += (player.position - self.position).normalized()
		$Sprite2D.flip_h = false
	else:
		$Sprite2D.flip_h = true
	if move_direction < 0:
		$Sprite2D.flip_h = false
	else:
		$Sprite2D.flip_h = true
	print(move_direction)
	move_and_slide()

func _on_area_detection_body_entered(body):
	player = body
	if body.name == "MaskDude":
		bat_chase = true

func _on_area_detection_body_exited(body):
	if body.name == "MaskDude":
		bat_chase = false
