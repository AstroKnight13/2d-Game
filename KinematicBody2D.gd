extends CharacterBody2D

const UP = Vector2(0,-1)
const GRAVITY = 20
const MAXFALLSPEED = 500
var MAXSPEED = 300
const JUMPFORCE = 500
const ACCEL = 20
var ANIMATIONSPEED = 1

var motion = Vector2()
func _ready():
	pass



func _physics_process(delta):
	
	motion.x = clamp(motion.x,-MAXSPEED,MAXSPEED)
	
	motion.y += GRAVITY
	if motion.y > MAXFALLSPEED:
		motion.y = MAXFALLSPEED
	
	if Input.is_action_pressed("sprint"):
		MAXSPEED = 500
	
	if Input.is_action_just_released("sprint"):
		MAXSPEED = 300
	
	
	
	if Input.is_action_pressed("right"):
		motion.x += ACCEL
		
		$Sprite2D.flip_h = false
	elif Input.is_action_pressed("left"):
		motion.x -= ACCEL
		
		$Sprite2D.flip_h = true
	else:
			$Sprite2D.stop()
			motion.x = lerp(motion.x,0.0,0.2)
		
	if is_on_floor():
		if Input.is_action_just_pressed("jump"):
			motion.y = -JUMPFORCE
			$Sprite2D.play("new_animation")
		if Input.is_action_just_released("jump"):
			$Sprite2D.stop
		
		if Input.is_action_pressed("sprint"):
			ANIMATIONSPEED = 3
		if Input.is_action_just_released("sprint"):
			ANIMATIONSPEED = 3
		
		if Input.is_action_pressed("right"):
			$Sprite2D.play("default", ANIMATIONSPEED)
		elif Input.is_action_pressed("left"):
			$Sprite2D.play("default", ANIMATIONSPEED)
		else:
			$Sprite2D.stop()
		
		
		
	
	
	set_velocity(motion)
	set_up_direction(UP)
	move_and_slide()
	motion = velocity
	
