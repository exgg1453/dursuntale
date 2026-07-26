# Auto-converted from GameMaker: obj_lastruins_bg
extends Node2D

func _process(delta: float):
	background_x[0]+= 0.1
	background_x[1]+= 0.3
	background_x[2]+= 0.5
	background_x[3]+= 0.6
	background_x[4]++
	background_x[5]+= 1.5
	background_x[6]+= 2

func _spawn(scene_name: String, px: float, py: float) -> Node:
	var scene = load("res://godot_objects/" + scene_name + ".tscn")
	if scene:
		var inst = scene.instantiate()
		inst.position = Vector2(px, py)
		get_parent().add_child(inst)
		return inst
	return null

func _play_sound(snd: String) -> void:
	var p := AudioStreamPlayer.new()
	add_child(p)
	var s = load("res://sound/audio/" + snd + ".ogg")
	if not s: s = load("res://sound/audio/" + snd + ".wav")
	if s:
		p.stream = s; p.play()
		p.finished.connect(p.queue_free)

func _stop_sound(_snd: String) -> void:
	pass  # TODO: track AudioStreamPlayer by name
