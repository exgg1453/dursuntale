# Auto-converted from GameMaker: obj_shop5
extends Node2D

func _ready():
	murder= 0
	ini_open("undertale.ini")
	gm= ini_read_real("General", "Gameover", 0)
	ini_close()
	if(scr_murderlv() >= 10) murder= 1
	instance_create(0, 0, 147/* obj_fader */)
	vol= 0.5
	if(GS.flag[7] == 0) {
	    shopmus= caster_load("music/temshop.ogg")
	    caster_loop(shopmus, vol, 1)
	    if(murder == 1) caster_set_pitch(shopmus, 0.5)
	}
	menumax= 3
	menu= 0
	menuc[0]= 0
	menuc[1]= 0
	menuc[2]= 0
	menuc[3]= 0
	menuc[4]= 0
	menuc[5]= 0
	menuc[6]= 0
	menuc[7]= 0
	item0pic= 34
	item1pic= 34
	item2pic= 34
	item3pic= 34
	item[0]= 22
	item[1]= 22
	item[2]= 22
	item[3]= 64
	if(murder == 1) item[3]= 22
	sell= 0
	bought= 0
	mainmessage= 0
	itemcost[0]= 3
	itemcost[1]= 1
	itemcost[2]= 20
	itemcost[3]= 1000
	minimenuy= 120
	GS.typer= 24
	draw_set_font(2)
	sidemessage= 0
	selling= 0
	GS.msc= 0
	glow= 0
	shx= 130
	instance_create(0, 0, 1403/* obj_shop5_body */)
	soldo= 0
	GS.faceemotion= 0
	sellpos= 0
	sellpos2= 0
	i= 0
	while(i < 8) {
	    value[i]= 0
	    sold[i]= 0
	    i++
	}
	value[8]= 0
	value[9]= 0
	value[10]= 0
	thanks= 0
	joytimer= 0
	s_quit= 0
	specialsell= 0
	c_con= 0
	colleg= 0

func _gm_event_2_4():
	c_con++

func _gm_event_2_3():
	if(GS.flag[7] == 0) caster_free(shopmus)
	instance_create(0, 0, 148/* obj_persistentfader */)
	get_tree().change_scene_to_file("res://godot_rooms/128.tscn")

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
	GS.entrance= 24
	GS.interact= 3

