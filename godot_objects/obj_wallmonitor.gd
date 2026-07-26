# Auto-converted from GameMaker: obj_wallmonitor
extends Node2D

func _ready():
	image_speed= 0.1
	lit= 0
	active= 1
	if(room == 262) active= 0
	if(GS.flag[485] == 1) {
	    active= 0
	    if(room == 262) active= 2
	}

func _process(delta: float):
	if(active > 0 and instance_exists(1570/* obj_mainchara */) and lit == 0 and obj_mainchara.x > x - 20 and obj_mainchara.x < x + 50) {
	    lit= 1
	    snd_play(114/* snd_squeak */)
	    sprite_index= 2140/* spr_monitor_lit */
	    if(active == 2) sprite_index= 2141/* spr_monitor_lit_f */
	}

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
