extends Node2D


@onready var timer = $Timer
var enemy_scene = preload("res://scenes/enemy.tscn")
@onready var spawn_positions = $SpawnPositions

func _ready():
	timer.connect("timeout", _on_timeout)
	
func _on_timeout():
	spawn_enemy()
	
func spawn_enemy():
	var positions = spawn_positions.get_children()
	var position = positions.pick_random()
	
	var enemy = enemy_scene.instantiate()
	enemy.global_position = position.global_position
	add_child(enemy)
