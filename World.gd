extends Node2D

var player_node : PackedScene = preload("res://Player.tscn")
var dot_node : PackedScene = preload("res://Dot.tscn")

var player_spawn_position : Vector2 = Vector2()
var player : KinematicBody2D
var dot : Area2D
var score : int = 0
var score_label : Label

const DOT_HEIGHT : int = 220

func _ready():
	randomize()
	score_label = get_node("ScoreLabel")
	player_spawn_position = get_node("PlayerSpawn").position

	dot = dot_node.instance()
	dot.connect("player_entered", self, "_player_scored")
	_randomize_dot_position()
	add_child(dot)

	player = player_node.instance()
	_reset_player_position()
	add_child(player)
	_update_score()

func _reset_player_position():
	player.reset_velocity()
	player.position = player_spawn_position
	

func _randomize_dot_position():
	var pos = randi() % 301 + 50
	if pos > 200:
		pos += 649
	
	dot.position = Vector2(pos, DOT_HEIGHT)
	

func _update_score():
	score_label.text = "Score: %d" % score

func _reset_score():
	score = 0
	
func _on_DeathZone_body_entered(body):
	if body.get_name() == "Player":
		_reset_score()
		_update_score()
		_reset_player_position()

func _player_scored():
	score += 1
	_randomize_dot_position()
	_update_score()
