# Auto-converted from GameMaker: obj_tembattle
# GM parent: obj_monsterparent
extends Node2D

func _ready():
	scr_monstersetup(0, 0, 0, 0, 0)
	image_speed= 0
	part1= 294
	mypart1= _spawn("part1", x, y)
	hurtanim= 0
	hurtsound= 43
	talked= 0
	whatiheard= -1
	attacked= 0
	killed= 0
	GS.heard= 0
	takedamage= 0
	mercymod= -40
	sha= 0
	shb= 0
	flex= 0
	dunk= 0
	ht= 100
	wd= 100

func _gm_event_1_0():
	if(mercymod > 10 and GS.monsterhp[myself] == GS.monstermaxhp[myself])
	    GS.goldreward[3]+= 30
	scr_monsterdefeat(0, 0, 0, 0, 0)
	with(mypart1) instance_destroy()

func _gm_event_2_8():
	snd_play(hurtsound)

func _gm_event_2_7():
	caster_resume(GS.batmusic)
	mycommand= round(random(100))
	GS.myfight= 0
	GS.mnfight= 1

func _gm_event_2_6():
	if(whatiheard == 7) {
	    talked= 0
	    whatiheard= -1
	    GS.mnfight= 2
	    GS.border= 7
	    $Alarm5.start((-2) / 30.0)
	    if(instance_exists(671/* blt_temhand */)) {
	        // blt_temhand
	        with(671) instance_destroy()
	    }
	    obj_heart.x= round((GS.idealborder[0] + GS.idealborder[1]) / 2) - 8
	    obj_heart.y= round((GS.idealborder[2] + GS.idealborder[3]) / 2) - 8
	} else  {
	    blcon= instance_create(x + 95, y - 25, 186/* obj_blconsm */)
	    gg= floor(random(3))
	    mycommand= round(random(100))
	    if(mycommand >= 0) GS.msg[0]= "awwAwa&cute!!&(pets u)"
	    if(mycommand > 25 and mycommand < 50) {
	        GS.msg[0]= "OMG!!&humans&TOO CUTE&(dies)"
	        with(mypart1) instance_destroy()
	        frame= 1
	    }
	    if(mycommand >= 50) GS.msg[0]= "hOI!!!&i\'m&TEMMIE!!"
	    if(mycommand >= 75) GS.msg[0]= "fhsdhjf&dsfjsd&dshjfsd"
	    if(whatiheard == 3)
	        GS.msg[0]= "NO!!!!!&muscles&......&NOT CUTE"
	    if(whatiheard == 1) {
	        GS.msg[0]= "NO!!!&so&hungr...&(dies)"
	        with(mypart1) instance_destroy()
	        frame= 1
	    }
	    if(whatiheard == 4) GS.msg[0]= "hOI!!!&i\'m&tEMMIE!!"
	    if(whatiheard == 6) {
	        GS.msg[0]= "FOOB!!!"
	        mercymod= 300
	    }
	    GS.msg[1]= "%%%"
	    GS.typer= 2
	    blconwd= instance_create(blcon.x + 15, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	    GS.border= 6
	    obj_heart.x= round((GS.idealborder[0] + GS.idealborder[1]) / 2) - 8
	    obj_heart.y= round((GS.idealborder[2] + GS.idealborder[3]) / 2) - 8
	    GS.heard= 0
	}

func _gm_event_2_5():
	with(blconwd) instance_destroy()
	with(blcon) instance_destroy()
	talked= 0
	whatiheard= -1
	GS.mnfight= 2
	GS.border= 7
	if(mycommand >= 25) GS.border= 10
	SCR_BORDERSETUP()
	frame= 0

func _gm_event_2_3():
	if(frame == 0) {
	    with(mypart1) instance_destroy()
	    dmgwriter= instance_create(x + sprite_width / 2 - 48, y + 120, 189/* obj_dmgwriter */)
	    GS.damage= takedamage
	    with(dmgwriter) dmg= GS.damage
	    frame= 1
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
	    GS.monsterhp[myself]-= takedamage
	    with(dmgwriter) $Alarm2.start((15) / 30.0)
	    if(GS.monsterhp[myself] >= 1) {
	        mypart1= _spawn("part1", x, y)
	        GS.hurtanim[myself]= 0
	        frame= 0
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
	if(GS.mnfight == 2 and attacked == 0) {
	    pop= scr_monstersum()
	    with(mypart1) instance_destroy()
	    mypart1= _spawn("part1", x, y)
	    GS.turntimer= 160
	    GS.firingrate= 25
	    if(pop == 3) GS.firingrate*= 2.4
	    if(pop == 2) GS.firingrate*= 1.7
	    if(mycommand >= 0 and mycommand < 25) {
	        GS.turntimer= 200
	        gen= instance_create(x + 24, y + 96, 671/* blt_temhand */)
	        gen.dmg= GS.monsteratk[myself]
	    } else  {
	        GS.firingrate= 4
	        gen= instance_create(GS.idealborder[0] + 80 + random(20), GS.idealborder[2], 662/* obj_maintem */)
	        gen.bullettype= 0
	    }
	    gen.myself= myself
	    if(mycommand >= 0)
	        GS.msg[0]= "* Temmie is trying to glomp&  you."
	    if(mycommand >= 25)
	        GS.msg[0]= "* Temmie forgot her other&  attack."
	    if(mycommand >= 50) GS.msg[0]= "* Temmie vibrates intensely."
	    if(mycommand >= 75) GS.msg[0]= "* Temmie is doing her hairs."
	    if(mycommand >= 83)
	        GS.msg[0]= "* Temmiy accidentally misspells&  her own name."
	    if(mycommand >= 90) GS.msg[0]= "* Smells like Temmie Flakes."
	    if(GS.monsterhp[myself] < 3)
	        GS.msg[0]= "* How\'d you do that?"
	    attacked= 1
	}
	if(GS.myfight == 2 and whatiheard != -1 and GS.heard == 0) {
	    if(whatiheard == 0) {
	        GS.msc= 0
	        GS.msg[0]= "* TEMMIE - RATED TEM OUTTA TEM&* Loves to pet cute humans^1.&* But you\'re allergic!/^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	        whatiheard= 9
	    }
	    if(whatiheard == 1) {
	        scr_itemcheck(22)
	        if(haveit == 0) {
	            GS.msc= 0
	            GS.msg[0]= "* Temmie only wants the&  Temmie Flakes./^"
	            OBJ_WRITER.halt= 3
	            iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	            with(iii) halt= 0
	        } else  {
	            GS.msc= 0
	            GS.myfight= 3
	            GS.bmenuno= 6
	            GS.msg[0]= "   Give the Temmie Flakes?& &   Yas             NO!!!!!!!\\C"
	            OBJ_WRITER.halt= 3
	            iii= instance_create(GS.idealborder[0], GS.idealborder[2], 785/* OBJ_INSTAWRITER */)
	        }
	    }
	    if(whatiheard == 3) {
	        GS.msc= 0
	        GS.msg[0]= "* You flex at Temmie.../%%"
	        flex++
	        if(GS.at < 150) GS.at+= 7
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	        GS.monsteratk[myself]++
	    }
	    if(whatiheard == 4) {
	        GS.flag[146]= 1
	        GS.msc= 0
	        GS.msg[0]= "* You say hello to Temmie./^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	        mercymod= -10
	    }
	    if(whatiheard == 6) {
	        i= 0
	        n= 0
	        repeat(8)  {
	            if(GS.item[i] == 22) {
	                n= 1
	                GS.flag[146]= 1
	            } else  i++
	        }
	        scr_itemshift(i, 0)
	        // OBJ_INSTAWRITER
	        with(785) instance_destroy()
	        $Alarm6.start((1) / 30.0)
	        $Alarm5.start((100) / 30.0)
	        GS.myfight= 0
	    }
	    if(whatiheard == 7) {
	        with(mypart1) atk= 3
	        caster_pause(GS.batmusic)
	        $Alarm7.start((190) / 30.0)
	        // OBJ_INSTAWRITER
	        with(785) instance_destroy()
	        with(mypart1) sprite_index= 251/* spr_temsmug */
	        with(mypart1) $Alarm9.start((30) / 30.0)
	    }
	    GS.heard= 1
	}
	if(whatiheard == 3 and not instance_exists(782/* OBJ_WRITER */) and dunk == 0) {
	    blconx= instance_create(x + 95, y - 25, 186/* obj_blconsm */)
	    GS.msg[0]= "NO!!!!!&muscles&r.....&NOT CUTE/%%"
	    dunk= 1
	    GS.msg[1]= "%%%"
	    GS.typer= 2
	    blconxwd= instance_create(blconx.x + 15, blconx.y + 10, 784/* OBJ_NOMSCWRITER */)
	}
	if(dunk == 1 and not instance_exists(782/* OBJ_WRITER */)) {
	    with(blconx) instance_destroy()
	    GS.monstertype[1]= 23
	    GS.monsterinstance[1]= instance_create(420, 38, 289/* obj_aaron */)
	    obj_aaron.modulate.a= 0
	    obj_aaron.alphaup= 1
	    blconx= instance_create(obj_aaron.x + 95, obj_aaron.y - 25, 186/* obj_blconsm */)
	    blconx.z_index= 50
	    GS.msg[0]= "Ooh, I&have to&disagree&; )/%%"
	    if(GS.flag[95] == 1) GS.msg[0]= "Temmie^1,&are you&okay?&; )/%%"
	    GS.msg[1]= "%%%"
	    GS.typer= 2
	    GS.msc= 0
	    blcont= instance_create(blconx.x + 15, blconx.y + 10, 782/* OBJ_WRITER */)
	    blcont.z_index= -50
	    dunk= 2
	    GS.myfight= 999
	}
	if(dunk == 2 and not instance_exists(782/* OBJ_WRITER */)) {
	    with(blconx) instance_destroy()
	    frame= 1
	    blconx= instance_create(x + 95, y - 25, 186/* obj_blconsm */)
	    obj_tembody.visible= 0
	    GS.msg[0]= "NO!!!!!&!!!!!!!/%%"
	    GS.msg[1]= "%%%"
	    GS.typer= 2
	    blconxwd= instance_create(blconx.x + 15, blconx.y + 10, 784/* OBJ_NOMSCWRITER */)
	    dunk= 3
	}
	if(dunk == 3 and not instance_exists(782/* OBJ_WRITER */)) {
	    with(blconx) instance_destroy()
	    mercymod= 222
	    obj_aaron.flex= 2
	}
	if(GS.myfight == 4 and GS.mercyuse == 0) {
	    script_execute(163/* scr_mercystandard */)
	    if(mercy < 0) instance_destroy()
	}
	if(mercymod == 222 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.myfight= 4
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
