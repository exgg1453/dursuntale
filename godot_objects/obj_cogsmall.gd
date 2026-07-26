# Auto-converted from GameMaker: obj_cogsmall
extends Node2D

func _ready():
	cogno= 6
	siner= 0
	ck= 0
	active= 0
	offx= 0
	offy= 0
	if(GS.osflavor != 1) {
	    offx= -1
	    offy= -1
	}

func _gm_event_2_1():
	scale.x= 1
	scale.y= 1

func _on_destroy():
	ck= 1

func _on_outside_room():
	if(ck == 0) siner+= 6
	if(ck == 1) siner-= 6
	if(scale.x >= 2) draw_set_circle_precision(8)
	else  draw_set_circle_precision(4)
	i= 0
	while(i < cogno) {
	    draw_set_color(128)
	    if(scale.x < 2)
	        draw_circle(x - 0.3 * scale.x + lengthdir_x(8, i / cogno * 360 + siner) * scale.x, y - 0.3 * scale.y + lengthdir_y(8, i / cogno * 360 + siner) * scale.y, 2 * scale.x, 0)
	    if(scale.x >= 2)
	        draw_circle(x - 0.4 * scale.x + lengthdir_x(8, i / cogno * 360 + siner) * scale.x, y - 0.4 * scale.y + lengthdir_y(8, i / cogno * 360 + siner) * scale.y, 2 * scale.x, 0)
	    i++
	}
	if(scale.x < 2)
	    draw_sprite_ext(sprite_index, 0, x + offx, y + offy, scale.x, scale.y, 0, 16777215, 1)
	if(scale.x >= 2)
	    draw_sprite_ext(904/* spr_cogmed_e */, 0, x + offx, y + offy, scale.x / 2, scale.y / 2, 0, 16777215, 1)

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
