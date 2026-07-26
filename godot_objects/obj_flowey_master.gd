# Auto-converted from GameMaker: obj_flowey_master
extends Node2D

func _ready():
	obj_screen.messed= 0
	GS.inbattle= 1
	savetimer= 0
	loadtimer= 0
	darkmode= 0
	darkvalue= 0
	htest= 0
	save_hp= 50
	save_inv= 0
	megadamage= 0
	GS.faceemotion= 0
	introcon= 1
	introskip= 0
	turnturn= 0
	drawhp= 0
	intent_hit= 0
	GS.floweyhp= 9950
	GS.floweymaxhp= 9999
	GS.battlephase= 0
	GS.soul_rescue= 0
	if(GS.fplot == 0) {
	    ini_open("undertale.ini")
	    ini_write_real("FFFFF", "P", 1)
	    ini_close()
	}
	if(GS.fplot > 1) {
	    GS.battlephase= GS.fplot - 1
	    GS.soul_rescue= GS.fplot - 1
	    introskip= 1
	    fadevalue= 0
	    // obj_floweyx_tv
	    with(1587) tvmode= 26
	}
	flx= 0
	fly= 0
	tv= instance_create(235, -32, 1587/* obj_floweyx_tv */)
	lefteye= instance_create(196, 132, 1591/* obj_floweyx_lefteye */)
	flipeye= instance_create(258, 192, 1589/* obj_floweyx_flipeye */)
	mouth= instance_create(292, 196, 1590/* obj_floweyx_mouth */)
	fleshface= instance_create(260, 126, 1588/* obj_fleshface */)
	pipetest= instance_create(272, 226, 1593/* obj_floweypipetest */)
	pipetest2= instance_create(230, 132, 1594/* obj_floweypipetest_2 */)
	pipetest3= instance_create(246, 54, 1595/* obj_floweypipetest_3 */)
	behind= instance_create(140, 10, 1592/* obj_floweyx_behind */)
	obj_floweybodyparent.visible= 0
	sprite_replace(2157, "external/spr_nostrils.png", 2, 1, 0, 0, 0)
	sprite_replace(2158, "external/spr_fleshmound.png", 1, 1, 0, 0, 0)
	sprite_replace(2159, "external/spr_lefteye_overlay.png", 1, 1, 0, 40, 24)
	sprite_replace(2162, "external/spr_lefteye_nopupil.png", 1, 1, 0, 31, 17)
	sprite_replace(2164, "external/spr_lefteye_pupil.png", 1, 1, 0, 8, 8)
	sprite_replace(2166, "external/spr_flipeye_bg.png", 1, 1, 0, 20, 50)
	sprite_replace(2168, "external/spr_flipeye_holder.png", 1, 1, 0, 31, 53)
	sprite_replace(2171, "external/spr_flipeye_noiris.png", 1, 1, 0, 21, 40)
	sprite_replace(2173, "external/spr_flipeye_pupil.png", 1, 1, 0, 5, 4)
	sprite_replace(2175, "external/spr_flipeye_iris.png", 1, 1, 0, 17, 15)
	sprite_replace(2157, "external/spr_nostrils.gif", 0, 1, 0, 0, 0)
	sprite_replace(2158, "external/spr_fleshmound.gif", 0, 1, 0, 0, 0)
	sprite_replace(2159, "external/spr_lefteye_overlay.gif", 0, 1, 0, 40, 24)
	sprite_replace(2162, "external/spr_lefteye_nopupil.gif", 0, 1, 0, 31, 17)
	sprite_replace(2164, "external/spr_lefteye_pupil.gif", 0, 1, 0, 8, 8)
	sprite_replace(2166, "external/spr_flipeye_bg.gif", 0, 1, 0, 20, 50)
	sprite_replace(2168, "external/spr_flipeye_holder.gif", 0, 1, 0, 31, 53)
	sprite_replace(2171, "external/spr_flipeye_noiris.gif", 0, 1, 0, 21, 40)
	sprite_replace(2173, "external/spr_flipeye_pupil.gif", 0, 1, 0, 5, 4)
	sprite_replace(2175, "external/spr_flipeye_iris.gif", 0, 1, 0, 17, 15)
	sprite_replace(2177, "external/spr_floweyx_mouthedge.png", 1, 1, 0, 0, 0)
	sprite_replace(2178, "external/spr_floweyx_mouthl.png", 1, 1, 0, 0, 0)
	sprite_replace(2178, "external/spr_floweyx_dimple.png", 3, 1, 0, 0, 0)
	sprite_replace(2180, "external/spr_floweyx_mouthbridge.png", 1, 1, 0, 0, 0)
	sprite_replace(2177, "external/spr_floweyx_mouthedge.gif", 0, 1, 0, 0, 0)
	sprite_replace(2178, "external/spr_floweyx_mouthl.gif", 0, 1, 0, 0, 0)
	sprite_replace(2178, "external/spr_floweyx_dimple.gif", 0, 1, 0, 0, 0)
	sprite_replace(2180, "external/spr_floweyx_mouthbridge.gif", 0, 1, 0, 0, 0)
	sprite_replace(2272, "external/spr_floweyx_tv.png", 1, 1, 0, 0, 0)
	sprite_replace(2274, "external/spr_pipepart.png", 1, 1, 0, 21, 19)
	sprite_replace(2272, "external/spr_floweyx_tv.gif", 0, 1, 0, 0, 0)
	sprite_replace(2274, "external/spr_pipepart.gif", 0, 1, 0, 21, 19)
	sprite_replace(2181, "external/spr_halfdentata_none.png", 1, 1, 0, 51, 36)
	sprite_replace(2183, "external/spr_halfdentata_bottom.png", 1, 1, 0, 51, 36)
	sprite_replace(2184, "external/spr_halfdentata_top.png", 1, 1, 0, 51, 36)
	sprite_replace(2185, "external/spr_dentata_tophalf.png", 1, 1, 0, 51, 36)
	sprite_replace(2186, "external/spr_dentata_bottomhalf.png", 1, 1, 0, 51, 36)
	sprite_replace(2187, "external/spr_dentata_none.png", 1, 1, 0, 51, 36)
	sprite_replace(2190, "external/spr_bgpipe.png", 1, 1, 0, 0, 0)
	sprite_replace(2190, "external/spr_bgpipe.gif", 0, 1, 0, 0, 0)
	sprite_replace(2191, "external/spr_floweyarm.png", 1, 1, 0, 0, 0)
	sprite_replace(2191, "external/spr_floweyarm.gif", 0, 1, 0, 0, 0)
	sprite_replace(2192, "external/spr_sidestalk.png", 1, 1, 0, 0, 0)
	sprite_replace(2192, "external/spr_sidestalk.gif", 0, 1, 0, 0, 0)
	sprite_replace(2193, "external/spr_vines_flowey.png", 1, 1, 0, 0, 0)
	sprite_replace(2194, "external/spr_vines_flowey_2.png", 1, 1, 0, 0, 0)
	sprite_replace(2195, "external/spr_vines_flowey_3.png", 1, 1, 0, 0, 0)
	sprite_replace(2193, "external/spr_vines_flowey.gif", 0, 1, 0, 0, 0)
	sprite_replace(2194, "external/spr_vines_flowey_2.gif", 0, 1, 0, 0, 0)
	sprite_replace(2195, "external/spr_vines_flowey_3.gif", 0, 1, 0, 0, 0)
	sprite_replace(2208, "external/tv.gif", 0, 0, 0, 0, 0)
	sprite_replace(2238, "external/spr_mouthball.png", 0, 1, 0, 59, 59)
	sprite_replace(2238, "external/spr_mouthball.gif", 0, 1, 0, 59, 59)
	sprite_replace(2240, "external/spr_floweynuke_explosion.png", 0, 1, 0, 0, 0)
	sprite_replace(2240, "external/spr_floweynuke_explosion.gif", 0, 1, 0, 0, 0)
	sprite_replace(2241, "external/spr_floweynuke.png", 0, 1, 0, 0, 0)
	sprite_replace(2241, "external/spr_floweynuke.gif", 0, 1, 0, 0, 0)
	sprite_replace(2244, "external/spr_mouthflash.png", 0, 1, 0, 0, 0)
	sprite_replace(2244, "external/spr_mouthflash.gif", 0, 1, 0, 0, 0)
	sprite_replace(2245, "external/spr_mouthbeam.png", 0, 1, 0, 0, 0)
	sprite_replace(2245, "external/spr_mouthbeam.gif", 0, 1, 0, 0, 0)
	sprite_replace(2249, "external/spr_floweyx_flame.png", 0, 1, 0, 20, 24)
	sprite_replace(2249, "external/spr_floweyx_flame.gif", 0, 1, 0, 20, 24)
	sprite_replace(2255, "external/spr_venus_placeholder.png", 0, 1, 0, 80, 0)
	sprite_replace(2255, "external/spr_venus_placeholder.gif", 0, 1, 0, 80, 0)
	sprite_collision_mask(2241, 0, 2, 13, 44, 34, 100, 1, 0)
	mus_soul[0]= caster_load("music/f_6s_1.ogg")
	mus_soul[1]= caster_load("music/f_6s_2.ogg")
	mus_soul[2]= caster_load("music/f_6s_3.ogg")
	mus_soul[3]= caster_load("music/f_6s_4.ogg")
	mus_soul[4]= caster_load("music/f_6s_5.ogg")
	mus_soul[5]= caster_load("music/f_6s_6.ogg")
	mus_soul[6]= caster_load("music/f_6s_1.ogg")
	soulpitch= 1
	mus_noise= caster_load("music/f_noise.ogg")
	mus_alarm= caster_load("music/f_alarm.ogg")
	mus_phase[0]= caster_load("music/f_part1.ogg")
	mus_phase[1]= caster_load("music/f_part2.ogg")
	mus_repeat1= caster_load("music/repeat_1.ogg")
	mus_repeat2= caster_load("music/repeat_2.ogg")
	mus_endnote= caster_load("music/f_endnote.ogg")
	mustype= 0
	sfx_oh= caster_load("music/sfx_oh.ogg")
	sfx_ted= caster_load("music/sfx_ted.ogg")
	sfx_generate= caster_load("music/sfx_generate.ogg")
	sfx_laugh= caster_load("music/f_laugh.ogg")
	mus_finale1= caster_load("music/f_finale_1.ogg")
	mus_finale1_l= caster_load("music/f_finale_1_l.ogg")
	mus_finale2= caster_load("music/f_finale_2.ogg")
	mus_finale3= caster_load("music/f_finale_3.ogg")
	mus_saved= caster_load("music/f_saved.ogg")
	mus_hit= caster_load("music/f_orchhit.ogg")
	pd= 0
	doomtimer= 0
	o_kill= 0
	destroyer= 0
	destroyercon= 0
	dcon= 0
	fileset= 2

