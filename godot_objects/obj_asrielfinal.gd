# Auto-converted from GameMaker: obj_asrielfinal
# GM parent: obj_monsterparent
extends Node2D

func _ready():
	scr_monstersetup()
	image_speed= 0
	part1= 568
	mypart1= _spawn("part1", x, y)
	$Alarm9.start((8) / 30.0)
	hurtanim= 0
	hurtsound= 42
	talked= 0
	whatiheard= -1
	attacked= 0
	killed= 0
	GS.heard= 0
	takedamage= 0
	mercymod= 10
	sha= 0
	shb= 0
	GS.faceemotion= 0
	songcon= 0
	if(GS.flag[501] > 0) {
	    obj_talkbt.spec= 1
	    obj_talkbt.sprite_index= 4/* spr_savebt */
	}
	// obj_battlebg
	with(185) instance_destroy()
	nextbattle= 0
	gocon= 0
	gotimer= 0
	total= GS.flag[505] + GS.flag[506] + GS.flag[507] + GS.flag[508]
	if(total == 1)
	    GS.msg[0]= "* You feel something faintly&  resonating within ASRIEL."
	if(total == 2)
	    GS.msg[0]= "* You feel something&  resonating within ASRIEL."
	if(total == 3)
	    GS.msg[0]= "* You feel something strongly&  resonating within ASRIEL."
	if(total == 4)
	    GS.msg[0]= "* You feel your friends\' SOULs&  resonating within ASRIEL!"
	if(total == 4 and GS.flag[501] < 2) GS.flag[501]= 2
	savecon_a= 0
	savecon_a_x= 0
	if(GS.flag[501] == 3) GS.faceemotion= 3
	turns= 0
	endcon= 0
	ht= 240
	wd= 10
	if(GS.flag[501] == 0) {
	    GS.bmenucoord[0]= 1
	    GS.mercy= 3
	}

func _gm_event_1_0():
	if(mercymod > 10 and GS.monsterhp[myself] == GS.monstermaxhp[myself])
	    GS.goldreward[3]+= 40
	scr_monsterdefeat(0, 0, 0, 0, 0)
	with(mypart1) instance_destroy()

func _gm_event_2_11():
	caster_free(-3)
	get_tree().change_scene_to_file("res://godot_rooms/331.tscn")

func _gm_event_2_9():
	mypart1.parent= GS.monsterinstance[myself]

