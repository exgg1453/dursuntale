# Auto-converted from GameMaker: obj_outsideworld_event
extends Node2D

func _ready():
	GS.flag[7]= 1
	GS.interact= 1
	thisblend= merge_color(0, 4235519, 0.2)
	obj_readablesolid.image_blend= thisblend
	obj_readablesolid.direction= 90
	obj_readablesolid.image_speed= 0
	obj_readablesolid.fun= 1
	obj_mainchara.visible= 0
	mc= scr_marker(obj_mainchara.x, obj_mainchara.y, 1044)
	mc.z_index= obj_mainchara.z_index
	mc.image_blend= thisblend
	con= 1
	blk= 2.3
	pap= 1314
	tor= 1311
	asg= 1316
	und= 1313
	sans= 1312
	al= 1315
	pap.sprite_index= 1325/* spr_papyrus_u */
	tor.sprite_index= 1112/* spr_toriel_u */
	asg.sprite_index= 1907/* spr_asgore_u */
	al.sprite_index= 1651/* spr_alphys_u */
	sans.sprite_index= 1362/* spr_sans_u */
	und.sprite_index= 1412/* spr_undyne_u */
	o_music= caster_load("music/leave.ogg")

func _gm_event_2_4():
	con++

func _on_outside_room():
	if(con == 1) {
	    GS.interact= 1
	    blk-= 0.01
	    if(blk == 1) caster_loop(o_music, 0.9, 0.9)
	    draw_set_alpha(blk)
	    draw_set_color(0)
	    draw_rectangle(-100, -100, 999, 999, 0)
	    draw_set_alpha(1)
	    if(blk <= 0) {
	        con= 2
	        $Alarm4.start((50) / 30.0)
	    }
	}
	if(con == 3) {
	    GS.msc= 814
	    GS.typer= 4
	    GS.facechoice= 1
	    GS.faceemotion= 0
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 4
	}
	if(con == 4 and not instance_exists(782/* OBJ_WRITER */)) {
	    pap.thisy= pap.y
	    con= 5
	    $Alarm4.start((3) / 30.0)
	}
	if(con == 5) {
	    pap.sprite_index= 1313/* spr_papyrus_d */
	    pap.y+= 5
	    pap.image_speed= 0.334
	}
	if(con == 6) {
	    pap.sprite_index= 1328/* spr_papyrus_r */
	    pap.x+= 7
	    if(pap.x > get_viewport_rect().size.x) {
	        con= 7
	        $Alarm4.start((30) / 30.0)
	    }
	}
	if(con == 8) {
	    GS.msc= 0
	    GS.typer= 17
	    GS.facechoice= 3
	    GS.faceemotion= 0
	    GS.msg[0]= "\\E0* welp./"
	    GS.msg[1]= "\\E1* someone\'s gotta keep&  him from getting&  into trouble./"
	    GS.msg[2]= "\\E2* see you guys./%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 9
	}
	if(con == 9 and not instance_exists(782/* OBJ_WRITER */)) {
	    sans.y+= 2
	    sans.sprite_index= 1353/* spr_sans_d */
	    sans.image_speed= 0.2
	    if(sans.y > get_viewport_rect().size.y) {
	        con= 10
	        $Alarm4.start((20) / 30.0)
	    }
	}
	if(con == 11) {
	    GS.msc= 0
	    GS.typer= 37
	    GS.facechoice= 5
	    GS.faceemotion= 9
	    GS.msg[0]= "\\E0* Man^1, do I have&  to do EVERYTHING?/"
	    GS.msg[1]= "\\E6* Papyrus^1, wait!!!/%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 12
	}
	if(con == 12 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 13
	    $Alarm4.start((3) / 30.0)
	}
	if(con == 13) {
	    und.sprite_index= 1404/* spr_undyne_d */
	    und.y+= 5
	    und.image_speed= 0.334
	}
	if(con == 14) {
	    und.sprite_index= 1416/* spr_undyne_r */
	    und.x+= 7
	    if(und.x > get_viewport_rect().size.x + 17) {
	        con= 15
	        $Alarm4.start((15) / 30.0)
	    }
	}
	if(con == 16) {
	    GS.msc= 0
	    GS.typer= 47
	    GS.facechoice= 6
	    GS.faceemotion= 0
	    GS.msg[0]= "\\E0* Hey^1, Undyne!^1!&* Wait up!!/%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 17
	}
	if(con == 17 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 18
	    $Alarm4.start((3) / 30.0)
	}
	if(con == 18) {
	    al.sprite_index= 1638/* spr_alphys_d */
	    al.y+= 5
	    al.image_speed= 0.334
	}
	if(con == 19) {
	    al.sprite_index= 1643/* spr_alphys_r */
	    al.x+= 7
	    if(al.x > get_viewport_rect().size.x) {
	        con= 20
	        $Alarm4.start((95) / 30.0)
	    }
	}
	if(con == 21) {
	    GS.msc= 0
	    GS.typer= 60
	    GS.facechoice= 7
	    GS.faceemotion= 3
	    GS.msg[0]= "* Whoops./%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 22
	}
	if(con == 22 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 23
	    $Alarm4.start((120) / 30.0)
	}
	if(con == 24) {
	    asg.sprite_index= 1900/* spr_asgore_l */
	    GS.msc= 0
	    GS.typer= 60
	    GS.facechoice= 7
	    GS.faceemotion= 3
	    GS.msg[0]= "* Uh^1, should I do&  something?/"
	    scr_torface(1, 9)
	    GS.msg[2]= "* .../"
	    scr_asgface(3, 0)
	    GS.msg[4]= "* Well^1, gotta go!/%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 25
	}
	if(con == 25 and not instance_exists(782/* OBJ_WRITER */)) {
	    asg.sprite_index= 1901/* spr_asgore_r */
	    asg.image_speed= 0.25
	    asg.x+= 5
	    if(asg.x > get_viewport_rect().size.x) {
	        con= 26
	        $Alarm4.start((20) / 30.0)
	    }
	}
	if(con == 27) {
	    tor.sprite_index= 1107/* spr_toriel_r */
	    con= 28
	    $Alarm4.start((60) / 30.0)
	}
	if(con == 29) {
	    tor.sprite_index= 1107/* spr_toriel_r */
	    con= 30
	    GS.msc= 0
	    GS.typer= 4
	    GS.facechoice= 1
	    GS.faceemotion= 0
	    GS.msg[0]= "* It seems that everyone&  is quite eager to&  set off./%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	}
	if(con == 30 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 31
	    tor.sprite_index= 1112/* spr_toriel_u */
	    con= 32
	    $Alarm4.start((90) / 30.0)
	}
	if(con == 33) {
	    tor.sprite_index= 1108/* spr_toriel_l */
	    $Alarm4.start((50) / 30.0)
	    con= 34
	}
	if(con == 35) {
	    mc.sprite_index= 1045/* spr_maincharar */
	    GS.typer= 4
	    GS.msc= 820
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 36
	}
	if(con == 100 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.flag[512]= 0
	    GS.msc= 0
	    GS.facechoice= 1
	    GS.faceemotion= 8
	    GS.typer= 4
	    GS.msg[0]= "* What?/"
	    GS.msg[1]= "\\E1* Frisk.../"
	    GS.msg[2]= "\\E0* You really are a&  funny child./"
	    GS.msg[3]= "\\E1* If you had said that&  earlier^1, none of this&  would have happened./"
	    GS.msg[4]= "\\E0* It is a good thing&  you took so long to&  change your mind./"
	    GS.msg[5]= "* Hee hee hee./"
	    GS.msg[6]= "* Well..^1.&* I suppose./"
	    GS.msg[7]= "* If you really do&  not have any other&  place to go.../"
	    GS.msg[8]= "* I will do my best to&  take care of you^1, for&  as long as you need./"
	    GS.msg[9]= "* All right?/"
	    GS.msg[10]= "* Now^1, come along./%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 101
	}
	if(con == 101 and not instance_exists(782/* OBJ_WRITER */)) {
	    tor.x-= 16
	    tor.sprite_index= 1114/* spr_toriel_handhold_r */
	    mc.visible= 0
	    con= 102
	    $Alarm4.start((40) / 30.0)
	}
	if(con == 103) {
	    GS.msg[0]= "* Everyone is waiting&  for us!/%%"
	    con= 104
	    instance_create(0, 0, 779/* obj_dialoguer */)
	}
	if(con == 104 and not instance_exists(782/* OBJ_WRITER */)) {
	    tor.x+= 2
	    tor.image_speed= 0.125
	    if(tor.x > get_viewport_rect().size.x + 100) con= 105
	}
	if(con == 105) {
	    blk+= 0.01
	    vol= caster_get_volume(o_music)
	    vol-= 0.01
	    caster_set_volume(o_music, vol)
	    draw_set_alpha(blk)
	    draw_set_color(0)
	    draw_rectangle(-100, -100, 999, 999, 0)
	    draw_set_alpha(1)
	    if(blk >= 1.6) {
	        caster_free(-3)
	        get_tree().change_scene_to_file("res://godot_rooms/278.tscn")
	    }
	}
	if(con == 200 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.msc= 0
	    GS.facechoice= 1
	    GS.faceemotion= 2
	    GS.typer= 4
	    GS.msg[0]= "\\E1* Ah./"
	    GS.msg[1]= "\\E0* ... I see./"
	    GS.msg[2]= "\\E1* .../"
	    GS.msg[3]= "\\E0* Well^1, I hope that&  I am not keeping&  you./%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 201
	}
	if(con == 201 and instance_exists(782/* OBJ_WRITER */)) {
	    if(OBJ_WRITER.stringno == 1) tor.sprite_index= 1112/* spr_toriel_u */
	    if(OBJ_WRITER.stringno == 3) tor.sprite_index= 1108/* spr_toriel_l */
	}
	if(con == 201 and not instance_exists(782/* OBJ_WRITER */)) {
	    tor.sprite_index= 1112/* spr_toriel_u */
	    con= 203
	    $Alarm4.start((15) / 30.0)
	}
	if(con == 204) {
	    tor.sprite_index= 1107/* spr_toriel_r */
	    con= 205
	    $Alarm4.start((15) / 30.0)
	}
	if(con == 206) {
	    $Alarm4.start((27) / 30.0)
	    con= 207
	}
	if(con == 207) {
	    tor.x++
	    tor.image_speed= 0.1
	}
	if(con == 208) {
	    tor.image_speed= 0
	    tor.frame= 0
	    con= 209
	    $Alarm4.start((90) / 30.0)
	}
	if(con == 210) {
	    tor.sprite_index= 1108/* spr_toriel_l */
	    con= 211
	    $Alarm4.start((50) / 30.0)
	}
	if(con == 212) {
	    GS.flag[512]= 1
	    GS.faceemotion= 0
	    GS.msg[0]= "* Frisk./"
	    GS.msg[1]= "* " + chr(ord('"')) + "See you around." + chr(ord('"')) + "/%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 213
	}
	if(con == 213 and not instance_exists(782/* OBJ_WRITER */)) {
	    tor.sprite_index= 1108/* spr_toriel_l */
	    con= 214
	    $Alarm4.start((60) / 30.0)
	}
	if(con == 215) {
	    tor.sprite_index= 1107/* spr_toriel_r */
	    con= 216
	    $Alarm4.start((80) / 30.0)
	}
	if(con == 217) {
	    mc.sprite_index= 1044/* spr_maincharau */
	    tor.x+= 3
	    tor.image_speed= 0.25
	    if(tor.x >= get_viewport_rect().size.x + 100) con= 105
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