func _gm_event_2_11():
	obj_floweybodyparent.knockfactor= knockfactor
	// obj_floweybodyparent
	with(1586) {
	    if(object_index != 1587) {
	        image_blend= make_color_rgb(255, 255 - knockfactor * 5, 255 - knockfactor * 5)
	        blend2= make_color_rgb(255, 255 - knockfactor * 5, 255 - knockfactor * 5)
	        x= xstart + random(knockfactor * 3) - random(knockfactor * 3)
	        y= ystart + random(knockfactor * 3) - random(knockfactor * 3)
	        if(object_index == 1588 or object_index == 1590) {
	            x= xstart
	            y= ystart
	        }
	        if(object_index == 1655) {
	            y-= 80
	            if(x > 320) x-= 40
	            if(x < 320) x+= 40
	        }
	    }
	}
	knockfactor--
	$Alarm11.start((1) / 30.0)
	if(knockfactor < 0) $Alarm11.start((-1) / 30.0)

func _gm_event_2_10():
	event_user(9)
	$Alarm10.start((80) / 30.0)
	if(destroyer > 1) $Alarm10.start((30 - destroyer * 2) / 30.0)
	if(alarm[10] <= 3) {
	    GS.my_hp= 0
	    $Alarm10.start((choose(2, 3)) / 30.0)
	}
	if(destroyer > 31) {
	    GS.my_hp= 1
	    obj_vsflowey_heart.move= 0
	    obj_vsflowey_heart.$Alarm5.start((-1) / 30.0)
	    GS.my_hp= 1
	    $Alarm10.start((-1) / 30.0)
	    obj_floweyx_flipeye.md= 0
	    dcon= 20
	}

