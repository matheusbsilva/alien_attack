extends Node2D

@onready var player = $Player
var lives = 3
# Called when the node enters the scene tree for the first time.
func _ready():
	player.connect("took_damage", _take_life)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_deathzone_area_entered(area):
	area.die()

func _take_life():
	lives -= 1
	
	if lives == 0:
		print("Game over")
		player.die()
		
	
