# Auto-converted from GameMaker: obj_torielboss
# GM parent: obj_monsterparent
extends Node2D

func _ready():
	scr_monstersetup(0, 0, 0, 0, 0)
	tt= 0
	hurtanim= 0
	hurtsound= 51
	talked= 0
	whatiheard= -1
	attacked= 0
	killed= 0
	iwilltalk= 0
	GS.heard= 0
	takedamage= 0
	outside= 0
	scale.x= 2
	scale.y= 2
	mercymod= -20000
	image_speed= 0
	GS.seriousbattle= 1
	obj_battlebg.frame= 1
	hplastturn= GS.monsterhp[myself]
	conversation= 0
	destroyed= 0
	ht= sprite_height
	wd= sprite_width
	if(scr_murderlv() >= 1) GS.monsterdef[myself]= -9999

func _gm_event_1_0():
	scr_monsterdefeat(0, 0, 0, 0, 0)
	GS.monster[0]= 1
	// obj_battlecontroller
	with(154) visible= 0
	GS.xp+= 150
	script_execute(55/* scr_levelup */)
	GS.border= 0
	SCR_BORDERSETUP()
	// obj_hpname
	with(183) instance_destroy()
	// obj_battlebg
	with(185) instance_destroy()
	// obj_btparent
	with(755) instance_destroy()
	// obj_borderparent
	with(757) instance_destroy()

func _gm_event_2_11():
	if(not instance_exists(782/* OBJ_WRITER */)) $Alarm7.start((2) / 30.0)
	else  $Alarm11.start((1) / 30.0)

func _gm_event_2_10():
	if(is_instance_valid(blcon)) {
	    with(blcon) instance_destroy()
	}
	if(modulate.a > 0.1) {
	    sprite_index= 739/* spr_torielboss_kneelsmile2 */
	    y+= 56
	    scale.x= 1
	    scale.y= 1
	    killed= 1
	    room_speed= 20
	    instance_create(obj_heart.x, sprite_height / 2 + y, 745/* obj_torheart */)
	    GS.flag[45]= 4
	    ini_open("undertale.ini")
	    TK= ini_read_real("Toriel", "TK", 0)
	    ini_write_real("Toriel", "TK", TK + 1)
	    ini_close()
	    instance_destroy()
	    modulate.a-= 0.05
	    $Alarm10.start((1) / 30.0)
	} else  {
	    caster_stop(GS.batmusic)
	    caster_free(GS.batmusic)
	    GS.typer= 1
	    script_execute(146/* scr_writetext */, 0, "* YOU WON!&* You lost 1 experience point./%", 0, 0)
	    $Alarm11.start((1) / 30.0)
	}

func _gm_event_2_9():
	if(not is_instance_valid(blconwriter)) {
	    if(GS.flag[6] == 0) $Alarm10.start((2) / 30.0)
	    else  {
	        destroyed= -1
	        with(blcon) instance_destroy()
	        tr= instance_create(x, y, 601/* obj_torboss_2ndtime */)
	        visible= 0
	        conversation= -20
	    }
	} else  $Alarm9.start((2) / 30.0)

func _gm_event_2_8():
	GS.border= 0
	SCR_BORDERSETUP()
	room_goto(GS.currentroom)

func _gm_event_2_7():
	instance_create(0, 0, 149/* obj_unfader */)
	$Alarm8.start((10) / 30.0)

