# Auto-converted from GameMaker: obj_gyftrot
# GM parent: obj_monsterparent
extends Node2D

func _ready():
	scr_monstersetup(0, 0, 0, 0, 0)
	image_speed= 0
	// obj_battlebg
	with(185) instance_destroy()
	part1= 236
	part2= 237
	part3= 233
	mypart1= _spawn("part1", x, y)
	mypart2= _spawn("part2", x, y)
	hurtanim= 0
	hurtsound= 43
	talked= 0
	whatiheard= -1
	attacked= 0
	killed= 0
	GS.heard= 0
	takedamage= 0
	mercymod= -5
	itemgone= 0
	gift[0]= floor(random(7))
	gift[1]= floor(random(7))
	gift[2]= floor(random(7))
	if(gift[1] == gift[0]) gift[1]++
	if(gift[2] == gift[0]) gift[2]++
	if(gift[2] == gift[1]) gift[2]= 0
	if(gift[2] == gift[0]) gift[2]++
	mypart3= _spawn("part3", x, y)
	mypart3.gift= gift[0]
	mypart4= _spawn("part3", x, y)
	mypart4.gift= gift[1]
	mypart8= _spawn("part3", x, y)
	mypart8.gift= gift[2]
	googly= 0
	giftgiven= 0
	betray= 0
	ung= 0
	ht= 200
	wd= 200

func _gm_event_1_0():
	if(mercymod > 10 and GS.monsterhp[myself] == GS.monstermaxhp[myself])
	    GS.goldreward[3]+= 20
	if(giftgiven == 1) GS.goldreward[3]= 0
	if(giftgiven == 2) GS.goldreward[3]= 75
	scr_monsterdefeat(0, 0, 0, 0, 0)
	with(mypart1) instance_destroy()
	with(mypart2) instance_destroy()
	if(is_instance_valid(mypart3)) {
	    with(mypart3) instance_destroy()
	}
	if(is_instance_valid(mypart4)) {
	    with(mypart4) instance_destroy()
	}
	if(googly == 1) {
	    with(mypart5) instance_destroy()
	}
	if(is_instance_valid(mypart8)) {
	    with(mypart8) instance_destroy()
	}

func _gm_event_2_8():
	snd_play(hurtsound)

