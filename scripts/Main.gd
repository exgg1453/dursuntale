extends Node2D

func _ready():
	var start_btn = $CanvasLayer/TitleScreen/StartButton
	start_btn.pressed.connect(_on_start_pressed)

func _on_start_pressed():
	print("Oyun başlıyor!")
	# get_tree().change_scene_to_file("res://scenes/Game.tscn")
