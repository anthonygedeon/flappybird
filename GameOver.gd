extends TextureRect

func _ready() -> void:
	modulate.a = 0
	position += Vector2.UP * 20

func animate() -> void:
	show()
	var tween = create_tween() \
		.set_trans(Tween.TRANS_LINEAR) \
		.set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "modulate:a", 1.0, 0.5)
	tween.parallel().tween_property(self, "position", position - Vector2.UP * 20, 0.3)

