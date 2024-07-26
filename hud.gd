extends CanvasLayer

const MENU_SCENE = "res://game_menu.tscn"
const GAME_SCENE = "res://main.tscn"

var score = 0

var bronze_medal = load("res://assets/sprites/medal_bronze.png")
var silver_medal = load("res://assets/sprites/medal_silver.png")
var gold_medal = load("res://assets/sprites/medal_gold.png")
var platinum_medal = load("res://assets/sprites/medal_platinum.png")

func _ready() -> void:
	$Control/Overlay/PlayButton.hide()
	$Control/Overlay/ColorRect.hide()
	$Control/Overlay/MenuButton.hide()
	$Control/GameOver.hide()
	$Control/ScoreLeaderboard.hide()
	$Control/HBoxButtons/StartButton.hide()
	$Control/HBoxButtons/LeaderBoardButton.hide()

func show_game_over() -> void:
	var best_score: int = SaveScore.load()
	$Control/ScoreLeaderboard/NewBest.hide()
	$Control/GameOver.animate()
	$Control/Overlay.hide()
	$Control/ScoreLeaderboard.animate()
	$Control/HBoxButtons/StartButton.show()
	$Control/HBoxButtons/LeaderBoardButton.show()
	$Control/ScoreLeaderboard/BestScore.text = str(score) if score >= best_score else str(best_score)
	$Control/ScoreLeaderboard/Score.score = score

	if score > best_score:
		$Control/ScoreLeaderboard/NewBest.show()
		SaveScore.save(str(score))
		
func update_score() -> void:
	score += 1
	$Control/ScoreLabel.text = str(score)
	
func _on_player_on_player_ready():
	$Control/GetReadyMessage.hide()
	$Control/PressToPlayMessage.hide()

func _on_play_button_pressed():
	$Control/Overlay/PauseButton.show()
	$Control/Overlay/PlayButton.hide()
	$Control/Overlay/ColorRect.hide()
	$Control/Overlay/MenuButton.hide()
	get_tree().paused = false

func _on_pause_button_pressed():
	$Control/Overlay/PlayButton.show()
	$Control/Overlay/PauseButton.hide()
	$Control/Overlay/ColorRect.show()
	$Control/Overlay/MenuButton.show()
	get_tree().paused = true

func _on_start_button_pressed():
	SceneManager.change_scene(GAME_SCENE)
func _on_menu_button_pressed():
	get_tree().paused = false
	$Control/Overlay/ColorRect.hide()
	$Control/Overlay/MenuButton.hide()
	SceneManager.change_scene(MENU_SCENE)

func _on_score_score_count_done(final_score):
	if final_score >= 40: 
		$Control/ScoreLeaderboard/Medal.change_medal(platinum_medal)
	elif final_score >= 30:
		$Control/ScoreLeaderboard/Medal.change_medal(gold_medal)
	elif final_score >= 20:
		$Control/ScoreLeaderboard/Medal.change_medal(silver_medal)
	elif final_score >= 10:
		$Control/ScoreLeaderboard/Medal.change_medal(bronze_medal)
