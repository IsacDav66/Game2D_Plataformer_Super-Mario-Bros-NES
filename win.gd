extends StaticBody2D

var verdad
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_meta_body_entered(body):
	if body.name == "Player":
		print("Player toco")
		get_tree().change_scene_to_file("res://Main.tscn")

#		verdad = true
#		_on_timer_ready(body)
#		print("e")
#		_on_timer_timeout(body)
#func _on_timer_ready(body):
#	print("a")
		


#func _on_timer_timeout(body):
#	print("finis")
#	if $Control/Timer.time_left == 0.0:
#		get_tree().change_scene_to_file("res://Main.tscn")
