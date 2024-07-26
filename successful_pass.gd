extends Area2D

func _on_body_entered(body):
	get_tree().root.get_node("/root/Main/HUD").update_score()
	$Audio_success.play()
