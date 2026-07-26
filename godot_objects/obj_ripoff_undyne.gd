# Auto-converted from GameMaker: obj_ripoff_undyne
# GM parent: obj_monsterparent
extends Node2D

func _ready():
	scr_monstersetup()
	image_speed= 0
	part1= 274
	$Alarm10.start((2) / 30.0)
	GS.faceemotion= 10
	mypart1= _spawn("part1", x, y)
	mypart1.z_index= 15
	mypart1.noanim= 1
	mypart1.spearalpha= 0
	mypart1.goof= 0
	with(mypart1) pause= 0
	// obj_battlebg
	with(185) instance_destroy()
	$Alarm9.start((8) / 30.0)
	hurtanim= 0
	hurtsound= 42
	talked= 0
	whatiheard= -1
	attacked= 0
	killed= 0
	GS.heard= 0
	takedamage= 0
	mercymod= -999999
	sha= 0
	shb= 0
	lesson= 15
	if(obj_heart.sprite_index == 34) {
	    obj_heart.sprite_index= 39/* spr_heartgreen */
	    obj_heart.movement= 3
	    green= 0
	}
	darkify= 0
	greenlock= 0
	rating= 12
	hitno= 0
	berserk= 0
	turns= 0
	mercyno= 0
	talkt= 0
	saved= 0
	st= instance_create(x + 20, y - 30, 1662/* obj_strangetangle */)
	with(st) z_index= 14
	ht= 200
	wd= 100

func _gm_event_1_0():
	if(mercymod > 10 and GS.monsterhp[myself] == GS.monstermaxhp[myself])
	    GS.goldreward[3]+= 40
	scr_monsterdefeat(0, 0, 0, 0, 0)
	with(mypart1) instance_destroy()

func _gm_event_2_11():
	saved++

func _gm_event_2_9():
	mypart1.parent= GS.monsterinstance[myself]

func _gm_event_2_8():
	// obj_dmgwriter
	with(189) instance_destroy()

func _gm_event_2_7():
	GS.mnfight= 3

