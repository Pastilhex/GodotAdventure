extends CharacterBody2D

enum States{DEFAULT, DEAD}
var state = States.DEFAULT
var speed = 40.0
var move_direction = -1
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var rayslime := $RaySlime as RayCast2D
@onready var rayleft := $RayLeft as RayCast2D
@onready var rayright := $RayRight as RayCast2D
@export var slime_margin = Vector2(-25,0)


func _ready():
	$AnimationPlayer.play("run")

func kill():
	if state != States.DEAD:
		state = States.DEAD
		$AnimationPlayer.play("hit")
		var tween = get_tree().create_tween()
		var tween1 = get_tree().create_tween()
		tween.tween_property(self, "position", position - Vector2(0, -30), 0.25)
		tween1.tween_property(self, "modulate:a", 0, 0.25)
		tween.tween_callback(queue_free)

func alive() -> bool:
	if state != States.DEAD:
		return true
	return false
	
func _physics_process(delta):
	if state == States.DEFAULT:
		if not rayright.is_colliding():
			move_direction *= -1
		if rayslime.is_colliding():
			print("Yess")
			rayslime.target_position = slime_margin * move_direction
			move_direction *= -1
		if move_direction < 0:
			$Sprite2D.flip_h = false
		else:
			$Sprite2D.flip_h = true
		velocity.x = speed * move_direction
	elif state == States.DEAD:
		velocity.x = move_toward(velocity.x, 0, (speed * delta) / 0.8)
		#velocity.y += gravity * delta
	move_and_slide()