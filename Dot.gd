extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal player_entered

func _on_Dot_body_entered(body):
	if body.get_name() == "Player":
		emit_signal("player_entered")
