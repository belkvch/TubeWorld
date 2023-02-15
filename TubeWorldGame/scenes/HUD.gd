extends CanvasLayer

signal start_game

func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()

func show_game_over():
	show_message("Game Over")
	yield($MessageTimer, "timeout")

	$Message.text = "Tube World!"
	$Message.show()

	yield(get_tree().create_timer(1), "timeout")
	$TextureButton.show()
	$TextInButton.show()

func update_score(score):
	$ScoreLabel.text = str(score)

func _on_MessageTimer_timeout():
	$Message.hide()

func _on_TextureButton_pressed():
	$TextureButton.hide()
	$TextInButton.hide()
	emit_signal("start_game")
