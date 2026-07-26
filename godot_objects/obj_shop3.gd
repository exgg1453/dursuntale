# Auto-converted from GameMaker: obj_shop3
extends Node2D

func _ready():
	murder= 0
	if(scr_murderlv() >= 12) murder= 1
	instance_create(0, 0, 147/* obj_fader */)
	vol= 0.8
	if(GS.flag[7] == 0) {
	    shopmus= caster_load("music/date.ogg")
	    caster_loop(shopmus, vol, 1)
	    if(murder == 1) caster_set_pitch(shopmus, 0.25)
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
	item[0]= 59
	item[1]= 49
	item[2]= 48
	item[3]= 60
	sell= 0
	bought= 0
	mainmessage= 0
	itemcost[0]= 25
	itemcost[1]= 350
	itemcost[2]= 350
	itemcost[3]= 600
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
	soldo= 0
	GS.faceemotion= 0
	GS.flag[20]= 0
	cattywriter= 1
	brattywriter= 2
	cwe= 0
	bwe= 0
	catty= 1407
	bratty= 1408
	if(murder == 1) obj_shopkeeper_catty.visible= 0
	if(murder == 1) obj_shopkeeper_bratty.visible= 0
	con= 0

func _gm_event_2_4():
	con++

func _gm_event_2_3():
	if(GS.flag[7] == 0) caster_free(shopmus)
	instance_create(0, 0, 148/* obj_persistentfader */)
	get_tree().change_scene_to_file("res://godot_rooms/182.tscn")

func _gm_event_2_2():
	if(GS.flag[7] == 0) {
	    caster_set_volume(shopmus, vol)
	    vol-= 0.02
	    $Alarm2.start((1) / 30.0)
	}

func _gm_event_7_13():
	cattywriter= instance_create(145, 110, 782/* OBJ_WRITER */)
	cattywriter.mycolor= 16759772

func _gm_event_7_12():
	brattywriter= instance_create(-10, 110, 782/* OBJ_WRITER */)
	brattywriter.mycolor= 13941759

func _gm_event_7_11():
	instance_create(0, 0, 149/* obj_unfader */)
	$Alarm2.start((1) / 30.0)
	$Alarm3.start((40) / 30.0)
	GS.entrance= 24
	GS.interact= 3

func _on_outside_room():
	draw_set_color(16777215)
	draw_rectangle(0, 120, 320, 240, 0)
	if(menu == 1 or menu == 2) {
	    draw_rectangle(210, 120, 320, minimenuy, 0)
	    draw_set_color(0)
	    if(minimenuy < 116) draw_rectangle(214, 120, 316, minimenuy + 4, 0)
	    draw_set_color(16777215)
	    wcheck= string(12 - GS.wstrength)
	    acheck= string(12 - GS.adef)
	    wchecks= " "
	    if(GS.wstrength <= 12) wchecks= "+"
	    if(GS.wstrength > 12) wchecks= " "
	    achecks= " "
	    if(GS.adef <= 12) achecks= "+"
	    if(GS.adef > 12) achecks= " "
	    if(menuc[1] == 0)
	        draw_text(224, minimenuy + 14, "Heals 17HP#Has a big#bite out of#it.")
	    if(menuc[1] == 3) {
	        if(GS.flag[444] == 0)
	            draw_text(224, minimenuy + 14, "?????#Probably#to someone\'s#house LOL")
	        else  draw_text(224, minimenuy + 14, "SOLD OUT!")
	    }
	    if(menuc[1] == 2) {
	        if(GS.flag[443] == 0)
	            draw_text(224, minimenuy + 14, "Armor: 12DF#(" + achecks + acheck + " DF)#ATTACK up#when worn.")
	        else  draw_text(224, minimenuy + 14, "SOLD OUT!")
	    }
	    if(menuc[1] == 1) {
	        if(GS.flag[442] == 0)
	            draw_text(224, minimenuy + 14, "Weapon: 12AT#(" + wchecks + wcheck + " AT)#Bullets NOT#included.")
	        else  draw_text(224, minimenuy + 14, "SOLD OUT!")
	    }
	}
	if(menu < 4) {
	    draw_set_color(0)
	    if(menu == 0) {
	        draw_rectangle(4, 124, 104, 236, 0)
	        draw_rectangle(108, 124, 210, 236, 0)
	    } else  draw_rectangle(4, 124, 210, 236, 0)
	    draw_rectangle(214, 124, 316, 236, 0)
	} else  {
	    draw_set_color(0)
	    draw_rectangle(4, 124, 156, 236, 0)
	    draw_rectangle(160, 124, 316, 236, 0)
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
	        GS.msg[0]= "* Don\'t be shy now./*"
	        mainmessage= 0 and GS.flag[69] == 0
	        GS.msg[0]= "* Hey^1!&* Check it&  out!/*"
	        if(murder == 1) GS.msg[0]= "* But^1, like./*"
	        brattywriter= instance_create(-10, 110, 782/* OBJ_WRITER */)
	        brattywriter.mycolor= 13941759
	        GS.msg[0]= "* Yeah!&* Check it&  out!/*"
	        if(murder == 1) GS.msg[0]= "* Nobody&  came and&  stuff./*"
	        cattywriter= instance_create(93, 110, 782/* OBJ_WRITER */)
	        cattywriter.mycolor= 16759772
	        catty.face= 0
	        bratty.face= 0
	        catty.armexp= 0
	        bratty.armexp= 0
	        GS.faceemotion= 0
	        GS.flag[20]= 0
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
	    } else  {
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
	                sell= 7
	                menu= 4
	            }
	        }
	        if(menuc[0] == 3) {
	            sell= 2
	            menu= 4
	        }
	    }
	}
	if(menu == 1 or menu == 2) {
	    if(murder == 0) draw_text(30, 130, " 25G - Junk Food")
	    if(murder == 1) draw_text(30, 130, " 00G - Junk Food")
	    if(GS.flag[442] == 0) {
	        if(murder == 0) draw_text(30, 150, "350G - Empty Gun")
	        else  draw_text(30, 150, "000G - Empty Gun")
	    } else  {
	        draw_set_color(8421504)
	        draw_text(30, 150, "--- SOLD OUT ---")
	        draw_set_color(16777215)
	    }
	    if(GS.flag[443] == 0) {
	        if(murder == 0) draw_text(30, 170, "350G - Cowboy Hat")
	        else  draw_text(30, 170, "000G - Cowboy Hat")
	    } else  {
	        draw_set_color(8421504)
	        draw_text(30, 170, "--- SOLD OUT ---")
	        draw_set_color(16777215)
	    }
	    if(GS.flag[444] == 0) {
	        if(murder == 0) draw_text(30, 190, "600G - Mystery Key")
	        else  draw_text(30, 190, "000G - Mystery Key")
	    } else  {
	        draw_set_color(8421504)
	        draw_text(30, 190, "--- SOLD OUT ---")
	        draw_set_color(16777215)
	    }
	    draw_text(30, 210, "Exit")
	    if(menu == 1) {
	        menumax= 4
	        if(not instance_exists(782/* OBJ_WRITER */)) {
	            if(murder == 0) {
	                if(sidemessage == 0)
	                    GS.msg[0]= "\\E0You should&buy ALL&our stuff!/*"
	                if(sidemessage == 1)
	                    GS.msg[0]= "\\E4Bratty!&We\'re&gonna&be rich!/*"
	                if(sidemessage == 2)
	                    GS.msg[0]= "\\E0So are&you gonna&buy it??/*"
	                if(sidemessage == 3)
	                    GS.msg[0]= "\\E0You need&WAY more&money./*"
	                if(sidemessage == 4)
	                    GS.msg[0]= "\\E0You have&TOO many&items!!!/*"
	                if(sidemessage == 5)
	                    GS.msg[0]= "\\E4We\'re all&$$$$$old&out!&Mee-YOW!/*"
	            } else  GS.msg[0]= "/*"
	            cattywriter= instance_create(210, 110, 782/* OBJ_WRITER */)
	            cattywriter.mycolor= 16759772
	        }
	        draw_sprite(49/* spr_heartsmall */, 0, 15, 135 + menuc[1] * 20)
	        if(keyboard_multicheck_pressed(0/* NOKEY */)) {
	            soldout= 0
	            if(menuc[1] == 1 and GS.flag[442] == 1) soldout= 1
	            if(menuc[1] == 2 and GS.flag[443] == 1) soldout= 1
	            if(menuc[1] == 3 and GS.flag[444] == 1) soldout= 1
	            if(soldout == 0) menu= 2
	            else  sidemessage= 5
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
	        draw_text(230, 130, "Buy it for")
	        draw_text(230, 145, string(itemcost[menuc[1]]) + "G ?")
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
	                            snd_play(113/* snd_buyitem */)
	                            sidemessage= 1
	                            if(menuc[1] == 1) GS.flag[442]= 1
	                            if(menuc[1] == 2) GS.flag[443]= 1
	                            if(menuc[1] == 3) GS.flag[444]= 1
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
	    if(GS.flag[7] != 1) {
	        if(GS.flag[437] < 2) draw_text(30, 130, "About you two")
	        if(GS.flag[437] == 2) {
	            draw_set_color(65535)
	            draw_text(30, 130, "Burgerpants (NEW)")
	            draw_set_color(16777215)
	        }
	        if(GS.flag[437] == 4) {
	            draw_set_color(65535)
	            draw_text(30, 130, "More Burgerpants (NEW)")
	            draw_set_color(16777215)
	        }
	        if(GS.flag[437] == 5) draw_text(30, 130, "About you two")
	        if(GS.flag[437] == 6) {
	            draw_set_color(65535)
	            draw_text(30, 130, "B.Pants Hangout? (NEW)")
	            draw_set_color(16777215)
	        }
	        if(GS.flag[437] == 7) {
	            draw_set_color(65535)
	            draw_text(30, 130, "That Kind of Guy (NEW)")
	            draw_set_color(16777215)
	        }
	        if(GS.flag[437] >= 8) draw_text(30, 130, "About you two")
	        if(GS.flag[405] == 0) draw_text(30, 150, "About your wares")
	        if(GS.flag[405] == 1) {
	            draw_set_color(65535)
	            draw_text(30, 150, "Origin of wares (NEW)")
	            draw_set_color(16777215)
	        }
	        if(GS.flag[405] == 2) {
	            draw_set_color(65535)
	            draw_text(30, 150, "Origin of garbage (NEW)")
	            draw_set_color(16777215)
	        }
	        if(GS.flag[405] == 3) draw_text(30, 150, "Origin of garbage")
	        if(GS.flag[406] == 0) draw_text(30, 170, "About Mettaton")
	        if(GS.flag[406] == 1) {
	            draw_set_color(65535)
	            draw_text(30, 170, "Origin of Mettaton (NEW)")
	            draw_set_color(16777215)
	        }
	        if(GS.flag[406] == 2) {
	            draw_set_color(16777215)
	            draw_text(30, 170, "About Mettaton (OLD???)")
	            draw_set_color(16777215)
	        }
	        if(GS.flag[407] == 0) draw_text(30, 190, "About Alphys")
	        if(GS.flag[407] == 1) {
	            draw_set_color(65535)
	            draw_text(30, 190, "Royal Scientist (NEW)")
	            draw_set_color(16777215)
	        }
	        if(GS.flag[407] == 2) {
	            draw_set_color(65535)
	            draw_text(30, 190, "About ASGORE (NEW)")
	            draw_set_color(16777215)
	        }
	        if(GS.flag[407] == 3) {
	            draw_set_color(16777215)
	            draw_text(30, 190, "About ASGORE")
	            draw_set_color(16777215)
	        }
	    }
	    if(GS.flag[7] == 1) {
	        draw_text(30, 130, "Freedom")
	        draw_text(30, 150, "I\'m a human")
	        draw_text(30, 170, "Future")
	        draw_text(30, 190, "Do You Like Cats")
	    }
	    draw_text(30, 210, "Exit")
	    if(not instance_exists(782/* OBJ_WRITER */)) {
	        GS.faceemotion= 0
	        GS.flag[20]= 0
	        catty.face= 0
	        bratty.face= 0
	        catty.armexp= 0
	        bratty.armexp= 0
	        GS.msg[0]= "So, like,&what\'s up?/*"
	        brattywriter= instance_create(210, 110, 782/* OBJ_WRITER */)
	        brattywriter.mycolor= 13941759
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
	            if(murder == 0) {
	                scr_itemcheck(40)
	                if(haveit == 0) {
	                    GS.msg[0]= "* Thanks^1, but we^1,&  like^1, don\'t&  really need&  anything./*"
	                    event_user(2)
	                    con= 75
	                }
	                if(haveit == 1) {
	                    con= 81
	                    GS.msg[0]= "\\M2* Oh my God^1.&* Is that a&  glamburger?/*"
	                    event_user(2)
	                }
	            } else  {
	                if(GS.flag[256] == 0) {
	                    GS.flag[256]= 1
	                    GS.gold+= 5
	                    GS.msg[0]= "* Stole 5G&  from the&  till./%%"
	                    event_user(2)
	                } else  {
	                    GS.msg[0]= "* The till&  is empty./%%"
	                    event_user(2)
	                }
	            }
	        }
	        if(sell == 2) {
	            if(murder == 0) {
	                GS.msg[0]= "* Like^1, see&  you later!  /%%"
	                event_user(2)
	                GS.msg[0]= "* Like^1, later&  and stuff!/%%"
	                event_user(3)
	            } else  {
	                GS.msg[0]= "* .../%%"
	                event_user(2)
	                GS.msg[0]= "* .../%%"
	                event_user(3)
	            }
	        }
	        if(sell == 3) {
	            if(GS.flag[437] != 2 and GS.flag[437] != 4 and GS.flag[437] != 6 and GS.flag[437] != 7 and GS.flag[7] != 1) {
	                con= 4
	                GS.msg[0]= "* I\'m Bratty^1, and&  this is my&  best friend^1,&  Catty./%%"
	                brattywriter= instance_create(-10, 110, 782/* OBJ_WRITER */)
	                brattywriter.mycolor= 13941759
	                GS.msg[0]= "* I\'m Catty^1, and&  this is my&  best friend^1,&  Bratty./%%"
	                cattywriter= instance_create(145, 110, 782/* OBJ_WRITER */)
	                cattywriter.mycolor= 16759772
	            } else  {
	                if(GS.flag[7] == 0) {
	                    if(GS.flag[437] == 7) {
	                        GS.flag[437]= 8
	                        GS.msg[0]= "\\M3* Well^1, that kind&  of guy.../"
	                        GS.msg[1]= "\\M5* You hang out&  with him once^1,&  then he wants&  to hang out.../"
	                        GS.msg[2]= "\\M2* All^1.&* The^1.&* Time./%%"
	                        event_user(2)
	                        con= 160
	                    }
	                    if(GS.flag[437] == 6) {
	                        GS.flag[437]= 7
	                        GS.msg[0]= "\\M5* Oh^1, uh.../*"
	                        event_user(2)
	                        con= 140
	                    }
	                    if(GS.flag[437] == 4) {
	                        GS.flag[437]= 5
	                        GS.msg[0]= "\\M4* OK^1, like^1,&  the annoying&  thing is.../*"
	                        event_user(2)
	                        con= 120
	                    }
	                    if(GS.flag[437] == 2) {
	                        GS.flag[437]= 4
	                        GS.msg[0]= "\\M2* Oh^1, that guy&  from the&  store^1?&*\\M4 Yuck^1, what a&  creep./*"
	                        event_user(2)
	                        con= 110
	                    }
	                } else  {
	                    GS.msg[0]= "\\M0* So^1, we\'re&  like^1,&  totally&  free now^1,&  huh?/*"
	                    event_user(2)
	                    con= 170
	                }
	            }
	        }
	        if(sell == 4) {
	            if(GS.flag[7] == 0) {
	                if(GS.flag[405] == 2 or GS.flag[405] == 3) {
	                    GS.msg[0]= "* Where do we&  get the&  garbage?/"
	                    GS.msg[1]= "\\M4* Like^1, the&  garbage store^1,&  duh!!!/%%"
	                    event_user(2)
	                    con= 22
	                }
	                if(GS.flag[405] == 1) {
	                    GS.msg[0]= "* I mean^1, like^1,&  where does&  anyone get guns^1,&  or food^1, or.../*"
	                    event_user(2)
	                    con= 16
	                }
	                if(GS.flag[405] == 0) {
	                    con= 10
	                    GS.msg[0]= "* The stuff&  inside^1, is&  like.../*"
	                    event_user(2)
	                }
	                if(GS.flag[405] == 2) GS.flag[405]= 3
	                if(GS.flag[405] == 1) GS.flag[405]= 2
	                if(GS.flag[405] == 0) GS.flag[405]= 1
	            } else  {
	                GS.msg[0]= "\\M2* Oh^1, oops^1,&  really?/"
	                GS.msg[1]= "\\M3* Uh^1, well^1,&  when we&  said^1, um.../"
	                GS.msg[2]= "* We were&  hyped for the&  destruction&  of humanity.../"
	                GS.msg[3]= "* We were^1,&  just^1, like^1,&  joking^1, you&  know?/%%"
	                event_user(2)
	                con= 180
	            }
	        }
	        if(sell == 5) {
	            if(GS.flag[7] == 0) {
	                if(GS.flag[406] == 1) {
	                    GS.msg[0]= "* So^1, like^1,&  Dr. Alphys&  built Mettaton^1,&  right?/*"
	                    event_user(2)
	                    con= 40
	                }
	                if(GS.flag[406] == 0 or GS.flag[406] == 2) {
	                    GS.msg[0]= "\\M6* Oh my God^1.&* Mettaton./"
	                    GS.msg[1]= "\\M6* He\'s like..^1.&* My robot&  husband.          /"
	                    GS.msg[2]= "\\M4* I think we\'re&  like..^1. both&  going to marry&  him./%%"
	                    event_user(2)
	                    GS.msg[0]= "\\E2* Oh my GOD^1,&* METTATON./"
	                    GS.msg[1]= "\\E2* Actually he\'s&  like..^1.&* MY robot&  husband./"
	                    GS.msg[2]= "* We\'re both&  like^1, ALREADY&  married to&  him.      /"
	                    GS.msg[3]= "\\E6* He just^1, like^1,&  doesn\'t know&  it yet./%%"
	                    event_user(3)
	                }
	                if(GS.flag[406] == 1) GS.flag[406]= 2
	                if(GS.flag[406] == 0) GS.flag[406]= 1
	            } else  {
	                GS.msg[0]= "* Hmmm..^1.&* Now that&  we\'re&  gonna be&  free.../*"
	                event_user(2)
	                con= 190
	            }
	        }
	        if(sell == 6) {
	            if(GS.flag[7] == 0) {
	                if(GS.flag[407] == 0) {
	                    GS.msg[0]= "\\M5* Oh my God^1.&* Alphys./"
	                    GS.msg[1]= "\\M0* She used to&  live on our&  street./%%"
	                    event_user(2)
	                    GS.msg[0]= "\\E7* Oh my god^1,&* ALPHYS./"
	                    GS.msg[1]= "\\E0* She was like&  a big sister.      /%%"
	                    event_user(3)
	                    con= 50
	                }
	                if(GS.flag[407] == 1) {
	                    GS.msg[0]= "\\M0* So Alphys&  has always^1,&  like.../*"
	                    event_user(2)
	                    con= 60
	                }
	                if(GS.flag[407] == 2 or GS.flag[407] == 3) {
	                    GS.msg[0]= "\\M4* Oh my God^1.&* He\'s a total&  goober./"
	                    GS.msg[1]= "\\M0* Like^1, I LOVE&  that guy./"
	                    GS.msg[2]= "\\M5* God^1, we\'re&  like.../"
	                    GS.msg[3]= "\\M1* SO hyped for&  the destruction&  of humanity./%%"
	                    event_user(2)
	                    GS.msg[0]= "\\E0* He\'s a big^1,&  fuzzy&  goofball!!   /"
	                    GS.msg[1]= "\\E0* He\'s like^1,&  SO nice.  /"
	                    GS.msg[2]= "\\E7* God^1, we\'re&  like.../"
	                    GS.msg[3]= "\\E1* SO hyped for&  the destruction&  of humanity./%%"
	                    event_user(3)
	                    con= 0
	                }
	                if(GS.flag[407] == 2) GS.flag[407]= 3
	                if(GS.flag[407] == 1) GS.flag[407]= 2
	                if(GS.flag[407] == 0) GS.flag[407]= 1
	            } else  {
	                GS.msg[0]= "\\M0* Me^1?&* Yeah^1, I&  LOVE cats!/"
	                GS.msg[1]= "\\M1* They\'re^1,&  like^1,&  SO tasty!!/%%"
	                event_user(2)
	                GS.msg[0]= "\\E8* Me^1?&* Yeah^1, I&  LOVE cats!/"
	                GS.msg[1]= "\\E1* They\'re^1,&  like^1,&  SO cute!!!/%%"
	                event_user(3)
	                con= 200
	            }
	        }
	        if(sell == 7) {
	            GS.msg[0]= "* Hey^1, this is&  Bratty!/*"
	            event_user(2)
	            GS.msg[0]= "* Hey^1, this is&  Catty! /%%"
	            event_user(3)
	            con= 250
	        }
	        if(not instance_exists(782/* OBJ_WRITER */)) instance_create(10, 110, 782/* OBJ_WRITER */)
	        selling= 1
	    }
	    if(con == 4 and not instance_exists(782/* OBJ_WRITER */)) {
	        caster_pause(shopmus)
	        mew= caster_load("music/myemeow.ogg")
	        selling= 4
	        con= 5
	        GS.faceemotion= 7
	        GS.flag[20]= 5
	        $Alarm4.start((30) / 30.0)
	    }
	    if(con == 6 and not instance_exists(782/* OBJ_WRITER */)) {
	        caster_play(mew, 0.5, 0.9)
	        selling= 4
	        con= 7
	        GS.faceemotion= 1
	        GS.flag[20]= 1
	        $Alarm4.start((50) / 30.0)
	    }
	    if(con == 8) {
	        caster_free(mew)
	        selling= 1
	        con= 0
	        caster_resume(shopmus)
	    }
	    if(con == 10) {
	        selling= 4
	        if(is_instance_valid(brattywriter) and brattywriter.halt != 0) {
	            GS.msg[0]= "\\E3* TOTALLY wicked&  expensive./%%"
	            event_user(3)
	            con= 11
	        }
	    }
	    if(con == 11 and not is_instance_valid(cattywriter)) {
	        with(brattywriter) instance_destroy()
	        GS.msg[0]= "* But^1, like^1, this&  stuff we found&  is like.../*"
	        event_user(2)
	        con= 12
	    }
	    if(con == 12 and is_instance_valid(brattywriter) and brattywriter.halt != 0) {
	        GS.msg[0]= "\\E3* TOTALLY wicked&  cheap./%%"
	        event_user(3)
	        con= 13
	    }
	    if(con == 13 and not is_instance_valid(cattywriter)) {
	        with(brattywriter) instance_destroy()
	        GS.msg[0]= "\\M5* You should.../"
	        GS.msg[1]= "\\M1* TOTALLY wicked&  buy all of&  it?/%%"
	        event_user(2)
	        GS.msg[0]= "\\E7* Like...      /"
	        GS.msg[1]= "\\E4* TOTALLY wicked&  buy all of&  it?/%%"
	        event_user(3)
	        con= 14
	    }
	    if(con == 14 and not instance_exists(782/* OBJ_WRITER */)) {
	        selling= 1
	        con= 0
	    }
	    if(con == 16) {
	        selling= 4
	        if(is_instance_valid(brattywriter) and brattywriter.halt != 0) {
	            GS.flag[20]= 2
	            GS.msg[0]= "\\E1* We found it in&  the garbage!/%%"
	            event_user(3)
	            con= 17
	        }
	    }
	    if(con == 17 and not is_instance_valid(cattywriter)) {
	        caster_pause(shopmus)
	        with(brattywriter) instance_destroy()
	        GS.faceemotion= 5
	        GS.flag[20]= 5
	        con= 18
	        $Alarm4.start((70) / 30.0)
	    }
	    if(con == 19) {
	        caster_resume(shopmus)
	        GS.msg[0]= "\\M3* It\'s GOOD&  garbage./*"
	        event_user(2)
	        GS.msg[0]= "\\E4* It\'s like^1,&  really good&  garbage./%%"
	        event_user(3)
	        con= 20
	    }
	    if(con == 20 and not is_instance_valid(cattywriter)) {
	        with(brattywriter) instance_destroy()
	        con= 0
	        selling= 1
	    }
	    if(con == 22) {
	        selling= 4
	        if(not is_instance_valid(brattywriter)) {
	            GS.msg[0]= "\\M5* ...../"
	            GS.msg[1]= "\\M1* Waterfall&  mostly.                  /%%"
	            event_user(2)
	            GS.msg[0]= "\\E7* ...../"
	            GS.msg[1]= "\\E1* I found a gun&  in a dumpster!/%%"
	            event_user(3)
	            selling= 1
	            con= 0
	        }
	    }
	    if(con == 40) {
	        selling= 4
	        if(is_instance_valid(brattywriter) and brattywriter.halt != 0) {
	            GS.msg[0]= "\\E6* That\'s like^1,&  what they&  TELL you./%%"
	            event_user(3)
	            con= 41
	        }
	    }
	    if(con == 41 and not is_instance_valid(cattywriter)) {
	        with(brattywriter) instance_destroy()
	        GS.msg[0]= "\\M2* But like..^1.&* Mettaton always&  acts like.../*"
	        event_user(2)
	        con= 42
	    }
	    if(con == 42) {
	        selling= 4
	        if(is_instance_valid(brattywriter) and brattywriter.halt != 0) {
	            GS.msg[0]= "\\E5* ... being built&  was HIS&  idea somehow./%%"
	            event_user(3)
	            con= 43
	        }
	    }
	    if(con == 43 and not is_instance_valid(cattywriter)) {
	        with(brattywriter) instance_destroy()
	        GS.msg[0]= "\\M5* And even right&  after he was&  built.../*"
	        event_user(2)
	        con= 44
	    }
	    if(con == 44) {
	        selling= 4
	        if(is_instance_valid(brattywriter) and brattywriter.halt != 0) {
	            GS.msg[0]= "\\E7* ... he acted&  like Alphys was&  an old friend./%%"
	            event_user(3)
	            con= 46
	        }
	    }
	    if(con == 46 and not is_instance_valid(cattywriter)) {
	        with(brattywriter) instance_destroy()
	        GS.msg[0]= "\\M4* But they\'re&  like..^1.&* Not friends&  anymore./*"
	        event_user(2)
	        con= 47
	    }
	    if(con == 47) {
	        selling= 4
	        if(is_instance_valid(brattywriter) and brattywriter.halt != 0) {
	            GS.msg[0]= "\\E1* Yeah!!^1!&* Unlike me&  and Bratty!^1!&* Best friends&  for-EVER!!!/%%"
	            event_user(3)
	            con= 48
	        }
	    }
	    if(con == 48 and not is_instance_valid(cattywriter)) {
	        with(brattywriter) instance_destroy()
	        con= 0
	        selling= 1
	    }
	    if(con == 50) {
	        selling= 4
	        if(not is_instance_valid(cattywriter)) {
	            with(brattywriter) instance_destroy()
	            GS.msg[0]= "\\M4* I mean^1, like^1,&  if your big&  sister.../*"
	            event_user(2)
	            con= 51
	        }
	    }
	    if(con == 51) {
	        selling= 4
	        if(is_instance_valid(brattywriter) and brattywriter.halt != 0) {
	            GS.msg[0]= "\\E1* Takes you on&  trips to the&  dump./%%"
	            event_user(3)
	            con= 52
	        }
	    }
	    if(con == 52) {
	        selling= 4
	        if(not is_instance_valid(cattywriter)) {
	            with(brattywriter) instance_destroy()
	            GS.msg[0]= "\\M0* She showed us&  the coolest&  places to&  find trash./*"
	            event_user(2)
	            con= 53
	        }
	    }
	    if(con == 53 and is_instance_valid(brattywriter) and brattywriter.halt != 0) {
	        GS.msg[0]= "\\E7* She was always&  collecting&  these weird&  cartoons./%%"
	        event_user(3)
	        con= 54
	    }
	    if(con == 54) {
	        selling= 4
	        if(not is_instance_valid(cattywriter)) {
	            with(brattywriter) instance_destroy()
	            GS.msg[0]= "\\M5* Then she&  became the&  Royal&  Scientist.../*"
	            event_user(2)
	            con= 55
	        }
	    }
	    if(con == 55 and is_instance_valid(brattywriter) and brattywriter.halt != 0) {
	        GS.msg[0]= "\\E5* Yeah^1, we&  haven\'t seen&  her in&  forever.../%%"
	        event_user(3)
	        con= 56
	    }
	    if(con == 56 and not is_instance_valid(cattywriter)) {
	        with(brattywriter) instance_destroy()
	        selling= 1
	        con= 0
	    }
	    if(con == 60) {
	        selling= 4
	        if(is_instance_valid(brattywriter) and brattywriter.halt != 0) {
	            GS.msg[0]= "\\E2* Thought ASGORE&  is a SUPER&  cutie./%%"
	            event_user(3)
	            con= 61
	        }
	    }
	    if(con == 61) {
	        selling= 4
	        if(not is_instance_valid(cattywriter)) {
	            with(brattywriter) instance_destroy()
	            GS.msg[0]= "\\M4* So^1, like^1, I\'m&  pretty sure&  she.../*"
	            event_user(2)
	            con= 62
	        }
	    }
	    if(con == 62 and is_instance_valid(brattywriter) and brattywriter.halt != 0) {
	        GS.msg[0]= "\\E0* Made Mettaton&  to^1, like^1,&  totally&  impress him./%%"
	        event_user(3)
	        con= 62.1
	    }
	    if(con == 62.1) {
	        selling= 4
	        if(not is_instance_valid(cattywriter)) {
	            with(brattywriter) instance_destroy()
	            GS.msg[0]= "\\M2* A robot with a&  SOUL.../*"
	            event_user(2)
	            con= 62.2
	        }
	    }
	    if(con == 62.2 and is_instance_valid(brattywriter) and brattywriter.halt != 0) {
	        GS.msg[0]= "\\E5* That\'s^1, like^1,&  SUPER relevant&  to his hobbies!/%%"
	        event_user(3)
	        con= 62.3
	    }
	    if(con == 62.3) {
	        selling= 4
	        if(not is_instance_valid(cattywriter)) {
	            with(brattywriter) instance_destroy()
	            GS.msg[0]= "\\M0* So after seeing&  Mettaton^1,&  ASGORE.../*"
	            event_user(2)
	            con= 62.4
	        }
	    }
	    if(con == 62.4 and is_instance_valid(brattywriter) and brattywriter.halt != 0) {
	        GS.msg[0]= "\\E0* Asked her to do&  all this science&  stuff for him!/"
	        GS.msg[1]= "\\E5* But nobody\'s^1,&  like^1, seen&  anything from&  her yet./%%"
	        event_user(3)
	        con= 65
	    }
	    if(con == 65) {
	        if(is_instance_valid(cattywriter) and cattywriter.stringno == 1) {
	            with(brattywriter) instance_destroy()
	        }
	        selling= 4
	        if(not is_instance_valid(cattywriter)) {
	            with(brattywriter) instance_destroy()
	            GS.msg[0]= "\\M2* Or...&  her at all.../*"
	            event_user(2)
	            con= 66
	        }
	    }
	    if(con == 66 and is_instance_valid(brattywriter) and brattywriter.halt != 0) {
	        GS.msg[0]= "\\E0* She must^1,&  like^1, just&  stay in her&  lab all day./%%"
	        event_user(3)
	        con= 67
	    }
	    if(con == 67) {
	        selling= 4
	        if(not is_instance_valid(cattywriter)) {
	            with(brattywriter) instance_destroy()
	            GS.msg[0]= "\\M4* Like^1, live&  a little^1,&  girl./*"
	            event_user(2)
	            con= 68
	        }
	    }
	    if(con == 68 and is_instance_valid(brattywriter) and brattywriter.halt != 0) {
	        GS.msg[0]= "\\E1* Yeah!!^1!&* Like us!!!/%%"
	        event_user(3)
	        con= 70
	    }
	    if(con == 70 and not is_instance_valid(cattywriter)) {
	        with(brattywriter) instance_destroy()
	        con= 0
	        selling= 1
	    }
	    if(con == 75) {
	        selling= 4
	        if(is_instance_valid(brattywriter) and brattywriter.halt != 0) {
	            GS.flag[20]= 5
	            GS.msg[0]= "\\E4* Oh my god^1,&  can you go&  get us some&  Glamburgers?/%%"
	            event_user(3)
	            con= 76
	        }
	    }
	    if(con == 76) {
	        selling= 4
	        if(not is_instance_valid(cattywriter)) {
	            with(brattywriter) instance_destroy()
	            GS.msg[0]= "\\M0* We don\'t.&* Really need^1.&* Anything./*"
	            event_user(2)
	            con= 77
	        }
	    }
	    if(con == 77) {
	        selling= 4
	        if(is_instance_valid(brattywriter) and brattywriter.halt != 0) {
	            GS.msg[0]= "\\E2* Wait^1! I\'ll pay&  you 1000G if&  you get Mettaton&  to autograph&  my butt!/%%"
	            event_user(3)
	            con= 78
	        }
	    }
	    if(con == 78 and not is_instance_valid(cattywriter)) {
	        with(brattywriter) instance_destroy()
	        con= 0
	        selling= 1
	    }
	    if(con == 81) {
	        selling= 4
	        if(is_instance_valid(brattywriter) and brattywriter.halt != 0) {
	            GS.flag[20]= 5
	            GS.msg[0]= "\\E4* OH MY GOD!!^1!&* GIMME!!!/%%"
	            event_user(3)
	            con= 83
	        }
	    }
	    if(con == 83) {
	        selling= 4
	        if(not is_instance_valid(cattywriter)) {
	            with(brattywriter) instance_destroy()
	            GS.msg[0]= "\\M4* God^1, Catty.&* Try to have&  some&  self-control./*"
	            event_user(2)
	            con= 84
	        }
	    }
	    if(con == 84) {
	        selling= 4
	        if(is_instance_valid(brattywriter) and brattywriter.halt != 0) {
	            GS.msg[0]= "\\E5* Sorry.../%%"
	            event_user(3)
	            con= 85
	        }
	    }
	    if(con == 85) {
	        selling= 4
	        if(not is_instance_valid(cattywriter)) {
	            with(brattywriter) instance_destroy()
	            GS.msg[0]= "\\M6* \'Cause they&  OBVIOUSLY&  brought that&  Glamburger&  for ME./*"
	            event_user(2)
	            con= 86
	        }
	    }
	    if(con == 86) {
	        selling= 4
	        if(is_instance_valid(brattywriter) and brattywriter.halt != 0) {
	            GS.msg[0]= "\\E1* NOOO WAYYY!!!!!/%%"
	            event_user(3)
	            con= 87
	        }
	    }
	    if(con == 87 and not is_instance_valid(cattywriter)) {
	        with(brattywriter) instance_destroy()
	        con= 0
	        selling= 1
	    }
	    if(con == 110) {
	        selling= 4
	        if(is_instance_valid(brattywriter) and brattywriter.halt != 0) {
	            GS.msg[0]= "\\E5* Yeah^1! He\'s&  a creep!/%%"
	            event_user(3)
	            con= 111
	        }
	    }
	    if(con == 111 and not is_instance_valid(cattywriter)) {
	        with(brattywriter) instance_destroy()
	        con= 112
	        GS.flag[20]= 2
	        GS.msg[0]= "\\E7* But he\'s kind&  of cute^1,&  too.../%%"
	        event_user(3)
	    }
	    if(con == 112) {
	        selling= 4
	        if(not is_instance_valid(cattywriter)) {
	            GS.msg[0]= "\\M4* C\'mon^1,&  Catty^1, don\'t&  you have&  ANY&  standards^2?/*"
	            event_user(2)
	            con= 113
	        }
	    }
	    if(con == 113) {
	        selling= 4
	        if(is_instance_valid(brattywriter) and brattywriter.halt != 0) {
	            GS.flag[20]= 1
	            GS.msg[0]= "\\E1*\\M1 Nope!!!/%%"
	            event_user(3)
	            con= 114
	        }
	    }
	    if(con == 114 and not is_instance_valid(cattywriter)) {
	        with(brattywriter) instance_destroy()
	        con= 0
	        selling= 1
	    }
	    if(con == 120) {
	        selling= 4
	        if(is_instance_valid(brattywriter) and brattywriter.halt != 0) {
	            GS.msg[0]= "\\E7* He\'d be OK&  if he just&  treated us&  with some&  respect./%%"
	            event_user(3)
	            con= 121
	        }
	    }
	    if(con == 121) {
	        selling= 4
	        if(not is_instance_valid(cattywriter)) {
	            with(brattywriter) instance_destroy()
	            GS.msg[0]= "\\M5* But he just&  acts..^1.&* Really&  weird./*"
	            event_user(2)
	            con= 122
	        }
	    }
	    if(con == 122) {
	        selling= 4
	        if(is_instance_valid(brattywriter) and brattywriter.halt != 0) {
	            GS.msg[0]= "\\E5* And then acts&  like it\'s OUR&  fault he&  acts that&  way!/%%"
	            event_user(3)
	            con= 123
	        }
	    }
	    if(con == 123) {
	        selling= 4
	        if(not is_instance_valid(cattywriter)) {
	            with(brattywriter) instance_destroy()
	            GS.msg[0]= "\\M0* Like^1, when&  we asked him&  to get those&  Glamburgers.../*"
	            event_user(2)
	            con= 124
	        }
	    }
	    if(con == 124) {
	        selling= 4
	        if(is_instance_valid(brattywriter) and brattywriter.halt != 0) {
	            GS.msg[0]= "\\E0* He dropped them&  and ran away&  before we&  could even say&  anything!/%%"
	            event_user(3)
	            con= 126
	        }
	    }
	    if(con == 126) {
	        selling= 4
	        if(not is_instance_valid(cattywriter)) {
	            with(brattywriter) instance_destroy()
	            GS.msg[0]= "\\M3* We were^1,&  like^1, going&  to share&  them./*"
	            event_user(2)
	            con= 127
	        }
	    }
	    if(con == 127) {
	        selling= 4
	        if(is_instance_valid(brattywriter) and brattywriter.halt != 0) {
	            GS.msg[0]= "\\E7* Really^1?&* I wasn\'t./%%"
	            event_user(3)
	            con= 128
	        }
	    }
	    if(con == 128) {
	        selling= 4
	        if(not is_instance_valid(cattywriter)) {
	            with(brattywriter) instance_destroy()
	            GS.faceemotion= 1
	            GS.flag[437]= 5
	            GS.msg[0]= "\\M1* Catty!!/%%"
	            event_user(2)
	            con= 129
	        }
	    }
	    if(con == 129 and not is_instance_valid(brattywriter)) {
	        with(cattywriter) instance_destroy()
	        con= 0
	        selling= 1
	    }
	    if(con == 140) {
	        selling= 4
	        if(is_instance_valid(brattywriter) and brattywriter.halt != 0) {
	            GS.msg[0]= "\\E1*\\M2 Yeah!^1!&* He should come&  look for&  junk with us!/%%"
	            event_user(3)
	            con= 141
	        }
	    }
	    if(con == 141) {
	        selling= 4
	        if(not is_instance_valid(cattywriter)) {
	            with(brattywriter) instance_destroy()
	            GS.faceemotion= 7
	            GS.msg[0]= "\\M3* But like^1, if&  we let him&  hang out with&  us..^1. I just&  worry it\'ll.../*"
	            event_user(2)
	            con= 142
	        }
	    }
	    if(con == 142) {
	        selling= 4
	        if(is_instance_valid(brattywriter) and brattywriter.halt != 0) {
	            GS.msg[0]= "\\E4*\\M2 ... be really&  super fun!/%%"
	            event_user(3)
	            con= 143
	        }
	    }
	    if(con == 143) {
	        selling= 4
	        if(not is_instance_valid(cattywriter)) {
	            with(brattywriter) instance_destroy()
	            GS.faceemotion= 7
	            GS.msg[0]= "\\M1* Um^1, that was&  NOT what I&  was gonna say./*"
	            event_user(2)
	            con= 145
	        }
	    }
	    if(con == 145) {
	        selling= 4
	        if(is_instance_valid(brattywriter) and brattywriter.halt != 0) {
	            GS.msg[0]= "\\E1* But I was&  close^1, right!?/%%"
	            event_user(3)
	            con= 114
	        }
	    }
	    if(con == 160) {
	        selling= 4
	        if(not is_instance_valid(brattywriter)) {
	            GS.flag[20]= 5
	            GS.msg[0]= "\\E7* But don\'t you&  feel bad for&  him^1, Bratty?/"
	            GS.msg[1]= "\\E5* Poor&  Burgerpants.../"
	            GS.msg[2]= "\\E4* Think about how&  cool we are&  compared to&  him!!!/"
	            GS.msg[3]= "* We\'d be saving&  his LIFE with&  our&  friendship!!/"
	            GS.msg[4]= "\\E1* His LIFE^1,&  Bratty!!/%%"
	            event_user(3)
	            con= 161
	        }
	    }
	    if(con == 161) {
	        selling= 4
	        if(not is_instance_valid(cattywriter)) {
	            with(brattywriter) instance_destroy()
	            GS.faceemotion= 8
	            GS.msg[0]= "\\M4* Uh^1, so?/%%"
	            event_user(2)
	            con= 162
	        }
	    }
	    if(con == 162) {
	        selling= 4
	        if(not is_instance_valid(brattywriter)) {
	            GS.msg[0]= "\\E7* ..^5. %"
	            GS.msg[1]= "\\E1* Think of all&  the glamburgers&  he could get&  for us!!/*"
	            event_user(3)
	            con= 163
	        }
	    }
	    if(con == 163) {
	        selling= 4
	        if(is_instance_valid(cattywriter) and cattywriter.halt != 0) {
	            with(brattywriter) instance_destroy()
	            GS.msg[0]= "\\M3* ... so is he&  free after&  work?/%%"
	            event_user(2)
	            con= 129
	        }
	    }
	    if(con == 170) {
	        selling= 4
	        if(is_instance_valid(brattywriter) and brattywriter.halt != 0) {
	            GS.msg[0]= "\\E0* Yeah^1, like^1,&  totally&  free./%%"
	            event_user(3)
	            con= 171
	        }
	    }
	    if(con == 171) {
	        selling= 4
	        if(not is_instance_valid(cattywriter)) {
	            with(brattywriter) instance_destroy()
	            GS.msg[0]= "* Like..^1.&* Cool./*"
	            event_user(2)
	            con= 172
	        }
	    }
	    if(con == 172) {
	        selling= 4
	        if(is_instance_valid(brattywriter) and brattywriter.halt != 0) {
	            GS.msg[0]= "\\E0* Yeah^1, like^1,&  cool./%%"
	            event_user(3)
	            con= 173
	        }
	    }
	    if(con == 173) {
	        selling= 4
	        if(not is_instance_valid(cattywriter)) {
	            with(brattywriter) instance_destroy()
	            GS.msg[0]= "* Like^1,&  milennia&  of being&  imprisoned&  finally over?/*"
	            event_user(2)
	            con= 174
	        }
	    }
	    if(con == 174) {
	        selling= 4
	        if(is_instance_valid(brattywriter) and brattywriter.halt != 0) {
	            GS.msg[0]= "\\E0* Yeah^1, that\'s&  like pretty&  chill I guess./%%"
	            event_user(3)
	            con= 114
	        }
	    }
	    if(con == 180) {
	        selling= 4
	        if(not is_instance_valid(brattywriter)) {
	            GS.flag[20]= 5
	            GS.msg[0]= "\\E7* Did we say&  that?/%%"
	            event_user(3)
	            con= 181
	        }
	    }
	    if(con == 181) {
	        selling= 4
	        if(not is_instance_valid(cattywriter)) {
	            with(brattywriter) instance_destroy()
	            GS.msg[0]= "\\M4* Probably?/"
	            GS.msg[1]= "\\M1* It\'s^1, like^1,&  practically&  our&  catchphrase./%%"
	            event_user(2)
	            con= 182
	        }
	    }
	    if(con == 182) {
	        selling= 4
	        if(not is_instance_valid(brattywriter)) {
	            GS.flag[20]= 5
	            GS.msg[0]= "\\E8* Really^1?&* I thought our&  catchphrase&  was.../"
	            GS.msg[1]= "\\E4* B-B-Bratty\'s&  the best^1,&  C-C-Catty\'s&  the coolest!/%%"
	            event_user(3)
	            con= 183
	        }
	    }
	    if(con == 183) {
	        selling= 4
	        if(not is_instance_valid(cattywriter)) {
	            GS.faceemotion= 7
	            with(brattywriter) instance_destroy()
	            GS.msg[0]= "\\M1* Um^1, no?/"
	            GS.msg[1]= "* We\'ve like&  literally&  NEVER said&  that./%%"
	            event_user(2)
	            con= 184
	        }
	    }
	    if(con == 184) {
	        selling= 4
	        if(not is_instance_valid(brattywriter)) {
	            GS.msg[0]= "\\E1* CAN it be&  though!^1?&* CAN it be!?/%%"
	            event_user(3)
	            con= 114
	        }
	    }
	    if(con == 190) {
	        selling= 4
	        if(is_instance_valid(brattywriter) and brattywriter.halt != 0) {
	            GS.flag[20]= 5
	            GS.msg[0]= "\\E4* OMG^1, we&  can finally&  fulfill our&  DREAM of having&  a pet cat!/%%"
	            event_user(3)
	            con= 191
	        }
	    }
	    if(con == 191) {
	        selling= 4
	        if(not is_instance_valid(cattywriter)) {
	            GS.faceemotion= 7
	            with(brattywriter) instance_destroy()
	            GS.msg[0]= "\\M1* That\'s^1, like^1,&  YOUR dream^1,&  Catty./*"
	            event_user(2)
	            con= 192
	        }
	    }
	    if(con == 192) {
	        selling= 4
	        if(is_instance_valid(brattywriter) and brattywriter.halt != 0) {
	            GS.msg[0]= "* But Bratty.../"
	            GS.msg[1]= "\\E5*\\M5 I don\'t wanna&  have a dream&  without YOU&  in it...!/%%"
	            event_user(3)
	            con= 193
	        }
	    }
	    if(con == 193) {
	        selling= 4
	        if(not is_instance_valid(cattywriter)) {
	            with(brattywriter) instance_destroy()
	            GS.msg[0]= "* Aww..^1.&* Catty..^3./*"
	            event_user(2)
	            con= 194
	        }
	    }
	    if(con == 194) {
	        selling= 4
	        if(is_instance_valid(brattywriter) and brattywriter.halt != 0) {
	            GS.flag[20]= 2
	            GS.msg[0]= "\\E1* And^1, in my&  dream^1, YOU clean&  up after&  the cat!/%%"
	            event_user(3)
	            con= 195
	        }
	    }
	    if(con == 195) {
	        selling= 4
	        if(not is_instance_valid(cattywriter)) {
	            with(brattywriter) instance_destroy()
	            GS.msg[0]= "\\M1* Catty!!!/%%"
	            event_user(2)
	            con= 129
	        }
	    }
	    if(con == 200 and not is_instance_valid(cattywriter)) {
	        selling= 4
	        caster_pause(GS.currentsong)
	        with(cattywriter) instance_destroy()
	        with(brattywriter) instance_destroy()
	        GS.faceemotion= 8
	        GS.flag[20]= 0
	        con= 201
	        $Alarm4.start((70) / 30.0)
	    }
	    if(con == 202) {
	        selling= 4
	        caster_resume(GS.currentsong)
	        GS.flag[20]= 1
	        GS.msg[0]= "\\E5* Bratty&  NOOOO!!!/%%"
	        event_user(3)
	        con= 203
	    }
	    if(con == 203) {
	        selling= 4
	        if(not is_instance_valid(cattywriter)) {
	            with(brattywriter) instance_destroy()
	            GS.faceemotion= 1
	            GS.msg[0]= "\\M1* I\'m just&  kidding!!/"
	            GS.msg[1]= "\\M4*\\E8 Kind of./"
	            GS.msg[2]= "\\M5*\\E7 Anyway^1, when&  was the last&  time you even&  SAW a cat&  around here?/%%"
	            event_user(2)
	            con= 204
	        }
	    }
	    if(con == 204) {
	        selling= 4
	        if(not is_instance_valid(brattywriter)) {
	            GS.flag[20]= 5
	            GS.msg[0]= "\\E8* Oh!^1!&* JUST the other&  day!/"
	            GS.msg[1]= "\\E3* There was&  this CUTE&  little white&  cat walking&  around.../"
	            GS.msg[2]= "\\E4* It was^1, like^1,&  SOOOOOO&  clueless&  looking./"
	            GS.msg[3]= "\\E1* I pet it&  for like an&  hour!!/%%"
	            event_user(3)
	            con= 205
	        }
	    }
	    if(con == 205) {
	        selling= 4
	        if(not is_instance_valid(cattywriter)) {
	            with(brattywriter) instance_destroy()
	            GS.msg[0]= "\\M5* ....^1.&* ....^1.&* ... Catty^2./*"
	            event_user(2)
	            con= 206
	        }
	    }
	    if(con == 206) {
	        selling= 4
	        if(is_instance_valid(brattywriter) and brattywriter.halt != 0) {
	            GS.msg[0]= "\\E7* Yeah^1, Bratty?/%%"
	            event_user(3)
	            con= 207
	        }
	    }
	    if(con == 207) {
	        selling= 4
	        if(not is_instance_valid(cattywriter)) {
	            with(brattywriter) instance_destroy()
	            GS.faceemotion= 8
	            GS.msg[0]= "\\M1* I think that&  was^1, like..^1.&* A dog^3./*"
	            event_user(2)
	            con= 208
	        }
	    }
	    if(con == 208) {
	        selling= 4
	        if(is_instance_valid(brattywriter) and brattywriter.halt != 0) {
	            GS.msg[0]= "\\E1* DOGS ARE JUST&  FIRM CATS!!!!/%%"
	            event_user(3)
	            con= 114
	        }
	    }
	    if(con == 250) {
	        selling= 4
	        if(not is_instance_valid(cattywriter)) {
	            with(brattywriter) instance_destroy()
	            GS.msg[0]= "* If you\'re&  reading&  this.../*"
	            event_user(2)
	            con= 251
	        }
	    }
	    if(con == 251 and is_instance_valid(brattywriter) and brattywriter.halt != 0) {
	        GS.msg[0]= "\\E7* Then^1, like^1,&  bad news you&  mega-evil&  weirdo!/%%"
	        event_user(3)
	        con= 252
	    }
	    if(con == 252 and not is_instance_valid(cattywriter)) {
	        with(brattywriter) instance_destroy()
	        GS.msg[0]= "* Alphys just&  came here&  and she\'s&  taking us.../*"
	        event_user(2)
	        con= 253
	    }
	    if(con == 253 and is_instance_valid(brattywriter) and brattywriter.halt != 0) {
	        GS.msg[0]= "\\E7* Someplace&  super duper&  safe!/%%"
	        event_user(3)
	        con= 254
	    }
	    if(con == 254 and not is_instance_valid(cattywriter)) {
	        with(brattywriter) instance_destroy()
	        GS.msg[0]= "* But^1, first^1,&  we gotta use&  up these gel&  pens./*"
	        event_user(2)
	        con= 255
	    }
	    if(con == 255 and is_instance_valid(brattywriter) and brattywriter.halt != 0) {
	        GS.msg[0]= "\\E7* Yeah^1!&* Chill^1, Alphys!&* We don\'t wanna&  waste pens!/%%"
	        event_user(3)
	        con= 256
	    }
	    if(con == 256 and not is_instance_valid(cattywriter)) {
	        with(brattywriter) instance_destroy()
	        GS.msg[0]= "* And don\'t even&  THINK about&  stealing our&  stuff./*"
	        event_user(2)
	        con= 257
	    }
	    if(con == 257 and is_instance_valid(brattywriter) and brattywriter.halt != 0) {
	        GS.msg[0]= "* Yeah^1, creep^1!&* Leave our&  junk alone!/%%"
	        event_user(3)
	        con= 258
	    }
	    if(con == 258 and not is_instance_valid(cattywriter)) {
	        with(brattywriter) instance_destroy()
	        GS.msg[0]= "* Catty^1, it\'s&  not JUNK^1.&* It\'s really&  valuable./*"
	        event_user(2)
	        con= 259
	    }
	    if(con == 259 and is_instance_valid(brattywriter) and brattywriter.halt != 0) {
	        GS.msg[0]= "* Yeah^1!&* Our garbage&  is REALLY&  valuable!/%%"
	        event_user(3)
	        con= 260
	    }
	    if(con == 260 and not is_instance_valid(cattywriter)) {
	        with(brattywriter) instance_destroy()
	        GS.msg[0]= "* Anyway^1.&* In closing^1:&* You\'re a&  total loser!/*"
	        event_user(2)
	        con= 261
	    }
	    if(con == 261 and is_instance_valid(brattywriter) and brattywriter.halt != 0) {
	        GS.msg[0]= "* Yeah^1!&* Loser!!^1!&* Nya ha ha!!!/%%"
	        event_user(3)
	        con= 262
	    }
	    if(con == 262 and not is_instance_valid(cattywriter)) {
	        with(brattywriter) instance_destroy()
	        GS.msg[0]= "* Signed^1,&  Bratty <3/%%"
	        event_user(2)
	        GS.msg[0]= "* Signed^1,&  Catty <3 /%%"
	        event_user(3)
	        con= 129
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
	if(GS.debug == 1) {
	    if(Input.is_key_pressed(71)) GS.gold= 5000
	    if(Input.is_key_pressed(75)) {
	        caster_free(-3)
	        get_tree().change_scene_to_file("res://godot_rooms/314.tscn")
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
