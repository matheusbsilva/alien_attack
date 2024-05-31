extends CharacterBody2D

signal took_damage

var speed = 350
var rocket_scene = preload("res://scenes/rocket.tscn")
@onready var rocket_container = $RocketContainer


func _physics_process(delta):
	process_movement_input()
	move_and_slide()
	crop_position()
	
func _process(delta):
	if Input.is_action_just_pressed("shoot"):
		shoot()
	
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
		
func shoot():
	var rocket = rocket_scene.instantiate()
	rocket_container.add_child(rocket)
	rocket.global_position = global_position
	rocket.global_position.x += 80

func take_damage():
	emit_signal("took_damage")
	
func die():
	queue_free()
