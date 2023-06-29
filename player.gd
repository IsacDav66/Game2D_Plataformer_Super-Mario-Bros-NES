extends CharacterBody2D


const SPEED = 150.0
	
const LONG_JUMP_VELOCITY = -225.0
const LONG_JUMP_HOLD_TIME = 0.18

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var anim = get_node("AnimationPlayer")
var jumpHoldTimer = 0.0
var isJumping = false

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = LONG_JUMP_VELOCITY
		anim.play("Jump")
		$AudioStreamPlayer2D.playing = true
		isJumping = true
		jumpHoldTimer = 0.0
		#print("Jump")
		
	if isJumping:
		if Input.is_action_pressed("ui_accept") and jumpHoldTimer < LONG_JUMP_HOLD_TIME:
			velocity.y = LONG_JUMP_VELOCITY
			jumpHoldTimer += delta
		else:
			isJumping = false
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	
	if direction == -1:
		get_node("AnimatedSprite2D").flip_h=true
	elif direction == 1:
		get_node("AnimatedSprite2D").flip_h= false
	if direction:
		velocity.x = direction * SPEED
		if velocity.y == 0:
			anim.play("Run")
			#print("Run")
	
	else:
		
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if velocity.y == 0:
			anim.play("Idle")
			#print("Idle")
	if velocity.y >0:
		anim.play("Fall")
		#print("Fall")

	move_and_slide()
	
	if Game.playerHP <= 0:
		queue_free()
		get_tree().change_scene_to_file("res://Main.tscn")


func _on_area_2d_area_entered(area):
	if area.get_parent().is_in_group("Interrogante"):
		area.get_parent().golpe()
		velocity.y=0
		
	if area.get_parent().is_in_group("Bloque"):
		area.get_parent().golpe1()
		