func _gm_event_2_6():
	blcon= instance_create(x + 205, y + 52, 186/* obj_blconsm */)
	gg= floor(random(3))
	mycommand= round(random(100))
	GS.msg[0]= "Error!!"
	if(mycommand >= 0 and mycommand < 20)
	    GS.msg[0]= "Is this&funny to&you?"
	if(mycommand >= 20 and mycommand < 40)
	    GS.msg[0]= "Don\'t&put any&more on&me!"
	if(mycommand >= 40 and mycommand < 60)
	    GS.msg[0]= "Leave me&alone..."
	if(mycommand >= 60 and mycommand <= 80)
	    GS.msg[0]= "Hohoho!&Go ahead&and&laugh..."
	if(mycommand >= 80 and mycommand <= 100)
	    GS.msg[0]= "Get this&off of&me..."
	if(mercymod > 90) {
	    GS.msg[0]= "Thanks."
	    GS.monsterdef[myself]= -100
	}
	if(whatiheard == 4) {
	    if(giftgiven == 1) GS.msg[0]= "Aw, you&shouldn\'&have..."
	    if(giftgiven == 2) GS.msg[0]= "You even&wrapped&it..."
	    if(googly == 1) GS.msg[0]= "Keep&away&from me!"
	    if(betray == 1) GS.msg[0]= "I don\'t&want&your&gift!"
	    if(itemgone == 0) GS.msg[0]= "How do&I know&it\'s not&a trick?"
	}
	if(whatiheard == 3) {
	    GS.flag[74]= 1
	    GS.msg[0]= "GOSHDARN&TEENAGE&GOOGLY&EYES!!!"
	    if(itemgone > 0 or giftgiven > 0) {
	        GS.msg[0]= "I WAS&STARTING&TO TRUST&YOU!!!"
	        betray= 1
	    }
	    mercymod= -20
	}
	if(whatiheard == 1) {
	    if(itemgone == 1 or itemgone == 2) {
	        mercymod= 10
	        GS.msg[0]= "That\'s&a little&better."
	    }
	    if(mercymod > 170) GS.msg[0]= "Er...&Those&are&real."
	    else  {
	        if(itemgone == 3) {
	            mercymod= 200
	            GS.msg[0]= "A weight&has been&lifted."
	        }
	    }
	    if(ung == 1) GS.msg[0]= "Thanks&for&nothing!"
	    ung= 0
	}
	GS.msg[1]= "%%%"
	GS.typer= 2
	blconwd= instance_create(blcon.x + 15, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	GS.border= 6
	obj_heart.x= round((GS.idealborder[0] + GS.idealborder[1]) / 2) - 8
	obj_heart.y= round((GS.idealborder[2] + GS.idealborder[3]) / 2) - 8

func _gm_event_2_5():
	with(blconwd) instance_destroy()
	with(blcon) instance_destroy()
	talked= 0
	whatiheard= -1
	GS.mnfight= 2
	GS.border= 7

func _gm_event_2_3():
	if(frame != 1) {
	    with(mypart1) instance_destroy()
	    with(mypart2) instance_destroy()
	    dmgwriter= instance_create(x, y + 20, 189/* obj_dmgwriter */)
	    GS.damage= takedamage
	    with(dmgwriter) dmg= GS.damage
	    frame= 1
	    snd_play(51/* snd_damage */)
	    $Alarm8.start((11) / 30.0)
	}
	x+= shudder
	if(shudder < 0) shudder= -(shudder + 2)
	else  shudder= -shudder
	if(shudder == 0) {
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
	    shudder= 16
	    $Alarm3.start((GS.damagetimer) / 30.0)
	    GS.hurtanim[myself]= 3
	}
	if(GS.hurtanim[myself] == 2) {
	    GS.monsterhp[myself]-= takedamage
	    with(dmgwriter) $Alarm2.start((15) / 30.0)
	    if(GS.monsterhp[myself] >= 1) {
	        mypart1= _spawn("part1", x, y)
	        mypart2= _spawn("part2", x, y)
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
	    if(instance_exists(217/* obj_jerry */) and obj_jerry.ditch == 0)
	        pop--
	    GS.turntimer= 120
	    if(mercymod > 90) GS.turntimer= -2
	    GS.firingrate= 5
	    if(GS.hardmode == 1) GS.firingrate= 3
	    if(pop == 3) GS.firingrate*= 2.4
	    if(pop == 2) GS.firingrate*= 1.7
	    if(mycommand >= 0 and mycommand <= 60) {
	        gen= instance_create(x, y, 714/* obj_gyftgen */)
	        gen.bullettype= 1
	    } else  {
	        gen= instance_create(x, y, 684/* obj_giftgen */)
	        gen.bullettype= 0
	    }
	    gen.myself= myself
	    if(mycommand >= 0)
	        GS.msg[0]= "* Gyftrot laments its lack of&  hands."
	    if(mycommand >= 25)
	        GS.msg[0]= "* Gyftrot eyes you with&  suspicion."
	    if(mycommand >= 40)
	        GS.msg[0]= "* Gyftrot distrusts your&  youthful demeanor."
	    if(mycommand >= 60)
	        GS.msg[0]= "* Ah^1, the scent of fresh&  pine needles."
	    if(mycommand >= 80)
	        GS.msg[0]= "* Gyftrot tries vainly to&  remove its decorations."
	    if(giftgiven == 1)
	        GS.msg[0]= "* Gyftrot pretends to refuse&  your gift."
	    if(giftgiven == 2)
	        GS.msg[0]= "* Gyftrot politely accepts&  your gift."
	    if(googly == 1) GS.msg[0]= "* Gyftrot stumbles blindly."
	    if(itemgone == 1 or itemgone == 2)
	        GS.msg[0]= "* Gyftrot is slightly less&  irritated."
	    if(itemgone == 3)
	        GS.msg[0]= "* Gyftrot\'s problems have&  been taken away."
	    if(betray == 1) GS.msg[0]= "* Gyftrot looks disappointed."
	    if(GS.monsterhp[myself] < 30)
	        GS.msg[0]= "* Gyftrot\'s antlers tremble."
	    attacked= 1
	}
	if(GS.myfight == 2 and whatiheard != -1) {
	    if(GS.heard == 0) {
	        if(whatiheard == 0) {
	            GS.msc= 0
	            GS.msg[0]= "* GYFTROT - ATK 16 DEF 8&* Some teens " + chr(ord('"')) + "decorated" + chr(ord('"')) + " it as&  a prank./^"
	            OBJ_WRITER.halt= 3
	            iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	            with(iii) halt= 0
	        }
	        if(whatiheard == 1) {
	            GS.msc= 0
	            if(itemgone < 3) {
	                if(gift[itemgone] == 0)
	                    GS.msg[0]= "* You remove the striped cane&  that says " + chr(ord('"')) + "I use this tiny&  cane to walk" + chr(ord('"')) + " on it./^"
	                if(gift[itemgone] == 1)
	                    GS.msg[0]= "* You remove the box of&  non-dog-related raisins./^"
	                if(gift[itemgone] == 2)
	                    GS.msg[0]= "* You remove the lenticular&  bookmark of a smug teen&  winking./^"
	                if(gift[itemgone] == 3)
	                    GS.msg[0]= "* You remove the barbed wire&  made of pipe cleaners./^"
	                if(gift[itemgone] == 4)
	                    GS.msg[0]= "* You remove a childhood&  photograph of Snowdrake and&  his parent./^"
	                if(gift[itemgone] == 5)
	                    GS.msg[0]= "* You remove a small^1, confused&  dog./^"
	                if(gift[itemgone] == 6)
	                    GS.msg[0]= "* You remove a stocking filled&  with chicken nuggets./^"
	                if(gift[itemgone] == 7)
	                    GS.msg[0]= "* You remove the shirt that says& \'I\'m with stupid\' and points&  inward./^"
	            }
	            if(itemgone == 3) {
	                GS.msg[0]= "* You try to undecorate...?/^"
	                mercymod= 180
	            }
	            if(googly == 1) GS.msg[0]= "* You remove the googly eyes./^"
	            OBJ_WRITER.halt= 3
	            iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	            with(iii) halt= 0
	            if(googly == 1) {
	                googly= 0
	                ung= 1
	                with(mypart5) instance_destroy()
	            } else  {
	                if(itemgone < 3) {
	                    if(itemgone == 2) {
	                        with(mypart8) instance_destroy()
	                        itemgone= 3
	                    }
	                    if(itemgone == 1) {
	                        with(mypart4) instance_destroy()
	                        itemgone= 2
	                    }
	                    if(itemgone == 0) {
	                        with(mypart3) instance_destroy()
	                        itemgone= 1
	                    }
	                }
	            }
	            if(mercymod < 150) {
	                if(itemgone > 0 and mercymod < 100) mercymod= 10
	                if(itemgone > 2) {
	                    mercymod= 160
	                    GS.flag[138]= 1
	                }
	            }
	        }
	        if(whatiheard == 3) {
	            GS.msc= 0
	            if(googly == 0) {
	                GS.msg[0]= "* You add some googly eyes&  you found on the ground./^"
	                googly= 1
	                mypart5= _spawn("part3", x, y)
	                mypart5.gift= 8
	            } else  GS.msg[0]= "* You can\'t improve on&  perfection./^"
	            OBJ_WRITER.halt= 3
	            iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	            with(iii) halt= 0
	        }
	        if(whatiheard == 4) {
	            GS.msc= 0
	            if(giftgiven == 0 and googly == 0 and itemgone > 0 and betray == 0) {
	                mypart6= _spawn("part3", x, y)
	                mypart6.gift= 9
	                if(GS.gold == 0) {
	                    GS.msg[0]= "* You give the cheapest gift&  of all..^1.&* Friendship./^"
	                    giftgiven= 2
	                    mercymod= 140
	                    GS.goldreward[myself]+= 50
	                }
	                if(GS.gold > 0) {
	                    if(GS.gold >= 35) {
	                        GS.msg[0]= "* You give 35 G because&  you can\'t think of an&  appropriate gift./^"
	                        GS.gold-= 35
	                    } else  {
	                        GS.gold= 0
	                        GS.msg[0]= "* You give your remaining&  money because you can\'t&  think of a better gift./^"
	                    }
	                    giftgiven= 1
	                    mercymod= 140
	                }
	            } else  {
	                if(googly == 1 or betray == 1 or itemgone == 0)
	                    GS.msg[0]= "* Gyftrot refuses your gift./^"
	                if(giftgiven == 1)
	                    GS.msg[0]= "* Hey now^1.&* You aren\'t made of money./^"
	                if(giftgiven == 2)
	                    GS.msg[0]= "* Hey now^1.&* You aren\'t made of friendship./^"
	            }
	            OBJ_WRITER.halt= 3
	            iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	            with(iii) halt= 0
	        }
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
