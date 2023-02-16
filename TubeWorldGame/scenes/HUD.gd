extends CanvasLayer

signal start_game

func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()

func show_game_over():
	show_message("Game Over")
	yield($MessageTimer, "timeout")

	$Message.text = "Delete Tinder,\npls"
	$Message.show()

	yield(get_tree().create_timer(2), "timeout")
	$Message.text = "Tube world"
	$TextureButton.show()
	$TextInButton.show()
	$CharacherButton.show()
	$TextInButtonCharacter.show()
	$InfoButton.show()
	$TextInButtonInfo.show()

func update_score(score):
	$ScoreLabel.text = str(score)

func _on_MessageTimer_timeout():
	$Message.hide()

func _on_TextureButton_pressed():
	$TextureButton.hide()
	$TextInButton.hide()
	$CharacherButton.hide()
	$TextInButtonCharacter.hide()
	$InfoButton.hide()
	$TextInButtonInfo.hide()
	$ButtonSound.play()
	emit_signal("start_game")


func _on_CharacherButton_pressed():
	$ButtonSound.play()
	get_tree().change_scene("res://scenes/CharacterSelect.tscn")


func _on_InfoButton_pressed():
	$ButtonSound.play()
	get_tree().change_scene("res://scenes/ControlInfo.tscn")