func _gm_event_2_6():
	if(hplastturn == GS.monsterhp[myself] and GS.talked == -1) {
	    conversation++
	    iwilltalk= 1
	} else  iwilltalk= 0
	hplastturn= GS.monsterhp[myself]
	if(GS.monsterhp[myself] > 0) {
	    if(iwilltalk == 1) {
	        GS.turntimer= -300
	        alarm[5]+= 70
	        if(conversation == 1) GS.msg[0]= " ....."
	        if(conversation == 2) GS.msg[0]= " .....& ....."
	        if(conversation == 3) GS.msg[0]= " .....& .....& ....."
	        if(conversation == 4) GS.msg[0]= " ...?"
	        if(conversation == 5) GS.msg[0]= " What are& you& doing?"
	        if(conversation == 6) GS.msg[0]= " Attack& or run& away!"
	        if(conversation == 7)
	            GS.msg[0]= " What are& you& proving& this way?"
	        if(conversation == 8) GS.msg[0]= " Fight me& or& leave!"
	        if(conversation == 9) GS.msg[0]= " Stop it."
	        if(conversation == 10) instance_create(x, y, 700/* obj_torgen */)
	        if(conversation == 10)
	            GS.msg[0]= " Stop& looking& at me& that way."
	        if(conversation == 11) GS.msg[0]= " Go away!"
	        if(conversation == 12) GS.msg[0]= " ..."
	        if(conversation == 12) sprite_index= 735/* spr_torielboss_side */
	        if(conversation == 13) GS.msg[0]= " ...& ..."
	        if(conversation == 13) sprite_index= 730/* spr_torielboss_sidesad */
	        if(conversation > 13) {
	            alarm[5]+= 400
	            if(conversation == 14) caster_free(GS.batmusic)
	            GS.mercy= 1
	            if(conversation == 14) sprite_index= 728/* spr_torielboss_sad */
	            if(conversation == 14)
	                GS.msg[0]= "I know you want&to go home^1, but..."
	            if(conversation > 15) sprite_index= 727/* spr_torielboss_sadhappy */
	            if(conversation == 15)
	                GS.msg[0]= "But please... go&upstairs now."
	            if(conversation == 16)
	                GS.msg[0]= "I promise I will&take good care&of you here."
	            if(conversation == 17)
	                GS.msg[0]= "I know we do not&have much^1, but..."
	            if(conversation == 18)
	                GS.msg[0]= "We can have a&good life here."
	            if(conversation == 19) sprite_index= 728/* spr_torielboss_sad */
	            if(conversation == 19)
	                GS.msg[0]= "Why are you&making this so&difficult?"
	            if(conversation == 20) sprite_index= 730/* spr_torielboss_sidesad */
	            if(conversation == 20) GS.msg[0]= "Please^1, go upstairs."
	            if(conversation == 21) sprite_index= 732/* spr_torielboss_sidesad2 */
	            if(conversation == 21) GS.msg[0]= "....."
	            if(conversation == 22) sprite_index= 733/* spr_torielboss_sidesadhappy */
	            if(conversation == 22) GS.msg[0]= "Ha ha..."
	            if(conversation == 23)
	                GS.msg[0]= "Pathetic^1, is it not^2?&I cannot save even&a single child."
	            if(conversation == 24) GS.msg[0]= "..."
	            if(conversation == 24) sprite_index= 730/* spr_torielboss_sidesad */
	            if(conversation == 25) {
	                GS.flag[27]= 1
	                sprite_index= 731/* spr_torielboss_neutral */
	                $Alarm5.start((-6) / 30.0)
	                conversation= 99
	                GS.flag[45]= 5
	                ini_open("undertale.ini")
	                TS= ini_read_real("Toriel", "TS", 0)
	                ini_write_real("Toriel", "TS", TS + 1)
	                ini_close()
	                GS.msg[0]= "No^1, I understand./"
	                GS.msg[1]= "You would just be&unhappy trapped&down here./"
	                GS.msg[2]= "The RUINS are very&small once you&get used to them./"
	                GS.msg[3]= "It would not be&right for you to&grow up in a&place like this./"
	                GS.msg[4]= "My expectations...&My loneliness...&My fear.../"
	                GS.msg[5]= "For you^1, my child...&I will put them aside./%%"
	                GS.mnfight= 99
	                GS.myfight= 0
	            }
	            blcon= instance_create(x + sprite_width + 3, y + 32, 187/* obj_blconwdflowey */)
	            GS.typer= 8
	            blconwd= instance_create(obj_blconwdflowey.x + 36, obj_blconwdflowey.y + 10, 784/* OBJ_NOMSCWRITER */)
	        } else 
	            blcon= instance_create(x + sprite_width + 21, ystart + 24, 186/* obj_blconsm */)
	        GS.typer= 8
	        if(instance_exists(186/* obj_blconsm */))
	            blconwd= instance_create(blcon.x + 15, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	    }
	} else  {
	    destroyed= 1
	    GS.faceemotion= 0
	    caster_free(GS.batmusic)
	    if(is_instance_valid(dmgwriter)) {
	        with(dmgwriter) instance_destroy()
	    }
	    blcon= instance_create(x + sprite_width + 2, y + 36, 187/* obj_blconwdflowey */)
	    GS.msc= 0
	    GS.msg[0]= "\\E0Urgh.../"
	    GS.msg[1]= "\\E0You are stronger&than I thought.../"
	    GS.msg[2]= "Listen to me^1,& small one.../"
	    GS.msg[3]= "If you go beyond&this door,/"
	    GS.msg[4]= "Keep walking as&far as you can./"
	    GS.msg[5]= "Eventually you will&reach an exit./"
	    GS.msg[6]= "\\E1..^1.&..../"
	    GS.msg[7]= "\\RASGORE\\X..^1.&Do not let \\RASGORE\\X &take your soul./"
	    GS.msg[8]= "His plan&cannot be allowed&to succeed./"
	    GS.msg[9]= "\\E2....../"
	    GS.msg[10]= "Be good^1,&won\'t you?/"
	    GS.msg[11]= "\\E3My child.      %%"
	    if(GS.flag[202] >= 20) {
	        GS.faceemotion= 4
	        GS.msg[0]= "Y... you...&really hate me&that much?/"
	        GS.msg[1]= "Now I see who I&was protecting by&keeping you here./"
	        GS.msg[2]= "Not you.../"
	        GS.msg[3]= "\\E5But them!/"
	        GS.msg[4]= "\\E3Ha... ha... %%"
	    }
	    if(conversation > 13) {
	        GS.faceemotion= 4
	        GS.msg[0]= "\\E4You.../"
	        GS.msg[1]= "... at my most&vulnerable&moment.../"
	        GS.msg[2]= "To think I was&worried you&wouldn\'t fit&in out there.../"
	        GS.msg[3]= "\\E5Eheheheh!!!&You really are&no different than&them!/"
	        GS.msg[4]= "\\E3Ha... ha... %%"
	    }
	    GS.plot= 11
	    conversation= 1
	    image_speed= 0.2
	    GS.typer= 12
	    blconwriter= instance_create(obj_blconwdflowey.x + 36, obj_blconwdflowey.y + 10, 782/* OBJ_WRITER */)
	    $Alarm9.start((2) / 30.0)
	}
	mycommand= round(random(100))
	GS.border= 6
	obj_heart.x= round((GS.idealborder[0] + GS.idealborder[1]) / 2) - 8
	obj_heart.y= round((GS.idealborder[2] + GS.idealborder[3]) / 2) - 8

func _gm_event_2_5():
	if(instance_exists(784/* OBJ_NOMSCWRITER */)) {
	    with(blconwd) instance_destroy()
	}
	if(instance_exists(186/* obj_blconsm */)) {
	    with(blcon) instance_destroy()
	}
	if(instance_exists(187/* obj_blconwdflowey */)) {
	    // obj_blconwdflowey
	    with(187) instance_destroy()
	}
	talked= 0
	whatiheard= -1
	GS.mnfight= 2
	if(mycommand < 40 or GS.hp < 3) GS.border= 7

func _gm_event_2_3():
	x= xstart
	if(sprite_index != 734 and sprite_index != 736 and sprite_index != 742) {
	    if(shudder == 16 or shudder == 32) {
	        dmgwriter= instance_create(x, y - 20, 189/* obj_dmgwriter */)
	        GS.damage= takedamage
	        with(dmgwriter) dmg= GS.damage
	        if(conversation < 4) conversation= 0
	    }
	    sprite_index= 734/* spr_torielboss_hurt */
	    if(GS.damage > 100) {
	        sprite_index= 736/* spr_torielboss_reallyhurt */
	        caster_set_volume(GS.batmusic, 0)
	    }
	    if(GS.damage > 100 and conversation > 13) sprite_index= 742/* spr_torielboss_murdered */
	    if(GS.flag[202] >= 20) sprite_index= 742/* spr_torielboss_murdered */
	    snd_play(hurtsound)
	}
	x+= shudder
	if(shudder < 0) shudder= -(shudder + 2)
	else  shudder= -shudder
	shudder-= 2
	if(shudder == 0) {
	    GS.hurtanim[myself]= 2
	    exit
	} else  {
	    $Alarm3.start((2) / 30.0)
	    if(GS.damage > 100) $Alarm3.start((3) / 30.0)
	    exit
	}

func _gm_event_2_2():
	obj_heart.x= -200
	GS.border= 0

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
	    if(GS.monsterhp[myself] > 0) $Alarm5.start((15) / 30.0)
	    if(mercymod == -49) $Alarm5.start((400) / 30.0)
	    $Alarm6.start((2) / 30.0)
	    talked= 1
	    GS.heard= 0
	}
	if(keyboard_multicheck_pressed(13/* ENTER */)) {
	    if(conversation < 13 and alarm[5] > 5 and obj_lborder.x == GS.idealborder[0] and alarm[6] < 0)
	        $Alarm5.start((2) / 30.0)
	    if(conversation >= 13 and conversation != 99 and instance_exists(784/* OBJ_NOMSCWRITER */) and OBJ_NOMSCWRITER.stringpos >= string_length(OBJ_NOMSCWRITER.mystring[0]))
	        $Alarm5.start((2) / 30.0)
	}
	if(GS.hurtanim[myself] == 1) {
	    shudder= 16
	    $Alarm3.start((GS.damagetimer) / 30.0)
	    if(GS.damage > 100) shudder= 32
	    GS.hurtanim[myself]= 3
	}
	if(GS.hurtanim[myself] == 2) {
	    GS.monsterhp[myself]-= takedamage
	    with(dmgwriter) $Alarm2.start((15) / 30.0)
	    if(GS.damage > 100) {
	        with(dmgwriter) $Alarm2.start((60) / 30.0)
	    }
	    if(GS.monsterhp[myself] <= 150)
	        GS.monsterdef[myself]= -140
	    if(GS.monsterhp[myself] >= 1) {
	        GS.hurtanim[myself]= 0
	        if(conversation < 13) {
	            if(GS.hp > 2) sprite_index= 725/* spr_torielboss */
	            if(GS.hp <= 2) sprite_index= 735/* spr_torielboss_side */
	        }
	        frame= 0
	        GS.myfight= 0
	        GS.mnfight= 1
	    } else  {
	        GS.myfight= 0
	        GS.mnfight= 1
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
	    GS.turntimer= 160
	    if(GS.hp > 2 and conversation < 13) {
	        if(GS.flag[6] == 0) {
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
	        } else  {
	            if(mycommand >= 0 and mycommand <= 20) {
	                GS.turntimer= 160
	                GS.firingrate= 4
	                gen= instance_create(0, 0, 713/* obj_1sidegen */)
	                gen.bullettype= 7
	            }
	            if(mycommand > 20 and mycommand <= 40) {
	                GS.turntimer= 160
	                GS.firingrate= 1
	                gen= instance_create(0, 0, 713/* obj_1sidegen */)
	                gen.bullettype= 8
	            }
	            if(mycommand > 80 and mycommand <= 100) {
	                GS.turntimer= 200
	                GS.firingrate= 1
	                gen= instance_create(GS.idealborder[0] - 45, GS.idealborder[2] + 5, 614/* blt_handbullet1 */)
	                if(GS.hp > 6) gen.dmg= 6
	            }
	            if(mycommand > 60 and mycommand <= 80) {
	                GS.turntimer= 200
	                GS.firingrate= 1
	                gen= instance_create(GS.idealborder[0] - 45, GS.idealborder[2] + 5, 614/* blt_handbullet1 */)
	                gen.x1= 1
	                if(GS.hp > 6) gen.dmg= 6
	                gen2= instance_create(GS.idealborder[1] + 5, GS.idealborder[3] - 15, 615/* blt_handbullet2 */)
	                if(GS.hp > 6) gen2.dmg= 6
	            }
	            if(mycommand > 40 and mycommand <= 60) {
	                GS.turntimer= 160
	                GS.firingrate= 5
	                gen= instance_create(0, 0, 713/* obj_1sidegen */)
	                gen.bullettype= 10
	            }
	        }
	    } else  {
	        if(GS.monsterhp[myself] > 150)
	            GS.monsterdef[myself]= -15
	        GS.turntimer= 140
	        GS.firingrate= 2
	        gen= instance_create(0, 0, 713/* obj_1sidegen */)
	        if(conversation < 13) instance_create(x, y, 700/* obj_torgen */)
	        gen.bullettype= 9
	    }
	    if(conversation > 13) {
	        GS.turntimer= 1
	        GS.monsterdef[myself]= -2000
	    }
	    if(GS.flag[202] >= 20) GS.monsterdef[myself]= -9999
	    gen.myself= myself
	    gen.dmg= GS.monsteratk[myself]
	    if(mycommand >= 0)
	        GS.msg[0]= "* Toriel prepares a magical&  attack."
	    if(mycommand >= 30) GS.msg[0]= "* Toriel looks through you."
	    if(mycommand >= 70) GS.msg[0]= "* Toriel is acting aloof."
	    if(mycommand >= 90) GS.msg[0]= "* Toriel takes a deep breath."
	    if(conversation > 13) GS.msg[0]= "* ..."
	    attacked= 1
	}
	if(whatiheard == 3 and not instance_exists(782/* OBJ_WRITER */)) {
	    script_execute(163/* scr_mercystandard */)
	    if(mercy < 0) instance_destroy()
	}
	if(GS.myfight == 2 and whatiheard != -1 and GS.heard == 0) {
	    if(whatiheard == 0) {
	        GS.msc= 0
	        GS.msg[0]= "* TORIEL - ATK 80 DEF 80&* Knows best for you./^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    if(whatiheard == 3) {
	        tt++
	        GS.msc= 0
	        GS.msg[0]= "* You couldn\'t think of&  any conversation&  topics./^"
	        ini_open("undertale.ini")
	        TK= ini_read_real("Toriel", "TK", 0)
	        ini_close()
	        if(tt > 1)
	            GS.msg[0]= "* You tried to think&  of something to say&  again^1, but.../^"
	        if(tt > 2)
	            GS.msg[0]= "* Ironically^1, talking does not&  seem to be the solution&  to this situation./^"
	        if(TK > 0) {
	            GS.msg[0]= "* You thought about telling&  Toriel that you saw&  her die./"
	            GS.msg[1]= "* But...&* That\'s creepy./"
	            GS.msg[2]= "* Can you show mercy without&  fighting or running&  away...?/^"
	        }
	        if(TK > 0 and tt > 1)
	            GS.msg[0]= "* Can you show mercy&  without running away...?/^"
	        if(GS.flag[202] >= 20) GS.msg[0]= "* Not worth talking to./^"
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
	if(destroyed == 1) {
	    if(GS.faceemotion == 0) {
	        sprite_index= 737/* spr_torielboss_kneel */
	        GS.typer= 12
	    }
	    if(GS.faceemotion == 1) {
	        sprite_index= 740/* spr_torielboss_kneelanguish */
	        GS.typer= 13
	    }
	    if(GS.faceemotion == 2) {
	        sprite_index= 741/* spr_torielboss_kneelanguish2 */
	        GS.typer= 14
	    }
	    if(GS.faceemotion == 3) {
	        sprite_index= 738/* spr_torielboss_kneelsmile */
	        GS.typer= 15
	    }
	    if(GS.faceemotion == 4) {
	        sprite_index= 742/* spr_torielboss_murdered */
	        image_speed= 0
	        frame= 0
	        GS.typer= 13
	    }
	    if(GS.faceemotion == 5) frame= 1
	    if(instance_exists(782/* OBJ_WRITER */)) {
	        // OBJ_WRITER
	        with(782) script_execute(150/* SCR_TEXTTYPE */, GS.typer)
	    }
	    GS.facechange= 1
	}
	if(conversation == 99 and not instance_exists(782/* OBJ_WRITER */)) {
	    if(instance_exists(784/* OBJ_NOMSCWRITER */)) {
	        with(blconwd) instance_destroy()
	    }
	    if(instance_exists(186/* obj_blconsm */)) {
	        with(blcon) instance_destroy()
	    }
	    if(instance_exists(187/* obj_blconwdflowey */)) {
	        // obj_blconwdflowey
	        with(187) instance_destroy()
	    }
	    if(GS.flag[6] == 0) {
	        obj_battlecontroller.runaway= 1
	        conversation= 56
	        GS.flag[45]= 5
	        $Alarm2.start((20) / 30.0)
	        instance_create(0, 0, 149/* obj_unfader */)
	    } else  {
	        tr= instance_create(x, y, 601/* obj_torboss_2ndtime */)
	        tr.sprite_index= 735/* spr_torielboss_side */
	        visible= 0
	        conversation= -20
	    }
	}

func _gm_event_7_0():
	if(outside == 0) {
	    OBJ_WRITER.halt= 3
	    GS.monster[myself]= 0
	    if(GS.mnfight == 2) GS.mnfight= 1
	    outside= 1
	    instance_destroy()
	    GS.flag[13]= 1
	    GS.flag[14]= 3
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
