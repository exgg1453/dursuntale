# Auto-converted from GameMaker: obj_mettaton_actor
extends Node2D

func _ready():
	scr_depth()
	m[0]= 1655
	m[1]= 1659
	m[2]= 1660
	m[3]= 1664
	m[4]= 1661
	m[5]= 1662
	m[6]= 1656
	m[7]= 1657
	if(GS.flag[20] < 7) sprite_index= m[GS.flag[20]]
	d= 0

func _process(delta: float):
	if(d == 0) scr_depth()
	if(GS.flag[20] < 7) sprite_index= m[GS.flag[20]]

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
