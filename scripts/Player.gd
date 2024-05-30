extends CharacterBody2D

var speed = 350

func _physics_process(delta):
	process_movement_input()
	move_and_slide()
	crop_position()
	
func crop_position():
	var w_size = get_viewport_rect().size
	global_position = global_position.clamp(Vector2(0,0), w_size)
	
func process_movement_input():
	velocity = Vector2(0, 0)
	if Input.is_action_pressed("move_up"):
		velocity.y = -speed
	if Input.is_action_pressed("move_down"):
		velocity.y = speed
	if Input.is_action_pressed("move_left"):
		velocity.x = -speed
	if Input.is_action_pressed("move_right"):
		velocity.x = speed