func _gm_event_2_6():
	blcon= instance_create(x + 100, y, 186/* obj_blconsm */)
	gg= floor(random(3))
	mycommand= round(random(100))
	GS.msg[0]= "Default"
	if(talkt == 0) GS.msg[0]= "All&humans&will&die!"
	if(talkt == 1) GS.msg[0]= "You\'re&our&real&enemy."
	if(talkt == 2) GS.msg[0]= "Mercy&is for&the&weak."
	if(talkt == 2) talkt= 0
	if(talkt == 1) talkt= 2
	if(talkt == 0) talkt= 1
	GS.msg[1]= "%%%"
	GS.typer= 39
	blconwd= instance_create(blcon.x + 15, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	GS.border= 17
	obj_heart.x= round((GS.idealborder[0] + GS.idealborder[1]) / 2) - 8
	obj_heart.y= round((GS.idealborder[2] + GS.idealborder[3]) / 2) - 8
	if(obj_heart.sprite_index == 39) {
	    GS.border= 13
	    obj_heart.x= get_viewport_rect().size.x / 2 - 8
	    obj_heart.y= obj_uborder.y + 34
	    greenlock= 1
	}

func _gm_event_2_5():
	with(blconwd) instance_destroy()
	with(blcon) instance_destroy()
	talked= 0
	GS.mnfight= 2
	GS.border= 18
	if(obj_heart.sprite_index == 39) {
	    GS.border= 12
	    event_user(2)
	}

func _gm_event_2_3():
	if(mypart1.pause != 1) {
	    dmgwriter= instance_create(x + sprite_width / 2 - 48, y - 24, 189/* obj_dmgwriter */)
	    GS.damage= takedamage
	    with(dmgwriter) dmg= GS.damage
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
	        if(hitno == 1) rating++
	        if(hitno > 1) rating+= 2
	        if(berserk == 1) rating--
	    } else  {
	        if(rating >= 10 and lesson > 5) rating-= 2
	        else  {
	            if(rating > 8) rating--
	        }
	        if(berserk == 1 and rating > 6) rating--
	    }
	    attacked= 0
	    GS.mnfight= 5
	    if(GS.border == 12) GS.border= 13
	    SCR_BORDERSETUP()
	    $Alarm7.start((10) / 30.0)
	    if(instance_exists(262/* obj_undynesiner2 */)) {
	        // obj_undynesiner2
	        with(262) event_user(1)
	    }
	}
	if(GS.mnfight == 3) attacked= 0
	if(alarm[5] > 0) {
	    if(GS.monster[0] == 1 and GS.monsterinstance[0].alarm[5] > alarm[5])
	        $Alarm5.start((GS.monsterinstance[0].alarm[5]) / 30.0)
	    if(GS.monster[1] == 1 and GS.monsterinstance[1].alarm[5] > alarm[5])
	        $Alarm5.start((GS.monsterinstance[1].alarm[5]) / 30.0)
	    if(GS.monster[2] == 1 and GS.monsterinstance[2].alarm[5] > alarm[5])
	        $Alarm5.start((GS.monsterinstance[2].alarm[5]) / 30.0)
	}
	if(GS.mnfight == 1 and talked == 0) {
	    $Alarm5.start((110) / 30.0)
	    $Alarm6.start((1) / 30.0)
	    talked= 1
	    GS.heard= 0
	}
	if(keyboard_multicheck_pressed(13/* ENTER */) and alarm[5] > 5 and obj_lborder.x == GS.idealborder[0] and alarm[6] < 0)
	    $Alarm5.start((2) / 30.0)
	if(GS.hurtanim[myself] == 1) {
	    shudder= 8
	    $Alarm3.start((GS.damagetimer) / 30.0)
	    GS.hurtanim[myself]= 3
	}
	if(GS.hurtanim[myself] == 2) {
	    with(dmgwriter) $Alarm2.start((15) / 30.0)
	    if(GS.monsterhp[myself] >= 1) {
	        GS.hurtanim[myself]= 0
	        GS.myfight= 0
	        GS.mnfight= 1
	    } else  {
	        GS.myfight= 0
	        GS.mnfight= 1
	        killed= 1
	        instance_destroy()
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
	if(GS.mnfight == 2) {
	    if(attacked == 0) {
	        pop= scr_monstersum()
	        GS.turntimer= 180
	        GS.firingrate= 10
	        if(pop == 3) GS.firingrate*= 2.5
	        if(pop == 2) GS.firingrate*= 1.8
	        hitno= 0
	        xx= get_viewport_rect().size.x / 2
	        yy= get_viewport_rect().size.y / 2
	        if(obj_heart.sprite_index == 39) {
	            gen= instance_create(xx, yy, 263/* obj_spearblocker */)
	            if(turns == 0) lesson= -50
	            if(turns == 1) lesson= -51
	            gen.lesson= lesson
	            gen.rating= rating
	            gen.dmg= GS.monsteratk[myself]
	            with(gen) event_user(1)
	        }
	        if(turns == 0) turns= 1
	        GS.msg[0]= "* The Lost Soul stands there."
	        attacked= 1
	    }
	    if(mercymod == 999999) {
	        GS.turntimer= -1
	        GS.mnfight= 3
	    }
	    whatiheard= -1
	}
	if(GS.myfight == 2 and whatiheard != -1 and GS.heard == 0) {
	    if(whatiheard == 0) {
	        GS.msc= 0
	        mercyno++
	        GS.msg[0]= "* You tapped the Lost Soul&  lightly./"
	        GS.msg[1]= "* Something about the way you&  fight is familiar to her.../^"
	        if(mercyno >= 3) {
	            GS.msg[1]= "* Something about the way you&  fight..^1.&* It\'s all flooding back!/%%"
	            saved= 1
	            GS.mnfight= 5
	        }
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	        whatiheard= 9
	    }
	    if(whatiheard == 3) {
	        GS.msc= 0
	        mercyno++
	        GS.msg[0]= "* You asked the Lost Soul to&  teach you how to cook./"
	        GS.msg[1]= "* She doesn\'t know why^1, but&  she kind of wants to&  teach you how.../^"
	        if(mercyno >= 3) {
	            GS.msg[1]= "* Suddenly^1, the memories are&  flooding back!/%%"
	            saved= 1
	            GS.mnfight= 5
	        }
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    if(whatiheard == 1) {
	        GS.msc= 0
	        mercyno++
	        GS.msg[0]= "* You gave the Lost Soul a big&  smile^1, like you remember&  she likes to do./"
	        GS.msg[1]= "* For some reason^1, she sort&  of wants to smile back.../^"
	        if(mercyno >= 3) {
	            GS.msg[1]= "* Suddenly^1, the memories are&  flooding back!/%%"
	            saved= 1
	            GS.mnfight= 5
	        }
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    if(whatiheard == 4) {
	        GS.msc= 0
	        mercyno++
	        GS.msg[0]= "* You clashed against the Lost&  Soul with all of your might./"
	        GS.msg[1]= "* She feels your fighting&  spirit..^1.&* It\'s familiar somehow./^"
	        if(mercyno >= 3) {
	            GS.msg[1]= "* She recognizes your fighting&  spirit..^1. suddenly^1, memories&  are flooding back!/%%"
	            saved= 1
	            GS.mnfight= 5
	        }
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    GS.heard= 1
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
	if(GS.mnfight == 3 and darkify > 0 and darkify != 3)
	    darkify= 3
	if(obj_heart.sprite_index == 39 and GS.mnfight == 2)
	    obj_heart.movement= 3
	if(GS.myfight == 4 and GS.mercyuse == 0) {
	    script_execute(163/* scr_mercystandard */)
	    if(mercy < 0) instance_destroy()
	}
	if(mercymod == 222 and not instance_exists(782/* OBJ_WRITER */)) {
	    script_execute(163/* scr_mercystandard */)
	    if(mercy < 0) instance_destroy()
	}
	if(GS.mnfight == 5 and not instance_exists(782/* OBJ_WRITER */)) {
	    if(saved == 1) {
	        if(GS.hp < GS.maxhp) {
	            GS.hp= GS.maxhp
	            snd_play(155/* snd_heal_c */)
	        }
	        // obj_strangetangle
	        with(1662) instance_destroy()
	        instance_create(0, 0, 118/* obj_flasher */)
	        snd_play(30/* snd_break2 */)
	        saved= 2
	        $Alarm11.start((3) / 30.0)
	    }
	    if(saved == 3) {
	        GS.faceemotion= 9
	        GS.msc= 0
	        GS.typer= 39
	        part1.noanim= 1
	        part1.spearalpha= 0
	        GS.msg[0]= "Well^1, some humans&are OK^1, I guess!/%%"
	        scr_blcon_x(x + 80, y)
	        saved= 4
	    }
	    if(saved == 4 and not instance_exists(782/* OBJ_WRITER */)) {
	        instance_create(-10, -10, 557/* obj_screenwhiter */)
	        saved= 5
	        instance_create(0, 0, 557/* obj_screenwhiter */)
	        $Alarm11.start((34) / 30.0)
	    }
	    if(saved == 6) {
	        GS.battlegroup= 256
	        GS.flag[505]= 1
	        room_restart()
	    }
	}

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
