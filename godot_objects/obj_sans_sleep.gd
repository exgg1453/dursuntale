# Auto-converted from GameMaker: obj_sans_sleep
extends Node2D

func _ready():
	image_speed= 0.05
	scr_depth()
	snoozer= instance_create(x + sprite_width / 2, y - 1, 1294/* obj_snoozer */)
	if(GS.plot > 121 or GS.flag[67] == 1) instance_destroy()

func _gm_event_1_0():
	with(snoozer) instance_destroy()

func _process(delta: float):
	if(GS.plot > 121) instance_destroy()
	gone= 0
	if(GS.flag[413] > 0) gone= 1
	if(GS.flag[67] == 1) gone= 1
	if(gone == 1) instance_destroy()

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
