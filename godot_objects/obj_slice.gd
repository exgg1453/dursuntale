# Auto-converted from GameMaker: obj_slice
extends Node2D

func _ready():
	image_speed= 0.5 - GS.stretch / 4
	scale.x= GS.stretch * 2 - 0.5
	scale.y= GS.stretch * 2 - 0.5
	x-= (scale.x - 1) * sprite_width / 2
	y-= (scale.y - 1) * sprite_height / 2
	snd_play(44/* snd_laz */)
	if(image_speed == 0) image_speed= 0.1
	GS.damagetimer= 1 / image_speed * image_number + 3

func _gm_event_7_7():
	queue_free()

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
