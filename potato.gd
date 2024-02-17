extends Sprite2D

func play(anim):
	$AnimationPlayer.play(anim)

func get_input():
	var input_direction = Input.get_vector("left","right","jump","move_down")
	if Input.is_action_pressed("move_left"):
		flip_h = true
	elif Input.is_action_pressed("move_right"):
		flip_h = false

func _physics_process(delta):
	get_input()
