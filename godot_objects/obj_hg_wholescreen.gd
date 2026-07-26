# Auto-converted from GameMaker: obj_hg_wholescreen
extends Node2D

func _ready():
	obj_heart.z_index= -10001
	xx= GS.idealborder[0]
	xx2= GS.idealborder[1]
	yy= GS.idealborder[2]
	yy2= GS.idealborder[3]
	con= 0
	scr= 1

func _on_outside_room():
	if(con == 0) {
	    obj_asriel_body.modulate.a-= 0.1
	    draw_set_color(0)
	    draw_rectangle(xx, yy, xx2, yy2, 0)
	}
	if(con == 2) {
	    draw_set_color(16777215)
	    draw_set_alpha(scr)
	    draw_rectangle(xx, yy, xx2, yy2, 0)
	    scr-= 0.1
	    draw_set_alpha(1)
	    if(scr <= 0) instance_destroy()
	}
	if(xx > -100) xx-= 10
	if(yy > -100) yy-= 10
	if(xx2 < 800) xx2+= 10
	if(yy2 < 800) yy2+= 10
	draw_set_color(16777215)
	i= 0
	while(i < 4) {
	    draw_rectangle(xx + i, yy + i, xx2 + i, yy2 + i, 1)
	    i++
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
