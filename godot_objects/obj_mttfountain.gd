# Auto-converted from GameMaker: obj_mttfountain
extends Node2D

func _ready():
	scr_depth()
	siner= 0
	pudd= scr_marker(x, y, 1984)
	pudd.image_speed= 0.5
	pudd.z_index= 800000

func _on_outside_room():
	siner++
	pudd.x= x - 14 + cos(siner / 2)
	pudd.y= y + 59 + sin(siner / 2)
	draw_sprite(1982/* spr_mttfountain */, floor(siner / 10), x, y)
	draw_sprite(1983/* spr_mttfountain_water */, floor(siner / 2), x + cos(siner) / 2, y + sin(siner) / 2)

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
