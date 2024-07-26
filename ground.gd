extends StaticBody2D

var did_leave_screen = false

func _on_visible_on_screen_notifier_2d_screen_exited():
	did_leave_screen = true
