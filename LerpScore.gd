extends Label

signal score_count_done(final_score)

var value: int = 0
var start: bool = false
var score: int = 0
var t: float = 0.0
var duration = 2

func _process(delta):
	if start:
		t += delta
		if value == score:
			start = false
			score_count_done.emit(score)
		value = lerp(value, score, t * duration)
		text = str(int(value))
		
