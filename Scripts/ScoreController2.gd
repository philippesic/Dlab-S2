extends Control

var scoreNode
var score = 0
var scoreText

func _ready():
	scoreNode = get_node("Score")

	while true:
		score = get_random_number(-2147483647, 2147483647)
		scoreText = str(score)
		yield(get_tree().create_timer(rand_range(1, 6)), "timeout")
		scoreNode.set_text(scoreText)

func get_random_number(minimum, maximum):
	return randi() % (maximum - minimum + 1) + minimum
