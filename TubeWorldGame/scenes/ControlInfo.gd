extends Node

func _on_MenuButton_pressed():
	$ButtonSound.play()
	get_tree().change_scene("res://scenes/Main.tscn")
