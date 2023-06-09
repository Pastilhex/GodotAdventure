extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -400.0
var jump_count = 0
var jump_speed = -250
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var grounded = false


func _ready():
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

func landing_animation():
	$Landing.play()
	$DustExplosive.restart()
	$DustExplosive.emitting = true
	#can add dust cloud animation when landing

func jump():
	if is_on_floor():
		jump_count = 0
	if Input.is_action_just_pressed("jump") and jump_count < 2:
		velocity.y = jump_speed
		$Jump.play()
		jump_count += 1

func bounce():
	velocity.y = jump_speed


func _physics_process(delta):
	if not is_on_floor():
		grounded = false
		velocity.y += gravity * delta
	elif is_on_floor():
		if not grounded:
			grounded = true
			landing_animation()
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	

	
	
	
	var direction = Input.get_axis("left", "right")
	horizontal_animation(direction)
	vertical_animation()
	jump()
	move_and_slide()


func _input(event):
	if event.is_action_pressed("restart"):
		get_tree().reload_current_scene()


func _on_damage_player_area_body_entered(body):
	if body.is_in_group("enemy"):
		Globals.player_health -= 2;
		bounce()
		print(Globals.player_health)
	elif body.is_in_group("traps"):
		Globals.player_health -= 1;
		bounce()
		print(Globals.player_health)
