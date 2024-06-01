extends Control

@onready var score = $Score
@onready var lives_left = $LivesLeft
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_score_label(new_score):
	score.text = "SCORE: {score}".format({'score': str(new_score)})

func set_lives(amount):
	lives_left.text = str(amount)
