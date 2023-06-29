extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func golpe1()-> void:
		$AnimationPlayer.play("Golpe")
		$AudioStreamPlayer.playing = true
