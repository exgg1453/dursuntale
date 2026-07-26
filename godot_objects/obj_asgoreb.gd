# Auto-converted from GameMaker: obj_asgoreb
# GM parent: obj_monsterparent
extends Node2D

func _ready():
	scr_monstersetup()
	// obj_battlebg
	with(185) instance_destroy()
	x-= 40
	image_speed= 0
	part1= 488
	mypart1= _spawn("part1", x + 40, y)
	part2= 489
	mypart2= _spawn("part2", x + 76 + 40, y + 100)
	GS.tempvalue[10]= 1
	GS.mercy= 2
	obj_sparebt.visible= 0
	$Alarm9.start((8) / 30.0)
	hurtanim= 0
	hurtsound= 96
	talked= 0
	whatiheard= -1
	attacked= 0
	killed= 0
	GS.heard= 0
	takedamage= 0
	mercymod= 10
	sha= 0
	shb= 0
	myself= 0
	turns= 0
	turnoff= 0
	dont= 0
	ttttt= 0
	talk_x= 0
	ht= 240
	wd= 300

func _gm_event_2_9():
	mypart1.parent= GS.monsterinstance[myself]

func _gm_event_2_8():
	snd_play(hurtsound)

func _gm_event_2_6():
	gg= floor(random(3))
	mycommand= round(random(100))
	GS.msg[0]= "Default"
	if(mycommand < 75) GS.msg[0]= "No 2"
	if(mycommand < 50) GS.msg[0]= "No 3"
	if(mycommand < 25) GS.msg[0]= "No 4"
	if(whatiheard == 1) GS.msg[0]= "Action1"
	if(whatiheard == 3) GS.msg[0]= "Action2"
	if(whatiheard == 4) GS.msg[0]= "Action3"
	turns++
	GS.msg[1]= "%%%"
	GS.typer= 2
	GS.border= 29
	obj_heart.x= round((GS.idealborder[0] + GS.idealborder[1]) / 2) - 8
	obj_heart.y= round((GS.idealborder[2] + GS.idealborder[3]) / 2) - 8

func _gm_event_2_5():
	talked= 0
	GS.mnfight= 2
	ttttt= 0
	if(turns == 4) ttttt= 1
	if(turns == 8) ttttt= 1
	if(turns == 12) ttttt= 1
	if(turns == 16) ttttt= 1
	if(turns == 20) ttttt= 1
	if(turns == 23) ttttt= 1
	if(ttttt == 0) GS.border= 30

