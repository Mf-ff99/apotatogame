extends CharacterBody2D

@export var speed = 600

func get_input():
	var input_direction = Input.get_vector("move_left","move_right","move_up","move_down")
	velocity = input_direction * speed

func _physics_process(_delta):
	if velocity.length() > 0.0:
		$potato.play_walk_animation()

	if velocity.length() == 0.0:
		$potato.play_idle_animation()
		
	get_input()
	move_and_slide()
