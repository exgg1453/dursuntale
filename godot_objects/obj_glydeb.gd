# Auto-converted from GameMaker: obj_glydeb
# GM parent: obj_monsterparent
extends Node2D

func _ready():
	GS.flag[282]= 1
	scr_monstersetup()
	image_speed= 0
	part1= 227
	mypart1= _spawn("part1", x + 72, y + 24)
	$Alarm9.start((8) / 30.0)
	hurtanim= 0
	hurtsound= 38
	talked= 0
	whatiheard= -1
	attacked= 0
	killed= 0
	GS.heard= 0
	takedamage= 0
	mercymod= -50
	sha= 0
	shb= 0
	ht= 200
	wd= 240
	applaud= 0
	nothing= 0
	boo= 0

func _gm_event_1_0():
	if(mercymod > 10) GS.goldreward[3]+= 120
	scr_monsterdefeat()
	with(mypart1) instance_destroy()

func _gm_event_2_9():
	mypart1.parent= GS.monsterinstance[myself]

func _gm_event_2_8():
	snd_play(hurtsound)

func _gm_event_2_6():
	blcon= instance_create(x + 220, y, 186/* obj_blconsm */)
	gg= floor(random(3))
	mycommand= round(random(100))
	GS.msg[0]= "How&great&I am."
	if(mycommand < 75) GS.msg[0]= "Look.&Watch.&Observe."
	if(mycommand < 50) GS.msg[0]= "Wow.&Check&out my&pecs."
	if(mycommand < 25) GS.msg[0]= "Sorry...&for&NOTHING&*ollies*"
	if(whatiheard == 1) {
	    GS.msg[0]= "Bepis"
	    if(boo == 1) GS.msg[0]= "Boo?&What a&wimpy&ghost."
	    if(boo >= 2) GS.msg[0]= "Mmm,&Fresh&Sweet&Haters"
	}
	if(whatiheard == 3) {
	    GS.msg[0]= "OK!&I rule!&I admit&it!"
	    if(applaud >= 2) GS.msg[0]= "What&else do&you have&to say!?"
	}
	if(whatiheard == 4) {
	    GS.msg[0]= "..."
	    if(nothing == 1) GS.msg[0]= "Eh?&You&forgot&to clap."
	    if(nothing == 2) GS.msg[0]= "HELLO??&I\'M&RIGHT&HERE!!!"
	}
	GS.msg[1]= "%%%"
	GS.typer= 2
	blconwd= instance_create(blcon.x + 15, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	GS.border= 3
	obj_heart.x= round((GS.idealborder[0] + GS.idealborder[1]) / 2) - 8
	obj_heart.y= round((GS.idealborder[2] + GS.idealborder[3]) / 2) - 8

func _gm_event_2_5():
	with(blconwd) instance_destroy()
	with(blcon) instance_destroy()
	talked= 0
	GS.mnfight= 2
	GS.border= 3

func _gm_event_2_3():
	if(mypart1.pause != 1) {
	    dmgwriter= instance_create(x + 10, y + ht, 189/* obj_dmgwriter */)
	    takedamage= ceil(takedamage / 3)
	    GS.damage= takedamage
	    with(dmgwriter) dmg= GS.damage
	    mypart1.pause= 1
	    snd_play(51/* snd_damage */)
	    $Alarm8.start((11) / 30.0)
	    shker= instance_create(0, 0, 1669/* obj_objshake */)
	    shker.obj= mypart1
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
	    with(mypart1) {
	        sh_timer= 0
	        sh= 0
	        $Alarm1.start((-1) / 30.0)
	        attackmode= 0
	    }
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
	        GS.hurtanim[myself]= 0
	        mypart1.pause= 0
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
	        if(mycommand < 40) {
	            with(mypart1) {
	                sh= 1
	                attackmode= 1
	                sh_speed= 1
	                diff= 5
	            }
	        }
	        if(mycommand >= 40 and mycommand < 70) {
	            with(mypart1) {
	                sh= 1
	                attackmode= 1
	                sh_speed= 2
	                diff= 3
	            }
	        }
	        if(mycommand > 70) {
	            with(mypart1) {
	                attackmode= 1
	                $Alarm1.start((5) / 30.0)
	            }
	        }
	        if(mycommand >= 0) GS.msg[0]= "* Glyde does fancy flips."
	        if(mycommand >= 25)
	            GS.msg[0]= "* Glyde is giving itself a&  high five^1.&* ... somehow."
	        if(mycommand >= 50)
	            GS.msg[0]= "* Glyde sees its reflection &  and gets jealous."
	        if(mycommand >= 75)
	            GS.msg[0]= "* Glyde is thinking of new&  slang for the word " + chr(ord('"')) + "cool." + chr(ord('"')) + "&* Like " + chr(ord('"')) + "freakadacious." + chr(ord('"')) + ""
	        if(mycommand >= 90)
	            GS.msg[0]= "* An arrogant-smelling wind&  blows through."
	        if(nothing == 2)
	            GS.msg[0]= "* Glyde is doing tons of flips&  to get your attention."
	        if(mercymod > 100) GS.msg[0]= "* Glyde seems satisfied."
	        if(GS.monsterhp[myself] <= GS.monstermaxhp[myself] / 4)
	            GS.msg[0]= "* Glyde is dying^1, but in a&  cool way."
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
	        GS.msg[0]= "* GLYDE - ATK HIGH DEF HIGH&* Refuses to give more details&  about its statistics./^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	        whatiheard= 9
	    }
	    if(whatiheard == 3) {
	        GS.msc= 0
	        if(applaud == 0) {
	            GS.msg[0]= "* You clap really sloppily^1.&* Glyde sucks up your praise&  like a vacuum cleaner./^"
	            applaud= 1
	        } else  {
	            GS.msg[0]= "* You clap like a gorilla^1.&* Glyde is becoming addicted to&  your praise./^"
	            if(applaud == 1) applaud= 2
	        }
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    if(whatiheard == 1) {
	        GS.msc= 0
	        GS.msg[0]= "* You boo..^1. but haters&  only make Glyde stronger^1.&* Glyde ATTACK UP+DEFENSE DOWN./^"
	        GS.monsteratk[myself]+= 2
	        GS.monsterdef[myself]-= 10
	        if(nothing == 2) {
	            GS.msg[0]= "* You boo loudly^1.&* Glyde leaves to look elsewhere&  for praise./^"
	            nothing= 3
	            mercymod= 222
	        }
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	        boo++
	    }
	    if(whatiheard == 4) {
	        GS.msc= 0
	        GS.msg[0]= "* You do nothing^1.&* No effect./^"
	        if(applaud >= 2) {
	            if(nothing == 2) {
	                GS.msg[0]= "* You do nothing^1.&* Glyde leaves to look elsewhere&  for praise./^"
	                nothing= 3
	                mercymod= 222
	            }
	            if(nothing == 1) {
	                GS.msg[0]= "* You do nothing^1.&* Glyde looks desperate for&  attention./^"
	                nothing= 2
	            }
	            if(nothing == 0) {
	                GS.msg[0]= "* You do nothing^1.&* Glyde looks disappointed you&  aren\'t paying attention./^"
	                nothing= 1
	            }
	        }
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    GS.heard= 1
	}
	if(GS.myfight == 4 and GS.mercyuse == 0) {
	    script_execute(163/* scr_mercystandard */)
	    if(mercy < 0) instance_destroy()
	}
	if(mercymod == 222 and not instance_exists(782/* OBJ_WRITER */)) {
	    script_execute(163/* scr_mercystandard */)
	    if(mercy < 0) instance_destroy()
	}
	if(GS.turntimer < 2 and GS.mnfight == 2) GS.mnfight= 3

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