func _gm_event_2_3():
	if(GS.monsterhp[myself] - takedamage <= 500) {
	    dmgwriter= instance_create(x, y + 150, 189/* obj_dmgwriter */)
	    GS.fivedamage= GS.monsterhp[myself] - 30
	    if(GS.fivedamage <= 0) GS.fivedamage= 1
	    with(dmgwriter) dmg= GS.fivedamage
	    instance_create(128, 46, 493/* obj_asgore_lastcutscene */)
	    caster_free(-3)
	    obj_purplegradienter.fade= 1
	    // obj_orangeparticlegen
	    with(484) instance_destroy()
	    snd_play(51/* snd_damage */)
	    with(mypart1) instance_destroy()
	    // obj_asgorespear
	    with(489) instance_destroy()
	    instance_destroy()
	} else  {
	    if(mypart1.pause != 1) {
	        dmgwriter= instance_create(x, y + 150, 189/* obj_dmgwriter */)
	        GS.damage= takedamage
	        with(dmgwriter) dmg= GS.damage
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
	    } else  $Alarm3.start((2) / 30.0)
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
	    $Alarm5.start((10) / 30.0)
	    $Alarm6.start((1) / 30.0)
	    talked= 1
	    GS.heard= 0
	}
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
	    instance_create(x, y - 24, 189/* obj_dmgwriter */)
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
	        if(turns == 1) {
	            GS.turntimer= 110
	            gen= instance_create(0, 0, 460/* obj_handbulletgen */)
	            gen.type= 1
	        }
	        if(turns == 2) {
	            GS.turntimer= 160
	            gen= instance_create(0, 0, 464/* obj_asgoreattackgen */)
	            gen.t= 1
	        }
	        if(turns == 3) {
	            GS.turntimer= 180
	            gen= instance_create(0, 0, 467/* obj_sinefiregen_asg_lv2_usethis */)
	        }
	        if(turns == 4) {
	            GS.turntimer= 9999
	            gen= instance_create(0, 0, 476/* obj_asgore_spearswipegen */)
	            gen.diff= 0
	        }
	        if(turns == 5) {
	            GS.turntimer= 175
	            gen= instance_create(0, 0, 459/* obj_randomhandgen */)
	            gen.factor= 40
	        }
	        if(turns == 6) {
	            GS.turntimer= 190
	            gen= instance_create(0, 0, 470/* obj_cfiregen */)
	            gen.diff= 0
	        }
	        if(turns == 7) {
	            GS.turntimer= 160
	            gen= instance_create(0, 0, 462/* obj_firestormgen */)
	            gen.diff= 0
	            gen.lv= 1
	        }
	        if(turns == 8) {
	            GS.turntimer= 9999
	            gen= instance_create(0, 0, 476/* obj_asgore_spearswipegen */)
	            gen.diff= 1
	        }
	        if(turns == 9) {
	            GS.turntimer= 145
	            gen= instance_create(0, 0, 464/* obj_asgoreattackgen */)
	            gen.t= 2
	        }
	        if(turns == 10) {
	            GS.turntimer= 190
	            gen= instance_create(0, 0, 459/* obj_randomhandgen */)
	            gen.factor= 35
	        }
	        if(turns == 11) {
	            GS.turntimer= 180
	            gen= instance_create(0, 0, 470/* obj_cfiregen */)
	            gen.diff= 1
	        }
	        if(turns == 12) {
	            GS.turntimer= 9999
	            gen= instance_create(0, 0, 476/* obj_asgore_spearswipegen */)
	            gen.diff= 1
	        }
	        if(turns == 13) {
	            GS.turntimer= 140
	            gen= instance_create(0, 0, 462/* obj_firestormgen */)
	            gen.lv= 2
	        }
	        if(turns == 14) {
	            GS.turntimer= 190
	            gen= instance_create(0, 0, 468/* obj_sinefiregen_asglv3 */)
	        }
	        if(turns == 15) {
	            GS.turntimer= 175
	            gen= instance_create(0, 0, 470/* obj_cfiregen */)
	            gen.diff= 2
	        }
	        if(turns == 16) {
	            GS.turntimer= 9999
	            gen= instance_create(0, 0, 476/* obj_asgore_spearswipegen */)
	            gen.diff= 2
	        }
	        if(turns == 17) {
	            GS.turntimer= 173
	            gen= instance_create(0, 0, 459/* obj_randomhandgen */)
	            gen.factor= 30
	        }
	        if(turns == 18) {
	            GS.turntimer= 188
	            gen= instance_create(0, 0, 470/* obj_cfiregen */)
	            gen.diff= 3
	        }
	        if(turns == 19) {
	            GS.turntimer= 130
	            gen= instance_create(0, 0, 462/* obj_firestormgen */)
	            gen.lv= 3
	        }
	        if(turns == 20) {
	            GS.turntimer= 9999
	            gen= instance_create(0, 0, 476/* obj_asgore_spearswipegen */)
	            gen.diff= 3
	        }
	        if(turns == 21 or turns == 22) {
	            if(GS.monsterdef[myself] > -90)
	                GS.monsterdef[myself]-= 5
	            ch= choose(0, 1, 2, 3, 4)
	            if(ch == 0) {
	                GS.turntimer= 188
	                gen= instance_create(0, 0, 470/* obj_cfiregen */)
	                gen.diff= 3
	            }
	            if(ch == 1) {
	                GS.turntimer= 130
	                gen= instance_create(0, 0, 462/* obj_firestormgen */)
	                gen.lv= 3
	            }
	            if(ch == 2) {
	                GS.turntimer= 173
	                gen= instance_create(0, 0, 459/* obj_randomhandgen */)
	                gen.factor= 30
	            }
	            if(ch == 3) {
	                GS.turntimer= 190
	                gen= instance_create(0, 0, 468/* obj_sinefiregen_asglv3 */)
	            }
	            if(ch == 4) {
	                GS.turntimer= 145
	                gen= instance_create(0, 0, 464/* obj_asgoreattackgen */)
	                gen.t= 2
	            }
	        }
	        if(turns >= 20 and GS.monsterdef[myself] > -120)
	            GS.monsterdef[myself]-= 10
	        if(turns == 23) {
	            GS.turntimer= 9999
	            gen= instance_create(0, 0, 476/* obj_asgore_spearswipegen */)
	            gen.diff= 3
	            turns= 20
	        }
	        turnoff= 1
	        toriel= 0
	        if(toriel == 1) {
	            if(mycommand >= 0 and mycommand <= 20) {
	                GS.turntimer= 140
	                GS.firingrate= 5
	                gen= instance_create(0, 0, 713/* obj_1sidegen */)
	                gen.bullettype= 7
	            }
	            if(mycommand > 20 and mycommand <= 40) {
	                GS.turntimer= 140
	                GS.firingrate= 2
	                gen= instance_create(0, 0, 713/* obj_1sidegen */)
	                gen.bullettype= 8
	            }
	            if(mycommand > 80 and mycommand <= 100) {
	                GS.turntimer= 200
	                GS.firingrate= 2
	                gen= instance_create(GS.idealborder[0] - 45, GS.idealborder[2] + 5, 614/* blt_handbullet1 */)
	                if(GS.hp > 6) gen.dmg= 5
	            }
	            if(mycommand > 60 and mycommand <= 80) {
	                GS.turntimer= 200
	                GS.firingrate= 2
	                gen= instance_create(GS.idealborder[0] - 45, GS.idealborder[2] + 5, 614/* blt_handbullet1 */)
	                gen.x1= 1
	                if(GS.hp > 6) gen.dmg= 5
	                gen2= instance_create(GS.idealborder[1] + 5, GS.idealborder[3] - 15, 615/* blt_handbullet2 */)
	                if(GS.hp > 6) gen2.dmg= 5
	            }
	            if(mycommand > 40 and mycommand <= 60) {
	                GS.turntimer= 140
	                GS.firingrate= 6
	                gen= instance_create(0, 0, 713/* obj_1sidegen */)
	                gen.bullettype= 10
	            }
	        }
	        gen.myself= myself
	        if(mycommand >= 0) GS.msg[0]= "* ..."
	        if(GS.monsterhp[myself] <= GS.monstermaxhp[myself] / 4)
	            GS.msg[0]= "* Asgore has low HP."
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
	        GS.msg[0]= "* ASGORE 80 ATK 80 DEF /^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	        whatiheard= 9
	    }
	    if(whatiheard == 3) {
	        ini_open("undertale.ini")
	        ky= ini_read_real("Asgore", "KillYou", 0)
	        ini_close()
	        GS.msc= 0
	        GS.msg[0]= "* But there was nothing to&  say./^"
	        if(GS.kills == 0) {
	            if(talk_x == 0) {
	                GS.msg[0]= "* You quietly tell ASGORE&  you don\'t want to fight&  him./"
	                GS.msg[1]= "* His hands tremble for a&  moment./^"
	            }
	            if(talk_x == 1) {
	                GS.msg[0]= "* You tell ASGORE that you&  don\'t want to fight him./"
	                GS.msg[1]= "* His breathing gets funny&  for a moment./^"
	            }
	            if(talk_x == 2) {
	                GS.msg[0]= "* You firmly tell ASGORE to&  STOP fighting./"
	                GS.msg[1]= "* Recollection flashes in his&  eyes.../"
	                GS.msg[2]= "* ASGORE\'s ATTACK dropped^1!&* ASGORE\'s DEFENSE dropped!/^"
	                GS.monsteratk[myself]--
	                GS.monsterdef[myself]-= 10
	            }
	            if(talk_x >= 3 and talk_x != 8)
	                GS.msg[0]= "* Seems talking won\'t do any&  more good./^"
	            if(talk_x == 8) GS.msg[0]= "* All you can do is FIGHT./^"
	        }
	        if(talk_x == 0 and ky > 0) {
	            vari= "too many times&  to count"
	            if(ky == 1) vari= "once before"
	            if(ky == 2) vari= "twice before"
	            if(ky == 3) vari= "three times"
	            if(ky == 4) vari= "four times"
	            if(ky == 5) vari= "five times"
	            if(ky == 6) vari= "six times"
	            if(ky == 7) vari= "seven times"
	            if(ky == 8) vari= "eight times"
	            if(ky == 9) vari= "nine times"
	            GS.msg[0]= "* You tell ASGORE that he\'s&  killed you " + vari + "./"
	            GS.msg[1]= "* He nods sadly./^"
	            if(ky > 4) GS.msg[1]= "* He nods grievously./^"
	            if(ky > 9) GS.msg[1]= "* He nods pitifully./^"
	        }
	        talk_x++
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
	curatk= GS.monsteratk[myself]
	if(turnoff == 1 and GS.turntimer <= 0) {
	    dont= 0
	    GS.turntimer= -1
	    turnoff= 0
	    GS.mnfight= 3
	    GS.myfight= -1
	}

func _on_outside_room():
	if(GS.debug == 1) {
	    draw_set_color(255)
	    draw_text(0, 0, turns)
	    if(Input.is_key_pressed(83)) turns++
	    if(Input.is_key_pressed(65)) turns--
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
