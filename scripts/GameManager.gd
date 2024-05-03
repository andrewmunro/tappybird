extends Node

signal on_game_start

@onready var scoreLabel = $"../Plane/score"
@onready var plane = $"../Plane"
@onready var animation_player = $"../Spikes/AnimationPlayer"

var game_started = false
var score = 0

func _process(delta):
	if not game_started and Input.is_action_just_pressed("tap"):
		game_started = true
		plane.start()
		animation_player.play("start")

func pickup():
	score += 1
	scoreLabel.text = str(score)
