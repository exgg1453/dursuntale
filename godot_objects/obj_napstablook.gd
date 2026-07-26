# Auto-converted from GameMaker: obj_napstablook
# GM parent: obj_monsterparent
extends Node2D

func _ready():
	scr_monstersetup(0, 0, 0, 0, 0)
	hurtanim= 0
	hurtsound= 51
	talked= 0
	whatiheard= -1
	attacked= 0
	killed= 0
	GS.heard= 0
	takedamage= 0
	outside= 0
	scale.x= 2
	scale.y= 2
	mercymod= -400
	image_speed= 0.2
	obj_battlebg.frame= 1
	ht= sprite_height
	wd= sprite_width
	mercer= 0

func _gm_event_1_0():
	scr_monsterdefeat(0, 0, 0, 0, 0)

func _gm_event_2_11():
	if(not instance_exists(782/* OBJ_WRITER */)) $Alarm7.start((2) / 30.0)
	else  $Alarm11.start((1) / 30.0)

func _gm_event_2_10():
	if(is_instance_valid(blcon)) {
	    with(blcon) instance_destroy()
	}
	if(modulate.a > 0.1) {
	    modulate.a-= 0.05
	    $Alarm10.start((1) / 30.0)
	} else  {
	    caster_stop(GS.batmusic)
	    caster_free(GS.batmusic)
	    GS.typer= 1
	    script_execute(146/* scr_writetext */, 0, "* YOU WON!&* You lost 1 experience point./%", 0, 0)
	    $Alarm11.start((1) / 30.0)
	}

func _gm_event_2_9():
	if(not is_instance_valid(blconwriter)) $Alarm10.start((2) / 30.0)
	else  $Alarm9.start((2) / 30.0)

func _gm_event_2_8():
	GS.flag[23]++
	room_goto(GS.currentroom)

func _gm_event_2_7():
	instance_create(0, 0, 149/* obj_unfader */)
	$Alarm8.start((10) / 30.0)

