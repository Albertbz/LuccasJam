extends Control

var round = 0

var startHealth = 5
var health = startHealth

var questions = [
	"Though they sound happy, what animal's \"laugh\" is a reaction to being threatened?",
	"Capable of exceeding 186 miles per hour, what is the fastest creature in the animal kingdom?"
]

var answers = [
	[
		"hyena",
		"cheetah"
	],
	[
		"baboon",
		"golden eagle"
	],
	[
		"fox",
		"peregrine falcon"
	],
	[
		"woodpecker",
		"sloth"
	]
]

var correctAnswers = [
	0,
	2
	
]

func _ready():
	round_start()
	get_node("Health").text = "Health: " + str(health)

func round_start():
	get_node("Question").text = questions[round]
	get_node("Answer0").text = answers[0][round]
	get_node("Answer1").text = answers[1][round]
	get_node("Answer2").text = answers[2][round]
	get_node("Answer3").text = answers[3][round]

func answer_pressed(answer):
	if correctAnswers[round] != answer:
		health -= 1
	else:
		round += 1
	if health == 0:
		round = 0
		health = startHealth
	
	get_node("Health").text = "Health: " + str(health)
		
	print(health)
	round_start()


func _on_answer_0_pressed():
	answer_pressed(0)


func _on_answer_1_pressed():
	answer_pressed(1)


func _on_answer_2_pressed():
	answer_pressed(2)


func _on_answer_3_pressed():
	answer_pressed(3)
