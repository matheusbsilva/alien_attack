extends Node2D

@onready var player = $Player
@onready var enemy_spawner = $EnemySpawner
@onready var hud = $UI/HUD
@onready var ui = $UI
@onready var enemy_hit_sound = $EnemyHitSound
@onready var took_damage_sound = $TookDamageSound
var game_over_screen = preload("res://scenes/game_over_screen.tscn")

var lives = 3
var score = 0

func _ready():
	player.connect("took_damage", _take_life)
	enemy_spawner.connect("enemy_spawned", _on_enemy_spawn)
	hud.set_score_label(score)
	hud.set_lives(lives)

func _on_deathzone_area_entered(area):
	area.queue_free()

func _take_life():
	lives -= 1
	hud.set_lives(lives)
	took_damage_sound.play()
	
	if lives == 0:
		player.die()
		await get_tree().create_timer(1).timeout
		
		var game_over = game_over_screen.instantiate()
		game_over.set_score(score)
		ui.add_child(game_over)
	
func _on_enemy_spawn(enemy):
	enemy.connect("died", _on_enemy_death)
	add_child(enemy)

func _on_enemy_death():
	score += 1
	enemy_hit_sound.play()
	hud.set_score_label(score)

func _on_enemy_spawner_path_enemy_spawned(path_enemy):
	add_child(path_enemy)
	path_enemy.enemy.connect("die", _on_enemy_death)
