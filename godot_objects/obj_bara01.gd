# Auto-converted from GameMaker: obj_bara01
# GM parent: obj_monsterparent
extends Node2D

func _ready():
	scr_monstersetup(0, 0, 0, 0, 0)
	image_speed= 0
	part1= 318
	mypart1= _spawn("part1", x + 28, y + 32)
	mypart1.parent= object_index
	hurtanim= 0
	hurtsound= 43
	talked= 0
	whatiheard= -1
	attacked= 0
	killed= 0
	GS.heard= 0
	takedamage= 0
	mercymod= -9999
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
	ht= sprite_height
	wd= sprite_width
	if(scr_murderlv() >= 12) GS.monsterdef[myself]= -400

func _gm_event_1_0():
	if(killed == 0) GS.flag[27]= 1
	if(mercymod > 10 and GS.monsterhp[myself] == GS.monstermaxhp[myself])
	    GS.goldreward[3]+= 50
	scr_monsterdefeat(0, 0, 0, 0, 0)
	with(mypart1) instance_destroy()

func _gm_event_2_8():
	snd_play(hurtsound)

func _gm_event_2_6():
	blcon= instance_create(x + 165 + 28, y + 55 + 32, 186/* obj_blconsm */)
	gg= floor(random(3))
	mycommand= round(random(100))
	if(mycommand >= 0 and mycommand < 25)
	    GS.msg[0]= "Like,&give us&the soul&brah."
	if(mycommand >= 25)
	    GS.msg[0]= "Like,&" + chr(ord('"')) + "you\'re&dead" + chr(ord('"')) + "&and all."
	if(mycommand >= 50) GS.msg[0]= "Like,&prepare&to die,&right?"
	if(mycommand >= 75) GS.msg[0]= "Like,&perish&and&stuff."
	if(shake == 1) GS.msg[0]= "D...&Dude..."
	if(turn0 == 0) GS.msg[0]= "Like,&team&attack!"
	turn0= 1
	if(whatiheard == 3) {
	    GS.msg[0]= "Like...&what?&I don\'t&get it."
	    if(toldhim == 1) GS.msg[0]= "I...&I..."
	}
	if(whatiheard == 1) GS.msg[0]= "Like,&hands&off the&merch."
	if(whatiheard == 12) GS.msg[0]= "H-HEY,&STOP&THAT!!"
	pop= scr_monstersum()
	if(pop < 2) {
	    if(mycommand >= 0 and mycommand < 25)
	        GS.msg[0]= "02...&this is,&like,&for you."
	    if(mycommand >= 25) GS.msg[0]= "Like,&02..."
	    if(mycommand >= 50) GS.msg[0]= "02...&are you&really.."
	    if(mycommand >= 75) GS.msg[0]= "..."
	    if(freshdeath == 0 and mercymod < 1)
	        GS.msg[0]= "02...&I never&told&him..."
	    if(freshdeath == 0 and mercymod > 100)
	        GS.msg[0]= "02!?&B-but&why!?"
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
	    dmgwriter= instance_create(x, y, 189/* obj_dmgwriter */)
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
	if(keyboard_multicheck_pressed(13/* ENTER */) and alarm[5] > 5 and obj_lborder.x == GS.idealborder[0] and alarm[6] < 0)
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
	        if(not instance_exists(699/* obj_carrotstargen */)) {
	            if(mycommand >= 0 and mycommand <= 50) {
	                GS.firingrate= 25
	                gen= instance_create(x, y, 699/* obj_carrotstargen */)
	                gen.dmg= GS.monsteratk[myself]
	                gen.$Alarm0.start((8) / 30.0)
	            } else  {
	                GS.firingrate= 20
	                gen= instance_create(x, y, 699/* obj_carrotstargen */)
	                gen.dmg= GS.monsteratk[myself]
	                gen.$Alarm1.start((8) / 30.0)
	            }
	            gen.myself= myself
	        }
	        if(mycommand >= 0)
	            GS.msg[0]= "* 02 seems to be bothered by&  his outfit."
	        if(mycommand >= 25) GS.msg[0]= "* 01 is polishing his face."
	        if(mycommand >= 50) GS.msg[0]= "* 01 stands guard."
	        if(mycommand >= 75) GS.msg[0]= "* 02 watches your movements."
	        if(mycommand >= 90) GS.msg[0]= "* Smells like a military zoo."
	        pop= scr_monstersum()
	        if(pop == 1) {
	            if(mycommand >= 0)
	                GS.msg[0]= "* 01 holds his head in his&  hands."
	            if(mycommand >= 25)
	                GS.msg[0]= "* Anguished noises come from&  inside 01\'s armor."
	            if(mycommand >= 50) GS.msg[0]= "* 01 stands still."
	            if(mycommand >= 75) GS.msg[0]= "* 01 doesn\'t know what to do."
	        }
	        if(GS.monsterhp[myself] < 30)
	            GS.msg[0]= "* 01\'s breathing intensifies."
	        attacked= 1
	    }
	}
	if(GS.myfight == 2 and whatiheard != -1 and GS.heard == 0) {
	    if(whatiheard == 0) {
	        GS.msc= 0
	        GS.msg[0]= "* RG 01 - ATK 30 DEF 20&* Royal Guard member with&  shining^1, polished armor./^"
	        if(scr_murderlv() >= 12 and GS.flag[27] == 0)
	            GS.msg[0]= "* I see two lovers staring over&  the edge of the cauldron of&  hell./^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	        whatiheard= 9
	    }
	    if(whatiheard == 1) {
	        GS.msc= 0
	        GS.msg[0]= "* You attempt to touch RG 01\'s&  armor^1.&* Your hands slip off./^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    if(whatiheard == 3) {
	        GS.msc= 0
	        GS.msg[0]= "* You tell RG 01 to be honest&  with his feelings./^"
	        if(shake == 1) toldhim= 1
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    GS.heard= 1
	}
	if(toldhim == 1 and GS.turntimer > 1 and GS.turntimer < 5 and GS.mnfight == 2 and con == 0 and scr_monstersum() == 2) {
	    GS.turntimer= -1
	    GS.mnfight= 5
	    GS.border= 0
	    obj_heart.x= -800
	    obj_heart.movement= -1
	}
	if(GS.mnfight == 5) {
	    if(con == 0 and toldhim == 1) {
	        caster_pause(GS.batmusic)
	        con= 1
	        $Alarm4.start((20) / 30.0)
	    }
	    if(con == 2) {
	        blcon= instance_create(x + blconx + 28, y + blcony, 186/* obj_blconsm */)
	        GS.typer= 2
	        GS.msg[0]= "D-dude&.../"
	        GS.msg[1]= "I can\'t&.../"
	        GS.msg[2]= "I can\'t&take&this&anymore!/"
	        GS.msg[3]= "Not like&this!!/%%"
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
	        GS.msg[0]= "Like^1, 02!&I like.../"
	        GS.msg[1]= "I like^1, LIKE you^1,&bro!/"
	        GS.msg[2]= "The way you fight..^1.&The way you talk.../"
	        GS.msg[3]= "I love doing team&attacks with you./"
	        GS.msg[4]= "I love standing here&with you^1, bouncing&and waving our&weapons in sync.../"
	        GS.msg[5]= "02..^1.&I^1, like^1, want to stay&like this forever.../%%"
	        scr_blcon_x(blconx + 50, blcony)
	    }
	    if(con == 4 and not instance_exists(782/* OBJ_WRITER */)) {
	        caster_pause(conmusic)
	        con= 5
	        // obj_bara02
	        with(310) {
	            blcon= instance_create(x - blconx, y + blcony, 186/* obj_blconsm */)
	            obj_bara01.blcon= blcon
	            blcon.sprite_index= 20/* spr_blconsm2 */
	            GS.typer= 2
	            GS.msg[0]= "^1.^1../"
	            GS.msg[1]= "^1.^1.^1.^1./%%"
	            writer= instance_create(blcon.x + 15, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	        }
	    }
	    if(con == 5 and not instance_exists(782/* OBJ_WRITER */)) {
	        with(mypart1) event_user(2)
	        with(blcon) instance_destroy()
	        blcon= instance_create(x + blconx + 28, y + blcony, 186/* obj_blconsm */)
	        GS.typer= 2
	        GS.msg[0]= "Uh.../"
	        GS.msg[1]= "I mean,&uh.../"
	        GS.msg[2]= "Psyche!&Gotcha,&bro!!!&Haha!/%%"
	        if(GS.flag[401] == 1) {
	            GS.msg[2]= "Whew,&bro!&That&human,/"
	            GS.msg[3]= "Put me&under,&uh, mind&control!/"
	            GS.msg[4]= "What was&I just&saying?/"
	            GS.msg[5]= "It\'s all&a blur,&dude!!&Whoops!/%%"
	        }
	        writer= instance_create(blcon.x + 15, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	        con= 6
	    }
	    if(con == 6 and not instance_exists(782/* OBJ_WRITER */)) {
	        with(blcon) instance_destroy()
	        con= 7
	        // obj_bara02
	        with(310) {
	            blcon= instance_create(x - blconx, y + blcony, 186/* obj_blconsm */)
	            obj_bara01.blcon= blcon
	            blcon.sprite_index= 20/* spr_blconsm2 */
	            GS.typer= 2
	            GS.msg[0]= "... 01./%%"
	            writer= instance_create(blcon.x + 15, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	        }
	    }
	    if(con == 7 and not instance_exists(782/* OBJ_WRITER */)) {
	        with(mypart1) shaker= 2
	        with(blcon) instance_destroy()
	        blcon= instance_create(x + blconx + 28, y + blcony, 186/* obj_blconsm */)
	        GS.typer= 2
	        GS.msg[0]= "Y-yeah,&bro??/%%"
	        writer= instance_create(blcon.x + 15, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	        con= 8
	    }
	    if(con == 8 and not instance_exists(782/* OBJ_WRITER */)) {
	        with(mypart1) shaker= 0
	        with(blcon) instance_destroy()
	        con= 9
	        // obj_bara02
	        with(310) {
	            blcon= instance_create(x - blconx, y + blcony, 186/* obj_blconsm */)
	            obj_bara01.blcon= blcon
	            blcon.sprite_index= 20/* spr_blconsm2 */
	            GS.typer= 2
	            GS.msg[0]= ".../"
	            GS.msg[1]= "... do&you want&to.../"
	            GS.msg[2]= "... get&some ice&cream.../"
	            GS.msg[3]= "...&after&this?/%%"
	            writer= instance_create(blcon.x + 15, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	        }
	    }
	    if(con == 9 and not instance_exists(782/* OBJ_WRITER */)) {
	        with(mypart1) shaker= 0
	        with(blcon) instance_destroy()
	        blcon= instance_create(x + blconx + 28, y + blcony, 186/* obj_blconsm */)
	        GS.typer= 2
	        GS.msg[0]= "Like.../"
	        GS.msg[0]= "Sure,&dude!&Haha!/%%"
	        writer= instance_create(blcon.x + 15, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	        con= 10
	    }
	    if(con == 10 and not instance_exists(782/* OBJ_WRITER */)) {
	        with(blcon) instance_destroy()
	        GS.mnfight= 3
	        con= 11
	        mercymod= 999
	        GS.monsterdef[myself]= -999
	        // obj_bara02
	        with(310) {
	            mercymod= 999
	            GS.monsterdef[myself]= -999
	        }
	        caster_free(conmusic)
	        GS.msg[0]= "* 01 and 02 are looking at&  each other happily."
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
