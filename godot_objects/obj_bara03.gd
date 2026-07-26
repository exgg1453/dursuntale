# Auto-converted from GameMaker: obj_bara03
# GM parent: obj_monsterparent
extends Node2D

func _ready():
	scr_monstersetup(0, 0, 0, 0, 0)
	image_speed= 0
	part1= 318
	mypart1= _spawn("part1", x, y)
	mypart1.parent= object_index
	mypart1.headpic= 367
	hurtanim= 0
	hurtsound= 43
	talked= 0
	whatiheard= -1
	attacked= 0
	killed= 0
	GS.heard= 0
	takedamage= 0
	mercymod= -999
	sha= 0
	shb= 0
	flex= 0
	alphaup= 0
	freshdeath= 0
	turn0= 0
	armor= 255
	con= 0
	shirtless= 0
	blconx= 165
	blcony= 55
	fuckyou= 0
	ht= 200
	wd= 200

func _gm_event_1_0():
	if(mercymod > 10 and GS.monsterhp[myself] == GS.monstermaxhp[myself])
	    GS.goldreward[3]+= 10
	scr_monsterdefeat(0, 0, 0, 0, 0)
	with(mypart1) instance_destroy()

func _gm_event_2_8():
	snd_play(hurtsound)

func _gm_event_2_6():
	blcon= instance_create(x - blconx, y + 55, 186/* obj_blconsm */)
	blcon.sprite_index= 20/* spr_blconsm2 */
	gg= floor(random(3))
	attacked= 0
	mycommand= round(random(100))
	if(mycommand >= 0 and mycommand < 25) GS.msg[0]= "..."
	if(mycommand >= 25) GS.msg[0]= "..."
	if(mycommand >= 50) GS.msg[0]= "...&..."
	if(mycommand >= 75) GS.msg[0]= "..."
	turn0= 1
	if(whatiheard == 3) GS.msg[0]= "I know,&but..."
	if(whatiheard == 1) {
	    GS.msg[0]= "Glove...&getting&looser."
	    if(shirtless == 1) GS.msg[0]= "Nice&to meet&you???"
	}
	pop= scr_monstersum()
	if(pop < 2) {
	    if(mycommand >= 0 and mycommand < 25) GS.msg[0]= "..."
	    if(mycommand >= 25) GS.msg[0]= "..."
	    if(mycommand >= 50) GS.msg[0]= "..."
	    if(mycommand >= 75) GS.msg[0]= "..."
	    if(freshdeath == 0 and mercymod < 1)
	        GS.msg[0]= "04...!!&Why&didn\'t&I..."
	    if(freshdeath == 0 and mercymod > 100)
	        GS.msg[0]= "04!?&You...&YOU...!"
	    freshdeath= 1
	    mercymod= -99999
	}
	GS.msg[1]= "%%%"
	GS.typer= 2
	blconwd= instance_create(blcon.x + 15, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	GS.border= 15
	obj_heart.x= round((GS.idealborder[0] + GS.idealborder[1]) / 2) - 8
	obj_heart.y= round((GS.idealborder[2] + GS.idealborder[3]) / 2) - 8

func _gm_event_2_5():
	with(blconwd) instance_destroy()
	with(blcon) instance_destroy()
	talked= 0
	GS.mnfight= 2
	GS.border= 16

func _gm_event_2_4():
	con++

func _gm_event_2_3():
	if(mypart1.pause != 1) {
	    dmgwriter= instance_create(x + sprite_width / 2 - 48, y - 24, 189/* obj_dmgwriter */)
	    GS.damage= takedamage
	    with(dmgwriter) dmg= GS.damage
	    with(mypart1) pause= 1
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
	if(GS.mnfight == 3) {
	    attacked= 0
	    // obj_carrotstargen
	    with(699) instance_destroy()
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
	    $Alarm5.start((110) / 30.0)
	    $Alarm6.start((1) / 30.0)
	    talked= 1
	    GS.heard= 0
	}
	if(keyboard_multicheck_pressed(13/* ENTER */) and alarm[5] > 5 and obj_lborder.x == GS.idealborder[0])
	    $Alarm5.start((2) / 30.0)
	if(GS.hurtanim[myself] == 1) {
	    shudder= 8
	    $Alarm3.start((GS.damagetimer) / 30.0)
	    GS.hurtanim[myself]= 3
	}
	if(GS.hurtanim[myself] == 2) {
	    GS.monsterhp[myself]-= takedamage
	    with(dmgwriter) $Alarm2.start((15) / 30.0)
	    if(GS.monsterhp[myself] >= 1) {
	        mypart1.pause= 0
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
	    if(obj_uborder.y > GS.idealborder[2])
	        obj_heart.y= (obj_uborder.y + obj_dborder.y) / 2
	    if(attacked == 0) {
	        pop= scr_monstersum()
	        GS.turntimer= 180
	        if(not instance_exists(699/* obj_carrotstargen */)) {
	            if(whatiheard == 1 and con == 0 and pop > 1)
	                mycommand= 80
	            if(mycommand >= 0 and mycommand <= 50) {
	                GS.firingrate= 25
	                gen= instance_create(x, y, 314/* obj_xbulletgen */)
	                gen.dmg= GS.monsteratk[myself]
	            } else  {
	                GS.firingrate= 20
	                if(whatiheard == 1 and con == 0 and pop > 1) {
	                    instance_create(get_viewport_rect().size.x / 2 - 15, get_viewport_rect().size.y / 2 - 80, 308/* obj_greenarmor */)
	                    GS.firingrate= 35
	                }
	                gen= instance_create(x, y, 313/* obj_warplinegen */)
	                gen.dmg= GS.monsteratk[myself]
	                gen.$Alarm1.start((8) / 30.0)
	                if(con > 6) gen.shake= 1
	            }
	            gen.myself= myself
	        }
	        if(mycommand >= 0) GS.msg[0]= "* 03 rubs her glove quietly."
	        if(mycommand >= 25)
	            GS.msg[0]= "* 04 hums and looks the other&  way."
	        if(mycommand >= 50) GS.msg[0]= "* 03 stands guard."
	        if(mycommand >= 75) GS.msg[0]= "* 04\'s twitches her tail."
	        if(mycommand >= 90) GS.msg[0]= "* Smells like a military zoo."
	        pop= scr_monstersum()
	        if(pop == 1) {
	            if(mycommand >= 0) GS.msg[0]= "* 03 is trembling."
	            if(mycommand >= 25)
	                GS.msg[0]= "* 03 is holding her face in&  her hands."
	            if(mycommand >= 50) GS.msg[0]= "* 03 stands still."
	            if(mycommand >= 75) GS.msg[0]= "* 03 seems sick."
	        }
	        if(GS.monsterhp[myself] < 30)
	            GS.msg[0]= "* 03\'s breathing intensifies."
	        attacked= 1
	        whatiheard= -1
	    }
	}
	if(GS.myfight == 2 and whatiheard != -1 and GS.heard == 0) {
	    if(whatiheard == 0) {
	        GS.msc= 0
	        GS.msg[0]= "* RG 03 " + string(GS.monsteratk[myself]) + " ATK " + string(GS.monsterdef[myself]) + " DEF&* Royal Guard member with&  stuffy armor./^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	        whatiheard= 9
	    }
	    if(whatiheard == 1) {
	        GS.msc= 0
	        GS.msg[0]= "* You touch RG 03\'s glove^1.&* It starts to come loose./^"
	        if(shirtless == 1) {
	            GS.msg[0]= "* You shake RG 03\'s claw./^"
	            if(instance_exists(309/* obj_bara01 */)) obj_bara01.whatiheard= 12
	        }
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    if(whatiheard == 3) {
	        GS.msc= 0
	        GS.msg[0]= "* You tell RG 03 that she&  should stand up for her/^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    GS.heard= 1
	}
	if(alphaup == 1 and modulate.a < 1)
	    modulate.a+= 0.05
	if(GS.myfight == 4 and GS.mercyuse == 0) {
	    script_execute(163/* scr_mercystandard */)
	    if(mercy < 0) instance_destroy()
	}
	if(mercymod == 222 and not instance_exists(782/* OBJ_WRITER */)) {
	    script_execute(163/* scr_mercystandard */)
	    if(mercy < 0) instance_destroy()
	}
	if(fuckyou == 1) GS.mnfight= 5
	if(GS.mnfight == 5) {
	    if(con == 0) {
	        fuckyou= 1
	        obj_heart.x= -800
	        obj_heart.movement= -1
	        GS.border= 0
	        $Alarm4.start((15) / 30.0)
	        con= 1
	    }
	    if(con == 2) {
	        blcon= instance_create(x - blconx, y + blcony, 186/* obj_blconsm */)
	        blcon.sprite_index= 20/* spr_blconsm2 */
	        GS.typer= 2
	        GS.msg[0]= "My glove&...!/%%"
	        writer= instance_create(blcon.x + 15, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	        con= 3
	    }
	    if(con == 3 and not instance_exists(782/* OBJ_WRITER */)) {
	        with(blcon) instance_destroy()
	        snd_play(47/* snd_grab */)
	        with(mypart1) hand1pic= 358
	        con= 4
	        $Alarm4.start((60) / 30.0)
	    }
	    if(con == 5 and not instance_exists(782/* OBJ_WRITER */)) {
	        if(instance_exists(312/* obj_bara04 */)) {
	            // obj_bara04
	            with(312) {
	                blcon= instance_create(x + blconx, y + blcony, 186/* obj_blconsm */)
	                GS.typer= 2
	                GS.msg[0]= "03...&Is that&...?/%%"
	                writer= instance_create(blcon.x + 15, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	            }
	        }
	        con= 6
	    }
	    if(con == 6 and not instance_exists(782/* OBJ_WRITER */)) {
	        if(instance_exists(312/* obj_bara04 */)) {
	            // obj_bara04
	            with(312) {
	                with(blcon) instance_destroy()
	            }
	        }
	        blcon= instance_create(x - blconx, y + blcony, 186/* obj_blconsm */)
	        blcon.sprite_index= 20/* spr_blconsm2 */
	        GS.typer= 2
	        GS.msg[0]= "Yes.&It is./"
	        GS.msg[1]= "Go&ahead.&Laugh at&me./%%"
	        writer= instance_create(blcon.x + 15, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	        con= 7
	    }
	    if(con == 7 and not instance_exists(782/* OBJ_WRITER */)) {
	        with(blcon) instance_destroy()
	        if(instance_exists(312/* obj_bara04 */)) {
	            // obj_bara04
	            with(312) {
	                blcon= instance_create(x + blconx, y + blcony, 186/* obj_blconsm */)
	                GS.typer= 2
	                GS.msg[0]= "No, I.../%%"
	                writer= instance_create(blcon.x + 15, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	            }
	        }
	        con= 8
	    }
	    if(con == 8 and not instance_exists(782/* OBJ_WRITER */)) {
	        if(instance_exists(312/* obj_bara04 */)) {
	            with(obj_bara04.blcon) instance_destroy()
	        }
	        con= 9
	    }
	    if(con == 9 and not instance_exists(782/* OBJ_WRITER */)) {
	        fuckyou= 0
	        shirtless= 1
	        with(blcon) instance_destroy()
	        GS.msg[0]= "* RG 04 is looking at her own&  glove."
	        con= 10
	        GS.mnfight= 3
	        obj_bara04.shake= 1
	        obj_heart.movement= 1
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
