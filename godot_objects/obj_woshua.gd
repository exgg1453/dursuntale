# Auto-converted from GameMaker: obj_woshua
# GM parent: obj_monsterparent
extends Node2D

func _ready():
	scr_monstersetup(0, 0, 0, 0, 0)
	image_speed= 0
	part1= 258
	mypart1= _spawn("part1", x, y)
	hurtanim= 0
	hurtsound= 43
	talked= 0
	whatiheard= -1
	attacked= 0
	killed= 0
	GS.heard= 0
	takedamage= 0
	mercymod= 5
	sha= 0
	shb= 0
	dirtyjoke= 0
	alphaup= 0
	dub= 0
	slime= 0
	flex= 0
	clean= 0
	ht= 100
	wd= 100

func _gm_event_1_0():
	if(mercymod > 10 and GS.monsterhp[myself] == GS.monstermaxhp[myself]) {
	    GS.goldreward[3]+= 25
	    GS.flag[145]= 1
	}
	scr_monsterdefeat(0, 0, 0, 0, 0)
	with(mypart1) instance_destroy()

func _gm_event_2_8():
	snd_play(hurtsound)

func _gm_event_2_6():
	blcon= instance_create(x + 95, y - 25, 186/* obj_blconsm */)
	gg= floor(random(3))
	mycommand= round(random(100))
	if(mycommand < 5) bodypart= "face"
	if(mycommand >= 5) bodypart= "teeth&and eyes"
	if(mycommand >= 10) bodypart= "leg"
	if(mycommand >= 15) bodypart= "SOUL"
	if(mycommand >= 20) bodypart= "hand"
	if(mycommand >= 0 and mycommand < 25)
	    GS.msg[0]= "Wosh u&" + bodypart
	if(mycommand >= 25) {
	    GS.msg[0]= "*whistle&as it&cleans*"
	    if(GS.kills > 0) GS.msg[0]= "Your&SOUL&is&unclean"
	}
	if(mycommand >= 50) GS.msg[0]= "Out!!!&Darned&spot"
	if(mycommand >= 75 and dub == 1)
	    GS.msg[0]= "Oops, I&meant...&scrub a&sub-SUBS"
	if(mycommand >= 75 and dub == 0) {
	    GS.msg[0]= "Scrub a&dub-dubs"
	    dub= 1
	}
	if(whatiheard == 3) GS.msg[0]= "Green&means&clean"
	if(whatiheard == 1) {
	    GS.msg[0]= "Yuck!"
	    if(clean == 2) GS.msg[0]= "Fresh!"
	}
	if(whatiheard == 4) GS.msg[0]= "NO. THAT&JOKE\'S&TOO...&DIRTY"
	GS.msg[1]= "%%%"
	GS.typer= 2
	blconwd= instance_create(blcon.x + 15, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	blcontweet= instance_create(x, y - 40, 186/* obj_blconsm */)
	blcontweet.sprite_index= 23/* spr_blcontinyabove */
	GS.msc= 0
	GS.msg[0]= "\\Xtweet"
	GS.typer= 5
	blconwd2= instance_create(blcontweet.x + 15, blcontweet.y - 10, 785/* OBJ_INSTAWRITER */)
	blconwd2.shake= 1
	GS.border= 6
	obj_heart.x= round((GS.idealborder[0] + GS.idealborder[1]) / 2) - 8
	obj_heart.y= round((GS.idealborder[2] + GS.idealborder[3]) / 2) - 8

func _gm_event_2_5():
	with(blconwd) instance_destroy()
	with(blcon) instance_destroy()
	with(blconwd2) instance_destroy()
	with(blcontweet) instance_destroy()
	talked= 0
	whatiheard= -1
	GS.mnfight= 2
	GS.border= 7

func _gm_event_2_3():
	if(frame != 1) {
	    with(mypart1) instance_destroy()
	    dmgwriter= instance_create(x + sprite_width / 2 - 48, y - 24, 189/* obj_dmgwriter */)
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
	    GS.turntimer= 160
	    GS.firingrate= 3
	    if(pop == 3) GS.firingrate*= 3
	    if(pop == 2) GS.firingrate*= 2
	    type= 2
	    if(mycommand >= 0 and mycommand < 50) type= 1
	    if(clean == 1 or clean == 3) type= 1
	    if(type == 1) {
	        GS.turntimer= 180
	        if(pop == 1) GS.turntimer= 150
	        if(pop == 1) GS.firingrate= 3
	        GS.firingrate+= dirtyjoke
	        if(dirtyjoke > 3) dirtyjoke= 2
	        if(pop > 1)
	            gen= instance_create(GS.idealborder[0] + c_borderwidth(0) / 2, GS.idealborder[2] + 90 + c_borderheight(0) / 2, 690/* obj_woshspiralgen */)
	        if(pop == 1)
	            gen= instance_create(GS.idealborder[0] + c_borderwidth(0) / 2, GS.idealborder[2] - 5 + c_borderheight(0) / 2, 690/* obj_woshspiralgen */)
	        if(pop == 1) {
	            gen.blue= 0
	            if(mycommand) gen.turn= 6
	            qq= choose(0, 1)
	            if(qq == 0) {
	                gen.turn= -6
	                gen.backwards= 1
	            }
	            gen.direction= 60 + random(40)
	        }
	        if(clean == 1) {
	            gen.cleaner= 1
	            clean= 0
	        }
	        if(clean == 3) {
	            gen.cleaner= 1
	            clean= 2
	        }
	        gen.dmg= GS.monsteratk[myself]
	    } else  {
	        GS.firingrate= 4
	        gen= instance_create(GS.idealborder[0] + c_borderwidth(0) / 2, GS.idealborder[2] - 60 + c_borderheight(0) / 2, 666/* blt_soapbul */)
	        gen.dmg= GS.monsteratk[myself]
	        if(pop > 1) gen.offset= 1
	        qd= 0
	        if(dirtyjoke > 0) qd= dirtyjoke * 0.5
	        if(qd > 1) qd= 1
	        gen.speed= 4 - qd
	        gen.bullettype= 0
	    }
	    gen.myself= myself
	    if(mycommand >= 0)
	        GS.msg[0]= "* Woshua wonders if tears are&  sanitary."
	    if(mycommand >= 25)
	        GS.msg[0]= "* Woshua is friends with&  a little bird."
	    if(mycommand >= 50)
	        GS.msg[0]= "* Woshua is rinsing off a&  pizza."
	    if(mycommand >= 75)
	        GS.msg[0]= "* Woshua is looking for some&  good clean fun."
	    if(mycommand >= 90) GS.msg[0]= "* Smells like detergent."
	    if(GS.monsterhp[myself] < 30)
	        GS.msg[0]= "* Woshua is revolted at its own&  wounds."
	    attacked= 1
	}
	if(GS.myfight == 2 and whatiheard != -1 and GS.heard == 0) {
	    if(whatiheard == 0) {
	        GS.msc= 0
	        GS.msg[0]= "* WOSHUA - ATK 18 DEF 5&* This humble germophobe seeks&  to cleanse the whole world./^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	        whatiheard= 9
	    }
	    if(whatiheard == 1) {
	        GS.msc= 0
	        GS.msg[0]= "* You reach out^1.&* Woshua recoils from your&  touch./^"
	        if(slime == 1) {
	            GS.msg[0]= "* Woshua is terrified of&  your slimy body!&* It runs away./^"
	            mercymod= 333
	        }
	        if(clean == 2)
	            GS.msg[0]= "* You give Woshua a friendly&  pat./^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    if(whatiheard == 3) {
	        GS.msc= 0
	        GS.msg[0]= "* You ask Woshua to clean you^1.&* It hops around excitedly./^"
	        if(clean == 2) GS.msg[0]= "* Woshua continues cleaning./^"
	        if(clean == 0) clean= 1
	        if(clean == 2) clean= 3
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    if(whatiheard == 4) {
	        GS.msc= 0
	        jj= floor(random(3))
	        if(jj == 0)
	            GS.msg[0]= "* You tell a joke about two&  kids who played in a&  muddy flower garden./"
	        if(jj == 1)
	            GS.msg[0]= "* You tell a joke about a kid&  who ate a pie with&  their bare hands./"
	        if(jj == 2)
	            GS.msg[0]= "* You tell a joke about a kid&  who slept in the soil./"
	        GS.msg[1]= "* Woshua\'s powers neutralized!/^"
	        dirtyjoke++
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	        if(instance_exists(289/* obj_aaron */)) {
	            obj_aaron.whatiheard= 12
	            obj_aaron.mercymod= 450
	        }
	        if(GS.monsteratk[myself] > 3)
	            GS.monsteratk[myself]-= 2
	    }
	    GS.heard= 1
	}
	if(whatiheard == 3 and flex == 3 and instance_exists(782/* OBJ_WRITER */) and OBJ_WRITER.stringno == 1) {
	    velocity.y= -4
	    mypart1.velocity.y= -4
	}
	if(whatiheard == 3 and flex == 3 and not instance_exists(782/* OBJ_WRITER */)) {
	    script_execute(163/* scr_mercystandard */)
	    if(mercy < 0) instance_destroy()
	}
	if(alphaup == 1 and modulate.a < 1)
	    modulate.a+= 0.05
	if(GS.myfight == 4 and GS.mercyuse == 0) {
	    script_execute(163/* scr_mercystandard */)
	    if(mercy < 0) instance_destroy()
	}
	if(mercymod == 333 and not instance_exists(782/* OBJ_WRITER */)) {
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
