extends Area2D

func _on_Hitbox_body_entered(body):
	if body is Player:
		body.player_die() # calling everything from player_die in player script
