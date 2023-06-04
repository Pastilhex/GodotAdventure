extends CharacterBody2D

enum States{DEFAULT, DEAD}
var state = States.DEFAULT
var speed = 50.0
var move_direction = -1
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var raybat := $RayBat as RayCast2D

func _ready():
	$AnimationPlayer.play("fly")

func kill():
	if state != States.DEAD:
		state = States.DEAD
		$AnimationPlayer.play("hit")
		var tween = get_tree().create_tween()
		tween.tween_property(self, "position", position - Vector2(0, -30), 0.25)
		var tween1 = get_tree().create_tween()
		tween1.tween_property(self, "modulate:a", 0, 0.25)
		tween.tween_callback(queue_free)

func alive() -> bool:
	if state != States.DEAD:
		return true
	return false

func _physics_process(delta):
	
	if state == States.DEFAULT:
		if raybat.is_colliding():
			move_direction *= -1
			#raybat.scale *= -1 usually altering scale is a bad thing specially with collisions, can cause weird bugs
			raybat.target_position = Vector2(50, 0) * move_direction
		if move_direction < 0:
			$Sprite2D.flip_h = false
		else:
			$Sprite2D.flip_h = true
		velocity.x = speed * move_direction
	elif state == States.DEAD:
		velocity.x = move_toward(velocity.x, 0, (speed * delta) / 0.8)
		velocity.y += gravity * delta
		#queue_free()
	move_and_slide()
