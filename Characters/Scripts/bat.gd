extends CharacterBody2D


@onready var raybat := $RayBat as RayCast2D
@export var bat_margin = Vector2(-20,0)
var speed = 15.0
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
	if bat_chase:
		position += (player.position - self.position).normalized()
		if (player.position.x - self.position.x) < 0:
			$Sprite2D.flip_h = false
		elif (player.position.x - self.position.x) > 0:
			$Sprite2D.flip_h = true
	elif not bat_chase:
		if move_direction < 0:
			$Sprite2D.flip_h = false
		else:
			$Sprite2D.flip_h = true
	move_and_slide()

func _on_area_detection_body_entered(body):
	player = body
	if body.name == "MaskDude":
		bat_chase = true

func _on_area_detection_body_exited(body):
	if body.name == "MaskDude":
		bat_chase = false
