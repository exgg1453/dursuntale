# Auto-converted from GameMaker: obj_rainbowbolt_testgen
extends Node2D

func _gm_event_6_54():
	gg= instance_create(mouse_x, 380, 584/* obj_rainbowtarget */)
	gg.giga= 1
	gg.scale.x= 3
	gg.scale.y= 3

func _gm_event_6_50():
	instance_create(mouse_x, 380, 584/* obj_rainbowtarget */)

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
