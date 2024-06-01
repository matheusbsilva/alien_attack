extends Node2D

signal enemy_spawned(enemy_instance)
signal path_enemy_spawned(path_enemy)

var enemy_scene = preload("res://scenes/enemy.tscn")
var path_enemy_scene = preload("res://scenes/path_enemy.tscn")
@onready var spawn_positions = $SpawnPositions
@onready var timer = $Timer

func _ready():
	timer.connect("timeout", _on_timeout)
	
func _on_timeout():
	spawn_enemy()
	
func spawn_enemy():
	var positions = spawn_positions.get_children()
	var position = positions.pick_random()
	
	var enemy = enemy_scene.instantiate()
	enemy.global_position = position.global_position
	emit_signal("enemy_spawned", enemy)

func _on_path_enemy_timer_timeout():
	var path_enemy = path_enemy_scene.instantiate()
	emit_signal("path_enemy_spawned", path_enemy)