func _gm_event_2_9():
	snd_play(156/* snd_hurt1_c */)
	GS.my_hp= 0
	GS.my_inv= 40
	instance_create(0, 0, 1582/* obj_vsflowey_shaker */)
	obj_vsflowey_heart.move= 0
	obj_vsflowey_heart.$Alarm5.start((5) / 30.0)
	if(destroyer == 1) obj_vsflowey_heart.$Alarm5.start((20) / 30.0)
	if(destroyer > 30) {
	    GS.my_hp= 1
	    obj_vsflowey_heart.move= 0
	    obj_vsflowey_heart.$Alarm5.start((-1) / 30.0)
	}

func _gm_event_2_7():
	event_user(7)

func _gm_event_2_5():
	introcon++

func _gm_event_2_4():
	dcon++

func _process_begin(delta: float):
	if(dcon == 55) {
	    caster_free(-3)
	    get_tree().change_scene_to_file("res://godot_rooms/323.tscn")
	    exit
	} else  exit

func _gm_event_5_86():
	if(GS.debug == 1) {
	    m= instance_create(110 + random(400), 200, 1638/* obj_gigavine_preview */)
	    m.memorymode= 1
	}

func _gm_event_5_72():
	if(GS.debug == 1) {
	    htest++
	    if(htest > 2) {
	        instance_create(0, 200 + random(280), 1629/* obj_f_handgun */)
	        htest= 0
	    }
	}

func _gm_event_7_20():
	if(not instance_exists(1584/* obj_flowey_bulletmaster */)) {
	    instance_create(0, 0, 1584/* obj_flowey_bulletmaster */)
	    drawhp= 1
	}

func _gm_event_7_19():
	loadtimer= 25
	fileset= 3
	GS.my_hp= 50
	if(destroyer < 28) obj_vsflowey_heart.move= 1
	else  obj_vsflowey_heart.move= 0
	$Alarm9.start((3) / 30.0)
	destroyer++
	if(destroyer > 3) {
	    flx= 0 + random(320)
	    fly= 0 - random(60)
	}
	obj_vsflowey_heart.z_index= z_index - 1
	obj_vsflowey_heart.x= 314
	obj_vsflowey_heart.y= 422
	obj_vsflowey_heart.special= 1
	obj_vsflowey_heart.sprite_index= 2270/* spr_ourheart */
	caster_stop(-3)
	caster_play(mus_hit, 1, 1)
	// obj_floweybodyparent
	with(1586) {
	    siner= 0
	    frame= 0
	}
	// obj_floweybullet_parent
	with(1627) instance_destroy()
	if(o_kill == 0) o_kill= 1
	else  o_kill= 0
	if(o_kill == 0) {
	    // obj_floweyx_mouth
	    with(1590) {
	        laugh= 0
	        mode= 0
	        rotbonus= 0
	        xbonus= 0
	        ybonus= 0
	    }
	    obj_floweyx_flipeye.md= 0
	    obj_floweyx_flipeye.con= 0
	    repeat(30)  {
	        m= instance_create(110 + random(400), 200, 1637/* obj_gigavine */)
	        with(m) {
	            visible= 1
	            scale.x= 1
	            scale.y= 1
	            modulate.a= 1
	            z_index= 12
	            xx= obj_vsflowey_heart.x + 8
	            yy= obj_vsflowey_heart.y + 8
	            direction= point_direction(x, y, xx, yy)
	            rotation_degrees= direction
	        }
	    }
	} else  {
	    // obj_floweyx_mouth
	    with(1590) {
	        laugh= 1
	        mode= 2
	        b= instance_create(271, 214, 1639/* obj_mouthbeam */)
	        b.z_index= z_index + 1
	        rotbonus= 15
	        xbonus= -4
	        ybonus= 6
	    }
	}

func _gm_event_7_18():
	instance_create(300, -10, 1597/* obj_floweyslice */)
	snd_play(157/* snd_laz_c */)
	$Alarm7.start((30) / 30.0)
	if(instance_exists(1599/* obj_floweydmgwriter */)) {
	    // obj_floweydmgwriter
	    with(1599) instance_destroy()
	}

func _gm_event_7_17():
	GS.damage= 5
	if(GS.soul_rescue == 0) GS.damage= 1
	if(GS.soul_rescue == 1) GS.damage= 3 + floor(random(3))
	if(GS.soul_rescue == 2) GS.damage= 10 + floor(random(3))
	if(GS.soul_rescue == 3) GS.damage= 14 + floor(random(3))
	if(GS.soul_rescue == 4) GS.damage= 18 + floor(random(4))
	if(GS.soul_rescue == 5) GS.damage= 23 + floor(random(4))
	if(GS.soul_rescue >= 6) {
	    GS.damage= 150 + floor(random(70))
	    if(megadamage == 1) GS.damage= 250 + floor(random(21))
	    if(megadamage == 2) GS.damage= 360 + floor(random(21))
	    if(megadamage == 3) GS.damage= 700 + floor(random(21))
	    if(megadamage == 4) GS.damage= 1200 + floor(random(21))
	    if(megadamage == 8) GS.damage= 6000
	}
	if(GS.damage > 100) {
	    // obj_floweyx_tv
	    with(1587) event_user(1)
	    knockfactor= 6
	    $Alarm11.start((1) / 30.0)
	} else  {
	    // obj_floweyx_tv
	    with(1587) event_user(2)
	}
	GS.floweyhp-= GS.damage
	if(GS.damage < 100) snd_play(158/* snd_damage_c */)
	else  snd_play(136/* snd_heavydamage */)
	dd= instance_create(100, 140, 1599/* obj_floweydmgwriter */)
	dd.$Alarm2.start((60) / 30.0)
	if(GS.floweyhp <= 0) {
	    // obj_flowey_fightbt
	    with(1596) instance_destroy()
	    // obj_fx_bgen
	    with(1583) instance_destroy()
	    // obj_flowey_bulletmaster
	    with(1584) instance_destroy()
	    // obj_floweybullet_parent
	    with(1627) instance_destroy()
	    caster_stop(-3)
	    snd_play(136/* snd_heavydamage */)
	    dd.$Alarm2.start((-1) / 30.0)
	    dcon= 1
	    $Alarm4.start((30) / 30.0)
	}

