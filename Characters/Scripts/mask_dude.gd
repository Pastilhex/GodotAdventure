extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -400.0
var jump_count = 0
var jump_speed = -250

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func horizontal_animation(direction):
	#Se a direção for diferente de 0 move-se para os lados
	if direction != 0:
		velocity.x = direction * SPEED
		$Animation.play("run")
		if direction > 0:
			get_node("Texture").flip_h = false
		else:
			get_node("Texture").flip_h = true
	else:
		$Footsteps.play()
		velocity.x = move_toward(velocity.x, 0, SPEED)
		$Animation.play("idle")

func vertical_animation():
	#Se a velocidade vertical for diferente de 0 é pq está no ar
	if velocity.y < 0:
		$Animation.play("jump")
	elif velocity.y > 0:
		$Animation.play("fall")

func jump():
	if is_on_floor():
		jump_count = 0
	if Input.is_action_just_pressed("jump") and jump_count < 2:
		velocity.y = jump_speed
		$Jump.play()
		jump_count += 1
		print(jump_count)

func bounce():
	velocity.y = jump_speed

func check_collision():
	for i in get_slide_collision_count():
		var collider = get_slide_collision(i).get_collider()
		if collider.is_in_group("bat"):
			if position.y < collider.position.y:
				if collider.alive():
					bounce()
				collider.kill()

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction = Input.get_axis("left", "right")
	horizontal_animation(direction)
	vertical_animation()
	jump()
	move_and_slide()
	check_collision()

func _input(event):
	if event.is_action_pressed("restart"):
		get_tree().reload_current_scene()
