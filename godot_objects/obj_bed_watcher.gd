# Auto-converted from GameMaker: obj_bed_watcher
# GM parent: obj_readable
extends Node2D

func _ready():
	tuck= 0
	bedy= 30
	con= 0
	walpha= 0
	win= 0
	limbx= 0
	limby= 0
	talkedto= 0
	myinteract= 0
	scr_depth()

func _gm_event_2_4():
	con++

func _on_destroy():
	myinteract= 3
	GS.msc= 782
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	if(obj_mainchara.x > x) {
	    GS.msg[0]= "* (Seems like a comfy bed.)/"
	    GS.msg[1]= "* (You could probably climb&  into it if you were to&  the left of it.)/%%"
	    GS.msc= 0
	}
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	talkedto++

func _on_outside_room():
	draw_sprite(sprite_index, frame, x, y)
	if((Input.is_action_pressed("move_left") or keyboard_multicheck_pressed(0/* NOKEY */) or keyboard_multicheck_pressed(1/* ANYKEY */)) and con > 7 and con < 30)
	    con= 30
	if(con == 5) {
	    z_index= 100000
	    limbx= 0
	    limby= 0
	    GS.phasing= 1
	    GS.interact= 1
	    siner= 0
	    con= 6
	    $Alarm4.start((20) / 30.0)
	    xx= x + 16
	    yy= y + 11
	    getx= obj_mainchara.x
	    gety= obj_mainchara.y
	    tox= (xx - getx) / 20
	    toy= (yy - gety) / 20
	    ivol= caster_get_volume(GS.currentsong)
	    vol= ivol
	}
	if(con == 6) {
	    vol-= 0.05
	    caster_set_volume(GS.currentsong, vol)
	    GS.interact= 1
	    GS.facing= 1
	    obj_mainchara.frame+= 0.25
	    obj_mainchara.x+= tox
	    obj_mainchara.y+= toy
	}
	if(con == 7) {
	    caster_pause(GS.currentsong)
	    obj_mainchara.frame= 0
	    obj_mainchara.x= floor(obj_mainchara.x)
	    obj_mainchara.y= floor(obj_mainchara.y)
	    con= 8
	    $Alarm4.start((150) / 30.0)
	    $Alarm4.start((150) / 30.0)
	}
	if(con == 9) {
	    con= 10
	    win= 1
	    $Alarm4.start((100) / 30.0)
	    $Alarm4.start((100) / 30.0)
	}
	if(con == 11) {
	    con= 12
	    $Alarm4.start((340) / 30.0)
	}
	if(con == 12) {
	    limbx+= 0.1
	    limby= sin(limbx / 4) * 2
	}
	if(con == 13) {
	    con= 13.1
	    $Alarm4.start((70) / 30.0)
	}
	if(con == 14.1) {
	    con= 14
	    $Alarm4.start((20) / 30.0)
	}
	if(con == 14) limby++
	if(con == 15) {
	    con= 16
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 17) {
	    con= 18
	    $Alarm4.start((8) / 30.0)
	}
	if(con == 18) {
	    tuck= 1
	    limby-= 3
	}
	if(con == 19) {
	    siner= 0
	    con= 20
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 21) {
	    con= 22
	    $Alarm4.start((15) / 30.0)
	}
	if(con == 22) {
	    limbx++
	    limby-= 0.8
	}
	if(con == 23) {
	    con= 24
	    $Alarm4.start((20) / 30.0)
	}
	if(con == 25) {
	    con= 26
	    $Alarm4.start((40) / 30.0)
	}
	if(con == 26 or con == 27 or con == 28) {
	    siner++
	    limby+= sin(siner / 3) / 1.5
	}
	if(con == 27) {
	    win= 0
	    con= 28
	}
	if(con == 30) {
	    caster_resume(GS.currentsong)
	    z_index= 100000
	    win= 0
	    tuck= 2
	    GS.facing= 3
	    obj_mainchara.image_speed= 0.25
	    obj_mainchara.velocity.x= -3
	    $Alarm4.start((13) / 30.0)
	    con= 31
	}
	if(con == 31) {
	    if(vol < ivol) vol+= 0.08
	    else  vol= ivol
	    caster_set_volume(GS.currentsong, vol)
	}
	if(con == 32) {
	    scr_depth()
	    obj_mainchara.image_speed= 0
	    GS.facing= 0
	    obj_mainchara.velocity.x= 0
	    // obj_mainchara
	    with(1570) uncan= 0
	    GS.interact= 0
	    GS.phasing= 0
	    con= 0
	}
	if(bedy < 30) {
	    z_index= 100
	    draw_sprite_ext(obj_mainchara.sprite_index, 0, obj_mainchara.x, obj_mainchara.y, 1, 1, 0, obj_mainchara.image_blend, 1)
	}
	if(tuck == 1) {
	    bedy-= 4
	    if(bedy <= 4) bedy= 4
	}
	if(tuck == 2) {
	    win= 0
	    bedy+= 4
	    if(bedy >= 30) {
	        bedy= 30
	        z_index= 100000
	        draw_sprite_ext(obj_mainchara.sprite_index, 0, obj_mainchara.x, obj_mainchara.y, 1, 1, 0, obj_mainchara.image_blend, 1)
	        tuck= 0
	    }
	}
	if(win == 1) {
	    if(walpha < 1) walpha+= 0.02
	} else  {
	    if(walpha > 0) walpha-= 0.1
	}
	draw_sprite_part(2153, 0, 0, 0, 46, 39 - bedy, x + 2, y + 13 + bedy)
	draw_sprite_ext(2155/* spr_watchingman */, 0, x - 20, y - 15, 1, 1, 0, 16777215, walpha)
	draw_sprite_part_ext(2156, 0, 50 - limbx, 0, limbx, 20, x - 14, y + 20 + limby, 1, 1, 16777215, walpha)

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