func _gm_event_7_16():
	if(darkmode == 0) darkmode= 1
	if(darkmode == 2) darkmode= 3

func _gm_event_7_15():
	// obj_floweybodyparent
	with(1586) event_user(5)
	// obj_vsflowey_heart
	with(1581) event_user(5)
	// obj_gigavine_preview
	with(1638) event_user(5)
	// obj_gigavine
	with(1637) event_user(5)
	// obj_eyeshot_a
	with(1636) event_user(5)
	// obj_vsflowey_heart
	with(1581) event_user(5)
	GS.my_hp= save_hp
	GS.my_inv= save_inv
	savetimer= -1
	loadtimer= 20
	fileset= 2
	if(mustype == 3) {
	    mused= 0
	    if(caster_is_playing(mus_repeat1) and mused == 0) {
	        mused= 1
	        caster_stop(mus_repeat1)
	        caster_loop(mus_repeat2, 1, 1)
	    }
	    if(caster_is_playing(mus_repeat2) and mused == 0) {
	        mused= 1
	        caster_stop(mus_repeat2)
	        caster_loop(mus_repeat1, 1, 1)
	    }
	}

func _gm_event_7_14():
	// obj_floweybodyparent
	with(1586) event_user(4)
	// obj_vsflowey_heart
	with(1581) event_user(4)
	// obj_gigavine_preview
	with(1638) event_user(4)
	// obj_gigavine
	with(1637) event_user(4)
	// obj_eyeshot_a
	with(1636) event_user(4)
	// obj_vsflowey_heart
	with(1581) event_user(4)
	save_hp= GS.my_hp
	save_inv= GS.my_inv
	savetimer= 20
	loadtimer= -1
	fileset= 2

