extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -400.0
var jump_count = 0
var jump_speed = -250
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _ready():
#	var tilemap_rect = get_parent().get_parent().get_node("Environment/Terrain/Baseterrain").get_used_rect()
#	var tilemap_cell_size = get_parent().get_parent().get_node("Environment/Terrain/Baseterrain").cell_quadrant_size
#	$Camera2D.limit_left = tilemap_rect.position.x * tilemap_cell_size.x
#	$Camera2D.limit_right = tilemap_rect.end.x * tilemap_cell_size.x
#	$Camera2D.limit_top = tilemap_rect.position.y * tilemap_cell_size.y
#	$Camera2D.limit_top = tilemap_rect.end.y * tilemap_cell_size.y
	pass
	
	
func horizontal_animation(direction):
	#Se a direção for diferente de 0 move-se para os lados
	if direction != 0:
		velocity.x = direction * SPEED
		$Dust.emitting = true
		$Animation.play("run")
		if direction > 0:
			get_node("Texture").flip_h = false
		else:
			get_node("Texture").flip_h = true
	else:
		$Footsteps.play()
		velocity.x = move_toward(velocity.x, 0, SPEED)
		$Dust.emitting = false
		$Animation.play("idle")

func vertical_animation():
	#Se a velocidade vertical for diferente de 0 é pq está no ar
	if velocity.y < 0:
		$Dust.emitting = false
		$Animation.play("jump")
	elif velocity.y > 0:
		$Dust.emitting = false
		$Animation.play("fall")

func jump():
	if is_on_floor():
		jump_count = 0
	if Input.is_action_just_pressed("jump") and jump_count < 2:
		velocity.y = jump_speed
		$Jump.play()
		jump_count += 1

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


	
