extends Node2D

func _process(delta):
	match Game.PlayerSelect:
		0:
			get_node("PlayerSelect").play("Player0")
			get_node("NameCharacter").text = "Polly"
		1:
			get_node("PlayerSelect").play("Player1")
			get_node("NameCharacter").text = "Wolf"
		2:
			get_node("PlayerSelect").play("Player2")
			get_node("NameCharacter").text = "Lina"
		3:
			get_node("PlayerSelect").play("Player3")
			get_node("NameCharacter").text = "Dora"

func _on_LeftButton_pressed():
	if Game.PlayerSelect > 0:
		Game.PlayerSelect -= 1
		$ButtonSound.play()


func _on_RightButton_pressed():
	if Game.PlayerSelect < 3:
		Game.PlayerSelect += 1
		$ButtonSound.play()


func _on_SelectButton_pressed():
	$ButtonSound.play()
	get_tree().change_scene("res://scenes/Main.tscn")