func _on_outside_room():
	draw_set_color(16777215)
	draw_set_font(10)
	savetimer--
	loadtimer--
	if(savetimer > 0) {
	    draw_set_color(65535)
	    sta= (10 + savetimer) / 20
	    if(sta > 1) sta= 1
	    draw_set_alpha(sta)
	    if(fileset == 2) draw_text_transformed(20, 430, "FILE 2 SAVED", 3, 3, 0)
	    if(fileset == 3) draw_text_transformed(20, 430, "FILE 3 SAVED", 3, 3, 0)
	    if(fileset == 6) draw_text_transformed(20, 430, "FILE 6 SAVED", 3, 3, 0)
	}
	if(loadtimer > 0) {
	    sta= (10 + loadtimer) / 20
	    if(sta > 1) sta= 1
	    draw_set_alpha(sta)
	    if(fileset == 3 or fileset == 4 or fileset == 5 or fileset == 6) {
	        if(fileset == 3)
	            draw_text_transformed(20 + flx, 430 + fly, "FILE 3 LOADED", 3, 3, 0)
	        if(fileset == 4) draw_text_transformed(20, 430, "FILE 4 LOADED", 3, 3, 0)
	        if(fileset == 5) draw_text_transformed(20, 430, "LOAD FAILED", 3, 3, 0)
	        if(fileset == 6) draw_text_transformed(20, 430, "FILE 6 LOADED", 3, 3, 0)
	    } else  draw_text_transformed(20, 430, "FILE 2 LOADED", 3, 3, 0)
	}
	if(darkmode == 1) {
	    obj_vsflowey_heart.z_index= -25
	    if(darkvalue < 1) darkvalue+= 0.05
	    draw_set_alpha(darkvalue)
	    if(darkvalue == 1) darkmode= 2
	}
	if(darkmode == 3) {
	    if(darkvalue > 0) darkvalue-= 0.05
	    else  {
	        obj_vsflowey_heart.z_index= 10
	        darkmode= 0
	        darkvalue= 0
	    }
	    draw_set_alpha(darkvalue)
	}
	if(darkmode > 0) {
	    draw_set_color(0)
	    draw_rectangle(-20, -20, 700, 500, 0)
	}
	draw_set_alpha(1)
	if(pd == 1) {
	    if(soulpitch > 0) {
	        soulpitch-= 0.02
	        caster_set_pitch(mus_soul[GS.soul_rescue], soulpitch)
	        caster_set_volume(mus_soul[GS.soul_rescue], soulpitch)
	    } else  {
	        caster_stop(mus_soul[GS.soul_rescue])
	        soulpitch= 1
	        pd= -1
	    }
	}
	if(drawhp == 1) {
	    draw_set_color(128)
	    draw_rectangle(295, 450, 345, 470, 0)
	    draw_set_color(65535)
	    if(GS.my_hp > 0) draw_rectangle(295, 450, 295 + GS.my_hp, 470, 0)
	}
	if(dcon > 0) {
	    if(destroyercon == 1) {
	        destroyercon= 2
	        $Alarm10.start((1) / 30.0)
	    }
	    if(dcon == 2) {
	        snd_play(136/* snd_heavydamage */)
	        // obj_floweyx_tv
	        with(1587) event_user(1)
	        dcon= 3
	        $Alarm4.start((30) / 30.0)
	    }
	    if(dcon == 4) {
	        snd_play(136/* snd_heavydamage */)
	        // obj_floweyx_tv
	        with(1587) event_user(1)
	        dcon= 5
	        $Alarm4.start((60) / 30.0)
	    }
	    if(dcon == 6) {
	        sfx_glock= caster_load("music/f_glock.ogg")
	        sfx_shake= caster_load("music/f_destroyed.ogg")
	        caster_loop(sfx_shake, 0.7, 0.9)
	        lsh= instance_create(0, 0, 1582/* obj_vsflowey_shaker */)
	        lsh.decay= 0
	        dcon= 7
	        $Alarm4.start((45) / 30.0)
	    }
	    if(dcon == 8) {
	        dcon= 10
	        GS.typer= 75
	        GS.msg[0]= "* No... NO!!!/"
	        GS.msg[1]= "* This CAN\'T be&  happening!!!/"
	        GS.msg[2]= "* You... YOU.../%%"
	        GS.msg[3]= "%%%"
	        // obj_flowey_writer
	        with(1598) instance_destroy()
	        tw= instance_create(170, 300, 1598/* obj_flowey_writer */)
	    }
	    if(dcon == 10 and not is_instance_valid(tw)) {
	        dcon= 11
	        $Alarm4.start((30) / 30.0)
	    }
	    if(dcon >= 2 and dcon <= 12) {
	        // obj_flowey_fightbt
	        with(1596) instance_destroy()
	    }
	    if(dcon == 12) {
	        GS.soul_rescue= 0
	        GS.my_hp= 50
	        loadtimer= 90
	        fileset= 3
	        GS.my_hp= 50
	        obj_vsflowey_heart.move= 1
	        obj_vsflowey_heart.z_index= -4
	        obj_vsflowey_heart.x= 314
	        obj_vsflowey_heart.y= 422
	        obj_vsflowey_heart.special= 1
	        obj_vsflowey_heart.sprite_index= 2270/* spr_ourheart */
	        // obj_floweyx_tv
	        with(1587) tvmode= 10
	        caster_stop(-3)
	        caster_play(sfx_glock, 1, 1)
	        // obj_flowey_writer
	        with(1598) instance_destroy()
	        view_xview[0]= 0
	        view_yview[0]= 0
	        // obj_vsflowey_shaker
	        with(1582) instance_destroy()
	        // obj_floweybodyparent
	        with(1586) {
	            siner= 0
	            desperate= 0
	            frozen= 0
	        }
	        // obj_floweydmgwriter
	        with(1599) {
	            dmg= 0
	            apparenthp= GS.floweymaxhp
	        }
	        dcon= 13
	        $Alarm4.start((90) / 30.0)
	    }
	    if(dcon == 14) {
	        GS.typer= 76
	        GS.msg[0]= "* You^2 IDIOT^5. %%"
	        // obj_flowey_writer
	        with(1598) instance_destroy()
	        dcon= 15
	        tw2= instance_create(170, 300, 1598/* obj_flowey_writer */)
	    }
	    if(dcon == 15 and not is_instance_valid(tw2)) {
	        // obj_floweydmgwriter
	        with(1599) instance_destroy()
	        dcon= 16
	        $Alarm4.start((15) / 30.0)
	    }
	    if(dcon == 17) {
	        // obj_floweyx_tv
	        with(1587) tvmode= 20
	        fileset= 3
	        destroyercon= 1
	        dcon= 18
	    }
	    if(dcon == 20) {
	        // obj_floweyx_tv
	        with(1587) tvmode= 21
	        obj_vsflowey_heart.move= 0
	        dcon= 20.1
	        $Alarm4.start((50) / 30.0)
	    }
	    if(dcon == 21.1) {
	        obj_vsflowey_heart.move= 0
	        sfg= instance_create(obj_vsflowey_heart.x + 8, obj_vsflowey_heart.y + 8, 1647/* obj_spinbullet_final_gen */)
	        fileset= 6
	        savetimer= 20
	        dcon= 21
	        $Alarm4.start((40) / 30.0)
	    }
	    if(dcon == 22) {
	        obj_vsflowey_heart.move= 1
	        mus_worry= caster_load("music/yourbestfriend_3.ogg")
	        caster_loop(mus_worry, 0.85, 0.9)
	        dcon= 23
	        $Alarm4.start((20) / 30.0)
	    }
	    if(dcon == 24) {
	        GS.typer= 76
	        GS.msg[0]= "* Hee hee hee./"
	        GS.msg[1]= "* Did you REALLY&  think.../"
	        GS.msg[2]= "* You could&  defeat ME!?/"
	        GS.msg[3]= "\\E5* I am the GOD of&  this world./"
	        GS.msg[4]= "\\E6* And YOU?/"
	        GS.msg[5]= "* You\'re HOPELESS./"
	        GS.msg[6]= "* Hopeless and&  alone.../"
	        GS.msg[7]= "\\E0* Golly^1, that\'s&  right!/"
	        GS.msg[8]= "\\E7* Your WORTHLESS&  friends.../"
	        GS.msg[9]= "\\E8* ... can\'t save&  you now./"
	        GS.msg[10]= "\\E1* Call for help^1.&* I dare you./"
	        GS.msg[11]= "\\E5* Cry into the&  darkness!/"
	        GS.msg[12]= "\\E8" + chr(ord('"')) + "Mommy^1! Daddy^1!" + chr(ord('"')) + "&" + chr(ord('"')) + "Somebody help!" + chr(ord('"')) + "/"
	        GS.msg[13]= "\\E5* See what good&  it does you!/%%"
	        GS.msg[14]= "%%%"
	        // obj_flowey_writer
	        with(1598) instance_destroy()
	        dcon= 25
	        tw2= instance_create(130, 280, 1598/* obj_flowey_writer */)
	    }
	    if(dcon == 25) {
	        if(instance_exists(1598/* obj_flowey_writer */)) {
	            if(intent_hit > 20 and obj_flowey_writer.stringno < 2) {
	                obj_flowey_writer.mystring[2]= "* You..^1. uh.../"
	                obj_flowey_writer.mystring[3]= "\\E4* Would you STOP that?/"
	                obj_flowey_writer.mystring[4]= "\\E6* Anyway^1, YOU!/"
	            }
	            if(obj_flowey_writer.stringno == 3) {
	                // obj_floweyx_tv
	                with(1587) {
	                    if(tvmode != 11) {
	                        tvmode= 11
	                        overnoiser= 6
	                    }
	                }
	            }
	            if(obj_flowey_writer.stringno == 5) {
	                // obj_floweyx_tv
	                with(1587) {
	                    if(tvmode != 12) {
	                        tvmode= 12
	                        overnoiser= 6
	                    }
	                }
	            }
	            if(obj_flowey_writer.stringno == 6) {
	                // obj_floweyx_tv
	                with(1587) tvmode= 13
	            }
	            if(obj_flowey_writer.stringno == 7) {
	                // obj_floweyx_tv
	                with(1587) {
	                    if(tvmode != 11) {
	                        tvmode= 11
	                        overnoiser= 6
	                    }
	                }
	            }
	        }
	        if(not instance_exists(1598/* obj_flowey_writer */)) {
	            obj_spinbullet_huge.z_index= 30
	            ap= instance_create(obj_vsflowey_heart.x + 45, obj_vsflowey_heart.y + 8, 1621/* obj_centeract_parent */)
	            ap.sprite_index= 2227/* spr_actbt_center_hole */
	            ap.z_index= 20
	            dcon= 30
	        }
	    }
	    if(dcon == 31) {
	        // obj_floweyx_tv
	        with(1587) tvmode= 11
	        GS.faceemotion= 3
	        GS.typer= 77
	        GS.msg[0]= "(You called for help.^4) %%"
	        GS.msg[1]= "%%%"
	        // obj_flowey_writer
	        with(1598) instance_destroy()
	        tw2= instance_create(130, 280, 1598/* obj_flowey_writer */)
	        dcon= 33
	        $Alarm4.start((160) / 30.0)
	    }
	    if(dcon == 34) {
	        caster_stop(-3)
	        GS.typer= 76
	        GS.msg[0]= "* .../"
	        GS.msg[1]= "\\E0* But nobody came./"
	        GS.msg[2]= "\\E2* Boy^1!&* What a shame!/"
	        GS.msg[3]= "\\E7* Nobody else.../"
	        GS.msg[4]= "* Is gonna get to&  see you DIE!!!/%%"
	        GS.msg[5]= "%%%"
	        // obj_flowey_writer
	        with(1598) instance_destroy()
	        dcon= 35
	        tw2= instance_create(130, 280, 1598/* obj_flowey_writer */)
	    }
	    if(dcon == 35) {
	        if(instance_exists(1598/* obj_flowey_writer */) and obj_flowey_writer.stringno == 4) {
	            // obj_floweyx_tv
	            with(1587) {
	                if(tvmode != 21) {
	                    tvmode= 21
	                    overnoiser= 6
	                }
	            }
	        }
	        if(not instance_exists(1598/* obj_flowey_writer */)) {
	            // obj_floweyx_tv
	            with(1587) tvmode= 20
	            caster_play(sfx_laugh, 1, 1)
	            // obj_spinbullet_final_gen
	            with(1647) $Alarm1.start((1) / 30.0)
	            // obj_spinbullet_huge
	            with(1648) trick= 1
	            dcon= 36
	        }
	    }
	    if(dcon == 40) {
	        caster_stop(sfx_laugh)
	        GS.facemotion= 0
	        // obj_floweyx_tv
	        with(1587) tvmode= 22
	        dcon= 41
	        $Alarm4.start((120) / 30.0)
	    }
	    if(dcon == 42) {
	        GS.typer= 76
	        GS.msg[0]= "* What^4? %"
	        GS.msg[1]= "\\E1* How\'d you...^4? %"
	        GS.msg[2]= "\\E2* Well^1, I\'ll jus^4t%%"
	        GS.msg[5]= "%%%"
	        // obj_flowey_writer
	        with(1598) instance_destroy()
	        dcon= 43
	        tw2= instance_create(130, 280, 1598/* obj_flowey_writer */)
	    }
	    if(dcon == 43 and not instance_exists(1598/* obj_flowey_writer */)) {
	        GS.faceemotion= 3
	        fileset= 5
	        loadtimer= 70
	        dcon= 44
	        $Alarm4.start((100) / 30.0)
	    }
	    if(dcon == 45) {
	        GS.typer= 76
	        GS.msg[0]= "\\E4* Wh..^4. %"
	        GS.msg[1]= "* Where are my&  powers!^5? %%"
	        GS.msg[5]= "%%%"
	        // obj_flowey_writer
	        with(1598) instance_destroy()
	        dcon= 47
	        tw2= instance_create(130, 280, 1598/* obj_flowey_writer */)
	    }
	    if(dcon == 47 and not instance_exists(1598/* obj_flowey_writer */)) {
	        // obj_floweybodyparent
	        with(1586) frozen= 1
	        instance_create(0, 0, 1602/* obj_6flasher */)
	        snd_play(154/* snd_break2_c */)
	        GS.soul_rescue= 6
	        dcon= 48
	        $Alarm4.start((45) / 30.0)
	        s6= instance_create(0, 0, 1604/* obj_6soul_lastcutscene */)
	    }
	    if(dcon == 49) {
	        GS.typer= 76
	        GS.msg[0]= "\\E5* The souls...^5? %"
	        GS.msg[1]= "* What are they&  doing^5? %%"
	        GS.msg[5]= "%%%"
	        // obj_flowey_writer
	        with(1598) instance_destroy()
	        dcon= 50
	        tw2= instance_create(130, 280, 1598/* obj_flowey_writer */)
	    }
	    if(dcon == 50 and not instance_exists(1598/* obj_flowey_writer */)) {
	        // obj_floweyx_tv
	        with(1587) tvmode= 99
	        instance_create(0, 0, 1602/* obj_6flasher */)
	        snd_play(154/* snd_break2_c */)
	        // obj_floweybodyparent
	        with(1586) frozen= 1
	        sh2= instance_create(0, 0, 1582/* obj_vsflowey_shaker */)
	        sh2.shakex= 10
	        sh2.shakey= 10
	        sh2.decay= 0
	        with(s6) con= 1
	        m_destroy= caster_load("music/f_destroyed3.ogg")
	        caster_loop(m_destroy, 1, 1)
	        GS.typer= 76
	        GS.msg[0]= "* NO!^1! NO!!!!^4! %"
	        GS.msg[1]= "* YOU CAN\'T DO&  THAT!!^4! %"
	        GS.msg[2]= "* YOU\'RE SUPPOSED&  TO OBEY ME!^4! %"
	        GS.msg[3]= "* STOP!!^1!&  STOP IT!!!!^4! %%"
	        GS.msg[4]= "%%%"
	        // obj_flowey_writer
	        with(1598) instance_destroy()
	        dcon= 51
	        tw2= instance_create(130, 280, 1598/* obj_flowey_writer */)
	    }
	    if(dcon == 51 and not instance_exists(1598/* obj_flowey_writer */)) {
	        // obj_floweyx_tv
	        with(1587) tvmode= 100
	        GS.typer= 74
	        GS.msg[0]= "* STOOOOPPPP!!!!!"
	        GS.msg[4]= "%%%"
	        pp= 0
	        // obj_flowey_writer
	        with(1598) instance_destroy()
	        dcon= 52
	        whiter_maker= 2
	        tw2= instance_create(130, 280, 1598/* obj_flowey_writer */)
	    }
	    if(dcon == 52) {
	        z_index= -90
	        pp+= 0.008
	        draw_set_alpha(pp / 1.5)
	        draw_set_color(16777215)
	        draw_rectangle(-10, -10, 900, 900, 0)
	        caster_set_pitch(m_destroy, 1 + pp)
	        caster_set_volume(m_destroy, 1 - pp / 2)
	        draw_set_alpha(1)
	        if(pp > 2) {
	            ini_open("undertale.ini")
	            ini_write_real("FFFFF", "E", 1)
	            ini_write_real("FFFFF", "F", 0)
	            ini_close()
	            if(file_exists("flowey.exe")) file_rename("flowey.exe", "undertale.exe")
	            drkdrk= 0
	            dcon= 53
	        }
	    }
	    if(dcon == 53) {
	        caster_stop(m_destroy)
	        dcon= 54
	        $Alarm4.start((120) / 30.0)
	    }
	    if(dcon == 54 or dcon == 55) {
	        draw_set_color(16777215)
	        draw_rectangle(-10, -10, 900, 900, 0)
	        draw_set_color(0)
	        drkdrk+= 0.01
	        draw_set_alpha(drkdrk)
	        draw_rectangle(-10, -10, 999, 999, 0)
	        draw_set_alpha(1)
	        if(drkdrk >= 1.1) {
	            drkdrk_px= scr_marker(-10, -10, 996)
	            drkdrk_px.scale.x= 900
	            drkdrk_px.scale.y= 900
	        }
	    }
	    if(dcon >= 51) {
	        // obj_floweybodyparent
	        with(1586) {
	            frozen= 1
	            siner+= 1 + random(0.5)
	            md= 1
	            image_blend= make_color_hsv(abs(sin(siner / 30)) * 512, 255, 255)
	            blend2= make_color_hsv(abs(sin(siner / 30)) * 512, 255, 255)
	            flash= -1
	            x= xstart + random(15) - random(15)
	            y= ystart + random(15) - random(15)
	            if(object_index == 1655) {
	                y-= 80
	                if(x > 320) x-= 40
	                if(x < 320) x+= 40
	            }
	        }
	    }
	}
	if(introcon > 0) {
	    if(introcon == 1) {
	        obj_vsflowey_heart.x= 314
	        obj_vsflowey_heart.y= 422
	        bgsiner= 0
	        dividefactor= 1
	        bganimer= 1
	        if(introskip == 0) {
	            mus_intro= caster_load("music/f_intro.ogg")
	            caster_play(mus_intro, 1, 1)
	        }
	        view_yview[0]+= 480
	        ny= view_yview[0]
	        hy= obj_vsflowey_heart.y
	        obj_vsflowey_heart.y+= 480
	        background_color= 128
	        obj_vsflowey_heart.move= 0
	        obj_floweyx_tv.tvmode= 25
	        obj_floweyx_tv.siner= 0
	        // obj_floweybodyparent
	        with(1586) {
	            desperate= 0
	            image_blend= 0
	            grgrgrgr= 0
	            blend2= 0
	            flash= 99
	        }
	        introcon= 2
	        $Alarm5.start((440) / 30.0)
	        if(introskip == 1) $Alarm5.start((1) / 30.0)
	    }
	    if(bganimer == 1) {
	        bgsiner++
	        background_color= make_color_rgb(abs(sin(bgsiner / 8) * 130 / dividefactor), 0, 0)
	    }
	    if(introcon == 2) {
	        if(introskip == 0) ny-= 1.09090909090909
	        if(introskip == 1) ny-= 480
	        view_yview[0]= floor(ny)
	        obj_vsflowey_heart.y= hy + floor(ny)
	    }
	    if(introcon == 3) {
	        dividefactor= 1
	        obj_floweyx_tv.tvmode= 24
	        introcon= 4
	        $Alarm5.start((70) / 30.0)
	        if(introskip == 1) $Alarm5.start((1) / 30.0)
	        view_yview[0]= 0
	        obj_vsflowey_heart.y= floor(obj_vsflowey_heart.y)
	    }
	    if(introcon == 5) {
	        fadevalue= 0
	        obj_floweyx_tv.tvmode= 19
	        obj_vsflowey_heart.move= 1
	        introcon= 5.1
	        $Alarm5.start((95) / 30.0)
	        if(introskip == 1) $Alarm5.start((1) / 30.0)
	    }
	    if(introcon == 6.1) {
	        dividefactor+= 9
	        fadevalue++
	        ib= make_color_rgb(fadevalue * 25.5, fadevalue * 25.5, fadevalue * 25.5)
	        obj_floweybodyparent.image_blend= ib
	        obj_floweybodyparent.blend2= ib
	        if(fadevalue >= 10) {
	            background_color= 0
	            introcon= 7
	            $Alarm5.start((20) / 30.0)
	        }
	        // obj_floweybodyparent
	        with(1586) frozen= 4
	    }
	    if(introcon == 8) {
	        sh= instance_create(0, 0, 1582/* obj_vsflowey_shaker */)
	        sh.decay= 0
	        caster_stop(-3)
	        caster_play(sfx_laugh, 1, 1)
	        obj_floweyx_mouth.laugh= 1
	        obj_floweyx_tv.tvmode= 20
	        introcon= 9
	        $Alarm5.start((180) / 30.0)
	    }
	    if(introcon == 10) {
	        with(sh) instance_destroy()
	        view_xview[0]= 0
	        view_yview[0]= 0
	        obj_floweyx_mouth.laugh= 0
	        obj_floweyx_tv.tvmode= 21
	        introcon= 11
	        $Alarm5.start((20) / 30.0)
	    }
	    if(introcon == 12) {
	        // obj_floweybodyparent
	        with(1586) {
	            frozen= 0
	            desperate= 1
	        }
	        event_user(10)
	        obj_floweyx_tv.tvmode= 0
	        introcon= -1
	    }
	    if(introskip == 1) {
	        draw_set_color(0)
	        draw_set_alpha((10 - fadevalue) / 10)
	        draw_rectangle(-10, -10, 999, 999, 0)
	        if(fadevalue < 10) obj_floweyx_tv.tvmode= 26
	        draw_set_alpha(1)
	    }
	}
	if(turnturn == 0 and introcon == 2) {
	    turnturn= 1
	    obj_floweybodyparent.visible= 1
	    draw_set_color(0)
	    draw_rectangle(-10, -10, 999, 999, 0)
	    draw_sprite(2270/* spr_ourheart */, 0, obj_vsflowey_heart.x, obj_vsflowey_heart.y)
	}
	if(GS.debug == 1) {
	    draw_set_color(65535)
	    draw_text(get_viewport_rect().size.x - 60, get_viewport_rect().size.y - 40, "debug")
	}

