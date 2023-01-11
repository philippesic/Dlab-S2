extends Control

var scoreNode
var score = 0
var scoreModifier = 0
var scoreText

func _ready():
	scoreNode = get_node("Score")

	while true:
		scoreModifier = get_random_number(250, 1750)
		score = score + scoreModifier
		scoreText = str(score)
		yield(get_tree().create_timer(rand_range(1, 6)), "timeout")
		scoreNode.set_text(scoreText)

func get_random_number(minimum, maximum):
	return randi() % (maximum - minimum + 1) + minimum

