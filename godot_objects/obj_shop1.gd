# Auto-converted from GameMaker: obj_shop1
extends Node2D

func _ready():
	murder= 0
	if(scr_murderlv() >= 7) murder= 1
	instance_create(0, 0, 147/* obj_fader */)
	vol= 0.8
	if(GS.flag[7] == 0) {
	    shopmus= caster_load("music/shop.ogg")
	    caster_loop(shopmus, vol, 0.93)
	    if(murder == 1) caster_set_pitch(shopmus, 0.2)
	}
	menumax= 3
	menu= 0
	menuc[0]= 0
	menuc[1]= 0
	menuc[2]= 0
	menuc[3]= 0
	menuc[4]= 0
	item0pic= 34
	item1pic= 34
	item2pic= 34
	item3pic= 34
	item[0]= 14
	item[1]= 15
	item[2]= 19
	item[3]= 21
	sell= 0
	bought= 0
	mainmessage= 0
	itemcost[0]= 50
	itemcost[1]= 50
	itemcost[2]= 15
	if(GS.plot > 100) itemcost[2]= 30
	if(GS.plot > 121) itemcost[2]= 45
	if(GS.plot > 199) itemcost[2]= 70
	itemcost[3]= 25
	if(murder == 1) {
	    itemcost[0]= 0
	    itemcost[1]= 0
	    itemcost[2]= 0
	    itemcost[3]= 0
	}
	minimenuy= 120
	GS.typer= 23
	draw_set_font(2)
	sidemessage= 0
	selling= 0
	GS.msc= 0
	glow= 0
	shx= 130
	instance_create(18 + shx, 40, 1406/* obj_shopeyes1 */)
	soldo= 0
	GS.faceemotion= 0
	an= 0
	facespr[1]= 881
	facespr[2]= 880
	facespr[3]= 882
	facespr[4]= 879
	facespr[5]= 878
	facespr[6]= 877
	if(murder == 1) {
	    // obj_shopeyes1
	    with(1406) instance_destroy()
	}

func _gm_event_2_3():
	if(GS.flag[7] == 0) caster_free(shopmus)
	instance_create(0, 0, 148/* obj_persistentfader */)
	get_tree().change_scene_to_file("res://godot_rooms/68.tscn")

func _gm_event_2_2():
	if(GS.flag[7] == 0) {
	    caster_set_volume(shopmus, vol)
	    vol-= 0.02
	    $Alarm2.start((1) / 30.0)
	}

func _gm_event_7_11():
	instance_create(0, 0, 149/* obj_unfader */)
	$Alarm2.start((1) / 30.0)
	$Alarm3.start((40) / 30.0)
	GS.entrance= 18
	GS.interact= 3