func _gm_event_9_87():
	if(GS.debug == 1) destroyercon= 1

func _gm_event_9_83():
	if(GS.debug == 1) event_user(4)

func _gm_event_9_81():
	if(GS.debug == 1) event_user(10)

func _gm_event_9_80():
	if(GS.debug == 1) {
	    instance_create(190, 260, 1619/* obj_6pan */)
	    ppp= instance_create(415, 260, 1619/* obj_6pan */)
	    ppp.spec= 1
	    instance_create(640, 260, 1619/* obj_6pan */)
	}

func _gm_event_9_79():
	if(GS.debug == 1) instance_create(0, 0, 1624/* obj_6book_master */)

func _gm_event_9_78():
	if(GS.debug == 1) instance_create(110 + random(400), -50, 1635/* obj_floweynuke */)

func _gm_event_9_77():
	if(GS.debug == 1) instance_create(random(530), 140, 1631/* obj_mouthball */)

func _gm_event_9_76():
	if(GS.debug == 1) event_user(5)

func _gm_event_9_75():
	if(GS.debug == 1) instance_create(0, 0, 1626/* obj_6knife_act */)

func _gm_event_9_74():
	if(GS.debug == 1)
	    instance_create(get_viewport_rect().size.x / 2, get_viewport_rect().size.y / 2, 1609/* obj_6gun */)

