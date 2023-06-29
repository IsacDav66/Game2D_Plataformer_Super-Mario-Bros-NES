extends StaticBody2D

var Powerup = preload("res://moneda_interrogante.tscn")
func golpe() -> void:
	
	$AudioStreamPlayer.playing = true

	if $AnimationPlayer.current_animation == "Idle":
		$Area2D/AudioStreamPlayer.playing = true
		$AnimationPlayer.play("Golpe")
		print("audio")



func _on_animation_player_animation_finished(anim_name: String) -> void:
	if anim_name == "Golpe":
		var powerup_instance = Powerup.instantiate()
		powerup_instance.position = $".".position
		print("Moneda bloque" , position , $".".position)
		get_parent().add_child(powerup_instance)


func _on_area_2d_body_entered(body):
	if  body.name == "Player" && $AnimationPlayer.current_animation == "Golpe":
		print("+5")
		Game.Gold += 5
