extends CharacterBody2D

const MAX_SPEED : float = 100.0
const GRAVITY : float = 25.0

var motion := Vector2()
# Called when the node enters the scene tree for the first time.
func _ready():
	
	motion.x = MAX_SPEED
	pass

func _next_to_left_wall() -> bool:
	#print("izquierda")
	return $LeftRayCast2D2.is_colliding()
	
func _next_to_right_wall() -> bool:
	#print("derecha")
	return $RightRayCast2D.is_colliding()
#func _next_to_floor_wall() -> bool:
#	return $AnimatedSprite2D/FlorrRayCast2D2.is_colliding()
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _flip():
	
	if _next_to_right_wall() or _next_to_left_wall():
		
		motion.x *= -1
		
		$AnimatedSprite2D.scale.x *= -1

func _process(delta):
	motion.y += GRAVITY
	_flip()
	velocity = motion
	move_and_slide()
	pass
