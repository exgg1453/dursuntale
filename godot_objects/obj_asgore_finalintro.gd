# Auto-converted from GameMaker: obj_asgore_finalintro
extends Node2D

func _ready():
	GS.batmusic= caster_load("music/bergentruckung.ogg")
	murder= 0
	if(scr_murderlv() >= 16) murder= 1
	image_speed= 0
	frame= 0
	con= -10
	face_index= 0
	GS.mnfight= -999
	GS.myfight= -999
	obj_heart.x= -999
	obj_fightbt.sprite_index= 6/* spr_fightbt_hollow */
	obj_itembt.sprite_index= 8/* spr_itembt_hollow */
	obj_talkbt.sprite_index= 13/* spr_talkbt_hollow */
	// obj_sparebt
	with(754) visible= 0
	if(murder == 0) instance_create(obj_sparebt.x, obj_sparebt.y, 480/* obj_mercybutton_shatter */)
	// obj_battlebg
	with(185) instance_destroy()
	obj_borderparent.visible= 0
	GS.faceemotion= 0
	GS.mercy= 2
	scale.x= 2
	scale.y= 2
	skip= 0
	if(GS.tempvalue[10] > 0 and GS.flag[493] < 12 and murder == 0) {
	    skip= 1
	    con= 2
	    $Alarm4.start((15) / 30.0)
	    caster_free(-3)
	}
	obj_heart.visible= 0
	GS.seriousbattle= 1
	cutsound= caster_load("music/sfx_cinematiccut.ogg")
	swipesound= caster_load("music/sfx_swipe.ogg")
	special_end= 0
	if(GS.flag[493] >= 12 and murder == 0) {
	    special_end= 1
	    con= -10
	    skip= 0
	    $Alarm4.start((0) / 30.0)
	}
	if(skip == 0 and murder == 0) caster_play(GS.batmusic, 1, 1)
	if(murder == 1) GS.faceemotion= 1

func _gm_event_2_4():
	con++

func _gm_event_7_22():
	if(GS.debug == 1) con++

