extends Popup



func show_button():
	if get_tree().current_scene.is_in_group("level1"):
		$VBoxContainer/Level2Button.show()
		$AudioStreamPlayer.play()
	if get_tree().current_scene.is_in_group("level2"):
		$VBoxContainer/Level3Button.show()
		$AudioStreamPlayer.play()


func win():
	$ColorRect2.show()
	$VBoxContainer/YouWonLabel.show()
	$VBoxContainer/EndGameButton.show()
	$VBoxContainer/LevelCompletedLabel.hide()
	$AudioStreamPlayer.play()


func _on_Level2Button_pressed():
	get_tree().change_scene("res://World/Level2.tscn")


func _on_Level3Button_pressed():
	get_tree().change_scene("res://World/Level3.tscn")


func _on_button_pressed():
	get_tree().quit()


func _on_RetryButton_pressed():
	pass # Replace with function body.