func _gm_event_2_6():
	if(GS.monsterhp[myself] > 0) {
	    blcon= instance_create(x + sprite_width + 21, ystart + 24, 186/* obj_blconsm */)
	    mycommand= round(random(100))
	    if(mycommand >= 0 and mycommand < 40)
	        GS.msg[0]= "i\'m&fine,&thanks."
	    if(mycommand >= 40 and mycommand < 66)
	        GS.msg[0]= "just&pluggin&along..."
	    if(mycommand >= 66 and mycommand)
	        GS.msg[0]= "nnnnnn&ggghhh."
	    if(whatiheard == 0) GS.msg[0]= "oh, i\'m&REAL&funny."
	    if(whatiheard == 1) GS.msg[0]= "go&ahead,&do it."
	    if(whatiheard == 3) GS.msg[0]= "i\'d just&weigh&you&down."
	    if(whatiheard == 4) GS.msg[0]= "heh..."
	    if(whatiheard == 4 and mercymod > -300)
	        GS.msg[0]= "heh&heh..."
	    if(whatiheard == 4 and mercymod > -200)
	        GS.msg[0]= "let me&try..."
	    if(whatiheard != 4 and whatiheard != 3 and mercymod == -50 and mercer == 0) {
	        GS.msg[0]= "i knew&it..."
	        mercymod= -1200
	        if(instance_exists(621/* blt_blookhat */)) {
	            // blt_blookhat
	            with(621) instance_destroy()
	        }
	    }
	    if(whatiheard == 3 and mercymod == -49) {
	        GS.msg[0]= "oh&no..."
	        $Alarm7.start((60) / 30.0)
	        GS.plot= 10.3
	    }
	    if(whatiheard == 4 and mercymod == -49) {
	        GS.msg[0]= "oh&gee..."
	        $Alarm7.start((60) / 30.0)
	        GS.plot= 10.3
	    } else  {
	        GS.border= 3
	        if(GS.turn == 1) GS.border= 5
	        obj_heart.x= round((GS.idealborder[0] + GS.idealborder[1]) / 2) - 8
	        obj_heart.y= round((GS.idealborder[2] + GS.idealborder[3]) / 2) - 8
	    }
	    GS.msg[1]= "%%%"
	    GS.typer= 2
	    blconwd= instance_create(blcon.x + 15, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	} else  {
	    if(is_instance_valid(dmgwriter)) {
	        with(dmgwriter) instance_destroy()
	    }
	    blcon= instance_create(x + sprite_width + 11, y + 24, 187/* obj_blconwdflowey */)
	    GS.msc= 0
	    GS.msg[0]= "umm... you do&know you cant&kill ghosts, right?/"
	    GS.msg[1]= "we\'re sorta&incorporeal and&all/"
	    GS.msg[2]= "i was just&lowering my hp&because i didnt&want to be rude/"
	    GS.msg[3]= "sorry..^1.&i just made this&more awkward.../"
	    GS.msg[4]= "pretend you beat&  me.../"
	    GS.msg[5]= "ooooooooo^1o%%"
	    GS.plot= 11
	    conversation= 1
	    image_speed= 0.2
	    GS.typer= 2
	    blconwriter= instance_create(obj_blconwdflowey.x + 36, obj_blconwdflowey.y + 10, 782/* OBJ_WRITER */)
	    $Alarm9.start((2) / 30.0)
	}
	mercer= 0

func _gm_event_2_5():
	with(blconwd) instance_destroy()
	with(blcon) instance_destroy()
	talked= 0
	whatiheard= -1
	GS.mnfight= 2

func _gm_event_2_3():
	if(shudder == 16) {
	    dmgwriter= instance_create(x + sprite_width / 2 - 48, y - 20, 189/* obj_dmgwriter */)
	    GS.damage= takedamage
	    with(dmgwriter) dmg= GS.damage
	}
	shudder-= 2
	if(shudder == 0) {
	    GS.hurtanim[myself]= 2
	    exit
	} else  {
	    $Alarm3.start((2) / 30.0)
	    exit
	}

func _process(delta: float):
	if(GS.mnfight == 3) attacked= 0
	scr_blconmatch()
	if(GS.mnfight == 1 and talked == 0) {
	    if(GS.monsterhp[myself] > 0) $Alarm5.start((75) / 30.0)
	    if(mercymod == -49) $Alarm5.start((400) / 30.0)
	    $Alarm6.start((1) / 30.0)
	    talked= 1
	    GS.heard= 0
	}
	if(keyboard_multicheck_pressed(13/* ENTER */) and alarm[5] > 5 and obj_lborder.x == GS.idealborder[0] and alarm[6] < 0)
	    $Alarm5.start((2) / 30.0)
	if(GS.hurtanim[myself] == 1) {
	    shudder= 16
	    $Alarm3.start((GS.damagetimer) / 30.0)
	    GS.hurtanim[myself]= 3
	}
	if(GS.hurtanim[myself] == 2) {
	    GS.monsterhp[myself]-= takedamage
	    with(dmgwriter) $Alarm2.start((15) / 30.0)
	    if(GS.monsterhp[myself] >= 1) {
	        GS.hurtanim[myself]= 0
	        frame= 0
	        GS.myfight= 0
	        GS.mnfight= 1
	    } else  {
	        GS.myfight= 0
	        GS.mnfight= 1
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
	    GS.turntimer= 160
	    if(mercymod != -100) {
	        if(GS.turn != 1) {
	            if(mycommand >= 0 and mycommand <= 50) {
	                GS.turntimer= 140
	                GS.firingrate= 4000 / -mercymod
	                gen= instance_create(0, 0, 707/* obj_crygen1 */)
	            } else  {
	                GS.turntimer= 170
	                GS.firingrate= 3600 / -mercymod
	                gen= instance_create(0, 0, 708/* obj_crygen2 */)
	            }
	        } else  {
	            GS.turntimer= 140
	            gen= instance_create(GS.idealborder[0] + 30, GS.idealborder[2] + 30, 710/* obj_sadmsggen */)
	        }
	    } else  {
	        GS.turntimer= 260
	        GS.firingrate= 8
	        instance_create(obj_napstablook.x + 34, obj_napstablook.y - 30, 621/* blt_blookhat */)
	        gen= instance_create(0, 0, 709/* obj_crygen3 */)
	    }
	    gen.myself= myself
	    gen.dmg= GS.monsteratk[myself]
	    if(mycommand >= 0)
	        GS.msg[0]= "* Napstablook is staring into&  the distance."
	    if(mycommand >= 30)
	        GS.msg[0]= "* Napstablook is wishing they&  weren\'t here."
	    if(mycommand >= 70)
	        GS.msg[0]= "* Napstablook is pretending to&  sleep."
	    if(mycommand >= 90)
	        GS.msg[0]= "* The faint odor of ectoplasm&  permeates the vicinity."
	    if(mercymod > -400)
	        GS.msg[0]= "* Napstablook looks just a&  little bit better."
	    if(mercymod > -290)
	        GS.msg[0]= "* Cheering seems to have&  improved Napstablook\'s&  mood again."
	    attacked= 1
	}
	if(whatiheard == 3 and not instance_exists(782/* OBJ_WRITER */)) {
	    script_execute(163/* scr_mercystandard */)
	    if(mercy < 0) instance_destroy()
	}
	if(GS.myfight == 2 and whatiheard != -1 and GS.heard == 0) {
	    if(whatiheard == 0) {
	        GS.msc= 0
	        GS.msg[0]= "* NAPSTABLOOK - ATK 10 DEF 10&* This monster doesn\'t seem to&  have a sense of humor.../^"
	        if(GS.flag[6] == 1)
	            GS.msg[0]= "* NAPSTABLOOK - ATK 10 DEF 10&* Missed the memo and is the&  same difficulty as normal./^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    if(whatiheard == 3) {
	        GS.myfight= 0
	        GS.mnfight= 1
	        if(mercymod == -50) {
	            mercymod= -49
	            caster_stop(GS.batmusic)
	            caster_free(GS.batmusic)
	            GS.myfight= 0
	            GS.mnfight= 1
	        }
	    }
	    if(whatiheard == 1) {
	        GS.msc= 0
	        GS.msg[0]= "* You give Napstablook a&  cruel look./^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    if(whatiheard == 4) {
	        GS.msc= 0
	        if(mercymod == -50) {
	            mercymod= -49
	            caster_stop(GS.batmusic)
	            caster_free(GS.batmusic)
	            GS.myfight= 0
	            GS.mnfight= 1
	        } else  {
	            if(mercymod < -400)
	                GS.msg[0]= "* You try to console&  Napstablook.../^"
	            if(mercymod == -400)
	                GS.msg[0]= "* You gave Napstablook a&  patient smile./^"
	            if(mercymod == -300)
	                GS.msg[0]= "* You told Napstablook a&  little joke./^"
	            if(mercymod == -200)
	                GS.msg[0]= "* Napstablook wants to&  show you something./^"
	            OBJ_WRITER.halt= 3
	            iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	            with(iii) halt= 0
	            mercymod+= 100
	        }
	    }
	    GS.heard= 1
	}
	if(GS.myfight == 4 and GS.mercyuse == 0) {
	    mercer= 1
	    script_execute(163/* scr_mercystandard */)
	    if(mercy < 0) instance_destroy()
	}

func _gm_event_7_0():
	if(outside == 0) {
	    OBJ_WRITER.halt= 3
	    GS.monster[myself]= 0
	    if(GS.mnfight == 2) GS.mnfight= 1
	    outside= 1
	    instance_destroy()
	    GS.flag[13]= 1
	    GS.flag[14]= 3
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
