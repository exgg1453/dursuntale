# Auto-converted from GameMaker: obj_asrielb
# GM parent: obj_monsterparent
extends Node2D

func _ready():
	scr_monstersetup()
	image_speed= 0
	instance_create(0, 0, 570/* obj_roundedge */)
	part1= 569
	mypart1= instance_create(x, y, 569/* obj_asriel_body */)
	$Alarm9.start((8) / 30.0)
	hurtanim= 0
	hurtsound= 42
	talked= 0
	whatiheard= -1
	attacked= 0
	killed= 0
	GS.heard= 0
	takedamage= 0
	mercymod= -99999999999999
	sha= 0
	shb= 0
	scale.x= 2
	scale.y= 2
	turns= 0
	GS.flag[500]= 1
	GS.seriousbattle= 1
	GS.hope= 0
	hoped= 0
	dreamed= 0
	say= 0
	GS.flag[20]= 0
	turns= GS.flag[504] - 3
	if(turns < 0) turns= 0
	trcon= 0
	ht= 200
	wd= 100

func _gm_event_1_0():
	if(mercymod > 10 and GS.monsterhp[myself] == GS.monstermaxhp[myself])
	    GS.goldreward[3]+= 40
	scr_monsterdefeat(0, 0, 0, 0, 0)
	with(mypart1) instance_destroy()

func _gm_event_2_10():
	trcon++

func _gm_event_2_9():
	mypart1.parent= GS.monsterinstance[myself]

