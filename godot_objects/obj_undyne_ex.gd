# Auto-converted from GameMaker: obj_undyne_ex
# GM parent: obj_monsterparent
extends Node2D

func _ready():
	scr_monstersetup(0, 0, 0, 0, 0)
	image_speed= 0
	part1= 281
	mypart1= _spawn("part1", x, y)
	hurtanim= 0
	hurtsound= 43
	talked= 0
	whatiheard= -1
	attacked= 0
	killed= 0
	GS.heard= 0
	takedamage= 0
	image_speed= 0
	mercymod= -9999999999
	joketold= 0
	sha= 0
	siner= 0
	// obj_battlebg
	with(185) instance_destroy()
	green= 0
	darkify= 0
	con= 0
	greenlock= 0
	songplayed= 0
	revert= 0
	lesson= -5
	order= 1
	rating= 9
	prevhp= GS.hp
	hitno= 0
	damagecause= 0
	borderspec= 0
	ratingb= 0
	defadjust= 0
	died= 0
	blconx= x + 180
	blcony= y + 10
	shakify= 0
	uncancel= 0
	hitfirst= 0
	berserk= 0
	mercied= 0
	ht= 200
	wd= 200
	obj_heart.sprite_index= 39/* spr_heartgreen */
	obj_heart.movement= 3
	orderb= 0
	GS.tempvalue[13]= 1

func _gm_event_1_0():
	scr_monsterdefeat(0, 0, 0, 0, 0)
	with(mypart1) instance_destroy()

func _gm_event_2_11():
	GS.mnfight= 4

func _gm_event_2_10():
	if(obj_heart.sprite_index == 34) {
	    obj_heart.sprite_index= 39/* spr_heartgreen */
	    obj_heart.movement= 3
	    green= 0
	    if(order == 3 or order == 7 or order == 12)
	        $Alarm11.start((15) / 30.0)
	} else  {
	    green= 0
	    obj_heart.sprite_index= 34/* spr_heart */
	    obj_heart.movement= 1
	}
	if(lesson == -7 or lesson == -11 or lesson == -14)
	    GS.turntimer= 10

func _gm_event_2_9():
	caster_free(-3)
	room_goto(GS.currentroom)

func _gm_event_2_7():
	GS.mnfight= 3

func _gm_event_2_6():
	blcontype= 0
	uncancel= 0
	gg= floor(random(3))
	mycommand= round(random(100))
	if(mycommand > 50 and obj_heart.sprite_index != 39)
	    borderspec= 1
	else  borderspec= 0
	GS.border= 6
	obj_heart.x= round((GS.idealborder[0] + GS.idealborder[1]) / 2) - 8
	obj_heart.y= round((GS.idealborder[2] + GS.idealborder[3]) / 2) - 8
	if(obj_heart.sprite_index == 39) {
	    GS.border= 13
	    obj_heart.x= get_viewport_rect().size.x / 2 - 8
	    obj_heart.y= obj_uborder.y + 34
	    greenlock= 1
	} else  {
	    obj_heart.x= get_viewport_rect().size.x / 2 - 8
	    obj_heart.y= obj_uborder.y + 34
	    GS.border= 31
	    if(orderb == 0 or orderb == 6) GS.border= 7
	    if(orderb == 1 or orderb == 7) GS.border= 14
	}
	damagecause= 0

func _gm_event_2_5():
	talked= 0
	whatiheard= -1
	GS.mnfight= 2
	if(obj_heart.sprite_index == 39) {
	    GS.border= 12
	    event_user(2)
	}

func _gm_event_2_4():
	con++