func _on_outside_room():
	GS.myfight= -999
	if(con == -10) {
	    obj_heart.x= -999
	    GS.mnfight= 999
	    GS.myfight= 999
	    // OBJ_WRITER
	    with(782) instance_destroy()
	    // OBJ_INSTAWRITER
	    with(785) instance_destroy()
	    GS.msc= 0
	    GS.typer= 61
	    if(murder == 0) {
	        GS.msg[0]= "* (A strange light fills the&  room.^4) %"
	        GS.msg[1]= "* (Twilight is shining through&  the barrier.^4) %"
	        GS.msg[2]= "* (It seems your journey is&  finally over.^4) %"
	        GS.msg[3]= "     * (You\'re filled with&          DETERMINATION.^5) %%"
	        instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        con= -9
	    } else  {
	        con= -8
	        $Alarm4.start((10) / 30.0)
	    }
	}
	if(con == -9 and not instance_exists(782/* OBJ_WRITER */)) {
	    obj_heart.x= -999
	    GS.mnfight= 999
	    GS.myfight= 999
	    con= -8
	    $Alarm4.start((30) / 30.0)
	}
	if(con == -8) {
	    obj_heart.x= -999
	    GS.mnfight= 999
	    GS.myfight= 999
	}
	if(con == -7) {
	    // OBJ_WRITER
	    with(782) instance_destroy()
	    // OBJ_INSTAWRITER
	    with(785) instance_destroy()
	    GS.typer= 62
	    GS.msg[0]= "Human.../"
	    GS.msg[1]= "\\E1It was&nice to&meet&you./"
	    GS.msg[2]= "\\E0Goodbye./%%"
	    con= -6
	    if(murder == 1) {
	        GS.msg[0]= "\\E1Now,&now./"
	        GS.msg[1]= "There\'s&no need&to&fight./"
	        GS.msg[2]= "Why not&settle&this.../"
	        GS.msg[3]= "Over a&nice cup&of tea?/%%"
	        con= -120
	    }
	    blcon2= instance_create(500, 120, 186/* obj_blconsm */)
	    blconwd2= instance_create(525, 130, 782/* OBJ_WRITER */)
	}
	if(con == -6 and not instance_exists(782/* OBJ_WRITER */)) {
	    // obj_blconsm
	    with(186) instance_destroy()
	    con= 3
	    if(special_end == 1) {
	        con= -100
	        instance_create(0, 0, 1675/* obj_friendscene */)
	        instance_destroy()
	    }
	}
	if(con == 2) {
	    obj_heart.x= -999
	    GS.mnfight= 999
	    GS.myfight= 999
	}
	if(con == 3) {
	    snd_play(13/* snd_spearappear */)
	    frame= 0
	    sprite_index= 605/* spr_asgore_brandish */
	    image_speed= 0
	    con= 6.1
	    $Alarm4.start((5) / 30.0)
	    velocity.x= -20
	}
	if(con == 6.1) {
	    sc= scr_afterimage(0, 0)
	    sc.size= 2
	    sc.scale.x= 2
	    sc.scale.y= 2
	    sc.modulate.a= 0.9
	}
	if(con == 7.1) {
	    velocity.x= 0
	    con= 7
	    $Alarm4.start((20) / 30.0)
	}
	draw_sprite_ext(sprite_index, frame, x, y, 2, 2, 0, image_blend, 1)
	if(con < 3)
	    draw_sprite_ext(604/* spr_asgore_bface */, GS.faceemotion, x + 138, y - 12, 2, 2, 0, 16777215, 1)
	if(con == 8) {
	    image_speed= 0.5
	    if(frame == 2) caster_play(cutsound, 1, 1)
	    if(frame >= 2 and frame < 4) {
	        draw_set_alpha(0.5)
	        if(frame == 3) draw_set_alpha(1)
	        draw_set_color(16777215)
	        draw_rectangle(-1, -1, 999, 999, 0)
	        draw_set_alpha(1)
	    }
	    if(frame == 4) scr_shake(6, 3, 2)
	    if(frame >= 13) {
	        image_speed= 0
	        con= 9
	        $Alarm4.start((20) / 30.0)
	    }
	}
	if(con == 9) {
	    image_speed= 0
	    frame= 13
	}
	if(con == 10) {
	    obj_battlecontroller.drawrect= 0
	    background_color= 16777215
	    image_blend= 0
	    obj_fightbt.image_blend= 0
	    obj_itembt.image_blend= 0
	    obj_talkbt.image_blend= 0
	    frame= 0
	    image_speed= 0
	    g= instance_create(268, 140, 481/* obj_asgorefakespear */)
	    g.image_blend= 255
	    g.scale.x= 2
	    g.scale.y= 2
	    obj_mercybutton_shatter.image_blend= 0
	    con= 12
	    $Alarm4.start((20) / 30.0)
	    vvv= 2.5
	    snd_play(13/* snd_spearappear */)
	}
	if(con == 12) {
	    g.velocity.x= 14.3
	    g.velocity.y= -13
	    g.rotation_degrees-= 4.5
	    velocity.x= (500 - x) / 20
	    g.z_index= -1000000
	    sc= scr_afterimage(0, 0)
	    sc.size= 2
	    sc.scale.x= 2
	    sc.scale.y= 2
	    sc.modulate.a= 0.9
	    sc.z_index= 100
	    with(g) {
	        sc= scr_afterimage(0, 0)
	        sc.z_index= -99999
	        sc.size= 2
	        sc.scale.x= 2
	        sc.scale.y= 2
	        sc.modulate.a= 0.9
	    }
	}
	if(con == 13) {
	    if(vvv > 0) vvv-= 0.1
	    g.velocity.x= 0
	    g.velocity.y= vvv
	    velocity.x= 0
	    con= 18
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 18) {
	    if(vvv > 0) vvv-= 0.1
	    g.velocity.x= 0
	    g.velocity.y= -vvv
	}
	if(con == 19) {
	    caster_free(-3)
	    caster_play(swipesound, 1, 1)
	    GS.batmusic= caster_load("music/vsasgore.ogg")
	    w_on= 0
	    whiteout= 0
	    blackout= 0
	    g.velocity.y= 100
	    con= 20
	}
	if(con == 20) {
	    with(g) {
	        sc= scr_afterimage(0, 0)
	        sc.z_index= z_index + 1
	        sc.z_index= -99999
	        sc.size= 2
	        sc.scale.x= 2
	        sc.scale.y= 2
	        sc.modulate.a= 0.9
	    }
	}
	if(con == 40) {
	    z_index= -100000
	    if(w_on == 0) whiteout+= 0.08
	    draw_set_color(16777215)
	    draw_set_alpha(whiteout)
	    draw_rectangle(-1, -1, 999, 999, 0)
	    if(whiteout >= 1.8) w_on= 1
	    if(w_on == 1) {
	        blackout+= 0.05
	        if(skip == 1 and blackout < 5.5)
	            blackout+= 0.05
	        draw_set_alpha(blackout)
	        draw_set_color(0)
	        draw_rectangle(-1, -1, 999, 999, 0)
	        if(blackout == 5.5) caster_loop(GS.batmusic, 1, 1)
	        fdhjfd= 9999
	        if(blackout == 7) {
	            con= 50
	            GS.mnfight= 0
	            GS.myfight= 0
	            background_color= 0
	            obj_battlecontroller.drawrect= 1
	            obj_fightbt.image_blend= 16777215
	            obj_itembt.image_blend= 16777215
	            obj_talkbt.image_blend= 16777215
	            obj_fightbt.sprite_index= 5/* spr_fightbt */
	            obj_itembt.sprite_index= 7/* spr_itembt */
	            obj_talkbt.sprite_index= 12/* spr_talkbt */
	            obj_borderparent.visible= 1
	            instance_create(0, 0, 484/* obj_orangeparticlegen */)
	            instance_create(0, 0, 483/* obj_purplegradienter */)
	            obj_heart.visible= 1
	            GS.mnfight= 3
	            GS.myfight= -1
	            GS.bmenuno= 0
	            GS.monster[0]= 0
	            GS.monster[1]= 0
	            GS.monster[2]= 0
	            GS.monstertype[0]= 52
	            GS.monsterinstance[0]= instance_create(208, 8, 478/* obj_asgoreb */)
	            GS.msc= 0
	            GS.msg[0]= "* ASGORE attacks!"
	            draw_set_alpha(1)
	            instance_destroy()
	        }
	    }
	    draw_set_alpha(1)
	}
	if(con == -120 and not instance_exists(782/* OBJ_WRITER */)) {
	    // obj_blconsm
	    with(186) instance_destroy()
	    GS.stretch= 1
	    sl= instance_create(320, 120, 733/* obj_slice */)
	    sl.z_index= -90000
	    con= -119
	    $Alarm4.start((25) / 30.0)
	}
	if(con == -118) {
	    snd_play(51/* snd_damage */)
	    asg= instance_create(128, 46, 493/* obj_asgore_lastcutscene */)
	    GS.faceemotion= 3
	    asg.murder= 1
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
