# Auto-converted from GameMaker: obj_potstir
extends Node2D

func _ready():
	stir= 0
	stiranim= 0
	stime= 0
	sval= 0

func _on_outside_room():
	draw_set_color(16777215)
	draw_rectangle(view_xview[view_current] + 16, view_yview[view_current] + 6, view_xview[view_current] + 304, view_yview[view_current] + 32, 0)
	draw_set_color(0)
	draw_rectangle(view_xview[view_current] + 19, view_yview[view_current] + 9, view_xview[view_current] + 301, view_yview[view_current] + 29, 0)
	draw_set_font(2)
	draw_set_color(16777215)
	draw_text(30, 11, "* Press [Z] repeatedly to stir!")
	if(keyboard_multicheck_pressed(0/* NOKEY */)) {
	    stir++
	    pot.frame++
	}
	stime++
	if(stime > 90 and stir <= 70 and sval == 0) {
	    sval= 1
	    GS.msc= 0
	    GS.facechoice= 5
	    GS.typer= 37
	    GS.faceemotion= 1
	    GS.msg[0]= "* Stir harder^2!%%"
	    gg= instance_create(0, 0, 779/* obj_dialoguer */)
	    gg.side= 1
	}
	if(stime > 150 and stir <= 70 and sval == 1) {
	    sval= 2
	    GS.msc= 0
	    GS.facechoice= 5
	    GS.typer= 37
	    GS.faceemotion= 2
	    GS.msg[0]= "* HARDER^2!%%"
	    gg= instance_create(0, 0, 779/* obj_dialoguer */)
	    gg.side= 1
	}
	if(stime > 210 and stir <= 70 and sval == 2) {
	    sval= 3
	    GS.msc= 0
	    GS.facechoice= 5
	    GS.typer= 37
	    GS.faceemotion= 6
	    GS.msg[0]= "* HARDER!!!^2!%%"
	    gg= instance_create(0, 0, 779/* obj_dialoguer */)
	    gg.side= 1
	}
	if((stime > 300 or stir > 70) and not instance_exists(782/* OBJ_WRITER */)) {
	    sval= 99
	    GS.msc= 0
	    GS.facechoice= 5
	    GS.typer= 37
	    GS.faceemotion= 6
	    GS.msg[0]= "* Ugh^1, let me do it!/%%"
	    gg= instance_create(0, 0, 779/* obj_dialoguer */)
	    gg.side= 1
	    obj_undynedate_inside.con= 210
	    instance_destroy()
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
