# Auto-converted from GameMaker: obj_sansshadowgen
extends Node2D

func _ready():
	shadow= 0
	level= 0
	prev_s= 3
	laser_d= 0
	shadow_num= 0
	shadow_max= 6
	// obj_borderparent
	with(757) instaborder= 1
	GS.border= -1
	event_user(0)

func _gm_event_2_1():
	event_user(0)

func _on_destroy():
	// obj_borderparent
	with(757) visible= 1
	snd_play(106/* snd_noise */)
	caster_resume(GS.batmusic)
	shadow= 0
	GS.idealborder[3]= 385
	if(level == 0) {
	    s_type= choose(0, 1, 2, 3, 4)
	    if(prev_s == s_type) s_type= choose(0, 1, 2, 3, 4)
	    if(prev_s == s_type) s_type= choose(0, 1, 2, 3, 4)
	}
	if(level == 1) {
	    s_type= choose(5, 6, 7, 8)
	    if(prev_s == s_type) s_type= choose(5, 6, 7, 8)
	    if(prev_s == s_type) s_type= choose(5, 6, 7, 8)
	}
	if(level == 2) {
	    s_type= choose(0, 1, 2, 3, 4, 5, 6, 7, 8)
	    if(prev_s == s_type) s_type= choose(0, 1, 2, 3, 4, 5, 6, 7, 8)
	    if(prev_s == s_type) s_type= choose(0, 1, 2, 3, 4, 5, 6, 7, 8)
	}
	if(level == 3) {
	    s_type= 50
	    if(prev_s == 50) s_type= 51
	    if(prev_s == 51) s_type= 52
	    if(prev_s == 52) s_type= 53
	    if(prev_s == 53) s_type= 54
	}
	prev_s= s_type
	if(shadow_num >= shadow_max) {
	    if(level < 3 and not instance_exists(510/* obj_menubone_maker */))
	        instance_create(0, 0, 510/* obj_menubone_maker */)
	    obj_sansb_body.x= 320
	    // obj_sansb
	    with(519) attacked= 0
	    // obj_borderparent
	    with(757) instaborder= 0
	    s_type= -1
	    GS.mnfight= 3
	    // obj_heart
	    with(743) movement= 1
	    // obj_heart
	    with(743) jumpstage= 0
	    // obj_heart
	    with(743) sprite_index= 34/* spr_heart */
	    // obj_heart
	    with(743) speed= 0
	    instance_destroy()
	    exit
	} else  {
	    if(level < 3) obj_sansb_body.x= 100 + random(440)
	    shadow_num++
	    if(s_type == 0) {
	        obj_heart.movement= 2
	        // obj_heart
	        with(743) jumpstage= 2
	        obj_heart.sprite_index= 40/* spr_heartblue */
	        obj_heart.speed= 0
	        GS.idealborder[0]= 120
	        GS.idealborder[1]= 520
	        GS.idealborder[2]= GS.idealborder[3] - 110
	        obj_heart.x= GS.idealborder[0] + (GS.idealborder[1] - GS.idealborder[0]) / 2 - 5
	        obj_heart.y= GS.idealborder[3] - 15
	        scr_sbo(45, 8, 25, 0)
	        scr_sbo(45, -8, 25, 0)
	        scr_sbo(45, 8, 27, 0)
	        scr_sbo(45, -8, 27, 0)
	        scr_sbo(45, 8, 29, 0)
	        scr_sbo(45, -8, 29, 0)
	        scr_sbo(45, 8, 31, 0)
	        scr_sbo(45, -8, 31, 0)
	        scr_sbo(100, 8, 33, 0)
	        scr_sbo(100, -8, 33, 0)
	        $Alarm1.start((28) / 30.0)
	    }
	    if(s_type == 1) {
	        obj_heart.movement= 2
	        // obj_heart
	        with(743) jumpstage= 2
	        obj_heart.sprite_index= 40/* spr_heartblue */
	        obj_heart.speed= 0
	        GS.idealborder[0]= 120
	        GS.idealborder[1]= 520
	        GS.idealborder[2]= GS.idealborder[3] - 110
	        obj_heart.x= GS.idealborder[0] + (GS.idealborder[1] - GS.idealborder[0]) / 2 - 5
	        obj_heart.y= GS.idealborder[3] - 15
	        scr_sbo(100, 8, 25, 1)
	        scr_sbo(100, -8, 25, 1)
	        scr_sbo(20, 8, 34, 0)
	        scr_sbo(20, -8, 34, 0)
	        scr_sbo(100, 8, 38, 0)
	        scr_sbo(100, -8, 38, 0)
	        $Alarm1.start((35) / 30.0)
	    }
	    if(s_type == 2) {
	        obj_heart.movement= 2
	        // obj_heart
	        with(743) jumpstage= 2
	        obj_heart.sprite_index= 40/* spr_heartblue */
	        obj_heart.speed= 0
	        GS.idealborder[0]= 170
	        GS.idealborder[1]= 470
	        GS.idealborder[2]= GS.idealborder[3] - 110
	        obj_heart.x= GS.idealborder[0] + (GS.idealborder[1] - GS.idealborder[0]) / 2 - 5
	        obj_heart.y= GS.idealborder[3] - 15
	        value= 0
	        i= 0
	        while(i < 7) {
	            ht= choose(20, 30, 40)
	            xx= 0
	            if(i > 0) xx= choose(-2, 0, 2)
	            scr_sbo(ht, 6 + xx, 25 + i * 22 + value, 0)
	            scr_sbo(ht, -6 + xx, 25 + i * 22 + value, 0)
	            scr_sbo(ht + 24, 6 + xx, 25 + i * 22 + value, 2)
	            scr_sbo(ht + 24, -6 + xx, 25 + i * 22 + value, 2)
	            if(ht == 30) value+= 5
	            if(ht == 40) value+= 10
	            if(ht == 60) value+= 20
	            i++
	        }
	        $Alarm1.start((58) / 30.0)
	    }
	    if(s_type == 3) {
	        obj_heart.movement= 2
	        // obj_heart
	        with(743) jumpstage= 2
	        obj_heart.sprite_index= 40/* spr_heartblue */
	        obj_heart.speed= 0
	        GS.idealborder[0]= 170
	        GS.idealborder[1]= 470
	        GS.idealborder[2]= GS.idealborder[3] - 110
	        obj_heart.x= GS.idealborder[0] + (GS.idealborder[1] - GS.idealborder[0]) / 2 - 5
	        obj_heart.y= GS.idealborder[3] - 15
	        i= 0
	        while(i < 8) {
	            scr_sbo(15, 5, 25 + i * 25, 0)
	            scr_sbo(15, -5, 25 + i * 25, 0)
	            scr_sbo(40, 5, 25 + i * 25, 2)
	            scr_sbo(40, -5, 25 + i * 25, 2)
	            i++
	        }
	        $Alarm1.start((52) / 30.0)
	    }
	    if(s_type == 4) {
	        obj_heart.movement= 2
	        // obj_heart
	        with(743) jumpstage= 2
	        obj_heart.sprite_index= 40/* spr_heartblue */
	        obj_heart.speed= 0
	        GS.idealborder[0]= 120
	        GS.idealborder[1]= 520
	        sd= choose(1, -1)
	        if(sd == 1) obj_heart.x= GS.idealborder[0] + 20
	        else  obj_heart.x= GS.idealborder[1] - 20
	        obj_heart.y= GS.idealborder[3] - 15
	        GS.idealborder[2]= GS.idealborder[3] - 110
	        scr_sbo(55, -12 * sd, 11, 0)
	        scr_sbo(55, -12 * sd, 13, 0)
	        scr_sbo(55, -12 * sd, 15, 0)
	        scr_sbo(55, -12 * sd, 17, 0)
	        scr_sbo(55, -12 * sd, 19, 0)
	        scr_sbo(55, -12 * sd, 21, 0)
	        scr_sbo(55, -12 * sd, 23, 0)
	        scr_sbo(55, -12 * sd, 25, 0)
	        scr_sbo(55, -12 * sd, 27, 0)
	        scr_sbo(55, -12 * sd, 29, 0)
	        scr_sbo(55, -12 * sd, 31, 0)
	        scr_sbo(15, -12 * sd, 33, 0)
	        scr_sbo(15, -12 * sd, 35, 0)
	        scr_sbo(15, -12 * sd, 37, 0)
	        scr_sbo(15, -12 * sd, 39, 0)
	        scr_sbo(15, -12 * sd, 41, 0)
	        scr_sbo(15, -12 * sd, 43, 0)
	        scr_sbo(15, -12 * sd, 45, 0)
	        scr_sbo(15, -12 * sd, 47, 0)
	        scr_sbo(15, -12 * sd, 49, 0)
	        scr_sbo(15, -12 * sd, 51, 0)
	        $Alarm1.start((47) / 30.0)
	    }
	    if(s_type == 5) {
	        obj_heart.movement= 2
	        // obj_heart
	        with(743) jumpstage= 2
	        obj_heart.sprite_index= 40/* spr_heartblue */
	        obj_heart.speed= 0
	        obj_heart.velocity.y= 1
	        GS.idealborder[0]= 120
	        GS.idealborder[1]= 520
	        GS.idealborder[2]= GS.idealborder[3] - 110
	        obj_heart.x= GS.idealborder[0] + (GS.idealborder[1] - GS.idealborder[0]) / 2
	        obj_heart.y= GS.idealborder[3] - 90
	        d= choose(1, -1)
	        scr_sbo(75, 8 * d, 27, 2)
	        scr_sbo(65, -8 * d, 42, 0)
	        scr_hplat(70, 0, 0, 20)
	        bone.x+= 8
	        scr_hplat(30, 0, 0, 20)
	        bone.x+= 8
	        i= 0
	        while(i < 30) {
	            instance_create(GS.idealborder[0] + i * 16, GS.idealborder[3] - 20, 501/* obj_bonewall */)
	            i++
	        }
	        $Alarm1.start((45) / 30.0)
	    }
	    if(s_type == 6) {
	        obj_heart.movement= 1
	        obj_heart.sprite_index= 674/* spr_heart_battle_pl */
	        obj_heart.speed= 0
	        GS.idealborder[0]= 240
	        GS.idealborder[1]= 400
	        GS.idealborder[2]= GS.idealborder[3] - 160
	        hwd= GS.idealborder[0] + (GS.idealborder[1] - GS.idealborder[0]) / 2
	        hht= GS.idealborder[2] + (GS.idealborder[3] - GS.idealborder[2]) / 2
	        obj_heart.x= GS.idealborder[0] + (GS.idealborder[1] - GS.idealborder[0]) / 2 - 8
	        obj_heart.y= GS.idealborder[2] + (GS.idealborder[3] - GS.idealborder[2]) / 2 - 8
	        chance= choose(0, 1)
	        if(chance == 0) {
	            gb= instance_create(0, 0, 498/* obj_gasterblaster */)
	            gb.idealrot= 90
	            gb.idealx= GS.idealborder[0] - 50
	            gb.idealy= hht
	            gb.scale.x= 2
	            gb.scale.y= 2
	            gb= instance_create(640, 480, 498/* obj_gasterblaster */)
	            gb.idealrot= -90
	            gb.idealx= GS.idealborder[1] + 50
	            gb.idealy= hht
	            gb.scale.x= 2
	            gb.scale.y= 2
	            gb= instance_create(0, 0, 498/* obj_gasterblaster */)
	            gb.idealrot= 0
	            gb.idealx= hwd
	            gb.idealy= GS.idealborder[2] - 60
	            gb.scale.x= 2
	            gb.scale.y= 2
	            gb= instance_create(640, 480, 498/* obj_gasterblaster */)
	            gb.idealrot= 180
	            gb.idealx= hwd
	            gb.idealy= GS.idealborder[3] + 60
	            gb.scale.x= 2
	            gb.scale.y= 2
	            obj_gasterblaster.pause= 18 - laser_d
	            obj_gasterblaster.terminal= 8
	            // obj_gasterblaster
	            with(498) x= idealx
	            // obj_gasterblaster
	            with(498) y= idealy
	            // obj_gasterblaster
	            with(498) rotation_degrees= idealrot
	        }
	        if(chance == 1) {
	            gb= instance_create(0, 0, 498/* obj_gasterblaster */)
	            gb.idealrot= 45
	            gb.idealx= GS.idealborder[0] - 50
	            gb.idealy= GS.idealborder[2] - 50
	            gb.scale.x= 2
	            gb.scale.y= 2
	            gb= instance_create(640, 0, 498/* obj_gasterblaster */)
	            gb.idealrot= -45
	            gb.idealx= GS.idealborder[1] + 50
	            gb.idealy= GS.idealborder[2] - 50
	            gb.scale.x= 2
	            gb.scale.y= 2
	            gb= instance_create(0, 480, 498/* obj_gasterblaster */)
	            gb.idealrot= 135
	            gb.idealx= GS.idealborder[0] - 50
	            gb.idealy= GS.idealborder[3] + 50
	            gb.scale.x= 2
	            gb.scale.y= 2
	            gb= instance_create(640, 480, 498/* obj_gasterblaster */)
	            gb.idealrot= -135
	            gb.idealx= GS.idealborder[1] + 50
	            gb.idealy= GS.idealborder[3] + 50
	            gb.scale.x= 2
	            gb.scale.y= 2
	            obj_gasterblaster.pause= 20 - laser_d
	            obj_gasterblaster.terminal= 8
	            // obj_gasterblaster
	            with(498) x= idealx
	            // obj_gasterblaster
	            with(498) y= idealy
	            // obj_gasterblaster
	            with(498) rotation_degrees= idealrot
	        }
	        $Alarm1.start((37 - laser_d) / 30.0)
	    }
	    if(s_type == 7) {
	        obj_heart.movement= 1
	        obj_heart.sprite_index= 674/* spr_heart_battle_pl */
	        obj_heart.speed= 0
	        GS.idealborder[0]= 240
	        GS.idealborder[1]= 400
	        GS.idealborder[2]= GS.idealborder[3] - 160
	        hwd= GS.idealborder[0] + (GS.idealborder[1] - GS.idealborder[0]) / 2
	        hht= GS.idealborder[2] + (GS.idealborder[3] - GS.idealborder[2]) / 2
	        obj_heart.x= GS.idealborder[0] + (GS.idealborder[1] - GS.idealborder[0]) / 2 - 8
	        obj_heart.y= GS.idealborder[2] + (GS.idealborder[3] - GS.idealborder[2]) / 2 - 8
	        dd= choose(-1, 1)
	        if(dd == -1) {
	            obj_heart.x= GS.idealborder[0] + 20
	            GS.idealborder[1]+= 60
	        }
	        if(dd == 1) {
	            obj_heart.x= GS.idealborder[1] - 20
	            GS.idealborder[0]-= 60
	        }
	        rr= choose(-1, 1)
	        i= 0
	        while(i < 16) {
	            scr_sbo(105 - sin(i / 3) * 28 * rr, 10 * dd, 16 + i * 2, 2)
	            bone.siner= i * 3
	            scr_sbo(60 - sin(i / 3) * 28 * rr, 10 * dd, 16 + i * 2, 0)
	            bone.siner= i * 3
	            i++
	        }
	        $Alarm1.start((52) / 30.0)
	    }
	    if(s_type == 8) {
	        obj_heart.movement= 2
	        // obj_heart
	        with(743) jumpstage= 2
	        obj_heart.sprite_index= 40/* spr_heartblue */
	        obj_heart.speed= 0
	        GS.idealborder[0]= 120
	        GS.idealborder[1]= 520
	        GS.idealborder[2]= GS.idealborder[3] - 110
	        sd= choose(1, -1)
	        if(sd == 1) obj_heart.x= GS.idealborder[1] - 40
	        else  obj_heart.x= GS.idealborder[0] + 40
	        obj_heart.y= GS.idealborder[3] - 15
	        i= 0
	        while(i < 10) {
	            scr_sbo(20, 4 * sd, -5 + i * 19, 0)
	            scr_sbo(28, -4 * sd, -5 + i * 19, 2)
	            i++
	        }
	        $Alarm1.start((57) / 30.0)
	    }
	    if(s_type == 50) {
	        obj_heart.movement= 2
	        // obj_heart
	        with(743) jumpstage= 2
	        obj_heart.sprite_index= 40/* spr_heartblue */
	        obj_heart.speed= 0
	        obj_heart.velocity.y= 1
	        GS.idealborder[0]= 240
	        GS.idealborder[1]= 400
	        GS.idealborder[2]= GS.idealborder[3] - 160
	        hwd= GS.idealborder[0] + (GS.idealborder[1] - GS.idealborder[0]) / 2
	        hht= GS.idealborder[2] + (GS.idealborder[3] - GS.idealborder[2]) / 2
	        obj_heart.x= hwd - 8
	        obj_heart.y= GS.idealborder[3] - 15
	        bs= instance_create(0, 0, 502/* obj_bonestab */)
	        bs.dir= 0
	        bs.warning= 18
	        bs.height= 50
	        bs= instance_create(0, 0, 502/* obj_bonestab */)
	        bs.dir= 2
	        bs.warning= 18
	        bs.height= 50
	        $Alarm1.start((27) / 30.0)
	    }
	    if(s_type == 51) {
	        obj_heart.movement= 12
	        obj_heart.sprite_index= 673/* spr_heartblue_u */
	        obj_heart.speed= 0
	        obj_heart.velocity.y= -2
	        GS.idealborder[0]= 240
	        GS.idealborder[1]= 400
	        GS.idealborder[2]= GS.idealborder[3] - 160
	        hwd= GS.idealborder[0] + (GS.idealborder[1] - GS.idealborder[0]) / 2
	        hht= GS.idealborder[2] + (GS.idealborder[3] - GS.idealborder[2]) / 2
	        obj_heart.x= GS.idealborder[0] + 15
	        obj_heart.y= GS.idealborder[2] + 10
	        bs= instance_create(0, 0, 502/* obj_bonestab */)
	        bs.dir= 2
	        bs.warning= 19
	        bs.height= 50
	        bs= instance_create(0, 0, 502/* obj_bonestab */)
	        bs.dir= 3
	        bs.warning= 19
	        bs.height= 50
	        $Alarm1.start((27) / 30.0)
	    }
	    if(s_type == 52) {
	        obj_heart.speed= 0
	        obj_heart.movement= 11
	        obj_heart.sprite_index= 671/* spr_heartblue_r */
	        obj_heart.velocity.x= 2
	        GS.idealborder[0]= 240
	        GS.idealborder[1]= 400
	        GS.idealborder[2]= GS.idealborder[3] - 160
	        hwd= GS.idealborder[0] + (GS.idealborder[1] - GS.idealborder[0]) / 2
	        hht= GS.idealborder[2] + (GS.idealborder[3] - GS.idealborder[2]) / 2
	        obj_heart.x= GS.idealborder[1] - 15
	        obj_heart.y= GS.idealborder[3] - 15
	        bs= instance_create(0, 0, 502/* obj_bonestab */)
	        bs.dir= 0
	        bs.warning= 19
	        bs.height= 50
	        bs= instance_create(0, 0, 502/* obj_bonestab */)
	        bs.dir= 1
	        bs.warning= 19
	        bs.height= 50
	        $Alarm1.start((27) / 30.0)
	    }
	    if(s_type == 53) {
	        obj_heart.speed= 0
	        obj_heart.movement= 13
	        obj_heart.sprite_index= 672/* spr_heartblue_l */
	        obj_heart.velocity.x= -2
	        GS.idealborder[0]= 240
	        GS.idealborder[1]= 400
	        GS.idealborder[2]= GS.idealborder[3] - 160
	        hwd= GS.idealborder[0] + (GS.idealborder[1] - GS.idealborder[0]) / 2
	        hht= GS.idealborder[2] + (GS.idealborder[3] - GS.idealborder[2]) / 2
	        obj_heart.x= GS.idealborder[0] + 10
	        obj_heart.y= GS.idealborder[2] == hht - 8
	        bs= instance_create(0, 0, 502/* obj_bonestab */)
	        bs.dir= 3
	        bs.warning= 19
	        bs.retain= 10
	        bs.height= 50
	        $Alarm1.start((22) / 30.0)
	        // obj_sansb_body
	        with(517) {
	            x= 320
	            lac= 49
	            $Alarm5.start((20) / 30.0)
	        }
	        instance_destroy()
	        exit
	    } else  exit
	}

func _gm_event_7_10():
	shadow= 1
	$Alarm0.start((12) / 30.0)
	if(level == 2) $Alarm0.start((3) / 30.0)
	if(level == 3) $Alarm0.start((3) / 30.0)
	caster_pause(GS.batmusic)
	// obj_bonestab
	with(502) instance_destroy()
	// obj_sans_shaker
	with(512) instance_destroy()
	// obj_bonewall_normal
	with(500) instance_destroy()
	// obj_bonewall
	with(501) instance_destroy()
	// obj_boneplat
	with(515) instance_destroy()
	// obj_sans_bonebul
	with(499) instance_destroy()
	// obj_gasterblaster
	with(498) instance_destroy()
	if(shadow_num >= shadow_max) GS.border= 0
	snd_play(106/* snd_noise */)
	// obj_borderparent
	with(757) visible= 0

func _on_outside_room():
	if(shadow == 1) {
	    draw_set_color(0)
	    draw_rectangle(-10, -10, 999, 999, 0)
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
