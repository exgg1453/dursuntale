# Auto-converted from GameMaker: obj_shop2
extends Node2D

func _ready():
	murder= 0
	if(scr_murderlv() >= 10) murder= 1
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
	item[0]= 37
	item[1]= 41
	item[2]= 44
	item[3]= 45
	sell= 0
	bought= 0
	mainmessage= 0
	itemcost[0]= 25
	itemcost[1]= 18
	itemcost[2]= 30
	itemcost[3]= 55
	minimenuy= 120
	GS.typer= 23
	draw_set_font(2)
	sidemessage= 0
	selling= 0
	GS.msc= 0
	glow= 0
	shx= 130
	instance_create(shx, 44, 1405/* obj_shopkeeper2 */)
	soldo= 0
	GS.faceemotion= 0

func _gm_event_2_3():
	if(GS.flag[7] == 0) caster_free(shopmus)
	instance_create(0, 0, 148/* obj_persistentfader */)
	get_tree().change_scene_to_file("res://godot_rooms/124.tscn")

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
	    if(GS.wstrength > 2) wchecks= " "
	    achecks= " "
	    if(GS.adef <= 5) achecks= "+"
	    if(GS.adef > 5) achecks= " "
	    if(menuc[1] == 0)
	        draw_text(224, minimenuy + 14, "Heals 18HP#(Looks#like a#crab.)")
	    if(menuc[1] == 1)
	        draw_text(224, minimenuy + 14, "Heals 10HP#SPEED#up in#battle.")
	    if(menuc[1] == 2)
	        draw_text(224, minimenuy + 14, "Armor: 5DF#(" + achecks + acheck + " DF)#Invincible#longer")
	    if(menuc[1] == 3)
	        draw_text(224, minimenuy + 14, "Weapon: 2AT#(" + wchecks + wcheck + " AT)#Invincible#longer")
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
	        GS.msg[0]= "* Don\'t be shy now./*"
	        mainmessage= 0 and GS.flag[69] == 0
	        GS.msg[0]= "* Woah there^1!&* I\'ve got some neat&  junk for sale./*"
	        if(GS.flag[7] == 1)
	            GS.msg[0]= "* Wah ha ha^1!&* I knew you could&  do it!/*"
	        if(murder == 1)
	            GS.msg[0]= "* Wa ha ha..^1.&* So you came here^1.&* What a treat!/*"
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
	            sell= 1
	            menu= 4
	        }
	        if(menuc[0] == 2) menu= 3
	        if(menuc[0] == 3) {
	            sell= 2
	            menu= 4
	        }
	    }
	}
	if(menu == 1 or menu == 2) {
	    draw_text(30, 130, "25G - Crab Apple")
	    draw_text(30, 150, "18G - Sea Tea")
	    draw_text(30, 170, "30G - Cloudy Glasses")
	    draw_text(30, 190, "55G - Torn Notebook")
	    draw_text(30, 210, "Exit")
	    if(menu == 1) {
	        menumax= 4
	        if(not instance_exists(782/* OBJ_WRITER */)) {
	            if(sidemessage == 0) GS.msg[0]= "What are&you lookin&for?/*"
	            if(sidemessage == 1) GS.msg[0]= "Thanks!&Wa ha ha./*"
	            if(sidemessage == 2) GS.msg[0]= "Careful&with that./*"
	            if(sidemessage == 3)
	                GS.msg[0]= "You\'re&a bit&short&on cash./*"
	            if(sidemessage == 4) GS.msg[0]= "You\'re&carrying&too much!/*"
	            if(murder == 1) {
	                if(sidemessage == 0) GS.msg[0]= "Don\'t&expect a&discount./*"
	                if(sidemessage == 1) GS.msg[0]= "Here we&are./*"
	                if(sidemessage == 2) GS.msg[0]= ".../*"
	                if(sidemessage == 3) GS.msg[0]= "Eh^1?&You can\'t&afford&it?/*"
	                if(sidemessage == 4) GS.msg[0]= "Don\'t you&have&enough?/*"
	            }
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
	        if(murder == 0) {
	            draw_text(30, 130, "About yourself")
	            if(GS.flag[96] == 0) draw_text(30, 150, "That emblem")
	            if(GS.flag[96] == 1) {
	                draw_set_color(65535)
	                draw_text(30, 150, "Emblem\'s meaning (NEW)")
	                draw_set_color(16777215)
	            }
	            if(GS.flag[96] == 2) {
	                draw_set_color(65535)
	                draw_text(30, 150, "The prophecy (NEW)")
	                draw_set_color(16777215)
	            }
	            if(GS.flag[96] == 3) draw_text(30, 150, "The prophecy")
	            draw_text(30, 170, "The King")
	            draw_text(30, 190, "About Undyne")
	        } else  {
	            draw_text(30, 130, "Fate")
	            draw_text(30, 150, "Threat")
	            draw_text(30, 170, "Fight")
	            draw_text(30, 190, "Hero")
	        }
	    }
	    if(GS.flag[7] == 1) {
	        draw_text(30, 130, "Fluffybuns Why?")
	        draw_text(30, 150, "Is ASGORE a goat")
	        draw_text(30, 170, "ASGORE and TORIEL")
	        draw_text(30, 190, "Undyne")
	    }
	    draw_text(30, 210, "Exit")
	    if(not instance_exists(782/* OBJ_WRITER */)) {
	        if(murder == 0) GS.msg[0]= "Anything&you&wanna&know?/*"
	        if(murder == 1) GS.msg[0]= "Really?&YOU&wanna&chat?/*"
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
	            if(murder == 0) {
	                GS.msg[0]= "\\E2* Ha^1!\\E0 &* I\'m tryin\' to get RID of&  my junk^1, not get more of it!/"
	                GS.msg[1]= "\\E4* Though^1, I\'ve heard if you&  want to sell stuff^1, the Temmie&  Village is your best bet./"
	                GS.msg[2]= "\\E0* Where is it?/"
	                GS.msg[3]= "\\E3* .../"
	                GS.msg[4]= "\\E0* I don\'t remember./%%"
	                soldo++
	                if(soldo > 1) {
	                    GS.msg[0]= "* For the last time^1, I\'m not&  taking it!/%%"
	                    GS.msg[1]= "* I hear people will pay for&  ANYTHING nowadays./%%"
	                }
	            } else 
	                GS.msg[0]= "\\E3* I wouldn\'t buy your chitzy&  garbage at knifepoint./%%"
	        }
	        if(sell == 2) {
	            if(murder == 0) GS.msg[0]= "* Be careful out there^1, kid!/%%"
	            if(murder == 1) GS.msg[0]= "* Good riddance./%%"
	        }
	        if(sell == 3) {
	            if(murder == 0) {
	                GS.msg[0]= "* I\'ve been around a long time^1.&*\\E3 Maybe too long./"
	                GS.msg[1]= "\\E2* Studying history sure is&  easy when you\'ve lived through&  so much of it yourself^1!&*\\E0 Wa ha ha!/%%"
	            } else  {
	                GS.msg[0]= "\\E0* Long ago^1, ASGORE and I&  agreed that escaping would&  be pointless.../"
	                GS.msg[1]= "\\E3* Since once we left^1, humans&  would just kill us./"
	                GS.msg[2]= "\\E1* I felt a little betrayed when&  he eventually changed his&  mind./"
	                GS.msg[3]= "\\E4* But now^1, I think..^1.&* Maybe he was right to./"
	                GS.msg[4]= "\\E2* \'Cause after all^1, even though&  we never escaped.../"
	                GS.msg[5]= "\\E3* A human\'s killing us anyway^1,&  ain\'t that right?/%%"
	            }
	            if(GS.flag[7] == 1) {
	                GS.msg[0]= "* OK^1, OK^1!&* I remember it clearly now./"
	                GS.msg[1]= "\\E3* It was the monthly address at&  the castle^1, and the queen&  was giving her part on&  current events./"
	                GS.msg[2]= "\\E0* After finishing her update^1,&  she moved to pass the&  microphone to the king./"
	                GS.msg[3]= "\\E3* However^1, she didn\'t realize&  the microphone was still in&  her hands when she said:/"
	                GS.msg[4]= "\\E2* " + chr(ord('"')) + "Your turn^1, Fluffybuns." + chr(ord('"')) + "/"
	                GS.msg[5]= "\\E0* The audience burst into&  laughter./"
	                GS.msg[6]= "\\E2* Realizing what she had said^1,&  she started laughing too./"
	                GS.msg[7]= "\\E0* After a few moments^1, the&  king held up his arms^1.&* The crowd grew silent./"
	                GS.msg[8]= "\\E3* He leaned towards the&  microphone^1, expression..^1.&* Stern./"
	                GS.msg[9]= "\\E0* " + chr(ord('"')) + "Dear citizens.^1" + chr(ord('"')) + "&* " + chr(ord('"')) + "Thank you for coming&  here today." + chr(ord('"')) + "/"
	                GS.msg[10]= "\\E3* " + chr(ord('"')) + "I..^1. King Fluffybuns..." + chr(ord('"')) + "/"
	                GS.msg[11]= "\\E2* And the rest is history./%%"
	            }
	        }
	        if(sell == 4) {
	            if(GS.flag[96] == 3) {
	                GS.msg[0]= "\\E2* What\'s that^1?&* You want me to repeat myself?/"
	                GS.msg[1]= "\\E0* Heck no^1!&* Your eyes still work..^1.&* Go read a book or something^1!&* Wahaha!/%%"
	            }
	            if(GS.flag[96] == 2) {
	                GS.msg[0]= "\\E0* Oh yeah..^1.&* The prophecy./"
	                GS.msg[1]= "\\E4* Legend has it, an \'angel\' who has&  seen the surface will descend&  from above and bring us freedom./"
	                GS.msg[2]= "\\E3* Lately^1, the people have been&  taking a bleaker outlook.../"
	                GS.msg[3]= "\\E4* Callin\' that winged circle the&  \'Angel of Death.\'/"
	                GS.msg[4]= "\\E3* A harbinger of destruction^1,&  waitin\' to \'free\' us from&  this mortal realm.../"
	                GS.msg[5]= "* In my opinion^1, when I see&  that little circle.../"
	                GS.msg[6]= "\\E2* I jus\' think it looks neat^1!&* Wahaha!/%%"
	            }
	            if(GS.flag[96] == 1) {
	                GS.msg[0]= "\\E0* That emblem actually predates&  written history^1.&* The original meaning has been&  lost to time.../"
	                GS.msg[1]= "\\E4* All we know is that the&  triangles symbolize us monsters&  below^1, and the winged circle&  above symbolizes.../"
	                GS.msg[2]= "\\E3* Somethin\' else./"
	                GS.msg[3]= "\\E0* Most people say it\'s the&  \'angel^1,\' from the prophecy.../%%"
	            }
	            if(GS.flag[96] == 0) {
	                GS.msg[0]= "\\E0* Eh^1?&* You don\'t know what that is?/"
	                GS.msg[1]= "\\E1* What are they teaching you&  kids in school nowadays...^1?&*\\E2 Wa ha ha!/"
	                GS.msg[2]= "\\W*\\E0 That\'s the \\YDelta Rune^1,\\W the&  emblem of our kingdom^1.&* The Kingdom.../"
	                GS.msg[3]= "* ... of Monsters./"
	                GS.msg[4]= "* Wahaha^1!&* Great name^1, huh^1?&* It\'s as I always say.../"
	                GS.msg[5]= "* Ol\' King Fluffybuns can\'t name&  for beans!/%%"
	            }
	            if(GS.flag[96] == 2) GS.flag[96]= 3
	            if(GS.flag[96] == 1) GS.flag[96]= 2
	            if(GS.flag[96] == 0) GS.flag[96]= 1
	            if(GS.flag[7] == 1) {
	                GS.msg[0]= "\\E3* Eh^1?&* Goat?/"
	                GS.msg[1]= "\\E2* Actually^1, that reminds me^1.&* Toriel once wore a flower-&  patterned muu-muu... /"
	                GS.msg[2]= "\\E0* Folks kept saying " + chr(ord('"')) + "nice muu-&  muu" + chr(ord('"')) + " to her^1, but she kept&  thinking they were calling&  her a cow./"
	                GS.msg[3]= "\\E1* So she never wore it again./"
	                GS.msg[4]= "\\E3* What was the question again?/"
	                GS.msg[5]= "\\E0* Oh^1.&* Right^1.&* ASGORE./"
	                GS.msg[6]= "\\E3* He\'s a real interesting&  type of monster^1.&* The strongest type of all./"
	                GS.msg[7]= "\\E0* We call \'em Boss Monsters./"
	                GS.msg[8]= "* When they have an offspring^1,&  the SOUL power of the&  parents flows into the&  child.../"
	                GS.msg[9]= "* Causing the child to grow&  as the parents age./"
	                GS.msg[10]= "\\E3* But ASGORE doesn\'t have a&  child^1.&* So he\'s been stuck at the&  same age..^1.&* And probably will be forever./"
	                GS.msg[11]= "\\E1* Huh^1?&* What if the child is a&  human...^1? What?/"
	                GS.msg[12]= "\\E1* Nah^1. That wouldn\'t work^1.&* So if ASGORE\'s your father^1,&  he\'ll definitely outlive&  you./%%"
	            }
	            if(murder == 1) {
	                GS.msg[0]= "\\E1* I\'ve lived too long to&  be afraid of something&  like you./"
	                GS.msg[1]= "\\E2* Try it^1, kiddo!/"
	                GS.msg[2]= "\\E3* ... I know you can\'t here./"
	                GS.msg[3]= "\\E1* Wah ha..^1.&* Knowledge like that is&  the only reason I\'ve&  survived so long./%%"
	            }
	        }
	        if(sell == 5) {
	            GS.msg[0]= "* King Fluffybuns^1?&* He\'s a friendly^1, happy-go-lucky&  kind of guy.../"
	            GS.msg[1]= "\\E4* If you keep walking around long&  enough^1, you\'ll probably meet him^1.&*\\E0 He loves to walk around and&  talk to people./"
	            GS.msg[2]= "\\E3* Eh^1?&* Why do I call Dreemurr&  \'Fluffybuns?^1\'&*\\E2 Oh^1, that\'s a great story!/"
	            GS.msg[3]= "\\E3* .../"
	            GS.msg[4]= "\\E0* I don\'t remember it./"
	            GS.msg[5]= "* But if you come back much&  later^1, I\'m sure I\'ll have&  remembered by then./%%"
	            if(GS.flag[7] == 1) {
	                GS.msg[0]= "\\E2* Oh yeah^1!&* Of course^1.&* Toriel was queen^1, and&  Asgore was the king./"
	                GS.msg[1]= "\\E3* It was tragic when she left./"
	                GS.msg[2]= "\\E1* Since everyone knew she was&  really the brains behind the&  throne.../"
	                GS.msg[3]= "\\E0* But it was also just a&  teensy^1, teensy bit relieving^1,&  you know?/"
	                GS.msg[4]= "\\E3* Those two were really&  insufferable together..^1.&* Nuzzling noses^1, bein\' all cute&  n\' cuddly in public..^1.&* Embarrassing their children.../"
	                GS.msg[5]= "\\E0* They were so sweet it&  made me SICK^1.&* Thank god those days are&  over!/%%"
	            }
	            if(murder == 1) {
	                GS.msg[0]= "\\E3* Eh^1? Fight you?/"
	                GS.msg[1]= "\\E1* Nah..^1. I\'m not a hero^1.&* Never was./"
	                GS.msg[2]= "\\E2* And b\'sides..^1.&* These old bones aren\'t fit&  for fighting anyhoo./"
	                GS.msg[3]= "\\E3* One attack from you^1, and&  then I\'d... well.../"
	                GS.msg[4]= "\\E2* At least by talking to&  you^1, I\'ve bought enough time&  for some of them to escape./%%"
	            }
	        }
	        if(sell == 6) {
	            GS.msg[0]= "\\E0* Undyne^1?&* Yeah^1, she\'s a local hero&  around here./"
	            GS.msg[1]= "\\E4* Through grit and determination&  alone^1, she fought her way to&  the top of the Royal Guard./"
	            GS.msg[2]= "\\E3* Actually^1, she just came through&  here asking about someone who&  looked just like you.../"
	            GS.msg[3]= "\\E0* I\'d watch your back^1, kid^1.&* And buy some items..^1.&* It might just save your hide^1!&* Wa ha ha!/%%"
	            if(GS.flag[7] == 1) {
	                GS.msg[0]= "\\E0* Undyne^1.&* She\'s really come a long way&  since she was a little&  urchin./"
	                GS.msg[1]= "\\E2* I used to be a hero myself^1,&  back in the old days^1.&* Gerson^1, the Hammer of Justice./"
	                GS.msg[2]= "\\E3* When she was younger^1, Undyne&  would follow me around^1, to&  watch me beat up bad guys.../"
	                GS.msg[3]= "\\E0* Sometimes she\'d even try&  to help!/"
	                GS.msg[4]= "\\E3* Though^1, most of the time&  the folks she attacked weren\'t&  bad guys^1.&* It\'d be the mailman or&  something like that./"
	                GS.msg[5]= "\\E2* Anyhoo^1, I appreciated it^1!&* Wah ha ha ha!!!/%%"
	            }
	            if(murder == 1) {
	                GS.msg[0]= "\\E1* I\'m not a hero./"
	                GS.msg[1]= "\\E3* But I know there\'s someone&  out there./"
	                GS.msg[2]= "\\E0* Someone who\'ll never give&  up trying to do the&  right thing^1, no matter&  what./"
	                GS.msg[3]= "\\E4* There\'s no prophecy or&  legend \'bout anyone like&  that./"
	                GS.msg[4]= "\\E3* It\'s just something I know&  is true./"
	                GS.msg[5]= "\\E0* That someone like that&  will strike you down./%%"
	            }
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
	            if(sell == 1) menu= 0
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
