# Auto-converted from GameMaker: obj_shop4
extends Node2D

func _ready():
	murder= 0
	if(scr_murderlv() >= 12) {
	    murder= 1
	    if(GS.flag[435] < 2) GS.flag[435]= 2
	}
	instance_create(0, 0, 147/* obj_fader */)
	vol= 0.8
	if(GS.flag[7] == 0) {
	    shopmus= caster_load("music/shop.ogg")
	    caster_loop(shopmus, vol, 0.7)
	    if(murder == 1) caster_set_pitch(shopmus, 0.4)
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
	item[0]= 42
	item[1]= 40
	item[2]= 43
	item[3]= 61
	sell= 0
	bought= 0
	mainmessage= 0
	itemcost[0]= 60
	itemcost[1]= 120
	itemcost[2]= 300
	itemcost[3]= 500
	minimenuy= 120
	GS.typer= 23
	draw_set_font(2)
	sidemessage= 0
	selling= 0
	GS.msc= 0
	glow= 0
	shx= 100
	instance_create(shx, 13, 1402/* obj_burgerpants_body */)
	soldo= 0
	GS.faceemotion= 0

func _gm_event_2_3():
	if(GS.flag[7] == 0) caster_free(shopmus)
	instance_create(0, 0, 148/* obj_persistentfader */)
	get_tree().change_scene_to_file("res://godot_rooms/183.tscn")

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
	GS.entrance= 20
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
	    if(GS.wstrength > 2) wchecks= "-"
	    achecks= " "
	    if(GS.adef <= 5) achecks= "+"
	    if(GS.adef > 5) achecks= "-"
	    if(menuc[1] == 0)
	        draw_text(224, minimenuy + 14, "Heals 14HP#Very popular#food.")
	    if(menuc[1] == 1)
	        draw_text(224, minimenuy + 14, "Heals 27HP#Very popular#food.")
	    if(menuc[1] == 2)
	        draw_text(224, minimenuy + 14, "Heals 40HP#Hero Sandwich.#ATTACK UP#in battle.")
	    if(GS.flag[445] == 0) {
	        if(menuc[1] == 3)
	            draw_text(224, minimenuy + 14, "Heals 60HP#Don\'t ask.#Please.")
	        else  {
	            if(menuc[1] == 3) draw_text(224, minimenuy + 14, "SOLD OUT")
	        }
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
	    sell= 0
	    selling= 0
	    sidemessage= 0
	    menuc[1]= 0
	    menuc[2]= 0
	    menuc[3]= 0
	    menuc[4]= 0
	    if(not instance_exists(782/* OBJ_WRITER */)) {
	        if(GS.flag[435] < 2) {
	            GS.msg[0]= "\\E0* The customer is always right./*"
	            if(mainmessage == 0 and GS.flag[69] == 0)
	                GS.msg[0]= "\\E0* Welcome to MTT-Brand&  Burger Emporium^1, home&  of the Glamburger^1.&* Sparkle up your&  day (TM)./*"
	        } else  {
	            GS.msg[0]= "\\E3* Anything else you need?/*"
	            if(mainmessage == 0 and GS.flag[69] == 0)
	                GS.msg[0]= "\\E3* What can I do for you^1,&  little buddy?/*"
	            if(murder == 1)
	                GS.msg[0]= "\\E1* (Why do I always&  get the freaks?)/*"
	        }
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
	        if(menuc[0] == 2) {
	            menu= 3
	            if(GS.flag[435] == 0) {
	                menu= 4
	                sell= 20
	            }
	            if(GS.flag[435] == 1) {
	                menu= 4
	                sell= 21
	            }
	        }
	        if(menuc[0] == 3) {
	            sell= 2
	            menu= 4
	        }
	    }
	}
	if(menu == 1 or menu == 2) {
	    draw_text(30, 130, " 60G - Starfait")
	    draw_text(30, 150, "120G - Glamburger")
	    draw_text(30, 170, "300G - Legendary Hero")
	    if(GS.flag[445] == 0) {
	        draw_text(30, 190, "500G - ")
	        draw_text_transformed(70, 190, "Steak in the Shape of Mettaton\'s Face", 0.6, 1, 0)
	    } else  {
	        draw_set_color(8421504)
	        draw_text(30, 190, "--- SOLD OUT ---")
	        draw_set_color(16777215)
	    }
	    draw_text(30, 210, "Exit")
	    if(menu == 1) {
	        menumax= 4
	        if(not instance_exists(782/* OBJ_WRITER */)) {
	            if(GS.flag[435] < 2) {
	                if(sidemessage == 0)
	                    GS.msg[0]= "\\E0How can&I help&you, O&customer?/*"
	                if(sidemessage == 1)
	                    GS.msg[0]= "\\E2Thanksy!&Have a&FABU-FUL&day!!!/*"
	                if(sidemessage == 2)
	                    GS.msg[0]= "\\E1So do&you want&it or&not???/*"
	                if(sidemessage == 3)
	                    GS.msg[0]= "\\E1That\'s not&the right&amount of&money./*"
	                if(sidemessage == 4) GS.msg[0]= "\\E1You&don\'t&have&room./*"
	                if(sidemessage == 5)
	                    GS.msg[0]= "\\E1We don\'t&HAVE&any&more./*"
	            }
	            if(GS.flag[435] == 2) {
	                if(sidemessage == 0)
	                    GS.msg[0]= "\\E6Take what&you want^1,&little&buddy./*"
	                if(sidemessage == 1)
	                    GS.msg[0]= "\\E6Here you&go^1,&little&buddy./*"
	                if(sidemessage == 2) GS.msg[0]= "\\E6Don\'t&worry&about&it./*"
	                if(sidemessage == 3)
	                    GS.msg[0]= "\\E6Sorry...&You can\'t&take it&for free./*"
	                if(sidemessage == 4)
	                    GS.msg[0]= "\\E6You gotta&drop some&stuff./*"
	                if(sidemessage == 5)
	                    GS.msg[0]= "\\E6Like I\'m&making&THAT&again./*"
	                if(murder == 1) {
	                    if(sidemessage == 0)
	                        GS.msg[0]= "\\E3Are you&gonna&order or&what?/*"
	                    if(sidemessage == 1)
	                        GS.msg[0]= "\\E6Here you&go^1,&little&weirdo./*"
	                    if(sidemessage == 2)
	                        GS.msg[0]= "\\E1So do&you want&it or&not???/*"
	                    if(sidemessage == 3)
	                        GS.msg[0]= "\\E1That\'s not&the right&amount of&money./*"
	                    if(sidemessage == 4) GS.msg[0]= "\\E1You&don\'t&have&room./*"
	                    if(sidemessage == 5)
	                        GS.msg[0]= "\\E1We don\'t&HAVE&any&more./*"
	                }
	            }
	            instance_create(210, 110, 782/* OBJ_WRITER */)
	        }
	        draw_sprite(49/* spr_heartsmall */, 0, 15, 135 + menuc[1] * 20)
	        if(keyboard_multicheck_pressed(0/* NOKEY */)) {
	            soldout= 0
	            if(menuc[1] == 3 and GS.flag[445] == 1) soldout= 1
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
	                            if(GS.flag[435] < 1) GS.flag[435]= 1
	                            if(menuc[1] == 3) GS.flag[445]= 1
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
	            draw_text(30, 130, "Life Advice")
	            if(GS.flag[437] == 0) draw_text(30, 150, "Romance Advice")
	            if(GS.flag[437] == 1) {
	                draw_set_color(65535)
	                draw_text(30, 150, "Glamburger Story (NEW)")
	                draw_set_color(16777215)
	            }
	            if(GS.flag[437] == 2) draw_text(30, 150, "Glamburger Story")
	            if(GS.flag[437] == 4) draw_text(30, 150, "Clarify Story")
	            if(GS.flag[437] == 5) {
	                draw_set_color(65535)
	                draw_text(30, 150, "Bratty & Catty (NEW)")
	                draw_set_color(16777215)
	            }
	            if(GS.flag[437] == 6) draw_text(30, 150, "Bratty & Catty")
	            if(GS.flag[437] == 7) draw_text(30, 150, "Outing")
	            if(GS.flag[437] == 8) {
	                draw_set_color(65535)
	                draw_text(30, 150, "Catty\'s Invitation (NEW)")
	                draw_set_color(16777215)
	            }
	            if(GS.flag[437] == 9) draw_text(30, 150, "Catty\'s Invitation")
	            if(GS.flag[436] == 0) draw_text(30, 170, "Mettaton")
	            if(GS.flag[436] == 1) {
	                draw_set_color(65535)
	                draw_text(30, 170, "Why is Mettaton bad (NEW)")
	                draw_set_color(16777215)
	            }
	            if(GS.flag[436] == 2) {
	                draw_set_color(65535)
	                draw_text(30, 170, "Why else is MTT bad (NEW)")
	                draw_set_color(16777215)
	            }
	            if(GS.flag[436] == 3) draw_text(30, 170, "Why else is MTT bad")
	            draw_text(30, 190, "Your future")
	        } else  {
	            draw_text(30, 130, "Evacuation")
	            draw_text(30, 150, "Mettaton")
	            draw_text(30, 170, "Alone")
	            draw_text(30, 190, "Threaten")
	        }
	    }
	    if(GS.flag[7] == 1) {
	        draw_text(30, 130, "Freedom")
	        draw_text(30, 150, "Bratty and Catty")
	        draw_text(30, 170, "Freedom")
	        draw_text(30, 190, "Future")
	    }
	    draw_text(30, 210, "Exit")
	    if(not instance_exists(782/* OBJ_WRITER */)) {
	        GS.msg[0]= "\\E3Take it&from me^1,&little&buddy./*"
	        if(murder == 1) GS.msg[0]= "\\E3Nothing&else to&do!/*"
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
	            if(GS.flag[435] < 2) {
	                GS.msg[0]= "\\E1* (WHY IS THIS PERSON TRYING TO&  SELL ME SOMETHING THIS IS&  A HAMBURGER RESTAURANT I\'M&  JUST TRYING TO SURVIVE)/%%"
	                soldo++
	                if(soldo > 1) GS.msg[0]= "\\E3* WHO DO YOU THINK YOU ARE./%%"
	            } else  {
	                GS.msg[0]= "\\E6* Hmmm..^1.&* Why not try selling that to&  the two chicks in the alley?/%%"
	                if(murder == 1)
	                    GS.msg[0]= "\\E3* Ah^1. Yes^1.&* I really want to buy your&  weird dusty artifacts..^1.&* NOT./%%"
	            }
	        }
	        if(sell == 2) {
	            GS.msg[0]= "\\E2* Have a SPARKULAR day!/%%"
	            if(GS.flag[435] > 1) {
	                GS.msg[0]= "\\E6* Any time^1, little buddy./%%"
	                if(murder == 1) GS.msg[0]= "\\E6* Alone again.../%%"
	            }
	        }
	        if(sell == 3) {
	            GS.msg[0]= "\\E6* I\'m getting on in years^1, so&  let me give you some&  advice^1, little buddy./"
	            GS.msg[1]= "\\E3* You\'ve still got time^1.&* Don\'t live like me./"
	            GS.msg[2]= "\\E6* I\'m 19 years old and I\'ve&  already wasted my entire life./%%"
	            if(GS.flag[7] == 1) {
	                GS.msg[0]= "\\E0* So we\'re free^1, huh^1?&* Mettaton told us as much./"
	                GS.msg[1]= "\\E4* Then he told me^1, " + chr(ord('"')) + "don\'t&  think that means you\'re&  getting out of work early." + chr(ord('"')) + "/"
	                GS.msg[2]= "\\E6* Ah..^1. my boss.&* I love that guy./"
	                GS.msg[3]= "\\E3* And by that I mean I hate&  him so^1, so much./%%"
	            }
	            if(murder == 1) {
	                GS.msg[0]= "\\E1* Evacuation^1?&* You\'re yanking my chain^1,&  little weirdo./"
	                GS.msg[1]= "\\E3* So WHAT if everybody else&  left work?&* So WHAT if nobody\'s buying&  anything?/"
	                GS.msg[2]= "\\E6* Par for the course^1,&  little weirdo^1.&* Par for the course./%%"
	            }
	        }
	        if(sell == 4) {
	            GS.msg[0]= "* I\'m a goofy goober Yeah &  this errorr. message./%%"
	            if(GS.flag[437] == 9)
	                GS.msg[0]= "\\E6* Thank you^1, little buddy./%%"
	            if(GS.flag[437] == 8) {
	                GS.msg[0]= "\\E5* They wanna hang out after&  work?/"
	                GS.msg[1]= "\\E3* Ha^1! Ahahaha!^1! Yes!!^1!&* I won\'t let you down!!/"
	                GS.msg[2]= "\\E6* Little buddy..^1. thank you./"
	                GS.msg[3]= "* You\'ve brought a tear to the&  eye of this old man./"
	                GS.msg[4]= "\\E5* So^1, uh^1, where do they&  want to go?/"
	                GS.msg[5]= "\\E4* .../"
	                GS.msg[6]= "* They want to hang out at&  the garbage dump./"
	                GS.msg[7]= "* .../"
	                GS.msg[8]= "\\E6* Well^1, nowhere to go but&  up^1, right^1, little buddy?/%%"
	            }
	            if(GS.flag[437] == 7) {
	                GS.msg[0]= "\\E6* Hey little buddy^1, wanna help&  me pick a spicy outfit for&  my little shindig later?/"
	                GS.msg[1]= "\\E4* Though^1, now that I think&  about it^1, I had to throw away&  all of my clothes to make&  room for the outfits Mettaton&  gave me.../"
	                GS.msg[2]= "\\E5* Don\'t take it the wrong way^1.&* They\'re just all these.../"
	                GS.msg[3]= "\\E4* Weird getups./"
	                GS.msg[4]= "\\E1* " + chr(ord('"')) + "Promotional" + chr(ord('"')) + " costumes^1.&* For " + chr(ord('"')) + "holidays.^1" + chr(ord('"')) + "&* Or " + chr(ord('"')) + "specials.^1" + chr(ord('"')) + "&* Or " + chr(ord('"')) + "because he felt like it." + chr(ord('"')) + "/"
	                GS.msg[5]= "\\E3* The thing IS though^1!&* Most of the time I\'m the&  only employee who has to&  wear this stuff!/"
	                GS.msg[6]= "\\E3* Sometimes he even calls me&  into his office just to..^1.&* Make me put something on.../"
	                GS.msg[7]= "\\E4* Then he laughs and lets me&  go back to work as normal./"
	                GS.msg[8]= "\\E6* Anyways^1, I won\'t sweat it^1,&  little buddy^1.&* I\'ll take it casual./"
	                GS.msg[9]= "* NEVER let hot people think&  you care^1.&* That\'s how they GET you./%%"
	            }
	            if(GS.flag[437] == 6)
	                GS.msg[0]= "\\E5* Well^1?&* Don\'t keep me waiting^1,&  little buddy!!/%%"
	            if(GS.flag[437] == 5) {
	                GS.msg[0]= "\\E4* The girls were..^1.&* Talking about me...?/"
	                GS.msg[1]= "* They say I should stop acting&  like they owe me.../"
	                GS.msg[2]= "\\E5* ... and if I want to be&  FRIENDS with them^1, I should&  just..^1. uh^1, try to see&  things from their&  perspective?/"
	                GS.msg[3]= "\\E4* Wow./"
	                GS.msg[4]= "\\E6* Poor^1, naive little buddy^1.&* They\'ve brainwashed you./"
	                GS.msg[5]= "* " + chr(ord('"')) + "Friendship" + chr(ord('"')) + " is just a hot&  person\'s way of making you&  their slave./"
	                GS.msg[6]= "\\E4* .../"
	                GS.msg[7]= "\\E5* So^1, uh^1, what time would&  they wanna hang out?/%%"
	            }
	            if(GS.flag[437] == 4) {
	                GS.msg[0]= "\\E5* Huh^1?&* Yeah^1, those two vendors in back^1.&* The girls./"
	                GS.msg[1]= "\\E3* NOT the Nice Cream guy./"
	                GS.msg[2]= "\\E5* He keeps coming in here and&  asking me stuff like^1,&* " + chr(ord('"')) + "Hey Burgy, what do you think&  of this joke for my next&  ice cream wrapper?" + chr(ord('"')) + "/"
	                GS.msg[3]= "\\E4* Joke^1?&* Why are you calling it a JOKE?/"
	                GS.msg[4]= "\\E3* You drew a picture of two&  dudes hugging and wrote&  " + chr(ord('"')) + "I love hugs!" + chr(ord('"')) + " on it./"
	                GS.msg[5]= "\\E3* You somehow understand comedy&  EVEN LESS than that guy who&  keeps going on stage and&  crying about his family./"
	                GS.msg[6]= "\\E5* Anyway^1, I^1, uh^1, just tell him&  that they\'re good^1, because he&  gives me the nice cream for&  free afterward.../%%"
	            }
	            if(GS.flag[437] == 2) {
	                GS.msg[0]= "\\E4* Everyone calls me burgerpants&  now./"
	                GS.msg[1]= "\\E5* But you won\'t^1, will you^1,&  little buddy?/%%"
	            }
	            if(GS.flag[437] == 1) {
	                GS.msg[0]= "\\E6* So I went out to the alley&  to see those two ladies^1, and&  uh..^1. you know^1, see what\'d&  happen next./"
	                GS.msg[1]= "\\E4* .../"
	                GS.msg[2]= "\\E5* Then my boss^1, uh^1, saw me and&  asked me what I was doing./"
	                GS.msg[3]= "\\E1* I was so startled^1, the hamburgers&  in my pockets tumbled out&  onto the ground./"
	                GS.msg[4]= "\\E3* Not wanting to lose face^1,&  I scrambled to pick them up!/"
	                GS.msg[5]= "\\E3* But^1, as I was leaning over^1,&  the weight of the remaining&  hamburgers.../"
	                GS.msg[6]= "\\E5* ... caused my pants to fall&  down./"
	                GS.msg[7]= "\\E4* Then the girls laughed at me./"
	                GS.msg[8]= "\\E4* Everyone calls me Burgerpants&  now./%%"
	            }
	            if(GS.flag[437] == 0) {
	                GS.msg[0]= "\\E6* Listen^1.&* I like you^1, little buddy^1.&* So I\'m gonna save you a lot&  of trouble./"
	                GS.msg[1]= "\\E3* Never interact with attractive&  people./"
	                GS.msg[2]= "\\E6* Unless you\'re " + chr(ord('"')) + "one of them^1," + chr(ord('"')) + "&  they\'re just gonna take&  advantage of you./"
	                GS.msg[3]= "\\E3* Like that time those two&  chicks asked me to sneak them&  some glamburgers./"
	                GS.msg[4]= "\\E6* And I^1, naive teenager that&  I was^1, said yes to them./"
	                GS.msg[5]= "\\E4* Bad idea./%%"
	            }
	            if(GS.flag[7] == 1) {
	                GS.msg[0]= "\\E4* Those girls?&* The ones who saw my pants&  fall down?/"
	                GS.msg[1]= "\\E5* Well^1, we\'re all gonna be&  free^1, so I\'ll never see&  them again^1, at least!/%%"
	                if(GS.flag[437] >= 9) {
	                    GS.msg[0]= "\\E4* So we\'re free now./"
	                    GS.msg[1]= "\\E5* Does that mean my double-&  date is cancelled...?/"
	                    GS.msg[2]= "\\E4* .../"
	                    GS.msg[3]= "\\E5* I know^1, it wasn\'t really&  a..^1.&* A date./"
	                    GS.msg[4]= "\\E6* Here\'s a trick^1, little buddy^1:&* Lie to yourself all the time^1.&* It makes you feel better./%%"
	                }
	            }
	            if(murder == 1) {
	                GS.msg[0]= "\\E4* Well^1, Mettaton didn\'t tell me&  I HAD to work, I guess.../"
	                GS.msg[1]= "\\E3* But that\'s the thing^1!&* Sometimes he doesn\'t even&  call me into work until&  halfway into my shift!/"
	                GS.msg[2]= "\\E4* If I don\'t play it safe^1,&  he\'s going to yell at me./"
	                GS.msg[3]= "\\E6* Okay^1, maybe " + chr(ord('"')) + "yell" + chr(ord('"')) + " is the&  wrong term./"
	                GS.msg[4]= "\\E4* It\'s more like he has this..^1.&* CD album he plays.../"
	                GS.msg[5]= "\\E5* That\'s entirely full of&  songs about how bad I am&  at my job./%%"
	            }
	            if(GS.flag[437] == 8) GS.flag[437]= 9
	            if(GS.flag[437] == 5) GS.flag[437]= 6
	            if(GS.flag[437] == 1) GS.flag[437]= 2
	            if(GS.flag[437] == 0) GS.flag[437]= 1
	        }
	        if(sell == 5) {
	            if(GS.flag[436] == 3)
	                GS.msg[0]= "\\E5* Let\'s not talk about this./%%"
	            if(GS.flag[436] == 2) {
	                GS.msg[0]= "\\E1* Why do people find him so&  attractive??/"
	                GS.msg[1]= "\\E3* He\'s literally just a freaking&  rectangle./"
	                GS.msg[2]= "\\E4* .../"
	                GS.msg[3]= "* You know^1, one time^1, I bought&  one of those^1, uh^1, kits&  online..^1. to.../"
	                GS.msg[4]= "\\E5* Uh^1, make yourself more&  rectangular./"
	                GS.msg[5]= "\\E4* .../"
	                GS.msg[6]= "\\E5* They don\'t work./%%"
	            }
	            if(GS.flag[436] == 1) {
	                GS.msg[0]= "\\E3* God^1, have you even looked&  around^1?&* This place is a labyrinth of&  bad choices./"
	                GS.msg[1]= "* And every time we try to change&  something for the better^1, he&  vetoes it and says " + chr(ord('"')) + "that\'s not&  how they do it on the&  surface." + chr(ord('"')) + "/"
	                GS.msg[2]= "\\E1Oh! Right!/"
	                GS.msg[3]= "\\E3* Humans are always eating&  hamburgers made of SEQUINS&  AND GLUE./%%"
	            }
	            if(GS.flag[436] == 0) {
	                GS.msg[0]= "\\E5* When I first came to Hotland^1,&  it was my dream to work&  with Mettaton./"
	                GS.msg[1]= "\\E4* .../"
	                GS.msg[2]= "\\E3* Well^1, be careful what you&  wish for^1, little buddy!/%%"
	            }
	            if(GS.flag[436] == 2) GS.flag[436]= 3
	            if(GS.flag[436] == 1) GS.flag[436]= 2
	            if(GS.flag[436] == 0) GS.flag[436]= 1
	            if(GS.flag[7] == 1) {
	                GS.msg[0]= "\\E3* Don\'t tell anyone this^1, Little&  Buddy./"
	                GS.msg[1]= "\\E4* (Because they\'ll make fun&  of me,)/"
	                GS.msg[2]= "\\E5* But I..^1.&* I feel like I played a hand in&  everyone getting free&  somehow./"
	                GS.msg[3]= "\\E1* Even if it was just&  working this awful job.../"
	                GS.msg[4]= "\\E5* I think I did something!/"
	                GS.msg[5]= "\\E3* I don\'t know if it\'s true^1,&  but I\'ll believe it anyway!/%%"
	            }
	            if(murder == 1) {
	                GS.msg[0]= "\\E3* Huh?&* Everyone else is DEAD?/"
	                GS.msg[1]= "\\E4* .../"
	                GS.msg[2]= "\\E5* Does that mean I don\'t&  have to work today?/"
	                GS.msg[3]= "\\E6* God^1.&* That it were true^1,&  little weirdo^1.&* That it were true./%%"
	            }
	        }
	        if(sell == 6) {
	            GS.msg[0]= "\\E3* Future^1?&* WHAT future^1?&* Nothing down here EVER&  changes./"
	            GS.msg[1]= "\\E4* I\'ll probably be trapped&  at this stupid job forever./"
	            GS.msg[2]= "* .../"
	            GS.msg[3]= "\\E3* But wait^1!&* There\'s one thing that keeps&  me going!/"
	            GS.msg[4]= "* If ASGORE gets just one&  more SOUL^1, we\'ll finally get&  to go to the surface!/"
	            GS.msg[5]= "* It\'ll be a brand new world^1!&* There\'s gotta be a second&  chance out there for me^1!&* For everyone!/"
	            GS.msg[6]= "\\E6* So stay strong^1, little buddy^1.&* When I make it big^1, I\'ll&  keep you in mind./%%"
	            if(GS.flag[7] == 1) {
	                GS.msg[0]= "\\E3* Little buddy^1!&* There\'s a brand new world&  out there waiting&  for us./"
	                GS.msg[1]= "\\E6* I\'m sure with my (ahem)&  qualifications^1, it won\'t&  be long before I\'m a&  famous movie star.../"
	                GS.msg[2]= "\\E4* Or^1, maybe I\'ll just end up&  flipping burgers again./"
	                GS.msg[3]= "\\E3* But it\'s as I say^1!&* Nowhere to go but up^1!&* Literally^1, in this case!/%%"
	            }
	            if(murder == 1) {
	                GS.msg[0]= "\\E6* Sorry^1, little weirdo^1.&* Threats won\'t work on me./"
	                GS.msg[1]= "* I can\'t go to hell^1.&* I\'m all out of vacation&  days./%%"
	            }
	        }
	        if(sell == 20)
	            GS.msg[0]= "\\E0* I\'m sorry^1, (Ha ha) it\'s against&  the rules to talk to customers&  who haven\'t bought anything./%%"
	        if(sell == 21) {
	            GS.msg[0]= "\\E1* What^1?&* Why do you keep trying to talk&  to me?/"
	            GS.msg[1]= "\\E1* I\'ll get in trouble if I get&  chummy with the customers./"
	            GS.msg[2]= "\\E0* Sorry./"
	            GS.msg[3]= "\\E4* .../"
	            GS.msg[4]= "\\E3* SO^1, I wanted to be an ACTOR./%%"
	            GS.flag[435]= 2
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
	            if(sell == 1 or sell == 20) menu= 0
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
	    if(Input.is_key_pressed(66))
	        GS.flag[437]++
	    if(Input.is_key_pressed(76)) {
	        caster_free(-3)
	        get_tree().change_scene_to_file("res://godot_rooms/313.tscn")
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
