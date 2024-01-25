extends Area2D


var Ball:RigidBody2D
@export var Force = 40000
@export var Sprite:AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Kick"):
		Kick()


func _on_body_entered(body):
	if body.is_in_group("Ball"):
		Ball = body
	

func _on_body_exited(body):
	if body.is_in_group("Ball"):
		Ball = null


func Kick():
	if Ball != null:
		if Sprite.flip_h:
			Ball.apply_central_force(Vector2(-Force, -Force/1.5))
		else:
			Ball.apply_central_force(Vector2(Force, -Force/1.5))
