# Auto-converted from GameMaker: obj_asriel_overworldanim
extends Node2D

func _ready():
	image_speed= 0
	rsprite= 2421
	lsprite= 2424
	dsprite= 2417
	usprite= 2419
	sprite_index= 2416/* spr_asriel_armcry */
	con= 1
	timer= 0
	$Alarm4.start((200) / 30.0)
	powered= 0
	emerge= 0
	instance_create(0, 0, 1527/* obj_overworldcontroller */)
	mc_real= instance_create(x, y + 60, 1570/* obj_mainchara */)
	mc_real.visible= 0
	mc_real.cutscene= 1
	mc= scr_marker(x, y + 60, 1044)
	mc.image_speed= 0
	mc.z_index= z_index + 3
	GS.facing= 2
	GS.interact= 1
	thisy= ystart
	musicbox= caster_load("music/musicbox.ogg")
	xpart= caster_load("music/xpart_back.ogg")

func _gm_event_2_5():
	instance_create(x + 3, y + 10, 1683/* obj_mhd */)
	$Alarm5.start((6) / 30.0)

func _gm_event_2_4():
	con++

func _gm_event_2_3():
	caster_play(xpart, 1, 0.92)

func _process(delta: float):
	if(con == 1) {
	    GS.facing= 2
	    GS.interact= 1
	    image_speed= 0.08
	}
	if(con == 2) {
	    con= 3
	    GS.msc= 0
	    GS.faceemotion= 3
	    GS.facechoice= 9
	    GS.typer= 89
	    GS.msg[0]= "* I\'m so sorry./%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	}
	if(con == 3 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 4
	    $Alarm4.start((90) / 30.0)
	}
	if(con == 4) {
	    image_speed= 0.1
	    sprite_index= 2415/* spr_asriel_rubtears */
	}
	if(con == 5) {
	    con= 6
	    $Alarm4.start((90) / 30.0)
	    image_speed= 0
	    frame= 0
	    y-= 2
	    sprite_index= 2413/* spr_asriel_tearsdry */
	}
	if(con == 6) {
	    if(frame < 2)
	        frame+= 0.0333333333333333
	    else  frame= 2
	}
	if(con == 7) {
	    caster_loop(musicbox, 1, 0.8)
	    sprite_index= 2417/* spr_asriel_d */
	    GS.msc= 800
	    GS.faceemotion= 7
	    GS.facechoice= 9
	    GS.typer= 89
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 7.1
	    mvol= caster_get_volume(musicbox)
	}
	if(con == 7.1 and not instance_exists(782/* OBJ_WRITER */)) {
	    mvol-= 0.02
	    caster_set_volume(musicbox, mvol)
	    if(mvol < -0.5) con= 8
	}
	if(con == 8 and not instance_exists(782/* OBJ_WRITER */)) {
	    $Alarm3.start((60) / 30.0)
	    con= 9
	    frame= 0
	    siner= 0
	    thisy= y
	    upy= 0
	    times= 0
	}
	if(con == 9) {
	    con= 10
	    $Alarm4.start((420) / 30.0)
	    whited= 0
	    shaked= -3
	    powered= 1
	}
	if(con == 10 or con == 11) {
	    shaked+= 0.01
	    if(shaked > 0) {
	        if(shaked < 1) shaked= 1
	        view_xview[0]= 0 + random(shaked) - random(shaked)
	        view_yview[0]= 0 + random(shaked) - random(shaked)
	    }
	}
	if(powered == 1) {
	    sprite_index= 2410/* spr_asriel_power */
	    if(frame < 7) frame+= 0.03
	    if(frame >= 7) {
	        frame+= 0.2
	        if(frame >= 8.8) {
	            times++
	            frame= 7
	        }
	        if(times > 6 and emerge == 0) emerge= 1
	    }
	    if(frame >= 5) {
	        if(upy < 10) upy+= 0.25
	        siner++
	        y= thisy - upy - sin(siner / 8) * 1
	    }
	}
	if(emerge == 1) {
	    m= instance_create(x + 3, y + 10, 1683/* obj_mhd */)
	    m.spec= 1
	    m.rno[0]= 6
	    $Alarm5.start((10) / 30.0)
	    emerge= 2
	}
	if(con == 20) {
	    mc.sprite_index= 1046/* spr_maincharal */
	    mc.x= x + 60
	    mc.y= thisy - 2
	    sprite_index= 2411/* spr_asriel_powerdown */
	    frame= 0
	    image_speed= 0
	    con= 21
	    $Alarm4.start((50) / 30.0)
	}
	if(con == 22) con= 23
	if(con == 23) {
	    frame+= 0.05
	    if(y < thisy) y+= 0.2
	    else  y= thisy
	    if(frame >= 10) {
	        con= 24
	        $Alarm4.start((70) / 30.0)
	    }
	}
	if(con == 25) {
	    sprite_index= 2423/* spr_asriel_rsad */
	    con= 26
	    $Alarm4.start((70) / 30.0)
	}
	if(con == 27) {
	    sprite_index= 2412/* spr_asriel_lookdown */
	    con= 27.1
	    GS.msc= 803
	    GS.faceemotion= 7
	    GS.facechoice= 9
	    GS.typer= 89
	    dl= instance_create(0, 0, 779/* obj_dialoguer */)
	    dl.side= 0
	}
	if(con == 28 and not instance_exists(782/* OBJ_WRITER */)) {
	    sprite_index= 2412/* spr_asriel_lookdown */
	    mc.x= x + 60
	    mc.y= thisy - 2
	    mc.z_index= z_index - 1
	    con= 29
	}
	if(con == 29) {
	    mc.x--
	    mc.frame+= 0.1
	    if(mc.x <= x + 2) {
	        mc.x= x + 2
	        con= 30
	        $Alarm4.start((20) / 30.0)
	    }
	}
	if(con == 31) {
	    mc.frame= 0
	    mc.visible= 0
	    frame= 0
	    sprite_index= 2409/* spr_asriel_hug */
	    con= 32
	}
	if(con == 32) {
	    frame+= 0.2
	    if(frame >= 4) {
	        con= 33
	        $Alarm4.start((40) / 30.0)
	    }
	}
	if(con == 34) {
	    frame+= 0.2
	    if(frame >= 8) {
	        con= 35
	        $Alarm4.start((40) / 30.0)
	    }
	}
	if(con == 36) {
	    pattimer= 0
	    frame+= 0.2
	    if(frame >= 11) {
	        con= 37
	        $Alarm4.start((80) / 30.0)
	    }
	}
	if(con == 38 or con == 38.1) {
	    frame+= 0.05
	    if(frame >= 11.8) frame= 10.2
	    pattimer++
	    if(pattimer == 90) {
	        con= 38.1
	        GS.msc= 0
	        GS.faceemotion= 0
	        GS.facechoice= 0
	        GS.typer= 90
	        GS.msg[0]= "* Ha..^1. ha.../"
	        GS.msg[1]= "* I don\'t want to let&  go.../%%"
	        dl= instance_create(0, 0, 779/* obj_dialoguer */)
	        dl.side= 0
	    }
	}
	if(con == 38.1 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 38.2
	    $Alarm4.start((60) / 30.0)
	}
	if(con == 39.2) {
	    con= 39
	    hug_rev= 11
	    frame= 11
	}
	if(con == 39) {
	    if(hug_rev > 0.3) {
	        hug_rev-= 0.1
	        frame-= 0.1
	    } else  {
	        frame= 0
	        con= 40
	        $Alarm4.start((30) / 30.0)
	        mcx= mc.x
	        mc.visible= 1
	        sprite_index= 2412/* spr_asriel_lookdown */
	    }
	}
	if(con == 41) {
	    mc.frame+= 0.1
	    mc.x++
	    if(mc.x > mcx + 30) {
	        mc.frame= 0
	        con= 49
	        $Alarm4.start((50) / 30.0)
	    }
	}
	if(con == 50 and not instance_exists(782/* OBJ_WRITER */)) {
	    sprite_index= 2421/* spr_asriel_r */
	    GS.msg[0]= "\\E7* Frisk.../"
	    GS.msg[1]= "* You\'re.../"
	    GS.msg[2]= "\\E0* You\'re going to do&  a great job^1, OK?/"
	    GS.msg[3]= "* No matter what you&  do./"
	    GS.msg[4]= "* Everyone will be&  there for you^1,&  okay?/%%"
	    GS.msc= 0
	    GS.faceemotion= 7
	    GS.facechoice= 9
	    GS.typer= 89
	    dl= instance_create(0, 0, 779/* obj_dialoguer */)
	    dl.side= 1
	    con= 50.1
	}
	if(con == 50.1 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 49.2
	    $Alarm4.start((40) / 30.0)
	}
	if(con == 50.2) {
	    sprite_index= 2419/* spr_asriel_u */
	    con= 49.3
	    $Alarm4.start((50) / 30.0)
	}
	if(con == 50.3) {
	    GS.msc= 0
	    GS.faceemotion= 7
	    GS.facechoice= 9
	    GS.typer= 89
	    GS.msg[0]= "\\E7* Well..^1.&* My time\'s running out./"
	    GS.msg[1]= "* Goodbye./%%"
	    dl= instance_create(0, 0, 779/* obj_dialoguer */)
	    dl.side= 1
	    con= 52
	}
	if(con == 52 and not instance_exists(782/* OBJ_WRITER */)) {
	    velocity.y= -0.25
	    image_speed= 0.1
	    con= 54
	    $Alarm4.start((80) / 30.0)
	}
	if(con == 55) {
	    y= round(y)
	    velocity.y= 0
	    image_speed= 0
	    frame= 0
	    con= 56
	    $Alarm4.start((80) / 30.0)
	}
	if(con == 57) {
	    sprite_index= 2417/* spr_asriel_d */
	    con= 58
	    $Alarm4.start((60) / 30.0)
	}
	if(con == 59) {
	    GS.msc= 0
	    GS.faceemotion= 0
	    GS.facechoice= 9
	    GS.typer= 89
	    GS.msg[0]= "* By the way.../"
	    GS.msg[1]= "* Frisk./"
	    GS.msg[2]= "\\E6* ... take care of Mom&  and Dad for me^1, OK?/%%"
	    dl= instance_create(0, 0, 779/* obj_dialoguer */)
	    dl.side= 1
	    con= 60
	}
	if(con == 60 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 61
	    $Alarm4.start((40) / 30.0)
	}
	if(con == 62) {
	    con= 63
	    $Alarm4.start((40) / 30.0)
	    sprite_index= 2419/* spr_asriel_u */
	    ttimer= 0
	}
	if(con == 64) {
	    mc.sprite_index= 1044/* spr_maincharau */
	    sprite_index= 2419/* spr_asriel_u */
	    velocity.y= -0.25
	    image_speed= 0.05
	    ttimer++
	    if(ttimer == 40) {
	        sw= instance_create(0, 0, 557/* obj_screenwhiter */)
	        sw.ex= 1
	    }
	    if(ttimer == 104) {
	        GS.flag[510]= 1
	        GS.plot= 999
	        GS.flag[7]= 1
	        ini_open("undertale.ini")
	        ini_write_real("F7", "F7", 1)
	        ini_close()
	        get_tree().change_scene_to_file("res://godot_rooms/236.tscn")
	    }
	}

func _on_outside_room():
	draw_sprite_ext(sprite_index, floor(frame), x, y, scale.x, scale.y, 0, image_blend, modulate.a)
	if(con == 11 or con == 12) {
	    whited+= 0.01
	    if(whited >= 1 and con == 11) {
	        con= 12
	        view_xview[0]= 0
	        view_yview[0]= 0
	    }
	    draw_set_alpha(whited)
	    draw_set_color(16777215)
	    draw_rectangle(-10, -10, 999, 999, 0)
	    draw_set_alpha(1)
	    if(whited >= 2) {
	        instance_create(0, 0, 1682/* obj_barriercut */)
	        con= 13
	        // obj_mhd
	        with(1683) instance_destroy()
	        $Alarm5.start((-1) / 30.0)
	    }
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