func _on_outside_room():
	if(GS.flag[276] == 0) itemcost[3]= 1000
	else  {
	    if(gm == 0) itemcost[3]= 9999
	    if(gm == 1) itemcost[3]= 9000
	    if(gm == 2) itemcost[3]= 8000
	    if(gm == 3) itemcost[3]= 7000
	    if(gm == 4) itemcost[3]= 6000
	    if(gm == 5) itemcost[3]= 5000
	    if(gm == 6) itemcost[3]= 4500
	    if(gm == 7) itemcost[3]= 4000
	    if(gm == 8) itemcost[3]= 3500
	    if(gm == 9) itemcost[3]= 3000
	    if(gm == 10) itemcost[3]= 2800
	    if(gm == 11) itemcost[3]= 2600
	    if(gm == 12) itemcost[3]= 2400
	    if(gm == 13) itemcost[3]= 2200
	    if(gm == 14) itemcost[3]= 2000
	    if(gm == 15) itemcost[3]= 1800
	    if(gm == 16) itemcost[3]= 1600
	    if(gm == 17) itemcost[3]= 1400
	    if(gm == 18) itemcost[3]= 1250
	    if(gm == 19) itemcost[3]= 1100
	    if(gm >= 20) itemcost[3]= 1000
	    if(gm >= 25) itemcost[3]= 750
	    if(gm >= 30) itemcost[4]= 500
	    if(itemcost[3] < 500) itemcost[3]= 500
	}
	draw_set_color(16777215)
	draw_rectangle(0, 120, 320, 240, 0)
	if(menu == 1 or menu == 2) {
	    draw_rectangle(210, 120, 320, minimenuy, 0)
	    draw_set_color(0)
	    if(minimenuy < 116) draw_rectangle(214, 120, 316, minimenuy + 4, 0)
	    draw_set_color(16777215)
	    wcheck= string(2 - GS.wstrength)
	    acheck= string(5 - GS.adef)
	    wchecks= " "
	    if(GS.wstrength <= 2) wchecks= "+"
	    if(GS.wstrength > 2) wchecks= "-"
	    achecks= " "
	    if(GS.adef <= 5) achecks= "+"
	    if(GS.adef > 5) achecks= "-"
	    if(menuc[1] == 0)
	        draw_text(224, minimenuy + 14, "Heals 2HP#food of#tem")
	    if(menuc[1] == 1)
	        draw_text(224, minimenuy + 14, "Heals 2HP#DISCOUNT#FOOD OF#TEM!!!")
	    if(menuc[1] == 2)
	        draw_text(224, minimenuy + 14, "Heals 2HP#food of#tem#(expensiv)")
	    if(murder == 0) {
	        if(GS.flag[276] == 0) {
	            if(menuc[1] == 3)
	                draw_text(224, minimenuy + 14, "COLLEGE#tem pursu#higher#education")
	        } else  {
	            if(menuc[1] == 3)
	                draw_text(224, minimenuy + 14, "ARMOR 20DF#makes#battles#too easy")
	        }
	    } else  {
	        if(menuc[1] == 3)
	            draw_text(224, minimenuy + 14, "Heals 2HP#food of#tem#(qualite)")
	    }
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
	    specialsell= 0
	    joytimer= 0
	    thanks= 0
	    sold[0]= 0
	    sold[1]= 0
	    sold[2]= 0
	    sold[3]= 0
	    sold[4]= 0
	    sold[5]= 0
	    sold[6]= 0
	    sold[7]= 0
	    sell= 0
	    selling= 0
	    sidemessage= 0
	    menuc[1]= 0
	    menuc[2]= 0
	    menuc[3]= 0
	    menuc[4]= 0
	    if(not instance_exists(782/* OBJ_WRITER */)) {
	        GS.msg[0]= "\\E0* hOI^1!&* welcom to..^1.&* da TEM SHOP!!!/*"
	        mainmessage= 0 and GS.flag[69] == 0
	        GS.msg[0]= "\\E0* hOI^1!&* welcom to..^1.&* da TEM SHOP!!!/*"
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
	    draw_text(240, 130, "Buy")
	    draw_text(240, 150, "Sell")
	    draw_text(240, 170, "Talk")
	    draw_text(240, 190, "Exit")
	    draw_sprite(49/* spr_heartsmall */, 0, 225, 135 + menuc[0] * 20)
	    if(keyboard_multicheck_pressed(0/* NOKEY */)) {
	        OBJ_WRITER.dfy= 1
	        keyboard_clear(13/* ENTER */)
	        if(menuc[0] == 0) menu= 1
	        if(menuc[0] == 1) {
	            if(GS.item[0] != 0) menu= 5
	            else  {
	                menu= 4
	                sell= 1
	            }
	        }
	        if(menuc[0] == 2) menu= 3
	        if(menuc[0] == 3) {
	            sell= 2
	            menu= 4
	        }
	    }
	}
	if(menu == 1 or menu == 2) {
	    draw_text(30, 130, " 3G - tem flake")
	    draw_text(30, 150, " 1G - tem flake (ON SALE,)")
	    draw_text(30, 170, "20G - tem flake (expensiv)")
	    if(murder == 0) {
	        if(GS.flag[276] != 1) draw_text(30, 190, "1000G - tem pay 4 colleg")
	        else  draw_text(30, 190, string(itemcost[3]) + "G - temy ARMOR!!!")
	    } else  draw_text(30, 190, "1000G - tem flake (premiem)")
	    draw_text(30, 210, "Exit")
	    if(menu == 1) {
	        menumax= 4
	        if(not instance_exists(782/* OBJ_WRITER */)) {
	            if(sidemessage == 0)
	                GS.msg[0]= "\\E0hOI^1!&welcome&to..^1.&TEM SHOP!/*"
	            if(sidemessage == 1) GS.msg[0]= "\\E6thanks&PURCHASE!/*"
	            if(sidemessage == 2) GS.msg[0]= "\\E0fdshfg/*"
	            if(sidemessage == 3) GS.msg[0]= "\\E2you don&hav da&muns,/*"
	            if(sidemessage == 4)
	                GS.msg[0]= "\\E1WAO!!^1!&bag..^1.&FULLS!/*"
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
	        GS.faceemotion= 3
	        draw_text(230, 130, "Buy for")
	        draw_text(230, 145, string(itemcost[menuc[1]]) + "G ?")
	        draw_text(240, 170, "Yaya")
	        draw_text(240, 185, "NO!!!")
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
	                    if(GS.flag[276] == 0 and menuc[1] == 3 and afford == 1 and murder == 0) {
	                        GS.gold-= 1000
	                        if(GS.gold < 0) GS.gold= 0
	                        colleg= 1
	                        menu= 4
	                        sell= 10
	                        // OBJ_WRITER
	                        with(782) instance_destroy()
	                    } else  {
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
	                }
	                if(menuc[2] == 1) sidemessage= 2
	                if(colleg == 0) menu= 1
	                colleg= 0
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
	    draw_text(30, 130, "Say Hello")
	    if(GS.flag[276] == 0) draw_text(30, 150, "About Yourself")
	    if(GS.flag[276] == 1) draw_text(30, 150, "About Temmie Armor")
	    draw_text(30, 170, "Temmie History")
	    draw_text(30, 190, "About Shop")
	    draw_text(30, 210, "Exit")
	    if(not instance_exists(782/* OBJ_WRITER */)) {
	        GS.msg[0]= "\\E0HOI!!^1!&im temmie/*"
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
	        if(sell == 1) GS.msg[0]= "\\E2* no more item.../%%"
	        if(sell == 2) GS.msg[0]= "\\E0* bOI!!/%%"
	        if(sell == 3) {
	            GS.msg[0]= "\\E0* hOI!!!/"
	            GS.msg[1]= "* i\'m temmie/%%"
	        }
	        if(sell == 4) {
	            GS.msg[0]= "\\E0* hOI!!!/"
	            GS.msg[1]= "* i\'m temmie/%%"
	            if(GS.flag[276] == 1) {
	                GS.msg[0]= "\\E1* tem armor so GOOds^1!&* any battle becom^1!&* a EASY victories!!!/"
	                GS.msg[1]= "\\E4* but^1, hnnn^1, tem think..^1.&* if u use armors^1, battles woudn b&  a challenge anymores,/"
	                GS.msg[2]= "\\E3* but tem..^1.&* have a solushun!/"
	                GS.msg[3]= "\\W* \\E6tem wil offer..^1.\\Y &* a SKOLARSHIPS\\W!/"
	                GS.msg[4]= "\\W*\\E3 if u \\Ylose a lot of battles^1, \\W &  tem wil \\YLOWER THE PRICE\\W!/"
	                GS.msg[5]= "\\E3* so if you get to TOUGH BATLE&  and feel FRUSTRATE^1, can buy&  TEM armor as last resort!/"
	                GS.msg[6]= "\\E5* but tem armor so goods^1,&* promise to only buy if you&  really needs it^1,/%%"
	                if(gm > 18) {
	                    GS.msg[5]= "\\E1* in fack..^1.&* PRICE MAY ALREADY BE LOWERS!!!&* WOA!!!!/"
	                    GS.msg[6]= "\\E6* Congra-tem-lations!!!/%%"
	                }
	            }
	        }
	        if(sell == 5) {
	            GS.msg[0]= "\\E0* us tems hav a DEEP HISTORY!!!/%%"
	            if(GS.flag[276] == 1)
	                GS.msg[0]= "\\E0* yaYA!!^1!&* tem got degree in TEM STUDIES^1!&* tem can tell you all about&  tem\'s DEEP HISTORY!!!/%%"
	        }
	        if(sell == 6) GS.msg[0]= "\\E0* yaYA!!!&* go to TEM SHOP!!!/%%"
	        if(sell == 7) {
	            GS.msg[0]= "\\E1* WOA!!/"
	            GS.msg[1]= "\\E2* u gota... " + GS.itemnameb[sellpos] + "s!!!/"
	            GS.msg[2]= "\\E4* hnnn...^1.&* i gota have dat " + GS.itemnameb[sellpos] + "s..^1.&* but i gota pay for colleg,/"
	            if(GS.flag[276] == 1)
	                GS.msg[2]= "\\E4* hnnn...^1.&* i gota have dat " + GS.itemnameb[sellpos] + "s..^1.&* but i gota pay for gradskool,/"
	            GS.msg[3]= "\\E5* hnnnn....!!^1!&* tem always wanna " + GS.itemnameb[sellpos] + "s...!/%%"
	        }
	        if(sell == 8) {
	            GS.msg[0]= "\\E2* b..^1 but.../"
	            GS.msg[1]= "\\E4* p!!!!!!!!!!!!/%%"
	        }
	        if(sell == 9) {
	            GS.msg[0]= "\\E3* You will regret this./%%"
	            if(GS.flag[276] == 1)
	                GS.msg[0]= "\\E3* Is this a joke^1?&* Are you having a chuckle^1?&* Ha ha^1, very funny^1.&* I\'m the one with a degree./%%"
	        }
	        instance_create(10, 110, 782/* OBJ_WRITER */)
	        selling= 1
	    }
	    if(sell == 10) {
	        if(c_con == 0) {
	            // OBJ_WRITER
	            with(782) instance_destroy()
	            selling= 9
	            GS.msg[0]= "\\E1* WOA!!/"
	            GS.msg[1]= "\\E2* thas ALOT o muns..^1.&* can tem realy acepts.../"
	            GS.msg[2]= "\\E7* OKs!!!^1!&* tem go to colleg and make&  u prouds!!!/%%"
	            instance_create(10, 110, 782/* OBJ_WRITER */)
	            c_con= 1
	        }
	        if(c_con == 1 and not instance_exists(782/* OBJ_WRITER */)) {
	            // OBJ_WRITER
	            with(782) instance_destroy()
	            if(GS.flag[7] == 0) caster_pause(shopmus)
	            c_con= 2
	            $Alarm4.start((120) / 30.0)
	        }
	        if(c_con == 2) {
	            obj_shop5_body.bodyx+= 3
	            obj_shop5_body.boxx+= 3
	        }
	        if(c_con == 3) {
	            c_con= 4
	            $Alarm4.start((120) / 30.0)
	            GS.flag[276]= 1
	        }
	        if(c_con == 4) {
	            obj_shop5_body.bodyx-= 3
	            obj_shop5_body.boxx-= 3
	        }
	        if(c_con == 5) {
	            if(GS.flag[7] == 0) caster_resume(shopmus)
	            GS.msg[0]= "* tem bak from cool leg,/"
	            GS.msg[1]= "\\E0* tem learn MANY THINs^1,&* learn to sell new ITEM^1!&* yayA!!!/%%"
	            instance_create(10, 110, 782/* OBJ_WRITER */)
	            c_con= 6
	        }
	        if(c_con == 6 and not instance_exists(782/* OBJ_WRITER */)) {
	            selling= 1
	            c_con= -1
	        }
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
	            if(sell == 1 or sell == 9 or sell == 10) menu= 0
	            else  menu= 3
	            if(sell == 7) {
	                menu= 6
	                buffer= 4
	                value[sellpos]++
	                specialsell= 1
	                sellpos2= 0
	            }
	            if(sell == 8) {
	                menu= 6
	                buffer= 4
	                value[sellpos]= ceil(value[sellpos] * 1.25) + 1
	                specialsell= 2
	                sellpos2= 0
	            }
	            sell= 0
	            selling= 0
	        }
	    }
	}
	if(menu == 5) {
	    specialsell= 0
	    joytimer--
	    if(joytimer <= 0) GS.faceemotion= 0
	    draw_set_color(16777215)
	    draw_set_font(2)
	    value[0]= 1
	    value[1]= 1
	    value[2]= 1
	    value[3]= 1
	    value[4]= 1
	    value[5]= 1
	    value[6]= 1
	    value[7]= 1
	    scr_itemvalue()
	    scr_itemnameb()
	    value[8]= 0
	    value[9]= 0
	    value[10]= 0
	    i= 0
	    while(i < 8) {
	        s_value[i]= "    " + string(value[i])
	        if(value[i] >= 10 and value[i] < 100)
	            s_value[i]= "  " + string(value[i])
	        if(value[i] >= 100 and value[i] < 1000)
	            s_value[i]= string(value[i])
	        if(value[i] == -1) s_value[i]= "NO!"
	        i++
	    }
	    odd= -1
	    if(sellpos == 0 or sellpos == 2 or sellpos == 4 or sellpos == 6) {
	        odd= 0
	        draw_sprite(49/* spr_heartsmall */, 0, 15, 135 + sellpos / 2 * 20)
	    }
	    if(sellpos == 1 or sellpos == 3 or sellpos == 5 or sellpos == 7) {
	        odd= 1
	        draw_sprite(49/* spr_heartsmall */, 0, 155, 135 + (sellpos - 1) / 2 * 20)
	    }
	    if(sellpos == 8) draw_sprite(49/* spr_heartsmall */, 0, 15, 215)
	    if(Input.is_action_pressed("move_right") and odd == 0 and value[sellpos + 1] != 0)
	        sellpos++
	    if(Input.is_action_pressed("move_left") and odd == 1)
	        sellpos--
	    if(Input.is_action_pressed("move_down")) {
	        d_fail= 0
	        if(value[sellpos + 2] == 0) d_fail= 1
	        if(d_fail == 1 and odd == 1 and value[sellpos + 1] != 0)
	            d_fail= 2
	        if(sellpos == 6 or sellpos == 7 or sellpos == 8)
	            d_fail= 1
	        if(d_fail == 1) sellpos= 8
	        else  {
	            if(d_fail == 2) sellpos++
	            else  sellpos+= 2
	        }
	    }
	    if(Input.is_action_pressed("move_up") and sellpos != 0 and sellpos != 1) {
	        if(sellpos == 8) {
	            sellpos= 0
	            if(value[2] != 0) sellpos= 2
	            if(value[4] != 0) sellpos= 4
	            if(value[6] != 0) sellpos= 6
	        } else  sellpos-= 2
	    }
	    draw_set_color(16777215)
	    i= 0
	    while(i < 4) {
	        draw_set_color(16777215)
	        if(value[i * 2] != 0 and sold[i * 2] == 0)
	            draw_text(30, 130 + i * 20, s_value[i * 2] + "G - " + GS.itemnameb[i * 2])
	        else  {
	            if(sold[i * 2] == 1) {
	                draw_set_color(8421504)
	                draw_text(30, 130 + i * 20, "(thanks PURCHASE)")
	            }
	        }
	        draw_set_color(16777215)
	        if(value[i * 2 + 1] != 0 and sold[i * 2 + 1] == 0)
	            draw_text(170, 130 + i * 20, s_value[i * 2 + 1] + "G - " + GS.itemnameb[i * 2 + 1])
	        else  {
	            if(sold[i * 2 + 1] == 1) {
	                draw_set_color(8421504)
	                draw_text(170, 130 + i * 20, "(thanks PURCHASE)")
	            }
	        }
	        i++
	    }
	    draw_set_color(16777215)
	    draw_text(30, 210, "Exit")
	    draw_set_color(65535)
	    draw_text(200, 210, "(" + string(GS.gold) + " G)")
	    if(keyboard_multicheck_pressed(0/* NOKEY */)) {
	        joytimer= 0
	        buffer= 3
	        if(sellpos == 8) menu= 0
	        else  {
	            if(value[sellpos] > 0) {
	                sellqual= 0
	                if(GS.flag[265] <= 1) sellqual= 1
	                if(GS.flag[266] == 0 and GS.item[sellpos] == 22) {
	                    sellqual= 1
	                    GS.flag[266]= 1
	                }
	                if(sellqual == 1) {
	                    menu= 4
	                    sell= 7
	                    GS.flag[265]= 9
	                } else  {
	                    menu= 6
	                    sellpos2= 0
	                }
	            } else  snd_play(64/* snd_mtt9 */)
	        }
	    }
	    if(keyboard_multicheck_pressed(1/* ANYKEY */)) {
	        menu= 0
	        sellpos= 0
	    }
	}
	if(menu == 6) {
	    GS.faceemotion= 3
	    buffer--
	    draw_set_color(16777215)
	    draw_set_font(2)
	    if(specialsell != 2)
	        draw_text(55, 150, "tem buy " + string(GS.itemnameb[sellpos]) + " for... " + string(value[sellpos]) + "G!!!")
	    else  {
	        GS.faceemotion= 5
	        draw_text(55, 150, "OK!! TEM BUY " + string(GS.itemnameb[sellpos]) + " FOR " + string(value[sellpos]) + "G!!!")
	    }
	    draw_text(80, 180, "yayA!")
	    draw_text(190, 180, "NO!!!")
	    draw_sprite(49/* spr_heartsmall */, 0, 65 + sellpos2 * 110, 185)
	    draw_set_color(65535)
	    draw_text(200, 210, "(" + string(GS.gold) + " G)")
	    if(Input.is_action_pressed("move_left") or Input.is_action_pressed("move_right")) {
	        if(sellpos2 == 0) sellpos2= 1
	        else  sellpos2= 0
	    }
	    if(keyboard_multicheck_pressed(1/* ANYKEY */) and buffer <= 0) {
	        buffer= 1
	        s_quit= 1
	    }
	    if(keyboard_multicheck_pressed(0/* NOKEY */) and buffer <= 0) {
	        if(sellpos2 == 1) s_quit= 1
	        else  {
	            if(GS.item[sellpos] != 22) GS.flag[265]--
	            joytimer= 90
	            GS.faceemotion= 6
	            snd_play(113/* snd_buyitem */)
	            GS.gold+= value[sellpos]
	            scr_itemshift(sellpos, 0)
	            thanks++
	            if(thanks > 8) thanks= 8
	            sold[8 - thanks]= 1
	            if(GS.item[sellpos] == 0 and sellpos > 0)
	                sellpos--
	            if(GS.item[0] != 0) menu= 5
	            else  menu= 0
	        }
	    }
	    if(s_quit == 1) {
	        s_quit= 0
	        menu= 5
	        if(specialsell > 0) {
	            if(specialsell == 1) {
	                menu= 4
	                sell= 8
	            }
	            if(specialsell == 2) {
	                menu= 4
	                sell= 9
	            }
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
	if(GS.debug == 1 and Input.is_key_pressed(71))
	    GS.gold= 5000

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
