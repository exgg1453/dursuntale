# Auto-converted from GameMaker: obj_bara04
# GM parent: obj_monsterparent
extends Node2D

func _ready():
	scr_monstersetup(0, 0, 0, 0, 0)
	image_speed= 0
	part1= 318
	mypart1= _spawn("part1", x, y)
	mypart1.parent= object_index
	mypart1.headpic= 366
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
	con= 0
	shake= 0
	toldhim= 0
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
	blcon= instance_create(x + 165, y + 55, 186/* obj_blconsm */)
	gg= floor(random(3))
	mycommand= round(random(100))
	if(mycommand >= 0 and mycommand < 25)
	    GS.msg[0]= "Hmph,&try not&to mess&this up."
	if(mycommand >= 25) GS.msg[0]= "I\'ll&take you&down&alone!"
	if(mycommand >= 50) GS.msg[0]= "Sigh...&team&attack,&I guess."
	if(mycommand >= 75) GS.msg[0]= "I\'m a&one&woman&army."
	if(shake == 1) GS.msg[0]= "D...&Dude..."
	if(whatiheard == 3) {
	    GS.msg[0]= "What&are you&talking&about?"
	    if(toldhim == 1) GS.msg[0]= "My...&glove..."
	}
	if(whatiheard == 1) {
	    GS.msg[0]= "Don\'t&touch&that!!"
	    if(toldhim == 1) GS.msg[0]= ",.."
	}
	if(whatiheard == 12) GS.msg[0]= "H-HEY,&STOP&THAT!!"
	pop= scr_monstersum()
	if(pop < 2) {
	    if(mycommand >= 0 and mycommand < 25)
	        GS.msg[0]= "03!&I didn\'t&want&this..."
	    if(mycommand >= 25) GS.msg[0]= "03...&03..."
	    if(mycommand >= 50) GS.msg[0]= "03...&answer&me..."
	    if(mycommand >= 75) GS.msg[0]= "..."
	    if(freshdeath == 0 and mercymod < 1)
	        GS.msg[0]= "03!&I never&said&sorry..."
	    if(freshdeath == 0 and mercymod > 100)
	        GS.msg[0]= "03...!?&Why,&you..."
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
	whatiheard= -1
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
	    whatiheard= -1
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
	    pop= scr_monstersum()
	    if(attacked == 0 and pop == 1) {
	        GS.turntimer= 180
	        if(not instance_exists(311/* obj_bara03 */)) {
	            if(mycommand >= 0 and mycommand <= 50) {
	                GS.firingrate= 25
	                gen= instance_create(x, y, 314/* obj_xbulletgen */)
	                gen.dmg= GS.monsteratk[myself]
	                gen.$Alarm0.start((8) / 30.0)
	            } else  {
	                GS.firingrate= 20
	                gen= instance_create(x, y, 313/* obj_warplinegen */)
	                gen.dmg= GS.monsteratk[myself]
	                gen.$Alarm1.start((8) / 30.0)
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
	            if(mycommand >= 0)
	                GS.msg[0]= "* 04 holds her head in her&  hands."
	            if(mycommand >= 25)
	                GS.msg[0]= "*Sad mews emerge from&  04\'s armor."
	            if(mycommand >= 50) GS.msg[0]= "* 04 is thunderstruck."
	            if(mycommand >= 75) GS.msg[0]= "* 04 does nothing."
	        }
	        if(GS.monsterhp[myself] < 30)
	            GS.msg[0]= "* 04\'s breathing intensifies."
	        attacked= 1
	    }
	}
	if(GS.myfight == 2 and whatiheard != -1 and GS.heard == 0) {
	    if(whatiheard == 0) {
	        GS.msc= 0
	        GS.msg[0]= "* RG 04 " + string(GS.monsteratk[myself]) + " ATK " + string(GS.monsterdef[myself]) + " DEF&* Royal Guard member.&* Protective of her armor./^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	        whatiheard= 9
	    }
	    if(whatiheard == 1) {
	        GS.msc= 0
	        GS.msg[0]= "* You attempt to touch RG 04\'s&  glove^1.&* She bats your hand away./^"
	        if(shake == 1) {
	            GS.msg[0]= "* You touch RG 04\'s glove softly.&* She nods and begins to&  take it off./^"
	            toldhim= 1
	        }
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    if(whatiheard == 3) {
	        GS.msc= 0
	        GS.msg[0]= "* You tell RG 04 to remember&  what being friends is about./^"
	        if(shake == 1) toldhim= 1
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    GS.heard= 1
	}
	if(toldhim == 1 and GS.turntimer > 6 and GS.turntimer < 12 and GS.mnfight == 2 and con == 0) {
	    GS.turntimer= -1
	    fuckyou= 1
	    GS.mnfight= 5
	    GS.border= 0
	    obj_heart.x= -800
	    obj_heart.movement= -1
	}
	if(fuckyou == 1) GS.mnfight= 5
	if(GS.mnfight == 5) {
	    if(con == 0 and toldhim == 1) {
	        caster_pause(GS.batmusic)
	        con= 0.1
	        $Alarm4.start((20) / 30.0)
	    }
	    if(con == 1.1) {
	        snd_play(47/* snd_grab */)
	        with(mypart1) hand1pic= 357
	        con= 1
	        $Alarm4.start((40) / 30.0)
	    }
	    if(con == 2) {
	        blcon= instance_create(x + blconx, y + blcony, 186/* obj_blconsm */)
	        GS.typer= 2
	        GS.msc= 0
	        GS.msg[0]= "Actually&.../"
	        GS.msg[1]= "I still&wear&mine&too./%%"
	        writer= instance_create(blcon.x + 15, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	        con= 3
	    }
	    if(con == 3 and not instance_exists(782/* OBJ_WRITER */)) {
	        with(mypart1) shaker= 0
	        with(blcon) instance_destroy()
	        conmusic= caster_load("music/confession.ogg")
	        caster_loop(conmusic, 0.8, 0.9)
	        con= 4
	        GS.msc= 0
	        GS.typer= 2
	        // obj_bara03
	        with(311) {
	            blcon= instance_create(x - blconx - 100, y + blcony, 186/* obj_blconsm */)
	            obj_bara04.blcon= blcon
	            blcon.sprite_index= 30/* spr_blconwdshrt_l */
	            GS.typer= 2
	            GS.msg[0]= "Our friendship&bracelets from&high school./%%"
	            writer= instance_create(blcon.x + 15, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	        }
	    }
	    if(con == 4 and not instance_exists(782/* OBJ_WRITER */)) {
	        with(blcon) instance_destroy()
	        blcon= instance_create(x + blconx - 5, y + blcony, 186/* obj_blconsm */)
	        blcon.sprite_index= 29/* spr_blconwdshrt */
	        GS.typer= 2
	        GS.msc= 0
	        GS.msg[0]= "03, I\'m sorry.&I thought you hated&me, after what&happened.../"
	        GS.msg[1]= "We did some pretty&nasty things to&each other, because&of.../%%"
	        writer= instance_create(blcon.x + 25, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	        con= 5
	    }
	    if(con == 5 and not instance_exists(782/* OBJ_WRITER */)) {
	        with(blcon) instance_destroy()
	        con= 6
	        GS.msc= 0
	        GS.typer= 2
	        // obj_bara03
	        with(311) {
	            blcon= instance_create(x - blconx - 100, y + blcony, 186/* obj_blconsm */)
	            obj_bara04.blcon= blcon
	            blcon.sprite_index= 30/* spr_blconwdshrt_l */
	            GS.typer= 2
	            GS.msg[0]= "That old drama?&Forget about it./"
	            GS.msg[1]= "To tell you the&truth, I requested&to be partners&with you./"
	            GS.msg[2]= "I wanted to become&friends with you&again.../"
	            GS.msg[3]= "But I didn\'t know&how to breach the&topic./%%"
	            writer= instance_create(blcon.x + 15, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	        }
	    }
	    if(con == 6 and not instance_exists(782/* OBJ_WRITER */)) {
	        with(blcon) instance_destroy()
	        blcon= instance_create(x + blconx - 5, y + blcony, 186/* obj_blconsm */)
	        blcon.sprite_index= 29/* spr_blconwdshrt */
	        GS.typer= 2
	        GS.msc= 0
	        GS.msg[0]= "03!/"
	        GS.msg[1]= "After this.../"
	        GS.msg[2]= "Do you want to get&some ice-cream?/%%"
	        writer= instance_create(blcon.x + 25, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	        con= 7
	    }
	    if(con == 7 and not instance_exists(782/* OBJ_WRITER */)) {
	        with(blcon) instance_destroy()
	        con= 8
	        GS.msc= 0
	        GS.typer= 2
	        // obj_bara03
	        with(311) {
	            blcon= instance_create(x - blconx, y + blcony, 186/* obj_blconsm */)
	            obj_bara04.blcon= blcon
	            blcon.sprite_index= 20/* spr_blconsm2 */
	            GS.typer= 2
	            GS.msg[0]= "Salmon-&flavor?/%%"
	            writer= instance_create(blcon.x + 15, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	        }
	    }
	    if(con == 8 and not instance_exists(782/* OBJ_WRITER */)) {
	        with(blcon) instance_destroy()
	        blcon= instance_create(x + blconx, y + blcony, 186/* obj_blconsm */)
	        blcon.sprite_index= 18/* spr_blconsm */
	        GS.typer= 2
	        GS.msc= 0
	        GS.msg[0]= "You know&it!/%%"
	        writer= instance_create(blcon.x + 15, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	        con= 10
	    }
	    if(con == 10 and not instance_exists(782/* OBJ_WRITER */)) {
	        fuckyou= 0
	        with(blcon) instance_destroy()
	        GS.mnfight= 3
	        con= 11
	        mercymod= 999
	        GS.monsterdef[myself]= -999
	        // obj_bara03
	        with(311) {
	            mercymod= 999
	            GS.monsterdef[myself]= -999
	        }
	        caster_free(conmusic)
	        GS.msg[0]= "* 03 and 04 are planning all&  sorts of things to do&  together."
	    }
	}
	if(GS.myfight == 4 and GS.mercyuse == 0) {
	    script_execute(163/* scr_mercystandard */)
	    if(mercy < 0) instance_destroy()
	}
	if(mercymod == 222 and not instance_exists(782/* OBJ_WRITER */)) {
	    script_execute(163/* scr_mercystandard */)
	    if(mercy < 0) instance_destroy()
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
