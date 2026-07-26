# Auto-converted from GameMaker: obj_screenwhiter
extends Node2D

func _ready():
	aaa= 0
	atimer= 0
	blk= 0
	ex= 0

func _on_outside_room():
	if(ex == 0) {
	    if(atimer == 0) aaa+= 0.03
	    if(atimer == 1) aaa-= 0.03
	}
	if(ex == 1) {
	    if(atimer == 0) aaa+= 0.015
	    if(atimer == 1) aaa-= 0.015
	}
	if(ex == 2) {
	    if(atimer == 0) aaa+= 0.0075
	    if(atimer == 1) aaa-= 0.0075
	}
	if(aaa <= -0.03) instance_destroy()
	if(aaa >= 1.2) {
	    aaa= 1
	    atimer= 1
	}
	draw_set_alpha(aaa)
	draw_set_color(16777215)
	draw_rectangle(-10, -10, 999, 999, 0)
	draw_set_alpha(1)

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
