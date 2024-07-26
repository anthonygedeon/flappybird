extends TextureRect

func _ready():
	$Sparkle.hide()
	$Timer.stop()

func change_medal(image: Texture2D = null) -> void:
	$Timer.start()
	$Sparkle.show()
	$Sparkle.play()
	texture = image

func _on_timer_timeout():
	$Sparkle.position = Vector2(randi_range(0, 70), randi_range(0, 70))
