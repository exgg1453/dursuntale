# Auto-converted from GameMaker: obj_asriel_body
extends Node2D

func _ready():
	x= 315
	y= 50
	pause= 0
	siner= 0
	rely= 0
	relx= 0
	headrot= 0
	armrot_l= 0
	armrot_r= 0
	torsorot= 0
	$Alarm0.start((1) / 30.0)
	aimage= 0
	normal= 1
	startx= x
	starty= y
	starcon= 0
	type= 0
	bladecon= 0
	specialarm= 0
	arm_alpha= 1
	heady= 0
	headx= 0
	guncon= 0
	gonercon= 0
	s_s= 0
	GS.faceemotion= 0
	shrug= 0
	shrug_x= 0
	aligncon= 1
	specialnormal= 1
	n_siner= 0
	cr= caster_load("music/create.ogg")
	powersfx= caster_load("music/sfx/sfx_spellcast.ogg")
	sn= 0
	// obj_battlebg
	with(185) instance_destroy()
	if(GS.flag[502] > 0 and GS.flag[7] == 0) {
	    specialnormal= 0
	    aligncon= 0
	}
	darker= 0
	darker_x= 0
	u_gen= 0
	h_mode= 0
	transform= 0
	stetch= 0
	if(GS.flag[502] > 0) aimage= 1

func _gm_event_2_8():
	gonercon++

func _gm_event_2_7():
	guncon++

func _gm_event_2_6():
	bladecon++

func _gm_event_2_5():
	starcon++

func _on_destroy():
	if(aimage == 1) {
	    o= instance_create(x + relx, y + rely, 571/* obj_afterimage_asriel */)
	    o.sprite_index= sprite_index
	    o.frame= frame
	    o.image_speed= 0
	    o.modulate.a= 0.5
	    o.z_index= z_index + 1
	}
	$Alarm0.start((1) / 30.0)

func _gm_event_7_11():
	GS.turntimer= -1
	GS.mnfight= 3

func _gm_event_7_5():
	caster_free(cr)
	caster_free(powersfx)