func _gm_event_9_73():
	if(GS.debug == 1) introcon= 1

func _gm_event_9_71():
	if(GS.debug == 1) {
	    instance_create(get_viewport_rect().size.x * 0.5, -100, 1617/* obj_6glove_boss */)
	    instance_create(get_viewport_rect().size.x * 0, -220, 1617/* obj_6glove_boss */)
	    instance_create(get_viewport_rect().size.x * 1, -220, 1617/* obj_6glove_boss */)
	    instance_create(get_viewport_rect().size.x * 0.5, -500, 1617/* obj_6glove_boss */)
	    instance_create(get_viewport_rect().size.x * 0, -620, 1617/* obj_6glove_boss */)
	    instance_create(get_viewport_rect().size.x * 1, -620, 1617/* obj_6glove_boss */)
	    lg= instance_create(get_viewport_rect().size.x * 0.5, -900, 1617/* obj_6glove_boss */)
	    with(lg) event_user(6)
	    instance_create(get_viewport_rect().size.x * 0, -1020, 1617/* obj_6glove_boss */)
	    instance_create(get_viewport_rect().size.x * 1, -1020, 1617/* obj_6glove_boss */)
	}

func _gm_event_9_70():
	if(GS.debug == 1) instance_create(0, 0, 1645/* obj_spinbullet_huge_gen_preview */)

func _gm_event_9_66():
	if(GS.debug == 1 and instance_exists(1644/* obj_chaosbomb */))
	    obj_chaosbomb.con= 1

func _gm_event_9_65():
	if(GS.debug == 1) {
	    if(not instance_exists(1640/* obj_floweyx_flamethrower */)) {
	        instance_create(110, 140, 1640/* obj_floweyx_flamethrower */)
	        instance_create(530, 140, 1640/* obj_floweyx_flamethrower */)
	    } else  obj_floweyx_flamethrower.con= 3
	}

func _gm_event_9_36():
	if(GS.debug == 1) {
	    megadamage= 8
	    event_user(7)
	}

func _gm_event_9_33():
	if(GS.debug == 1) {
	    GS.battlephase++
	    GS.soul_rescue++
	}

func _gm_event_9_16():
	if(GS.debug == 1) {
	    GS.soul_rescue++
	    if(GS.soul_rescue == 7) GS.soul_rescue= 0
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