func _on_outside_room():
	glow+= 2
	glow2= floor(sin(glow / 30) * 2) / 32 + 0.125
	draw_sprite(873/* spr_shop1_bg */, 0, 0, 0)
	draw_sprite_ext(874/* spr_shop1_bgorange */, 0, 0, 0, 1, 1, 0, 16777215, glow2)
	if(murder == 0) draw_sprite(875/* spr_shopkeeper1 */, 0, shx, 0)
	draw_set_color(16777215)
	draw_rectangle(0, 120, 320, 240, 0)
	if(menu == 1 or menu == 2) {
	    draw_rectangle(210, 120, 320, minimenuy, 0)
	    draw_set_color(0)
	    if(minimenuy < 116) draw_rectangle(214, 120, 316, minimenuy + 4, 0)
	    draw_set_color(16777215)
	    wcheck= string(5 - GS.wstrength)
	    acheck= string(7 - GS.adef)
	    wchecks= " "
	    if(GS.wstrength <= 5) wchecks= "+"
	    if(GS.wstrength > 5) wchecks= " "
	    achecks= " "
	    if(GS.adef <= 7) achecks= "+"
	    if(GS.adef > 7) achecks= " "
	    if(menuc[1] == 0)
	        draw_text(224, minimenuy + 14, "Weapon: 5AT#(" + wchecks + wcheck + " AT)#Slap \'em.")
	    if(menuc[1] == 1)
	        draw_text(224, minimenuy + 14, "Armor: 7DF#(" + achecks + acheck + " DF)#It has abs#on it.")
	    if(menuc[1] == 2)
	        draw_text(224, minimenuy + 14, "Heals 11HP x 2#Eat it twice!")
	    if(menuc[1] == 3)
	        draw_text(224, minimenuy + 14, "Heals 22HP#It\'s my own#recipe.")
	}
	if(menu < 4) {
	    draw_set_color(0)
	    draw_rectangle(4, 124, 210, 236, 0)
	    draw_rectangle(214, 124, 316, 236, 0)
	} else  {
	    draw_set_color(0)
	    draw_rectangle(4, 124, 316, 236, 0)
	}
	draw_set_color(16777215)
	if(menu == 0) {
	    sell= 0
	    selling= 0
	    sidemessage= 0
	    menuc[1]= 0
	    menuc[2]= 0
	    menuc[3]= 0
	    menuc[4]= 0
	    if(not instance_exists(782/* OBJ_WRITER */)) {
	        GS.msg[0]= "\\E0* Take your time./*"
	        mainmessage= 0 and GS.flag[69] == 0
	        GS.msg[0]= "\\E0* Hello^1, traveller^1.&* How can I help you?/*"
	        if(murder == 1) GS.msg[0]= "* But nobody came./*"
	        instance_create(0, 110, 782/* OBJ_WRITER */)
	    } else  {
	        if(keyboard_multicheck_pressed(1/* ANYKEY */)) {
	            // OBJ_WRITER
	            with(782) {
	                if(halt == 0) stringpos= string_length(originalstring)
	                keyboard_clear(16/* SHIFT */)
	            }
	        }
	    }
	    menumax= 3
	    if(murder == 0) {
	        draw_text(240, 130, "Buy")
	        draw_text(240, 150, "Sell")
	        draw_text(240, 170, "Talk")
	        draw_text(240, 190, "Exit")
	    }
	    if(murder == 1) {
	        draw_text(240, 130, "Take")
	        draw_text(240, 150, "Steal")
	        draw_text(240, 170, "Read")
	        draw_text(240, 190, "Exit")
	    }
	    draw_sprite(49/* spr_heartsmall */, 0, 225, 135 + menuc[0] * 20)
	    if(keyboard_multicheck_pressed(0/* NOKEY */)) {
	        OBJ_WRITER.dfy= 1
	        keyboard_clear(13/* ENTER */)
	        if(menuc[0] == 0) menu= 1
	        if(menuc[0] == 1) {
	            sell= 1
	            menu= 4
	        }
	        if(menuc[0] == 2) {
	            if(murder == 0) menu= 3
	            else  {
	                menu= 4
	                sell= 7
	            }
	        }
	        if(menuc[0] == 3) {
	            sell= 2
	            menu= 4
	        }
	    }
	}
	if(menu == 1 or menu == 2) {
	    if(murder == 0) {
	        draw_text(30, 130, "50G - Tough Glove")
	        draw_text(30, 150, "50G - Manly Bandanna")
	        if(GS.plot <= 100) draw_text(30, 170, "15G - Bisicle")
	        if(GS.plot > 100 and GS.plot <= 121)
	            draw_text(30, 170, "30G - Bisicle")
	        if(GS.plot > 121 and GS.plot <= 199)
	            draw_text(30, 170, "45G - Bisicle")
	        if(GS.plot > 199) draw_text(30, 170, "70G - Bisicle")
	        draw_text(30, 190, "25G - Cinnamon Bun")
	    }
	    if(murder == 1) {
	        draw_text(30, 130, "00G - Tough Glove")
	        draw_text(30, 150, "00G - Manly Bandanna")
	        draw_text(30, 170, "00G - Bisicle")
	        draw_text(30, 190, "00G - Cinnamon Bun")
	    }
	    draw_text(30, 210, "Exit")
	    if(menu == 1) {
	        menumax= 4
	        if(not instance_exists(782/* OBJ_WRITER */)) {
	            if(sidemessage == 0)
	                GS.msg[0]= "\\E0What would&you like&to buy?/*"
	            if(sidemessage == 1)
	                GS.msg[0]= "\\E5Thanks for&your&purchase./*"
	            if(sidemessage == 2) GS.msg[0]= "\\E0Just&looking?/*"
	            if(sidemessage == 3)
	                GS.msg[0]= "\\E6That\'s not&enough&money./*"
	            if(sidemessage == 4)
	                GS.msg[0]= "\\E6You\'re&carrying&too much./*"
	            if(murder == 1) GS.msg[0]= "/*"
	            instance_create(210, 110, 782/* OBJ_WRITER */)
	        }
	        draw_sprite(49/* spr_heartsmall */, 0, 15, 135 + menuc[1] * 20)
	        if(keyboard_multicheck_pressed(0/* NOKEY */)) {
	            menu= 2
	            OBJ_WRITER.dfy= 1
	            if(menuc[1] == menumax) menu= 0
	        } else  {
	            if(keyboard_multicheck_pressed(1/* ANYKEY */)) {
	                menu= 0
	                OBJ_WRITER.dfy= 1
	            }
	        }
	        if(menu == 2) keyboard_clear(13/* ENTER */)
	        menuc[2]= 0
	    }
	    if(menu == 2) {
	        menumax= 1
	        if(murder == 0) {
	            draw_text(230, 130, "Buy it for")
	            draw_text(230, 145, string(itemcost[menuc[1]]) + "G ?")
	        }
	        if(murder == 1) draw_text(230, 130, "Take it.")
	        draw_text(240, 170, "Yes")
	        draw_text(240, 185, "No")
	        draw_sprite(49/* spr_heartsmall */, 0, 225, 175 + menuc[2] * 15)
	        if(keyboard_multicheck_pressed(1/* ANYKEY */)) {
	            menu= 1
	            keyboard_clear(16/* SHIFT */)
	            sidemessage= 2
	        } else  {
	            if(keyboard_multicheck_pressed(0/* NOKEY */)) {
	                keyboard_clear(13/* ENTER */)
	                if(menuc[2] == 0) {
	                    scr_cost(itemcost[menuc[1]])
	                    if(afford == 1) {
	                        script_execute(84/* scr_itemget */, item[menuc[1]])
	                        if(noroom == 0) {
	                            GS.gold-= itemcost[menuc[1]]
	                            sidemessage= 1
	                            snd_play(113/* snd_buyitem */)
	                        }
	                        if(noroom == 1) sidemessage= 4
	                    } else  sidemessage= 3
	                }
	                if(menuc[2] == 1) sidemessage= 2
	                menu= 1
	            }
	        }
	    }
	    if(menuc[1] != 4) {
	        if(minimenuy > 40) minimenuy-= 3
	        if(minimenuy > 55) minimenuy-= 2
	        if(minimenuy > 80) minimenuy-= 4
	        if(minimenuy > 100) minimenuy-= 5
	    } else  {
	        if(minimenuy < 120) minimenuy+= 20
	    }
	}
	if(menu == 3) {
	    menumax= 4
	    if(GS.flag[7] == 0) {
	        draw_text(30, 130, "Say hello")
	        draw_text(30, 150, "What to do here")
	        draw_text(30, 170, "Town history")
	        draw_text(30, 190, "Your life")
	    } else  {
	        draw_text(30, 130, "What happened")
	        draw_text(30, 150, "Human")
	        draw_text(30, 170, "Ruins")
	        draw_text(30, 190, "Future")
	    }
	    draw_text(30, 210, "Exit")
	    if(not instance_exists(782/* OBJ_WRITER */)) {
	        GS.msg[0]= "\\E0Care to&chat?/*"
	        instance_create(210, 110, 782/* OBJ_WRITER */)
	    }
	    draw_sprite(49/* spr_heartsmall */, 0, 15, 135 + menuc[3] * 20)
	    if(keyboard_multicheck_pressed(0/* NOKEY */)) {
	        OBJ_WRITER.dfy= 1
	        if(menuc[3] < menumax) {
	            sell= menuc[3] + 3
	            keyboard_clear(13/* ENTER */)
	            menu= 4
	        } else  menu= 0
	    } else  {
	        if(keyboard_multicheck_pressed(1/* ANYKEY */)) {
	            keyboard_clear(16/* SHIFT */)
	            menu= 0
	            OBJ_WRITER.dfy= 1
	        }
	    }
	}
	if(menu < 4) {
	    draw_text(230, 210, string(GS.gold) + "G")
	    scr_itemroom()
	    draw_text(280, 210, string(itemhold) + "/8")
	}
	if(menu == 4) {
	    if(sell == 0) menu= 0
	    if(not instance_exists(782/* OBJ_WRITER */) and selling == 0) {
	        if(sell == 1) {
	            GS.msg[0]= "\\E3* Huh^1?&* Sell somethin\'^1?&* Does this look like a&  pawn shop?/"
	            GS.msg[1]= "\\E4* I don\'t know how it works where&  you come from... but.../"
	            GS.msg[2]= "\\E0* If I started spending money&  on old branches and used&  bandages^1, I\'d be out of business&  in a jiffy!/%%"
	            soldo++
	            if(soldo > 1) {
	                GS.msg[0]= "\\E4* If you\'re really hurtin\' for&  cash^1, then maybe you could&  do some crowdfunding./"
	                GS.msg[1]= "* I hear people will pay for&  ANYTHING nowadays./%%"
	            }
	            if(murder == 1) {
	                if(GS.flag[255] == 0) {
	                    GS.msg[0]= "* You took 758G from behind the&  counter./%%"
	                    GS.gold+= 758
	                    GS.flag[255]= 1
	                } else  GS.msg[0]= "* Nothing left./%%"
	            }
	        }
	        if(sell == 2) {
	            GS.msg[0]= "\\E0* Bye now^1!&* Come again sometime!/%%"
	            if(murder == 1) GS.msg[0]= "* .../%%"
	        }
	        if(sell == 3) {
	            GS.msg[0]= "\\E0* Hiya^1! Welcome to Snowdin^1!&* I can\'t remember the last&  time I saw a fresh face around&  here./"
	            GS.msg[1]= "\\E4* Where did you come from^1?&* The capital?/"
	            GS.msg[2]= "\\E0* You don\'t look like a tourist^1.&* Are you here by yourself?/%%"
	            if(GS.flag[7] == 1) {
	                GS.msg[0]= "\\E0* I mean^1, it happened to you^1,&  right?/"
	                GS.msg[1]= "* There was a strange flash of&  white light..^1.&* Then I felt my body being pulled&  into..^1. something./"
	                GS.msg[2]= "* Then^1, suddenly^1, everything was&  back to normal./%%"
	            }
	        }
	        if(sell == 4) {
	            GS.msg[0]= "\\E0* You want to know what to do&  here in Snowdin?/"
	            GS.msg[1]= "\\E4* Grillby\'s has food^1, and the&  library has information.../"
	            GS.msg[2]= "* If you\'re tired^1, you can take&  a nap at the inn^1.&* It\'s right next door ^1- my sister&  runs it./"
	            GS.msg[3]= "\\E0* And if you\'re bored^1, you can&  sit outside and watch those wacky&  skeletons do their thing./"
	            GS.msg[4]= "\\E0* There\'s two of \'em..^1.&*\\E4 Brothers^1, I think^1.&* They just showed up one day&  and..^1.&*\\E0 ... asserted themselves./"
	            GS.msg[5]= "* The town has gotten a lot&  more interesting since then./%%"
	            if(GS.flag[7] == 1) {
	                GS.msg[0]= "\\E0* I heard that it was all \'cause&  a human came through here./"
	                GS.msg[1]= "* A human..^1.&* I can hardly believe it!/"
	                GS.msg[2]= "* Well if they decide to stop&  in^1, I\'ll be sure to give&  them a hero\'s welcome./%%"
	            }
	        }
	        if(sell == 5) {
	            GS.msg[0]= "\\E4* Think back to your history&  class.../"
	            GS.msg[1]= "\\E0* A long time ago^1, monsters lived&  in the RUINS back there in&  the forest./"
	            GS.msg[2]= "* Long story short^1, we all decided&  to leave the ruins and head&  for the end of the caverns./"
	            GS.msg[3]= "* Along the way^1, some fuzzy folk&  decided they liked the cold&  and set up camp in Snowdin./"
	            GS.msg[4]= "\\E6* Oh^1, and don\'t think about&  trying to explore the RUINS.../"
	            GS.msg[5]= "\\E0* The door\'s been locked for&  ages^1.&* So unless you\'re a ghost&  or can burrow under the door^1,&  forget about it./%%"
	            if(GS.flag[7] == 1) {
	                GS.msg[0]= "\\E0* Didja hear^1?&* The RUINS have been opened up^1,&  and get this.../"
	                GS.msg[1]= "* They were opened from the&  INSIDE./"
	                GS.msg[2]= "* Apparently the Queen had been&  staying inside there for God&  knows how long./"
	                GS.msg[3]= "* Pretty unbelievable^1, huh!?/%%"
	            }
	        }
	        if(sell == 6) {
	            GS.msg[0]= "\\E0* Life is the same as usual./"
	            GS.msg[1]= "\\E1* A little claustrophobic.../"
	            GS.msg[2]= "\\E2* But..^1. we all know deep down&  that freedom is coming^1, don\'t we?/"
	            GS.msg[3]= "\\E2* As long as we got that hope^1, we&  can grit our teeth and face the&  same struggles^1, day after day.../"
	            GS.msg[4]= "\\E5* That\'s life^1, ain\'t it?/%%"
	            if(GS.flag[7] == 1) {
	                GS.msg[0]= "\\E0* Well^1, I suppose I\'ll move&  my store to the overworld.../"
	                GS.msg[1]= "* ... haven\'t planned much&  more than that^1, I\'m afraid./%%"
	            }
	        }
	        if(sell == 7) {
	            GS.msg[0]= "* (There\'s a note here.)/"
	            GS.msg[1]= "* Please don\'t hurt my family./%%"
	        }
	        instance_create(10, 110, 782/* OBJ_WRITER */)
	        selling= 1
	    }
	    if(instance_exists(782/* OBJ_WRITER */) and keyboard_multicheck_pressed(1/* ANYKEY */)) {
	        // OBJ_WRITER
	        with(782) {
	            if(halt == 0) stringpos= string_length(originalstring)
	            keyboard_clear(16/* SHIFT */)
	        }
	    }
	    if(selling == 1 and not instance_exists(782/* OBJ_WRITER */)) {
	        if(sell == 2) {
	            selling= 2
	            event_user(1)
	        } else  {
	            if(sell == 1 or sell == 7) menu= 0
	            else  menu= 3
	            sell= 0
	            selling= 0
	        }
	    }
	}
	if(Input.is_action_pressed("move_down")) {
	    menuc[menu]++
	    if(menuc[menu] > menumax) menuc[menu]= 0
	}
	if(Input.is_action_pressed("move_up")) {
	    menuc[menu]--
	    if(menuc[menu] < 0) menuc[menu]= menumax
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