func _on_outside_room():
	if(transform == 1) stetch+= 0.2
	if(normal == 1) {
	    siner++
	    rely+= sin(siner / 12)
	    x+= cos(siner / 24) * 6
	    y+= sin(siner / 6) * 0.25
	}
	yoff= sin(siner / 6)
	xoff= cos(siner / 3)
	draw_set_color(0)
	draw_set_alpha(modulate.a)
	draw_rectangle(x - 40, y + 20 + rely, x + 42, y + 46 + rely, 0)
	draw_set_alpha(1)
	draw_sprite_ext(2355/* spr_asrielfeet */, 0, x + yoff * 2, y + 168 - 112 + rely * 0.9, 2 + stetch, 2, torsorot, image_blend, modulate.a)
	draw_sprite_ext(2354/* spr_torsoball */, 0, x + yoff, y + 48 + rely, 2 + stetch, 2, 0, image_blend, modulate.a)
	draw_sprite_ext(2353/* spr_asrieltorso */, 0, x + yoff, y + 48 + rely, 2 + stetch, 2, torsorot, image_blend, modulate.a)
	draw_sprite_ext(2351/* spr_asriellocket */, 0, x + 2, y + 34 + rely * 1.2, 2 + stetch, 2, 0, image_blend, modulate.a)
	if(specialarm == 0) {
	    if(shrug == 0) {
	        draw_sprite_ext(2349/* spr_asrielarm_r */, 0, x - 28, y + 38 + rely * 1.2, -2 - stetch, 2, armrot_l, image_blend, modulate.a)
	        draw_sprite_ext(2349/* spr_asrielarm_r */, 0, x + 30, y + 38 + rely * 1.2, 2 + stetch, 2, armrot_r, image_blend, modulate.a)
	    }
	    if(shrug == 1) {
	        draw_sprite_ext(2350/* spr_asrielarm_r_shrug */, 0, x - 28, y + 38 + rely * 1.2, -2, 2, armrot_l, image_blend, modulate.a)
	        draw_sprite_ext(2350/* spr_asrielarm_r_shrug */, 0, x + 30, y + 38 + rely * 1.2, 2, 2, armrot_r, image_blend, modulate.a)
	    }
	}
	if(specialarm == 1) {
	    draw_sprite_ext(2349/* spr_asrielarm_r */, 0, x - 28, y + 38 + rely * 1.2, -2, 2, armrot_l, image_blend, arm_alpha)
	    draw_sprite_ext(2349/* spr_asrielarm_r */, 0, x + 30, y + 38 + rely * 1.2, 2, 2, armrot_r, image_blend, arm_alpha)
	}
	if(specialarm == 2) {
	    draw_sprite_ext(2349/* spr_asrielarm_r */, 0, x - 28, y + 38 + rely * 1.2, -2, 2, armrot_l, image_blend, modulate.a)
	    draw_sprite_ext(2349/* spr_asrielarm_r */, 0, x + 30, y + 38 + rely * 1.2, 2, 2, armrot_r, image_blend, arm_alpha)
	}
	draw_sprite_ext(2352/* spr_asrielshoulder_r */, 0, x - 28, y + 26 + rely * 1.2, -2 - stetch, 2, 0, image_blend, modulate.a)
	draw_sprite_ext(2352/* spr_asrielshoulder_r */, 0, x + 30, y + 26 + rely * 1.2, 2 + stetch, 2, 0, image_blend, modulate.a)
	draw_sprite_ext(2356/* spr_asrielcollar */, 0, x, y + 22 + rely * 1, 2 + stetch, 2, 0, image_blend, modulate.a)
	if(shrug == 0)
	    draw_sprite_ext(2357/* spr_asrielhead */, GS.faceemotion, x + headx, y + rely * 1.2 + heady, 2 + stetch, 2, headrot, image_blend, modulate.a)
	if(shrug == 1) {
	    shrug_x++
	    draw_sprite_ext(2359/* spr_asriel_headshake_sassy */, floor(shrug_x / 6), x + headx, y + rely * 1.2 + heady, 2 + stetch, 2, headrot, image_blend, modulate.a)
	}
	if(aligncon == 1) {
	    normal= 0
	    xxx= mouse_x
	    yyy= mouse_y
	    xxx= 320
	    yyy= 45
	    if(s_s == 1) yyy= 100
	    xxoff= x - xxx
	    yyoff= y - yyy
	    aligncon= 2
	    altimer= 0
	}
	if(aligncon == 2) {
	    modulate.a= 1
	    if(abs(relx) > 1) relx*= 0.7
	    else  relx= 0
	    if(abs(rely) > 1) rely*= 0.7
	    else  rely= 0
	    if(abs(yyoff) > 1) yyoff*= 0.7
	    else  yyoff= 0
	    if(abs(xxoff) > 1) xxoff*= 0.7
	    else  xxoff= 0
	    if(abs(armrot_l) > 1) armrot_l*= 0.7
	    else  armrot_l= 0
	    if(abs(armrot_r) > 1) armrot_r*= 0.7
	    else  armrot_r= 0
	    if(abs(torsorot) > 1) torsorot*= 0.7
	    else  torsorot= 0
	    if(abs(headrot) > 1) headrot*= 0.7
	    else  headrot= 0
	    altimer++
	    x= xxx + xxoff
	    y= yyy + yyoff
	    if(altimer > 15) {
	        modulate.a= 1
	        aligncon= 3
	        aimage= 0
	    }
	}
	if(aligncon == 4) {
	    heady= 0
	    headx= 0
	    specialarm= 0
	    arm_alpha= 0
	    relx= 0
	    rely= 0
	    xxoff= 0
	    yyoff= 0
	    armrot_l= 0
	    armrot_r= 0
	    torsorot= 0
	    headrot= 0
	    aligncon= 0
	    siner= 0
	    aimage= 1
	    normal= 1
	    altimer= 0
	}
	if(GS.debug == 1) {
	    if(Input.is_key_pressed(83) and aligncon == 3) {
	        type= 0
	        starcon= 1
	    }
	    if(Input.is_key_pressed(66) and aligncon == 3) {
	        type= 1
	        starcon= 1
	    }
	    if(Input.is_key_pressed(87) and aligncon == 3) {
	        type= 1
	        bladecon= 1
	    }
	    if(Input.is_key_pressed(71) and aligncon == 3) {
	        type= 1
	        guncon= 1
	    }
	    if(Input.is_key_pressed(72) and aligncon == 3) {
	        type= 1
	        gonercon= 1
	    }
	}
	if(starcon > 0) {
	    if(starcon == 1) {
	        GS.faceemotion= 2
	        caster_play(powersfx, 0.8, 1)
	        armraise= 20
	        starcon= 2
	        $Alarm5.start((1) / 30.0)
	    }
	    if(starcon == 3) {
	        starcon= 4
	        $Alarm5.start((1) / 30.0)
	    }
	    if(starcon == 5) {
	        armrot_l-= armraise
	        armrot_r+= armraise
	        armraise-= 2
	        if(armraise <= 0) {
	            starcon= 6
	            $Alarm5.start((20) / 30.0)
	        }
	    }
	    if(starcon >= 5 and starcon <= 9) {
	        a_xx1= x - 28
	        a_yy1= y + 38 + rely * 1.2
	        a_x1_add= lengthdir_x(90, armrot_l - 90 - 15)
	        a_y1_add= lengthdir_y(90, armrot_l - 90 - 15)
	        repeat(2)  {
	            hl= instance_create(a_xx1 + a_x1_add, a_yy1 + a_y1_add, 572/* obj_handlightning */)
	            hl.z_index= z_index + 1
	            hl.type= type
	        }
	        a_xx2= x + 30
	        a_yy2= y + 38 + rely * 1.2
	        a_x2_add= lengthdir_x(90, armrot_r - 90 + 15)
	        a_y2_add= lengthdir_y(90, armrot_r - 90 + 15)
	        repeat(2)  {
	            hl= instance_create(a_xx2 + a_x2_add, a_yy2 + a_y2_add, 572/* obj_handlightning */)
	            hl.z_index= z_index + 1
	            hl.type= type
	        }
	    }
	    if(starcon == 7) {
	        starcon= 8
	        $Alarm5.start((15) / 30.0)
	    }
	    if(starcon == 9) starcon= 12
	    if(starcon == 12) {
	        if(type == 0) gen= instance_create(0, 0, 580/* obj_stormstar_gen */)
	        if(type == 1) gen= instance_create(0, 0, 586/* obj_rainbowbolt_realgen */)
	        gen.h_mode= h_mode
	        starcon= 13
	        $Alarm5.start((300) / 30.0)
	        if(type == 1) $Alarm5.start((180) / 30.0)
	    }
	    if(starcon == 13 and modulate.a > 0)
	        modulate.a-= 0.05
	    if(starcon == 14) {
	        GS.faceemotion= 0
	        with(gen) instance_destroy()
	        armrot_l= 0
	        armrot_r= 0
	        modulate.a+= 0.05
	        if(modulate.a >= 1) {
	            event_user(1)
	            aligncon= 4
	            starcon= 0
	        }
	    }
	}
	if(bladecon > 0) {
	    if(bladecon == 1) {
	        armraise= 20
	        bladecon= 2
	        specialarm= 1
	        $Alarm6.start((30) / 30.0)
	    }
	    if(bladecon == 2 and arm_alpha > 0)
	        arm_alpha-= 0.05
	    if(bladecon == 3) {
	        gen= instance_create(x, y, 589/* obj_asriel_swordmaster */)
	        gen.h_mode= h_mode
	        bladecon= 4
	        $Alarm6.start((30) / 30.0)
	    }
	    if(bladecon == 10) {
	        heady= 0
	        headrot= 0
	        specialarm= 1
	        arm_alpha= 0
	        bladecon= 11
	    }
	    if(bladecon == 11) {
	        modulate.a= 0
	        heady= 0
	        headx= 0
	        specialarm= 0
	        arm_alpha= 1
	        x= 320
	        y= 50
	        relx= 0
	        rely= 0
	        xxoff= 0
	        yyoff= 0
	        armrot_l= 0
	        armrot_r= 0
	        torsorot= 0
	        headrot= 0
	        siner= 0
	        altimer= 0
	        bladecon= 12
	    }
	    if(bladecon == 12) {
	        siner= 0
	        modulate.a+= 0.05
	        if(modulate.a >= 1) {
	            event_user(1)
	            specialarm= 0
	            aligncon= 4
	            bladecon= 0
	        }
	    }
	}
	if(guncon > 0) {
	    if(guncon == 1) {
	        arm_alpha= 1
	        guncon= 2
	        specialarm= 2
	        $Alarm7.start((20) / 30.0)
	    }
	    if(guncon == 2 and arm_alpha > 0)
	        arm_alpha-= 0.05
	    if(guncon == 3) {
	        gen= instance_create(x + 70, y + 15, 583/* obj_gunarm_firepattern */)
	        gen.h_mode= h_mode
	        guncon= 4
	        $Alarm7.start((30) / 30.0)
	    }
	    if(guncon == 7) {
	        arm_alpha+= 0.1
	        if(arm_alpha >= 1) guncon= 8
	    }
	    if(guncon == 8) {
	        aligncon= 1
	        guncon= 9
	        $Alarm7.start((10) / 30.0)
	    }
	    if(guncon == 10) {
	        event_user(1)
	        aligncon= 4
	        guncon= 0
	    }
	}
	if(gonercon > 0) {
	    if(gonercon == 1) {
	        GS.flag[20]= 1
	        gonercon= 2
	        $Alarm8.start((1) / 30.0)
	    }
	    if(gonercon == 3) {
	        gonercon= 4
	        $Alarm8.start((30) / 30.0)
	    }
	    if(gonercon == 5) {
	        // obj_heart
	        with(743) ignore_border= 1
	        ws= instance_create(0, 0, 592/* obj_hg_wholescreen */)
	        gonercon= 6
	        $Alarm8.start((40) / 30.0)
	    }
	    if(gonercon == 7) {
	        hg= instance_create(176, 16, 594/* obj_hg_body */)
	        gonercon= 8
	    }
	    if(gonercon == 10) {
	        ws.con= 2
	        shrug= 0
	        specialnormal= 1
	        GS.faceemotion= 0
	        GS.flag[20]= 0
	        // obj_hg_debris
	        with(593) instance_destroy()
	        caster_play(cr, 0.9, 0.8)
	        obj_heart.modulate.a= 1
	        modulate.a= 0
	        // obj_heart
	        with(743) {
	            ignore_border= 0
	            x= 312
	            y= (GS.idealborder[2] + GS.idealborder[3]) / 2
	        }
	        gonercon= 11
	    }
	    if(gonercon == 11) {
	        obj_heart.z_index= 0
	        modulate.a+= 0.1
	        if(modulate.a >= 1) {
	            modulate.a= 1
	            gonercon= 12
	            $Alarm8.start((30) / 30.0)
	        }
	    }
	    if(gonercon == 13) {
	        GS.mnfight= 5
	        gonercon= 0
	    }
	}
	if(GS.debug == 1) {
	    if(Input.is_action_pressed("ui_accept")) {
	        s_s= 0
	        if(aligncon == 0) aligncon= 1
	        if(aligncon == 3) aligncon= 4
	    }
	    if(Input.is_key_pressed(17)) {
	        s_s= 1
	        if(aligncon == 0) aligncon= 1
	        if(aligncon == 3) aligncon= 4
	    }
	}
	if(specialnormal == 1) {
	    sn++
	    y= 50 + sin(sn / 8) * 4
	}
	if(specialnormal == 0 and GS.mnfight == 0 and GS.myfight == 0 and (GS.bmenuno == 1 or GS.bmenuno == 2)) {
	    GS.monstername[0]= "               "
	    if(instance_exists(785/* OBJ_INSTAWRITER */))
	        OBJ_INSTAWRITER.originalstring= "\\W   *                "
	    n_siner++
	    fullphrase= " Asriel Dreemurr "
	    len= string_length(fullphrase)
	    draw_set_font(1)
	    letter= "A"
	    i= 0
	    while(i < len) {
	        tcolor= make_color_hsv(siner * 8 + i * 8, 140, 255)
	        draw_set_color(tcolor)
	        letter= string_char_at(fullphrase, i)
	        draw_text_transformed(110 + i * 16 + sin((siner + i) / 5) * 8, 270 + cos((siner + i) / 5) * 4, letter, 1, 1, 0)
	        i++
	    }
	}
	if(GS.flag[20] == 1) shrug= 1
	else  shrug= 0

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