func _gm_event_2_3():
	if(mypart1.pause != 1) {
	    dmgwriter= instance_create(x, y + 150, 189/* obj_dmgwriter */)
	    GS.damage= takedamage
	    GS.damage*= 21
	    takedamage*= 21
	    if(takedamage < 600) {
	        takedamage= 600 + floor(random(67))
	        GS.damage= takedamage
	    }
	    with(dmgwriter) dmg= GS.damage
	    shk= instance_create(0, 0, 1669/* obj_objshake */)
	    shk.obj= mypart1
	    if(GS.monsterhp[myself] - takedamage <= 0) {
	        caster_free(-3)
	        GS.faceemotion= 0
	        mypart1.facetype= 2
	        shk.shaketime= 5
	    }
	    mypart1.pause= 1
	    snd_play(51/* snd_damage */)
	    $Alarm8.start((11) / 30.0)
	}
	if(sha == 0) sha= x
	x= sha + shudder
	if(shudder < 0) shudder= -(shudder + 1)
	else  shudder= -shudder
	if(shudder == 0) {
	    sha= 0
	    GS.hurtanim[myself]= 2
	    exit
	} else  {
	    $Alarm3.start((2) / 30.0)
	    exit
	}

func _process(delta: float):
	if(GS.mnfight == 4 and attacked == 1) {
	    if(hitno > 0) {
	        if(hitno >= 1 and rating < 10) rating++
	        if(hitno >= 3 and rating < 10) rating= 10
	    } else  {
	        if(rating > 8) rating--
	    }
	    attacked= 0
	    GS.mnfight= 5
	    if(GS.border == 12) GS.border= 13
	    SCR_BORDERSETUP()
	    $Alarm7.start((10) / 30.0)
	}
	if(alarm[5] > 0) {
	    if(GS.monster[0] == 1 and GS.monsterinstance[0].alarm[5] > alarm[5])
	        $Alarm5.start((GS.monsterinstance[0].alarm[5]) / 30.0)
	    if(GS.monster[1] == 1 and GS.monsterinstance[1].alarm[5] > alarm[5])
	        $Alarm5.start((GS.monsterinstance[1].alarm[5]) / 30.0)
	    if(GS.monster[2] == 1 and GS.monsterinstance[2].alarm[5] > alarm[5])
	        $Alarm5.start((GS.monsterinstance[2].alarm[5]) / 30.0)
	}
	if(GS.mnfight == 1 and talked == 0) {
	    $Alarm5.start((15) / 30.0)
	    $Alarm6.start((1) / 30.0)
	    talked= 1
	    GS.heard= 0
	    if(order == -35) {
	        GS.mnfight= 99
	        GS.bmenuno= 4
	        obj_heart.x= -400
	        $Alarm5.start((-2) / 30.0)
	        $Alarm6.start((-2) / 30.0)
	        con= 60
	    }
	}
	if(uncancel == 1) {
	    $Alarm5.start((100) / 30.0)
	    if(not instance_exists(782/* OBJ_WRITER */)) {
	        $Alarm5.start((1) / 30.0)
	        uncancel= 0
	    }
	}
	if(GS.hurtanim[myself] == 1) {
	    shudder= 8
	    $Alarm3.start((GS.damagetimer) / 30.0)
	    GS.hurtanim[myself]= 3
	}
	if(GS.hurtanim[myself] == 2) {
	    GS.monsterhp[myself]-= takedamage
	    with(dmgwriter) $Alarm2.start((15) / 30.0)
	    if(GS.monsterhp[myself] > 0) {
	        GS.hurtanim[myself]= 0
	        mypart1.pause= 0
	        GS.myfight= 0
	        GS.mnfight= 1
	    } else  {
	        GS.myfight= -99
	        GS.mnfight= -99
	        GS.hurtanim[myself]= 0
	        con= 50
	    }
	}
	if(GS.hurtanim[myself] == 5) {
	    GS.damage= 0
	    instance_create(x + sprite_width / 2 - 48, y - 24, 189/* obj_dmgwriter */)
	    // obj_dmgwriter
	    with(189) $Alarm2.start((30) / 30.0)
	    GS.myfight= 0
	    GS.mnfight= 1
	    GS.hurtanim[myself]= 0
	}
	if(greenlock == 1 and GS.mnfight > 0) {
	    if(obj_heart.sprite_index == 39) obj_heart.y= obj_uborder.y + 34
	    else  greenlock= 0
	} else  greenlock= 0
	if(darkify == 1) {
	    if(pseudodarker.modulate.a < 0.5)
	        pseudodarker.modulate.a+= 0.04
	    else  darkify= 2
	    obj_borderparent.modulate.a= 1 - pseudodarker.modulate.a
	}
	if(darkify == 3) {
	    if(pseudodarker.modulate.a > 0)
	        pseudodarker.modulate.a-= 0.04
	    obj_borderparent.modulate.a= 1 - pseudodarker.modulate.a
	    if(pseudodarker.modulate.a <= 0) {
	        darkify= 0
	        with(pseudodarker) instance_destroy()
	    }
	}
	if(GS.hurtanim[myself] == 5) {
	    GS.damage= 0
	    instance_create(x + sprite_width / 2 - 48, y - 24, 189/* obj_dmgwriter */)
	    // obj_dmgwriter
	    with(189) $Alarm2.start((30) / 30.0)
	    GS.myfight= 0
	    GS.mnfight= 1
	    GS.hurtanim[myself]= 0
	}
	if(GS.mnfight == 2 and attacked == 0) {
	    hitno= 0
	    xx= get_viewport_rect().size.x / 2
	    yy= get_viewport_rect().size.y / 2
	    GS.turntimer= 300
	    GS.firingrate= 15
	    if(obj_heart.sprite_index == 39) {
	        gen= instance_create(xx, yy, 263/* obj_spearblocker */)
	        gen.lesson= lesson
	        gen.rating= rating
	        gen.dmg= GS.monsteratk[myself]
	        with(gen) event_user(1)
	    } else  {
	        if(orderb == 0 or orderb == 6) {
	            borderspec= 0
	            GS.turntimer= 240
	            event_user(2)
	            ratingb++
	            lesson++
	            if(ratingb > 10) ratingb= 10
	            if(ratingb < 8) ratingb= 8
	            GS.firingrate= 18 - ratingb
	            gen= instance_create(x, y, 270/* obj_spearbulletfollowgen */)
	            gen.dmg= GS.monsteratk[myself]
	        }
	        if(orderb == 1 or orderb == 7) {
	            GS.turntimer= 220
	            borderspec= 1
	            ratingb++
	            lesson++
	            if(ratingb > 10) ratingb= 10
	            if(ratingb < 8) ratingb= 8
	            GS.firingrate= 23 - ratingb
	            gen= instance_create(x, y, 269/* obj_risespearbulletgen */)
	            gen.dmg= GS.monsteratk[myself]
	        }
	        if(orderb == 2 or orderb == 3) {
	            borderspec= 0
	            GS.turntimer= 215
	            ratingb++
	            lesson++
	            gen= instance_create(x, y, 276/* obj_rotspeargen_gen */)
	            gen.type= 0
	            gen.t= 0
	            gen.dmg= GS.monsteratk[myself]
	        }
	        if(orderb == 4) {
	            borderspec= 0
	            GS.turntimer= 400
	            ratingb++
	            lesson++
	            gen= instance_create(x, y, 279/* obj_followspeargen_2 */)
	            gen.dmg= GS.monsteratk[myself]
	        }
	        if(orderb == 5) {
	            borderspec= 0
	            GS.turntimer= 215
	            ratingb++
	            lesson++
	            gen= instance_create(x, y, 276/* obj_rotspeargen_gen */)
	            gen.type= 1
	            gen.t= 1
	            gen.dmg= GS.monsteratk[myself]
	        }
	        orderb++
	        if(orderb >= 8) orderb= 4
	    }
	    gen.myself= myself
	    hitno= 0
	    attacked= 1
	    order++
	    lesson--
	    if(mycommand >= 0) GS.msg[0]= "* The wind is howling..."
	}
	if(GS.mnfight == 3 and darkify > 0 and darkify != 3)
	    darkify= 3
	if(GS.myfight == 2 and whatiheard != -1 and GS.heard == 0) {
	    if(whatiheard == 0) {
	        GS.msc= 0
	        GS.msg[0]= "* UNDYNE THE UNDYING 99ATK 99DEF&* Heroine reformed by her own&  DETERMINATION to save Earth./^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    GS.heard= 1
	}
	siner++
	if(instance_exists(267/* obj_boxsiner */))
	    obj_boxsiner.x= obj_boxsiner.xstart + sin(siner / 24) * 40
	if(GS.myfight == 4 and GS.mercyuse == 0) {
	    mercied++
	    script_execute(163/* scr_mercystandard */)
	}
	if(obj_heart.sprite_index == 39 and GS.mnfight == 2)
	    obj_heart.movement= 3
	if(GS.mnfight == 2 and GS.turntimer < 1 and obj_heart.sprite_index == 34)
	    GS.mnfight= 4
	if(con == 50) {
	    con= 51
	    $Alarm4.start((90) / 30.0)
	}
	if(con == 52) {
	    shakify= 2
	    mypart1.shakify= 1
	    myfight= 0
	    mnfight= 99
	    GS.bmenuno= 4
	    GS.border= 0
	    SCR_BORDERSETUP()
	    con= 53
	    GS.msc= 0
	    GS.typer= 94
	    GS.msg[0]= "Damn it.../"
	    GS.msg[1]= "So even THAT&power..^1.&It wasn\'t enough...?/"
	    GS.msg[2]= ".../"
	    GS.msg[3]= "\\E1Heh.../"
	    GS.msg[4]= "Heheheh.../"
	    GS.msg[5]= "\\E2If you..^1./"
	    GS.msg[6]= "If you think I\'m&gonna give up hope^1,&you\'re wrong./"
	    GS.msg[7]= "\'Cause I\'ve..^1.&Got my friends&behind me./"
	    GS.msg[8]= "\\E3Alphys told me that&she would watch me&fight you.../"
	    GS.msg[9]= "\\E4And if anything went&wrong^1, she would..^1.&evacuate everyone./"
	    GS.msg[10]= "\\E5By now she\'s called&ASGORE and told him&to absorb the 6&human SOULs./%%"
	    scr_blcon_x(blconx, blcony)
	}
	if(con == 53 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.typer= 95
	    GS.msg[0]= "And with that&power.../%%"
	    melter= scr_marker(mypart1.x - 20, -40, 299)
	    con= 54
	    scr_blcon_x(blconx, blcony)
	    with(mypart1) instance_destroy()
	}
	if(con == 54 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.typer= 96
	    GS.msg[0]= "This world will&live on...!/%%"
	    melter.frame= 1
	    con= 71
	    scr_blcon_x(blconx, blcony)
	}
	if(con == 71 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.monstersprite= melter.sprite_index
	    GS.vaporspeed= 0
	    ddd= instance_create(melter.x, melter.y, 155/* obj_vaporized_new */)
	    with(ddd) scr_newvapordata(35)
	    ddd.sprite_index= melter.sprite_index
	    with(melter) instance_destroy()
	    ddd.ht= ht
	    ddd.wd= wd
	    ddd.image_speed= 0
	    ddd.frame= 1
	    GS.kills++
	    GS.xp+= 1500
	    scr_levelup()
	    con= 72
	    $Alarm4.start((180) / 30.0)
	}
	if(con == 73) {
	    instance_create(x, y, 149/* obj_unfader */)
	    GS.flag[350]= 1
	    GS.flag[251]= 1
	    GS.plot= 122
	    $Alarm9.start((10) / 30.0)
	    con= 74
	}
	if(obj_heart.sprite_index == 34) GS.mercy= 1
	if(obj_heart.sprite_index == 39) GS.mercy= 1

func _gm_event_7_12():
	darkify= 1
	pseudodarker= instance_create(-20, -20, 1363/* obj_npc_marker */)
	pseudodarker.visible= 1
	pseudodarker.image_speed= 0
	pseudodarker.sprite_index= 996/* spr_pixblk */
	pseudodarker.z_index= 2
	pseudodarker.modulate.a= 0
	pseudodarker.scale.x= 600
	pseudodarker.scale.y= 600

func _gm_event_7_11():
	if(green == 0) {
	    $Alarm10.start((10) / 30.0)
	    with(mypart1) event_user(1)
	    green= 2
	}

func _gm_event_9_65():
	if(GS.debug == 1) {
	    lesson--
	    order--
	}

func _gm_event_9_55():
	if(GS.debug == 1) GS.hp= 999

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
