# Auto-converted from GameMaker: obj_spikes_room
extends Node2D

func _ready():
	frame= 0
	image_speed= 0
	yarl= 0
	if(room == 8) yarl= 4.5
	if(room == 15) yarl= 99
	if(room == 17) yarl= 99
	if(room == 22) yarl= 12
	if(room == 24 and x < 60) yarl= 13
	if(room == 25 and x < 160) yarl= 14
	if(room == 26 and x > 320) yarl= 15
	if(room == 57) yarl= 48
	if(room == 58) yarl= 52
	if(room == 59) yarl= 55

func _process(delta: float):
	if(GS.plot > yarl) frame= 1
	if(room == 15 and GS.flag[35] == 1) frame= 1
	if(room == 17 and GS.flag[33] == 1) frame= 1

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
