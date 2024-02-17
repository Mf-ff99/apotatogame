extends CharacterBody2D

const JUMP_VELOCITY = -150.0
const SPEED = 280

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@export var speed = 300

@onready var anim = $potato

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
#		if velocity.y > 0:
#			anim.play('fall')

	# Handle Jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		anim.play("jump")

	var direction = Input.get_axis("left", "right")
	if direction == -1:
		anim.flip_h = true
	elif direction == 1:
		anim.flip_h = false
		
	if direction:
		velocity.x = direction * SPEED
		if velocity.y == 0:
			anim.play("walk")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if velocity.y == 0:
			anim.play("idle")

	move_and_slide()
