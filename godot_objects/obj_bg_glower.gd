# Auto-converted from GameMaker: obj_bg_glower
extends Node2D

func _ready():
	d= 0
	h= 130

func _gm_event_7_0():
	d+= 0.05
	if(Input.is_action_pressed("move_right")) h++
	g= make_color_hsv(h, 100 + sin(d) * 100, 255)
	background_color= g

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
