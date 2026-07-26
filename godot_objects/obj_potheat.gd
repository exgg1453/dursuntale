# Auto-converted from GameMaker: obj_potheat
extends Node2D

func _ready():
	stir= 0
	stiranim= 0
	stime= 0
	sval= 0
	wrong= 0
	wrongval= 0
	hot= 0
	jingle= 0
	fire= caster_load("music/bgflameA.ogg")
	caster_loop(fire, 0.5, 0.7)
	rot= caster_load("music/rotate.ogg")

func _on_outside_room():
	draw_sprite_ext(1485/* spr_rotdial */, 0, 169, 45, 1, 1, -stir * 6, 16777215, 1)
	draw_set_color(16777215)
	draw_rectangle(view_xview[view_current] + 16, view_yview[view_current] + 6, view_xview[view_current] + 304, view_yview[view_current] + 32, 0)
	draw_set_color(0)
	draw_rectangle(view_xview[view_current] + 19, view_yview[view_current] + 9, view_xview[view_current] + 301, view_yview[view_current] + 29, 0)
	draw_set_font(2)
	draw_set_color(16777215)
	draw_text(30, 11, "* Hold [RIGHT] to turn up the heat!")
	if(Input.is_action_pressed("move_right")) {
	    stir++
	    jingle++
	    if(jingle > 10) {
	        caster_play(rot, 0.5, 1)
	        jingle= 0
	    }
	}
	if(Input.is_action_pressed("move_left")) wrong= 1
	stime++
	if(wrong == 1 and wrongval == 0 and not instance_exists(782/* OBJ_WRITER */)) {
	    caster_set_pitch(fire, 0.8)
	    caster_set_volume(fire, 0.55)
	    wrongval= 1
	    GS.msc= 0
	    GS.facechoice= 5
	    GS.typer= 37
	    GS.faceemotion= 1
	    GS.msg[0]= "* Left^1? You fool^2!%"
	    GS.msg[1]= "\\E6* THIS BURNER ONLY&  GOES ONE WAY!!^2!%%"
	    gg= instance_create(0, 0, 779/* obj_dialoguer */)
	    gg.side= 1
	}
	if(stir > 50 and sval == 0) {
	    caster_set_pitch(fire, 0.9)
	    caster_set_volume(fire, 0.6)
	    with(pot) event_user(0)
	    sval++
	}
	if(stir > 100 and sval == 1 and not instance_exists(782/* OBJ_WRITER */)) {
	    caster_set_pitch(fire, 1)
	    caster_set_volume(fire, 0.66)
	    with(pot) event_user(0)
	    sval= 2
	    GS.msc= 0
	    GS.facechoice= 5
	    GS.typer= 37
	    GS.faceemotion= 1
	    GS.msg[0]= "* Hotter^2!%%"
	    gg= instance_create(0, 0, 779/* obj_dialoguer */)
	    gg.side= 1
	}
	if(stir > 150 and sval == 2) {
	    caster_set_pitch(fire, 1.1)
	    caster_set_volume(fire, 0.72)
	    with(pot) event_user(0)
	    sval++
	}
	if(stir > 200 and sval == 3 and not instance_exists(782/* OBJ_WRITER */)) {
	    caster_set_pitch(fire, 1.2)
	    caster_set_volume(fire, 0.78)
	    with(pot) event_user(0)
	    sval= 4
	    GS.msc= 0
	    GS.facechoice= 5
	    GS.typer= 37
	    GS.faceemotion= 1
	    GS.msg[0]= "* HOTTER^1, DARNIT^2!%%"
	    gg= instance_create(0, 0, 779/* obj_dialoguer */)
	    gg.side= 1
	}
	if(stir > 250 and sval == 4) {
	    caster_set_pitch(fire, 1.3)
	    caster_set_volume(fire, 0.83)
	    with(pot) event_user(0)
	    sval++
	}
	if(stir > 300 and sval == 5 and not instance_exists(782/* OBJ_WRITER */)) {
	    caster_set_pitch(fire, 1.4)
	    caster_set_volume(fire, 0.87)
	    with(pot) event_user(0)
	    sval= 6
	    GS.msc= 0
	    GS.facechoice= 5
	    GS.typer= 37
	    GS.faceemotion= 1
	    GS.msg[0]= "* HOTTER!!!!!!^2!%%"
	    gg= instance_create(0, 0, 779/* obj_dialoguer */)
	    gg.side= 1
	}
	if(stir > 360 and sval < 99 and not instance_exists(782/* OBJ_WRITER */)) {
	    stir= 360
	    caster_stop(GS.currentsong)
	    caster_set_pitch(fire, 1.7)
	    caster_set_volume(fire, 0.95)
	    with(pot) event_user(0)
	    sval= 99
	    GS.msc= 0
	    GS.facechoice= 5
	    GS.typer= 37
	    GS.faceemotion= 1
	    GS.msg[0]= "* Wait^1, that\'s too ^1- %%"
	    gg= instance_create(0, 0, 779/* obj_dialoguer */)
	    gg.side= 1
	    obj_undynedate_inside.con= 250
	    instance_destroy()
	}
	if(stime > 500 and sval < 99 and not instance_exists(782/* OBJ_WRITER */)) {
	    sval= 101
	    GS.msc= 0
	    GS.facechoice= 5
	    GS.typer= 37
	    GS.faceemotion= 1
	    GS.msg[0]= "* Ugh^1, let me do it!/%%"
	    gg= instance_create(0, 0, 779/* obj_dialoguer */)
	    gg.side= 1
	}
	if(sval == 101 and not instance_exists(782/* OBJ_WRITER */)) {
	    caster_stop(GS.currentsong)
	    caster_set_pitch(fire, 1.7)
	    caster_set_volume(fire, 0.95)
	    sval= 102
	    while(pot.level < 8) {
	        with(pot) event_user(0)
	    }
	    GS.msc= 0
	    GS.facechoice= 5
	    GS.typer= 37
	    GS.faceemotion= 1
	    GS.msg[0]= "* See!^1?&* This is how you ^1-%%"
	    gg= instance_create(0, 0, 779/* obj_dialoguer */)
	    gg.side= 1
	    obj_undynedate_inside.con= 250
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