func _gm_event_2_6():
	blcon= instance_create(x + 120, y, 187/* obj_blconwdflowey */)
	gg= floor(random(3))
	mycommand= round(random(100))
	if(turns == 1) {
	    GS.msg[0]= "\\E1You know.../"
	    GS.msg[1]= "\\M1I \\E0don\'t care about&destroying this&world anymore./%%"
	}
	if(turns == 2) {
	    GS.msg[0]= "\\E1After I defeat you&and gain total&control over the&timeline.../"
	    GS.msg[1]= "\\E2I just want to reset&everything./%%"
	}
	if(turns == 3) {
	    GS.msg[0]= "\\E3All your progress..^1.&Everyone\'s memories./"
	    GS.msg[1]= "\\E2I\'ll bring them all&back to zero!/%%"
	}
	if(turns == 4)
	    GS.msg[0]= "\\E2Then we can do&everything ALL over&again./%%"
	if(turns == 5) {
	    GS.msg[0]= "\\E3And you know what&the best part of&all this is?/"
	    GS.msg[1]= "\\E2You\'ll DO it./%%"
	}
	if(turns == 6)
	    GS.msg[0]= "\\E1And then you\'ll&lose to me again./%%"
	if(turns == 7) GS.msg[0]= "\\E3And again./%%"
	if(turns == 8) GS.msg[0]= "\\E3And again!!!/%%"
	if(turns == 9)
	    GS.msg[0]= "\\E1Because you want a&" + chr(ord('"')) + "happy ending." + chr(ord('"')) + "/%%"
	if(turns == 10)
	    GS.msg[0]= "Because you " + chr(ord('"')) + "love&your friends." + chr(ord('"')) + "/%%"
	if(turns == 11) GS.msg[0]= "Because you " + chr(ord('"')) + "never&give up." + chr(ord('"')) + "/%%"
	if(turns == 12) {
	    GS.msg[0]= "\\M1I\\E1sn\'t that&delicious?/"
	    GS.msg[1]= "\\M0Your " + chr(ord('"')) + "determination.^1" + chr(ord('"')) + "&The power that let&you get this far.../"
	    GS.msg[2]= "\\E2It\'s gonna be your&downfall!/%%"
	}
	if(turns == 13) {
	    GS.msg[0]= "\\E2Now^1, ENOUGH messing&around!/"
	    GS.msg[1]= "It\'s time to purge&this timeline once&and for all!/%%"
	}
	xx= 0
	if(turns < GS.flag[504]) xx= 1
	GS.typer= 86
	blconwd= instance_create(blcon.x + 25, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	if(mypart1.specialnormal == 1 or turns == 0 or xx == 1) {
	    with(blconwd) instance_destroy()
	    with(blcon) instance_destroy()
	}
	GS.border= 17
	if(mypart1.specialnormal == 1) GS.border= 6
	if(turns == 2 or turns == 6 or turns == 10)
	    GS.border= 4
	obj_heart.x= round((GS.idealborder[0] + GS.idealborder[1]) / 2) - 8
	obj_heart.y= round((GS.idealborder[2] + GS.idealborder[3]) / 2) - 8
	say= 1

func _gm_event_2_3():
	if(mypart1.pause != 1) {
	    dmgwriter= instance_create(x + sprite_width / 2 - 48, y - 24, 189/* obj_dmgwriter */)
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
	} else  {
	    $Alarm3.start((2) / 30.0)
	    exit
	}

func _process(delta: float):
	x= mypart1.x - 60
	y= mypart1.y
	if(GS.mnfight == 3) {
	    attacked= 0
	    GS.hope= 0
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
	    if(mypart1.specialnormal == 0) $Alarm6.start((16) / 30.0)
	    else  $Alarm6.start((1) / 30.0)
	    with(mypart1) {
	        if(specialnormal == 0) {
	            snd_play(13/* snd_spearappear */)
	            s_s= 0
	            if(aligncon == 0) aligncon= 1
	        }
	    }
	    if(turns == 2 or turns == 6 or turns == 10) {
	        with(mypart1) s_s= 1
	    }
	    talked= 1
	    GS.heard= 0
	}
	if(say == 1 and not is_instance_valid(blconwd)) {
	    event_user(1)
	    say= 0
	}
	if(GS.hurtanim[myself] == 1) {
	    shudder= 8
	    $Alarm3.start((GS.damagetimer) / 30.0)
	    GS.hurtanim[myself]= 3
	}
	if(GS.hurtanim[myself] == 2) {
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
	        GS.turntimer= 150
	        GS.firingrate= 10
	        if(pop == 3) GS.firingrate*= 2.5
	        if(pop == 2) GS.firingrate*= 1.8
	        if(mypart1.specialnormal == 1) {
	            GS.turntimer= 140
	            GS.firingrate= 6
	            gen= instance_create(0, 0, 713/* obj_1sidegen */)
	            gen.myself= myself
	            gen.dmg= 8
	            if(GS.hope == 1) {
	                gen.dmg= 6
	                GS.monsteratk[myself]= 6
	            }
	            if(GS.hope == 0) {
	                gen.dmg= 8
	                GS.monsteratk[myself]= 8
	            }
	            gen.bullettype= 7
	        } else  {
	            if(turns >= 8) mypart1.h_mode= 1
	            if(turns == 0 or turns == 4 or turns == 9) {
	                with(mypart1) {
	                    starcon= 1
	                    type= 0
	                }
	            }
	            if(turns == 1 or turns == 3 or turns == 8 or turns == 12) {
	                with(mypart1) {
	                    starcon= 1
	                    type= 1
	                }
	            }
	            if(turns == 2 or turns == 6 or turns == 10) {
	                with(mypart1) {
	                    bladecon= 1
	                    type= 1
	                }
	            }
	            if(turns == 5 or turns == 7 or turns == 11) {
	                with(mypart1) {
	                    guncon= 1
	                    type= 1
	                }
	            }
	            if(turns == 13) {
	                with(mypart1) {
	                    gonercon= 1
	                    type= 1
	                    GS.hope= 2
	                }
	            }
	            turns++
	            if(GS.flag[504] < turns) GS.flag[504]= turns
	        }
	        if(turns == 0 or turns == 4)
	            GS.msg[0]= "* Asriel readies " + chr(ord('"')) + "STAR BLAZING." + chr(ord('"')) + ""
	        if(turns == 1 or turns == 3)
	            GS.msg[0]= "* Asriel charges " + chr(ord('"')) + "SHOCKER&  BREAKER." + chr(ord('"')) + ""
	        if(turns == 2 or turns == 6)
	            GS.msg[0]= "* Asriel calls on " + chr(ord('"')) + "CHAOS SABER." + chr(ord('"')) + ""
	        if(turns == 5 or turns == 7)
	            GS.msg[0]= "* Asriel readies " + chr(ord('"')) + "CHAOS BUSTER." + chr(ord('"')) + ""
	        if(turns == 9)
	            GS.msg[0]= "* Asriel readies " + chr(ord('"')) + "GALACTA&  BLAZING." + chr(ord('"')) + ""
	        if(turns == 10)
	            GS.msg[0]= "* Asriel calls on " + chr(ord('"')) + "CHAOS SLICER." + chr(ord('"')) + ""
	        if(turns == 8 or turns == 12)
	            GS.msg[0]= "* Asriel readies " + chr(ord('"')) + "SHOCKER&  BREAKER II." + chr(ord('"')) + ""
	        if(turns == 11)
	            GS.msg[0]= "* Asriel readies " + chr(ord('"')) + "CHAOS&  BLASTER." + chr(ord('"')) + ""
	        if(turns == 13) GS.msg[0]= "* Asriel readies " + chr(ord('"')) + "HYPER GONER." + chr(ord('"')) + ""
	        if(turns == 14)
	            GS.msg[0]= "* Asriel is glowing with a&  strange power."
	        if(mypart1.specialnormal == 1) GS.msg[0]= "* It\'s the end."
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
	        if(mypart1.specialnormal == 1)
	            GS.msg[0]= "* ASRIEL DREEMURR \\z4   ATK \\z4   DEF&* Legendary being made of every&  SOUL in the underground./^"
	        if(mypart1.specialnormal == 0)
	            GS.msg[0]= "* ASRIEL DREEMURR \\z4   ATK \\z4   DEF&* The Absolute GOD of Hyperdeath!/^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	        whatiheard= 9
	    }
	    if(whatiheard == 3) {
	        GS.msc= 0
	        GS.hope= 1
	        GS.msg[0]= "* You held on to your hopes..^1.&* You reduced how much DAMAGE&  you\'ll take this turn!/^"
	        if(hoped > 0)
	            GS.msg[0]= "* You kept holding on^1.&* DAMAGE reduced!/^"
	        hoped++
	        if(GS.hp < GS.maxhp) {
	            GS.hp++
	            snd_play(155/* snd_heal_c */)
	        }
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    if(whatiheard == 1) {
	        GS.msc= 0
	        repeat(8)  scr_itemget(55)
	        GS.msg[0]= "* You think about why you\'re&  here now.../"
	        GS.msg[1]= "* You can feel the empty&  space in your inventory&  get smaller and smaller!/^"
	        if(dreamed > 0)
	            GS.msg[0]= "* Your items fill up with&  dreams./^"
	        if(GS.hp < GS.maxhp) {
	            GS.hp+= 4
	            if(GS.hp > GS.maxhp) GS.hp= GS.maxhp
	            snd_play(155/* snd_heal_c */)
	        }
	        dreamed++
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    if(whatiheard == 4) {
	        GS.msc= 0
	        GS.msg[0]= "* You execute some action./^"
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
	if(GS.mnfight == 5) {
	    if(trcon == 0) {
	        blcon= instance_create(x + 120, y, 187/* obj_blconwdflowey */)
	        GS.msg[0]= "\\E0... even after that&attack^1, you\'re still&standing in my way...?/"
	        GS.msg[1]= "\\M1W\\E0ow..^1.&You really ARE&something special./"
	        GS.msg[2]= "\\M0B\\E3ut don\'t get&cocky./"
	        GS.msg[3]= "\\E0Up until now^1, I\'ve&only been using&a fraction of my&REAL power!/"
	        GS.msg[4]= "\\E2Let\'s see what good&your DETERMINATION&is against THIS!!/%%"
	        GS.msc= 0
	        GS.typer= 68
	        GS.typer= 86
	        blconwd= instance_create(blcon.x + 25, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	        trcon= 1
	    }
	    if(trcon == 1) {
	        if(instance_exists(782/* OBJ_WRITER */)) {
	            if(OBJ_WRITER.stringno == 1) caster_set_volume(GS.currentsong, 0.75)
	            if(OBJ_WRITER.stringno == 2) caster_set_volume(GS.currentsong, 0.5)
	            if(OBJ_WRITER.stringno == 3) caster_set_volume(GS.currentsong, 0.25)
	            if(OBJ_WRITER.stringno == 4) caster_set_volume(GS.currentsong, 0)
	        }
	        if(not is_instance_valid(blconwd)) {
	            // obj_asriel_body
	            with(569) transform= 1
	            caster_free(-3)
	            bright= caster_load("music/sfx/sfx_spellcast.ogg")
	            caster_play(bright, 0.24, 0.2)
	            caster_play(bright, 0.24, 0.3)
	            caster_play(bright, 0.24, 0.4)
	            caster_play(bright, 0.24, 0.5)
	            caster_play(bright, 0.24, 0.6)
	            caster_play(bright, 0.24, 0.65)
	            shakeamt= 0
	            trcon= 2
	            $Alarm10.start((67) / 30.0)
	            with(blcon) instance_destroy()
	            sw= instance_create(0, 0, 557/* obj_screenwhiter */)
	            sw.ex= 1
	        }
	    }
	    if(trcon == 2) {
	        if(shakeamt < 9) shakeamt+= 0.25
	        view_xview[0]= 0 + random(shakeamt) - random(shakeamt)
	        view_yview[0]= 0 + random(shakeamt) - random(shakeamt)
	    }
	    if(trcon == 3) {
	        view_xview[0]= 0
	        view_yview[0]= 0
	        trcon= 6
	        $Alarm10.start((150) / 30.0)
	    }
	    if(trcon == 7) {
	        caster_free(-3)
	        GS.flag[15]= 1
	        GS.battlegroup= 256
	        room_restart()
	    }
	}

func _gm_event_7_11():
	with(blconwd) instance_destroy()
	with(blcon) instance_destroy()
	talked= 0
	if(turns != 8) GS.flag[20]= 0
	GS.faceemotion= 0
	GS.mnfight= 2

func _on_outside_room():
	if(GS.debug == 1) {
	    if(Input.is_key_pressed(85)) turns--
	    if(Input.is_key_pressed(73)) turns++
	}
	if(trcon >= 3) {
	    if(instance_exists(557/* obj_screenwhiter */))
	        z_index= obj_screenwhiter.z_index + 2
	    draw_set_color(0)
	    draw_rectangle(-100, -100, 800, 800, 0)
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