func _gm_event_2_3():
	if(mypart1.pause != 1) {
	    dmgwriter= instance_create(x - 50, y + 80, 189/* obj_dmgwriter */)
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
	if(GS.mnfight == 3) attacked= 0
	if(alarm[5] > 0) {
	    if(GS.monster[0] == 1 and GS.monsterinstance[0].alarm[5] > alarm[5])
	        $Alarm5.start((GS.monsterinstance[0].alarm[5]) / 30.0)
	    if(GS.monster[1] == 1 and GS.monsterinstance[1].alarm[5] > alarm[5])
	        $Alarm5.start((GS.monsterinstance[1].alarm[5]) / 30.0)
	    if(GS.monster[2] == 1 and GS.monsterinstance[2].alarm[5] > alarm[5])
	        $Alarm5.start((GS.monsterinstance[2].alarm[5]) / 30.0)
	}
	if(GS.mnfight == 1) {
	    if(talked == 1 and not is_instance_valid(blconwd)) event_user(2)
	    if(talked == 0) {
	        event_user(3)
	        talked= 1
	        GS.heard= 0
	    }
	    if(talked == 2) talked= 0
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
	        if(GS.flag[501] < 3) mypart1.ucon= 1
	        else  {
	            if(turns == 0) {
	                mypart1.u_gen= 2
	                mypart1.ucon= 1
	            }
	            if(turns == 1) {
	                mypart1.u_gen= 3
	                mypart1.ucon= 1
	            }
	            if(turns == 2 or turns == 3 or turns == 4 or turns == 5) {
	                GS.turntimer= 120
	                GS.firingrate= 2
	                gen= instance_create(0, 0, 713/* obj_1sidegen */)
	                gen.myself= myself
	                gen.dmg= 1
	                gen.bullettype= 9
	            }
	            if(turns == 6) mypart1.bcon= 1
	            if(turns >= 7) mercymod= -12
	            if(turns >= 11) mercymod= 999999
	            turns++
	        }
	        GS.msg[0]= "* The whole world is ending."
	        total= GS.flag[505] + GS.flag[506] + GS.flag[507] + GS.flag[508]
	        if(total == 1)
	            GS.msg[0]= "* You feel something faintly&  resonating within ASRIEL."
	        if(total == 2)
	            GS.msg[0]= "* You feel something&  resonating within ASRIEL."
	        if(total == 3)
	            GS.msg[0]= "* You feel something strongly&  resonating within ASRIEL."
	        if(total == 4)
	            GS.msg[0]= "* You feel your friends\' SOULs&  resonating within ASRIEL!"
	        if(turns > 0) GS.msg[0]= "* ..."
	        attacked= 1
	    }
	    if(mercymod == -12 or mercymod == 999999) {
	        GS.turntimer= -1
	        GS.mnfight= 3
	    }
	    whatiheard= -1
	}
	if(GS.myfight == 2 and whatiheard != -1 and GS.heard == 0) {
	    if(GS.flag[501] > 2) {
	        GS.myfight= 0
	        GS.mnfight= 1
	    }
	    if(GS.flag[501] == 2 and whatiheard == 0) {
	        GS.msc= 0
	        savecon_a= 1
	        OBJ_WRITER.halt= 3
	        GS.msg[0]= "* Strangely^1, as your friends&  remembered you.../"
	        GS.msg[1]= "* Something else began resonating&  within the SOUL^1, stronger&  and stronger./"
	        GS.msg[2]= "* It seems that there\'s still&  one last person that needs&  to be saved./"
	        GS.msg[3]= "* But who...?/"
	        GS.msg[4]= "* .../"
	        GS.msg[5]= "* Suddenly^1, you realize./"
	        GS.msg[6]= "* You reach out and call&  their name./%%"
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	        whatiheard= 9
	    }
	    if(GS.flag[501] == 1) {
	        if(whatiheard == 0) {
	            GS.msc= 0
	            if(GS.flag[505] == 0) {
	                event_user(0)
	                nextbattle= 87
	            } else  event_user(1)
	            OBJ_WRITER.halt= 3
	            iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	            with(iii) halt= 0
	            whatiheard= 9
	        }
	        if(whatiheard == 3) {
	            GS.msc= 0
	            if(GS.flag[506] == 0) {
	                event_user(0)
	                nextbattle= 89
	            } else  event_user(1)
	            OBJ_WRITER.halt= 3
	            iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	            with(iii) halt= 0
	        }
	        if(whatiheard == 1 or whatiheard == 4) {
	            GS.msc= 0
	            if(GS.flag[507] == 0) {
	                event_user(0)
	                nextbattle= 88
	            } else  event_user(1)
	            OBJ_WRITER.halt= 3
	            iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	            with(iii) halt= 0
	        }
	        if(whatiheard == 2 or whatiheard == 5) {
	            GS.msc= 0
	            if(GS.flag[508] == 0) {
	                event_user(0)
	                nextbattle= 90
	            } else  event_user(1)
	            OBJ_WRITER.halt= 3
	            iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	            with(iii) halt= 0
	        }
	    }
	    if(GS.flag[501] == 0 and whatiheard == 0) {
	        if(GS.tempvalue[12] >= 4) {
	            with(mypart1) darker= 1
	            songcon= 1
	            GS.msc= 0
	            GS.msg[0]= "* Can\'t move your body^1.&* Nothing happened./"
	            GS.msg[1]= "* You struggle..^1.&* Nothing happened./"
	            GS.msg[2]= "* You tried to reach your&  SAVE file^1.&* Nothing happened./"
	            GS.msg[3]= "* You tried again to reach&  your SAVE file^1.&* Nothing happened./"
	            GS.msg[4]= "* Seems SAVING the game really&  is impossible./"
	            if(not file_exists("file0")) {
	                GS.msg[2]= "* SAVING over ASRIEL\'s file&  seems like the only way to&  defeat him.../"
	                GS.msg[3]= "* But^1, having never SAVED&  before^1, you lack the power&  to do it./"
	                GS.msg[4]= "* Seems SAVING the game really&  is impossible./"
	            }
	            GS.msg[5]= "* .../"
	            GS.msg[6]= "* But.../"
	            GS.msg[7]= "* Maybe^1, with what little&  power you have.../"
	            GS.msg[8]= "* You can SAVE something else./%%"
	            OBJ_WRITER.halt= 3
	            iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	            iii.z_index= -1020
	            with(iii) halt= 0
	            whatiheard= 9
	        } else  {
	            GS.tempvalue[12]++
	            GS.msc= 0
	            GS.msg[0]= "* Can\'t move your body./^"
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
	if(songcon == 1) {
	    vol= caster_get_volume(GS.batmusic)
	    vol-= 0.04
	    caster_set_volume(GS.batmusic, vol)
	    if(vol <= 0.04) {
	        vol= 0
	        caster_free(GS.batmusic)
	        songcon= 2
	    }
	}
	if(songcon == 3) {
	    with(mypart1) darker= 0
	    snd_play(30/* snd_break2 */)
	    songcon= -1
	}
	if(songcon == 2 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.heard= 0
	    GS.mercy= 1
	    GS.flag[501]= 1
	    GS.mnfight= 0
	    GS.myfight= 0
	    GS.bmenuno= 0
	    instance_create(0, 0, 118/* obj_flasher */)
	    GS.hp= GS.maxhp
	    obj_talkbt.spec= 1
	    obj_talkbt.sprite_index= 4/* spr_savebt */
	    songcon= 3
	    GS.batmusic= caster_load("music/xpart_2.ogg")
	    caster_loop(GS.batmusic, 0.8, 0.95)
	    GS.msg[0]= "* !?!?"
	}
	if(gocon == 1 and not instance_exists(782/* OBJ_WRITER */)) {
	    if(gotimer == 0) instance_create(0, 0, 557/* obj_screenwhiter */)
	    gotimer++
	    if(gotimer == 34) {
	        GS.battlegroup= nextbattle
	        gocon= 0
	        room_restart()
	    }
	}
	if(savecon_a > 0) {
	    vol= caster_get_volume(GS.batmusic)
	    vol-= 0.04
	    caster_set_volume(GS.batmusic, vol)
	    if(vol <= 0.04) {
	        vol= 0
	        caster_free(GS.batmusic)
	    }
	    if(savecon_a == 1 and not instance_exists(782/* OBJ_WRITER */)) {
	        savecon_a= 2
	        blcon= instance_create(400, 50, 187/* obj_blconwdflowey */)
	        GS.msc= 0
	        GS.msg[0]= "Huh^1? What are you&doing...!?"
	        GS.faceemotion= 2
	        GS.typer= 86
	        blconwd= instance_create(blcon.x + 25, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	        blcon.z_index= -2000
	        blconwd.z_index= -2200
	    }
	    if(savecon_a == 2) savecon_a_x++
	    if(savecon_a_x == 70) {
	        sw= instance_create(0, 0, 557/* obj_screenwhiter */)
	        sw.ex= 1
	    }
	    if(savecon_a_x == 138) get_tree().change_scene_to_file("res://godot_rooms/332.tscn")
	}
	if(endcon == 1) {
	    sw= instance_create(0, 0, 557/* obj_screenwhiter */)
	    sw.ex= 2
	    endcon= 3
	    $Alarm11.start((136) / 30.0)
	}

func _gm_event_7_13():
	if(GS.flag[501] != 3) {
	    blcon= instance_create(x + 100, y, 186/* obj_blconsm */)
	    gg= floor(random(3))
	    mycommand= round(random(100))
	    GS.msg[0]= ""
	    if(mycommand < 75) GS.msg[0]= ""
	    if(mycommand < 50) GS.msg[0]= ""
	    if(mycommand < 25) GS.msg[0]= ""
	    if(whatiheard == 1) GS.msg[0]= ""
	    if(whatiheard == 3) GS.msg[0]= ""
	    if(whatiheard == 4) GS.msg[0]= ""
	    GS.msg[1]= "%%%"
	    GS.typer= 2
	    blconwd= instance_create(blcon.x + 15, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	    with(blcon) instance_destroy()
	    with(blconwd) instance_destroy()
	    GS.border= 17
	    obj_heart.x= round((GS.idealborder[0] + GS.idealborder[1]) / 2) - 8
	    obj_heart.y= round((GS.idealborder[2] + GS.idealborder[3]) / 2) - 8
	}
	if(GS.flag[501] == 0) {
	    blcon= instance_create(400, 50, 187/* obj_blconwdflowey */)
	    GS.msc= 0
	    GS.typer= 86
	    if(GS.tempvalue[12] == 0 or GS.tempvalue[12] == 1)
	        GS.msg[0]= "Urah ha ha ha...&Behold my TRUE power!/%%"
	    if(GS.tempvalue[12] == 2) {
	        GS.msg[0]= "I can feel it.../"
	        GS.msg[1]= "Every time you die^1,&your grip on this&world slips away./"
	        GS.msg[2]= "Every time you die^1,&your friends forget&you a little more./"
	        GS.msg[3]= "Your life will end&here^1, in a world&where no one&remembers you.../%%"
	    }
	    if(GS.tempvalue[12] == 3) {
	        GS.msg[0]= "Still^1, you\'re&hanging on...?/"
	        GS.msg[1]= "That\'s fine./"
	        GS.msg[2]= "In a few moments^1,&you\'ll forget&everything^1, too./"
	        GS.msg[3]= "That attitude will&serve you well in&your next life!/%%"
	    }
	    if(GS.tempvalue[12] == 4) {
	        GS.msg[0]= "Ura ha ha.../"
	        GS.msg[1]= "Still!?/"
	        GS.msg[2]= "Come on.../"
	        GS.msg[3]= "Show me what good&your DETERMINATION&is now!/%%"
	    }
	    if(GS.tempvalue[12] >= 5) GS.msg[0]= "Ultimate bepis/%%"
	    blconwd= instance_create(blcon.x + 25, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	    blcon.z_index= -2000
	    blconwd.z_index= -2200
	    GS.border= 17
	    obj_heart.x= round((GS.idealborder[0] + GS.idealborder[1]) / 2) - 8
	    obj_heart.y= round((GS.idealborder[2] + GS.idealborder[3]) / 2) - 8
	}
	if(GS.flag[501] == 3) {
	    blcon= instance_create(400, 50, 187/* obj_blconwdflowey */)
	    GS.msc= 0
	    GS.typer= 86
	    if(turns == 0) {
	        GS.msg[0]= "\\E1Wh..^1.&what did you do...?/"
	        GS.msg[1]= "\\E3What\'s this&feeling...^1?&What\'s happening&to me?/"
	        GS.msg[2]= "\\E2No^1! NO^1!&I don\'t need&ANYONE!/%%"
	    }
	    if(turns == 1) {
	        GS.msg[0]= "\\E6STOP IT^1!&Get away from me!/"
	        GS.msg[1]= "Do you hear me!?/"
	        GS.msg[2]= "\\E2I\'ll tear you&apart!/%%"
	    }
	    if(turns == 2) {
	        GS.msg[0]= "\\E3.../"
	        GS.msg[1]= "\\E3.../"
	        GS.msg[2]= GS.charname + "..^1.&Do you know why&I\'m doing this...?/"
	        GS.msg[3]= "Why I keep fighting&to keep you&around...?/%%"
	    }
	    if(turns == 3) {
	        GS.msg[0]= "\\E4I\'m doing this.../"
	        GS.msg[1]= "\\E6Because you\'re&special^1, " + GS.charname + "./"
	        GS.msg[2]= "You\'re the only one&that understands&me./"
	        GS.msg[3]= "You\'re the only one&who\'s any fun to&play with anymore./%%"
	    }
	    if(turns == 4) {
	        GS.msg[0]= "\\E4.../"
	        GS.msg[1]= "No.../"
	        GS.msg[2]= "\\E1That\'s not JUST&it./"
	        GS.msg[3]= "I..^1. I.../"
	        GS.msg[4]= "\\E4I\'m doing this&because I care&about you^1, " + GS.charname + "!/"
	        GS.msg[5]= "\\E4I care about you&more than anybody&else!/%%"
	    }
	    if(turns == 5) {
	        GS.msg[0]= "\\E4I\'m not ready for&this to end./"
	        GS.msg[1]= "I\'m not ready for&you to leave./"
	        GS.msg[2]= "I\'m not ready to&say goodbye to&someone like&you again.../%%"
	    }
	    if(turns == 6) {
	        GS.typer= 88
	        mypart1.cry= 1
	        GS.msg[0]= "\\E7So, please..^1.&STOP doing this.../"
	        GS.msg[1]= "AND JUST LET ME&WIN!!!/%%"
	    }
	    if(turns == 7) {
	        with(mypart1) bodyfader+= 0.2
	        // obj_asrielpanels
	        with(566) event_user(0)
	        GS.typer= 87
	        GS.msg[0]= "\\E5.../"
	        GS.msg[1]= GS.charname + ".../%%"
	    }
	    if(turns == 8) {
	        with(mypart1) bodyfader+= 0.2
	        // obj_asrielpanels
	        with(566) event_user(0)
	        GS.typer= 87
	        GS.msg[0]= "\\E5I\'m so alone^1,&" + GS.charname + ".../%%"
	    }
	    if(turns == 9) {
	        with(mypart1) bodyfader+= 0.2
	        // obj_asrielpanels
	        with(566) event_user(0)
	        GS.typer= 87
	        GS.msg[0]= "\\E5I\'m so afraid^1,&" + GS.charname + ".../%%"
	    }
	    if(turns == 10) {
	        with(mypart1) bodyfader+= 0.2
	        // obj_asrielpanels
	        with(566) event_user(0)
	        GS.typer= 87
	        GS.msg[0]= GS.charname + "^1, I.../%%"
	    }
	    if(turns == 11) {
	        with(mypart1) bodyfader+= 0.2
	        // obj_asrielpanels
	        with(566) event_user(0)
	        GS.typer= 87
	        GS.msg[0]= "I..."
	        endcon= 1
	    }
	    blconwd= instance_create(blcon.x + 25, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	    blcon.z_index= -2000
	    blconwd.z_index= -2200
	    GS.border= 17
	    if(turns == 6) GS.border= 4
	    obj_heart.x= round((GS.idealborder[0] + GS.idealborder[1]) / 2) - 8
	    obj_heart.y= round((GS.idealborder[2] + GS.idealborder[3]) / 2) - 8
	}

func _gm_event_7_12():
	with(blconwd) instance_destroy()
	with(blcon) instance_destroy()
	talked= 2
	GS.mnfight= 2

func _gm_event_7_11():
	GS.msg[0]= "* You called out to your&  friends with all your&  heart./"
	GS.msg[1]= "* From somewhere^1, you felt&  their support.../^"
	if(GS.hp < GS.maxhp) {
	    GS.hp= GS.maxhp
	    snd_play(155/* snd_heal_c */)
	}

func _gm_event_7_10():
	GS.msg[0]= "* You reached out to ASRIEL\'s&  SOUL and called out to your&  friends./"
	GS.msg[1]= "* They\'re in there somewhere^1,&  aren\'t they?/"
	GS.msg[2]= "* .../"
	GS.msg[3]= "* Within the depths of ASRIEL\'s&  SOUL^1, something\'s resonating..!/%%"
	if(GS.flag[505] == 1 or GS.flag[506] == 1 or GS.flag[507] == 1 or GS.flag[508] == 1)
	    GS.msg[0]= "* Within the depths of ASRIEL\'s&  SOUL^1, something\'s resonating..!/%%"
	gocon= 1

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
