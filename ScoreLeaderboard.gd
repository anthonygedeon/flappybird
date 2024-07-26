extends TextureRect

func _ready() -> void:
	position += Vector2.DOWN * 1000

func animate() -> void:
	show()
	$Score.show()
	$BestScore.show()
	var tween = create_tween() \
		.set_trans(Tween.TRANS_QUAD) \
		.set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "position", position - Vector2(0, 1000), 0.5)
	await tween.finished
	$Score.start = true
