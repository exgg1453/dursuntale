# Auto-converted from GameMaker: obj_sansb
# GM parent: obj_monsterparent
extends Node2D

func _ready():
	if(GS.plot < 201) GS.plot= 201
	scr_monstersetup()
	image_speed= 0
	part1= 517
	mypart1= _spawn("part1", x, y)
	$Alarm9.start((8) / 30.0)
	hurtanim= 0
	hurtsound= 96
	talked= 0
	whatiheard= -1
	attacked= 0
	killed= 0
	GS.heard= 0
	takedamage= 0
	mercymod= -99999
	sha= 0
	shb= 0
	ht= 100
	wd= 120
	con= 1
	$Alarm4.start((30) / 30.0)
	obj_borderparent.visible= 0
	GS.mnfight= 99
	GS.myfight= 99
	GS.faceemotion= 4
	normalfight= 0
	obj_heart.visible= 0
	beamsfx= caster_load("music/sfx/sfx_rainbowbeam_1.ogg")
	beamsfx_a= caster_load("music/sfx/sfx_a_gigatalk.ogg")
	beam_up_sfx= caster_load("music/sfx/sfx_segapower.ogg")
	cutsfx= caster_load("music/sfx/sfx_cinematiccut.ogg")
	p_cut= 0
	p_beam= 0
	p_power= 0
	hit_try= 0
	hit_reached= 0
	timer_on= 0
	turn= 0
	turns= 0
	part= 0
	skip= 0
	if(skip == 0) {
	    birdnoise= caster_load("music/birdnoise.ogg")
	    caster_loop(birdnoise, 1, 1)
	}
	if(skip == 1) {
	    con= -1
	    with(mypart1) bounce= 1
	    obj_borderparent.visible= 1
	    GS.msg[0]= "* Skipped ahead."
	    GS.mnfight= 3
	    GS.myfight= 0
	    GS.faceemotion= 0
	    normalfight= 1
	    obj_heart.visible= 1
	    GS.flag[271]= 1
	    caster_loop(GS.batmusic, 0.95, 0.95)
	}
	drama= 0
	mercy_death= 0
	nx= 0
	GS.seriousbattle= 1
	ini_open("undertale.ini")
	ini_f= ini_read_real("Sans", "F", 0)
	intro= ini_read_real("Sans", "Intro", 0)
	ini_write_real("Sans", "F", ini_f + 1)
	ini_close()

func _gm_event_1_0():
	if(mercymod > 10 and GS.monsterhp[myself] == GS.monstermaxhp[myself])
	    GS.goldreward[3]+= 40
	scr_monsterdefeat(0, 0, 0, 0, 0)
	with(mypart1) instance_destroy()

func _gm_event_2_9():
	mypart1.parent= GS.monsterinstance[myself]

func _gm_event_2_6():
	sm= 0
	gg= floor(random(3))
	mycommand= round(random(100))
	GS.msg[0]= "del"
	GS.msg[1]= "%%%"
	yoff= 0
	if(hit_try > hit_reached) {
	    if(hit_try == 1) {
	        GS.faceemotion= 3
	        GS.flag[20]= 1
	        GS.msg[0]= "what^1?&you think i\'m just&gonna stand there&and take it?/%%"
	    }
	    if(hit_try == 2) {
	        GS.msg[0]= "our reports showed&a massive anomaly&in the timespace&continuum./"
	        GS.msg[1]= "timelines jumping&left and right,&stopping and&starting.../%%"
	    }
	    if(hit_try == 3)
	        GS.msg[0]= "\\E4until suddenly^1,&everything ends./%%"
	    if(hit_try == 4) {
	        GS.msg[0]= "\\E4heh heh heh.../"
	        GS.msg[1]= "\\E5that\'s your fault^1,&isn\'t it?/%%"
	    }
	    if(hit_try == 5)
	        GS.msg[0]= "\\E1you can\'t understand&how this feels./%%"
	    if(hit_try == 6) {
	        GS.msg[0]= "\\E4knowing that one&day^1, without any&warning.../"
	        GS.msg[1]= "\\E9it\'s all going to&be reset./%%"
	    }
	    if(hit_try == 7) {
	        GS.flag[20]= 1
	        GS.msg[0]= "\\E9look^1.&i gave up trying&to go back a long&time ago./%%"
	    }
	    if(hit_try == 8) {
	        GS.flag[20]= 1
	        GS.msg[0]= "\\E4and getting to the&surface doesn\'t&really appeal&anymore^1, either./%%"
	    }
	    if(hit_try == 9) {
	        GS.flag[20]= 1
	        GS.msg[0]= "\\E4cause even if we&do.../"
	        GS.msg[1]= "\\E5we\'ll just end up&right back here^1,&without any memory&of it^1, right?/%%"
	    }
	    if(hit_try == 10) {
	        GS.flag[20]= 1
	        GS.msg[0]= "\\E1to be blunt.../"
	        GS.msg[1]= "\\E4it makes it kind&of hard to give&it my all./%%"
	    }
	    if(hit_try == 11) {
	        GS.flag[20]= 1
	        GS.msg[0]= "\\E1... or is that just&a poor excuse for&being lazy...?/"
	        GS.msg[1]= "\\E3hell if i know./%%"
	    }
	    if(hit_try == 12) {
	        GS.flag[20]= 1
	        GS.msg[0]= "\\E4all i know is..^1.&seeing what comes&next.../"
	        GS.msg[1]= "\\E9i can\'t afford not&to care anymore./%%"
	    }
	    if(hit_try == 13) {
	        GS.flag[20]= 0
	        with(mypart1) sweat= 2
	        caster_pause(GS.batmusic)
	        drama= 1
	        obj_heart.speed= 0
	        ini_open("undertale.ini")
	        SS= ini_read_real("Sans", "SS", 0)
	        MP= ini_read_real("Sans", "MP", 0)
	        ini_write_real("Sans", "MP", MP + 1)
	        ini_close()
	        GS.msg[0]= "\\E9ugh..^1.&that being said.../"
	        GS.msg[1]= "\\E1you^1, uh^1, really&like swinging that&thing around^1,&huh?/"
	        GS.msg[2]= "\\E0.../"
	        GS.msg[3]= "\\E4listen./"
	        GS.msg[4]= "i know you didn\'t&answer me before^1,&but.../"
	        GS.msg[5]= "\\E4somewhere in&there^1.&i can feel it./"
	        GS.msg[6]= "\\E0there\'s a glimmer&of a good person&inside of you./"
	        GS.msg[7]= "\\E4the memory of&someone who once&wanted to do the&right thing./"
	        GS.msg[8]= "\\E1someone who^1, in&another time^1,&might have even&been.../"
	        GS.msg[9]= "\\E4a friend?/"
	        GS.msg[10]= "\\E3c\'mon^1, buddy./"
	        GS.msg[11]= "\\E0do you remember&me?/"
	        GS.msg[12]= "\\E4please^1, if you\'re&listening.../"
	        GS.msg[13]= "\\E9let\'s forget all&this^1, ok?/"
	        GS.msg[14]= "\\E3just lay down&your weapon^1, and.../"
	        GS.msg[15]= "\\E4well^1, my job&will be a lot&easier./%%"
	        if(SS > 0) {
	            GS.msg[0]= "\\E9ugh..^1.&that being said.../"
	            GS.msg[1]= "\\E1you^1, uh^1, really&like swinging that&thing around^1,&huh?/"
	            GS.msg[2]= "\\E0.../"
	            GS.msg[3]= "\\E4listen./"
	            GS.msg[4]= "friendship.../"
	            GS.msg[5]= "\\E3it\'s really great^1,&right?/"
	            GS.msg[6]= "let\'s quit fighting./%%"
	        }
	        mercymod= 999999
	    }
	    if(hit_try == 14) {
	        ini_open("undertale.ini")
	        SS= ini_read_real("Sans", "SS", 0)
	        SS2= ini_read_real("Sans", "SS2", 0)
	        if(SS > 0) ini_write_real("Sans", "SS2", SS2 + 1)
	        ini_close()
	        if(drama == 2) caster_free(d_music)
	        GS.flag[20]= 1
	        GS.msg[0]= "\\E3welp^1, it was&worth a shot./"
	        GS.msg[1]= "\\E5guess you like&doing things the&hard way^1, huh?/%%"
	        if(SS > 0 and SS2 == 0) {
	            GS.msg[0]= "\\E3woah^1, you look&REALLY pissed off.../"
	            GS.msg[1]= "\\E4heheheh.../"
	            GS.msg[2]= "\\E5did i getcha?/"
	            GS.msg[3]= "\\E4well^1, if you came&back anyway.../"
	            GS.msg[4]= "\\E1i guess that means&we never really&WERE friends^1, huh?/"
	            GS.msg[5]= "\\E4heh./"
	            GS.msg[6]= "\\E9don\'t tell that&to the other&sans-es^1, ok?/%%"
	        }
	        mercymod= 999999
	    }
	    if(hit_try == 15) {
	        GS.msg[0]= "\\E4sounds strange^1, but&before all this i&was secretly hoping&we could be friends./"
	        GS.msg[1]= "\\E1i always thought the&anomaly was doing&this cause they&were unhappy./"
	        GS.msg[2]= "and when they got&what they wanted^1,&they would stop&all this./%%"
	    }
	    if(hit_try == 16) {
	        GS.msg[0]= "\\E3and maybe all they&needed was..^1.&i dunno./"
	        GS.msg[1]= "\\M1some good food^1,&some bad laughs^1,&some nice friends./%%"
	    }
	    if(hit_try == 17) {
	        GS.msg[0]= "\\E4but that\'s&ridiculous^1,&right?/"
	        GS.msg[1]= "\\E5yeah^1, you\'re the&type of person&who won\'t EVER&be happy./%%"
	    }
	    if(hit_try == 18) {
	        GS.msg[0]= "\\E5you\'ll keep&consuming timelines&over and over^1,&until.../"
	        GS.msg[1]= "\\E4well./"
	        GS.msg[2]= "\\M1hey./"
	        GS.msg[3]= "\\E3take it from me^1,&kid./"
	        GS.msg[4]= "someday.../"
	        GS.msg[5]= "you gotta learn&when to QUIT./%%"
	    }
	    if(hit_try == 19) GS.msg[0]= "\\E3and that day\'s&TODAY./%%"
	    if(hit_try == 20) {
	        with(mypart1) sweat= 1
	        GS.msg[0]= "\\E4cause..^1.&y\'see../"
	        GS.msg[1]= "\\E1all this fighting&is really tiring&me out./%%"
	    }
	    if(hit_try == 21) {
	        with(mypart1) sweat= 1
	        GS.msg[0]= "\\E4and if you keep&pushing me.../"
	        GS.msg[1]= "\\Xt\\E3hen i\'ll be&forced to use my\\R &special attack\\X./%%"
	    }
	    if(hit_try == 22) {
	        with(mypart1) sweat= 2
	        GS.msg[0]= "\\Xy\\E3eah^1, my \\Rspecial&attack\\X.&sound familiar?/"
	        GS.msg[1]= "\\Xw\\E1ell^1, get ready^1.&cause after the&next move^1, i\'m&going to \\Ruse it\\X./"
	        GS.msg[2]= "\\E3so^1, if you don\'t&wanna see it^1, now&would be a good&time to die./%%"
	    }
	    if(hit_try == 23) {
	        with(mypart1) sweat= 0
	        GS.msg[0]= "\\E4well^1, here goes&nothing.../"
	        GS.msg[1]= "\\E3are you ready?/"
	        GS.msg[2]= "\\Xs\\E5urvive THIS^1, and&i\'ll show you my\\R &special attack\\X!/%%"
	    }
	    hit_reached= hit_try
	}
	if(mercy_death == 1) {
	    GS.flag[272]= 1
	    caster_free(-3)
	    GS.flag[20]= 0
	    GS.faceemotion= 4
	    GS.msg[0]= ".../"
	    GS.msg[1]= "you\'re sparing me?/"
	    GS.msg[2]= "\\E1finally./"
	    GS.msg[3]= "\\E3buddy^1.&pal./"
	    GS.msg[4]= "\\E4i know how hard&it must be.../"
	    GS.msg[5]= "to make that&choice./"
	    GS.msg[6]= "to go back on&everything you\'ve&worked up to./"
	    GS.msg[7]= "\\E0i want you to&know..^1.&i won\'t let it&go to waste./"
	    GS.msg[8]= "\\M1.../"
	    GS.msg[9]= "\\E3c\'mere^1, pal./%%"
	    ini_open("undertale.ini")
	    SS= ini_read_real("Sans", "SS", 0)
	    ini_write_real("Sans", "SS", SS + 1)
	    ini_close()
	}
	GS.typer= 109
	GS.border= 35
	a_choose= 0
	if(hit_try < 13) {
	    GS.flag[271]= 1
	    a_choose= part
	    if(part >= 13) a_choose= 10
	    if(a_choose == 0) GS.border= 35
	    if(a_choose == 1) GS.border= 35
	    if(a_choose == 2) GS.border= 35
	    if(a_choose == 3) GS.border= 35
	    if(a_choose == 4) GS.border= 35
	    if(a_choose == 5) GS.border= 35
	    if(a_choose == 6) GS.border= 39
	    if(a_choose == 7) GS.border= 35
	    if(a_choose == 8) GS.border= 39
	    if(a_choose == 9) GS.border= 35
	    if(a_choose == 10) GS.border= 35
	    if(a_choose == 11) GS.border= 35
	    if(a_choose == 12) GS.border= 35
	    obj_heart.movement= 2
	    obj_heart.sprite_index= 40/* spr_heartblue */
	}
	if(hit_try >= 14 and hit_try < 23 and nx == 1) {
	    obj_heart.movement= 1
	    obj_heart.sprite_index= 34/* spr_heart */
	    c_choose= 0
	    if(part == 0) GS.border= 37
	    if(part == 1) GS.border= 0
	    if(part == 2) GS.border= 36
	    if(part == 3) GS.border= 36
	    if(part == 4) GS.border= 37
	    if(part == 5) GS.border= 36
	    if(part == 6) GS.border= 0
	    if(part == 7) GS.border= 36
	    if(part >= 8) c_choose= choose(3, 1, 2)
	    if(c_choose == 3) GS.border= 37
	    if(c_choose == 1 or c_choose == 2) GS.border= 36
	}
	if(hit_try == 23) {
	    GS.border= 36
	    obj_heart.movement= 1
	    obj_heart.sprite_index= 34/* spr_heart */
	}
	if(mercy_death == 1) {
	    GS.border= 38
	    SCR_BORDERSETUP()
	    obj_heart.speed= 0
	}
	obj_heart.x= round((GS.idealborder[0] + GS.idealborder[1]) / 2)
	obj_heart.y= round((GS.idealborder[2] + GS.idealborder[3]) / 2) - 8
	if(obj_heart.movement == 2) {
	    // obj_heart
	    with(743) {
	        y= GS.idealborder[3] - 15
	        speed= 0
	        jumpstage= 1
	    }
	}
	if(GS.border == 39) obj_heart.y= GS.idealborder[3] - 70
	if(mercy_death == 1) {
	    obj_heart.x= round((GS.idealborder[0] + GS.idealborder[1]) / 2) - 8
	    obj_heart.y= round((GS.idealborder[2] + GS.idealborder[3]) / 2) - 8
	    obj_heart.sprite_index= 34/* spr_heart */
	    obj_heart.movement= 1
	}
	// obj_menubone
	with(505) terminate= 1
	// obj_menubone_bottom
	with(504) terminate= 1
	// obj_menubone_maker
	with(510) instance_destroy()
	SCR_BORDERSETUP()
	yoff= 250 - GS.idealborder[2]
	if(yoff < 0) yoff= 0
	if(sm == 1)
	    blcon= instance_create(x + 120, y - yoff, 186/* obj_blconsm */)
	else  blcon= instance_create(x + 120, y - yoff, 187/* obj_blconwdflowey */)
	blconwd= instance_create(blcon.x + 30, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	if(GS.msg[0] == "del") {
	    with(blconwd) instance_destroy()
	    with(blcon) instance_destroy()
	}

func _gm_event_2_5():
	with(blconwd) instance_destroy()
	with(blcon) instance_destroy()
	talked= 0
	GS.faceemotion= 0
	GS.flag[20]= 0
	GS.mnfight= 2

func _gm_event_2_4():
	con++

func _gm_event_2_3():
	if(mypart1.pause != 1) {
	    dmgwriter= instance_create(x + sprite_width / 2 - 48, y - 50, 189/* obj_dmgwriter */)
	    GS.damage= 0
	    with(dmgwriter) dmg= 0
	    mypart1.pause= 1
	    hit_try++
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
	if(GS.mnfight == 1 and talked == 0) {
	    $Alarm5.start((15) / 30.0)
	    $Alarm6.start((1) / 30.0)
	    talked= 1
	    GS.heard= 0
	}
	if(talked == 1 and instance_exists(782/* OBJ_WRITER */)) {
	    scr_textskip()
	    if(alarm[5] <= 3) $Alarm5.start((3) / 30.0)
	}
	if(GS.hurtanim[myself] == 1) {
	    shudder= 8
	    $Alarm3.start((GS.damagetimer) / 30.0)
	    GS.hurtanim[myself]= 3
	}
	if(GS.hurtanim[myself] == 2) {
	    with(dmgwriter) $Alarm2.start((15) / 30.0)
	    GS.hurtanim[myself]= 0
	    mypart1.pause= 0
	    GS.myfight= 0
	    GS.mnfight= 1
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
	if(GS.mnfight == 2 and normalfight == 1) {
	    if(attacked == 0) {
	        GS.flag[271]= 1
	        if(GS.sp < 5) GS.sp= 5
	        GS.turntimer= 10
	        timer_on= 1
	        if(mercy_death == 0) {
	            if(hit_try < 13) {
	                obj_heart.movement= 2
	                obj_heart.sprite_index= 40/* spr_heartblue */
	                if(part == 0) {
	                    // obj_sansb_body
	                    with(517) {
	                        a_type= 0
	                        event_user(0)
	                    }
	                }
	                if(part == 1) {
	                    // obj_sansb_body
	                    with(517) {
	                        a_type= 3
	                        event_user(0)
	                    }
	                }
	                if(part == 2) {
	                    // obj_sansb_body
	                    with(517) {
	                        a_type= 23
	                        event_user(0)
	                    }
	                }
	                if(part == 3) {
	                    // obj_sansb_body
	                    with(517) {
	                        a_type= 6
	                        event_user(0)
	                    }
	                }
	                if(part == 4) {
	                    // obj_sansb_body
	                    with(517) {
	                        a_type= 7
	                        event_user(0)
	                    }
	                }
	                if(part == 5) {
	                    // obj_sansb_body
	                    with(517) {
	                        a_type= 8
	                        event_user(0)
	                    }
	                }
	                if(part == 6) {
	                    // obj_sansb_body
	                    with(517) {
	                        a_type= 17
	                        event_user(0)
	                    }
	                }
	                if(part == 7) {
	                    // obj_sansb_body
	                    with(517) {
	                        a_type= 15
	                        event_user(0)
	                    }
	                }
	                if(part == 8) {
	                    // obj_sansb_body
	                    with(517) {
	                        a_type= 18
	                        event_user(0)
	                    }
	                }
	                if(part == 9) {
	                    // obj_sansb_body
	                    with(517) {
	                        a_type= 1
	                        event_user(0)
	                    }
	                }
	                if(part == 10) {
	                    // obj_sansb_body
	                    with(517) {
	                        a_type= 5
	                        event_user(0)
	                    }
	                }
	                if(part == 11) {
	                    // obj_sansb_body
	                    with(517) {
	                        a_type= 21
	                        event_user(0)
	                    }
	                }
	                if(part == 12) {
	                    // obj_sansb_body
	                    with(517) {
	                        a_type= 16
	                        event_user(0)
	                    }
	                }
	                if(part >= 13) {
	                    b_choose= choose(0, 1, 2, 3)
	                    if(b_choose == 0) {
	                        // obj_sansb_body
	                        with(517) {
	                            a_type= 1
	                            event_user(0)
	                        }
	                    }
	                    if(b_choose == 1) {
	                        // obj_sansb_body
	                        with(517) {
	                            a_type= 5
	                            event_user(0)
	                        }
	                    }
	                    if(b_choose == 2) {
	                        // obj_sansb_body
	                        with(517) {
	                            a_type= 21
	                            event_user(0)
	                        }
	                    }
	                    if(b_choose == 3) {
	                        // obj_sansb_body
	                        with(517) {
	                            a_type= 16
	                            event_user(0)
	                        }
	                    }
	                }
	                if(GS.border == 39) {
	                    obj_heart.y= GS.idealborder[3] - 70
	                    obj_heart.velocity.y= 2
	                }
	            }
	            if(hit_try >= 14 and hit_try < 23 and nx == 1) {
	                GS.turntimer= 20
	                timer_on= 0
	                obj_heart.movement= 1
	                obj_heart.sprite_index= 34/* spr_heart */
	                if(part == 0) {
	                    // obj_sansb_body
	                    with(517) {
	                        a_type= 12
	                        event_user(0)
	                    }
	                    timer_on= 1
	                }
	                if(part == 1) {
	                    shadow= instance_create(0, 0, 511/* obj_sansshadowgen */)
	                    shadow.level= 1
	                    shadow.shadow_max= 5
	                }
	                if(part == 2) {
	                    // obj_sansb_body
	                    with(517) {
	                        smasher= 1
	                        smashlv= 0
	                        smashcon= 0
	                    }
	                }
	                if(part == 3) {
	                    // obj_sansb_body
	                    with(517) {
	                        smasher= 1
	                        smashlv= 1
	                        smashcon= 0
	                    }
	                }
	                if(part == 4) {
	                    // obj_sansb_body
	                    with(517) {
	                        a_type= 13
	                        event_user(0)
	                    }
	                    timer_on= 1
	                }
	                if(part == 5) {
	                    // obj_sansb_body
	                    with(517) {
	                        a_type= 22
	                        event_user(0)
	                    }
	                    timer_on= 1
	                }
	                if(part == 6) {
	                    shadow= instance_create(0, 0, 511/* obj_sansshadowgen */)
	                    with(shadow) $Alarm0.start((4) / 30.0)
	                    shadow.level= 2
	                    shadow.shadow_max= 6
	                }
	                if(part == 7) {
	                    // obj_sansb_body
	                    with(517) {
	                        smasher= 1
	                        smashlv= 2
	                        smashcon= 0
	                    }
	                }
	                if(part >= 8) {
	                    if(c_choose == 1) {
	                        // obj_sansb_body
	                        with(517) {
	                            smasher= 1
	                            smashlv= 2
	                            smashcon= 0
	                        }
	                    }
	                    if(c_choose == 2) {
	                        shadow= instance_create(0, 0, 511/* obj_sansshadowgen */)
	                        with(shadow) $Alarm0.start((4) / 30.0)
	                        shadow.level= 2
	                        shadow.shadow_max= 6
	                    }
	                    if(c_choose == 3) {
	                        // obj_sansb_body
	                        with(517) {
	                            a_type= 13
	                            event_user(0)
	                        }
	                        timer_on= 1
	                    }
	                }
	            }
	            if(hit_try == 23) {
	                GS.border= -1
	                // obj_sansb_body
	                with(517) lac= 4
	                // obj_borderparent
	                with(757) instaborder= 1
	                timer_on= 0
	                obj_heart.x= round((GS.idealborder[0] + GS.idealborder[1]) / 2)
	                obj_heart.y= round((GS.idealborder[2] + GS.idealborder[3]) / 2) - 8
	            }
	            if(hit_try == 14 and nx == 0) {
	                nx= 1
	                mercymod= -10000
	                caster_resume(GS.batmusic)
	                part= -1
	                shadow= instance_create(0, 0, 511/* obj_sansshadowgen */)
	                shadow.level= 0
	                shadow.shadow_max= 5
	                timer_on= 0
	            }
	        } else  {
	            mercymod= -999999
	            timer_on= 0
	            obj_heart.x= round((GS.idealborder[0] + GS.idealborder[1]) / 2) - 8
	            obj_heart.y= round((GS.idealborder[2] + GS.idealborder[3]) / 2) - 8
	            obj_heart.sprite_index= 34/* spr_heart */
	            obj_heart.movement= 1
	            // obj_sansb_body
	            with(517) {
	                a_type= 20
	                event_user(0)
	            }
	        }
	        turns++
	        part++
	        if(hit_try < 4 and mycommand >= 0)
	            GS.msg[0]= "* Just keep attacking."
	        if(hit_try >= 4 and mycommand >= 0)
	            GS.msg[0]= "* Sans\'s movements grow a&  little wearier."
	        if(hit_try >= 8 and mycommand >= 0)
	            GS.msg[0]= "* Sans\'s movements seem to be&  slower."
	        if(hit_try >= 13 and mycommand >= 0)
	            GS.msg[0]= "* Felt like a turning point."
	        if(GS.km >= 0)
	            GS.msg[0]= "* You felt your sins crawling&  on your back."
	        if(GS.km >= 10)
	            GS.msg[0]= "* You felt your sins weighing&  on your neck."
	        if(GS.km >= 20)
	            GS.msg[0]= "* KARMA coursing through your&  veins."
	        if(GS.km >= 30) GS.msg[0]= "* Doomed to death of KARMA!"
	        if(hit_try == 15 and mycommand >= 0)
	            GS.msg[0]= "* The REAL battle finally begins."
	        if(hit_try >= 19 and mycommand >= 0)
	            GS.msg[0]= "* Reading this doesn\'t seem&  like the best use of time."
	        if(hit_try >= 20 and mycommand >= 0)
	            GS.msg[0]= "* Sans is starting to look&  really tired."
	        if(hit_try >= 21 and mycommand >= 0)
	            GS.msg[0]= "* Sans is preparing something."
	        if(hit_try >= 22 and mycommand >= 0)
	            GS.msg[0]= "* Sans is getting ready to&  use his special attack."
	        attacked= 1
	    }
	    if(mercymod == 999999) {
	        obj_heart.speed= 0
	        GS.msg[0]= "* Sans is sparing you."
	        GS.turntimer= -1
	        GS.mnfight= 3
	    }
	    whatiheard= -1
	}
	if(GS.myfight == 2 and whatiheard != -1 and GS.heard == 0) {
	    if(whatiheard == 0) {
	        GS.msc= 0
	        if(hit_try > 0) {
	            GS.msg[0]= "* SANS 1 ATK 1 DEF&* The easiest enemy^1.&* Can only deal 1 damage./"
	            GS.msg[1]= "* Can\'t keep dodging forever^1.&* Keep attacking./^"
	        } else 
	            GS.msg[0]= "* SANS 1 ATK 1 DEF&* The easiest enemy^1.&* Can only deal 1 damage./^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	        whatiheard= 9
	    }
	    GS.heard= 1
	}
	if(GS.myfight == 4 and GS.mercyuse == 0) {
	    script_execute(163/* scr_mercystandard */)
	    if(mercy < 0) mercy_death= 1
	}
	if(mercymod == 222 and not instance_exists(782/* OBJ_WRITER */)) {
	    script_execute(163/* scr_mercystandard */)
	    if(mercy < 0) mercy_death= 1
	}
	if(con == 1 and skip == 0) {
	    // OBJ_WRITER
	    with(782) instance_destroy()
	    GS.mnfight= 99
	    GS.myfight= 99
	    obj_heart.visible= 0
	    GS.sp= 5
	}
	if(con == 1 and skip == 1) {
	    GS.mnfight= 99
	    GS.myfight= 99
	    caster_loop(GS.batmusic, 0.9, 0.95)
	    GS.sp= 5
	    // OBJ_WRITER
	    with(782) instance_destroy()
	    with(mypart1) fac= 20
	}
	if(con == 2) {
	    GS.msc= 0
	    GS.typer= 107
	    GS.msg[0]= "it\'s a beautiful&day outside./"
	    GS.msg[1]= "birds are singing^1,&flowers are&blooming.../"
	    GS.msg[2]= "on days like these^1,&kids like you.../%%"
	    if(intro == 1) {
	        GS.msg[0]= "it\'s a beautiful&day outside./"
	        GS.msg[1]= "birds are singing^1,%%"
	    }
	    if(intro >= 2) GS.msg[0]= "ready?/%%"
	    con= 3
	    scr_blcon_x(x + 120, y)
	}
	if(con == 3 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 5
	    $Alarm4.start((10) / 30.0)
	    if(intro >= 1) $Alarm4.start((2) / 30.0)
	}
	if(con == 6) {
	    caster_stop(birdnoise)
	    snd_play(106/* snd_noise */)
	    blk= scr_marker(-10, -10, 996)
	    blk.scale.x= 999
	    blk.scale.y= 999
	    blk.z_index= -9999
	    GS.bmenuno= 999
	    // obj_borderparent
	    with(757) instaborder= 1
	    GS.border= -1
	    GS.idealborder[0]= 240
	    GS.idealborder[1]= 400
	    GS.idealborder[2]= GS.idealborder[3] - 160
	    obj_heart.x= GS.idealborder[0] + 75
	    obj_heart.y= GS.idealborder[2] + 75
	    con= 7
	    $Alarm4.start((8) / 30.0)
	    if(intro >= 1) $Alarm4.start((2) / 30.0)
	}
	if(con == 8) {
	    GS.faceemotion= 5
	    GS.flag[271]= 1
	    obj_heart.visible= 1
	    with(blk) instance_destroy()
	    snd_play(106/* snd_noise */)
	    normalfight= 0
	    GS.myfight= -1
	    GS.mnfight= 2
	    con= 9
	    obj_borderparent.visible= 1
	    $Alarm4.start((20) / 30.0)
	    if(intro >= 1) {
	        con= 11
	        $Alarm4.start((-1) / 30.0)
	    }
	}
	if(con == 10) {
	    GS.typer= 108
	    GS.msg[0]= "Should&be&burning&in hell./%%"
	    con= 11
	    scr_blcon_x(x + 120, y - 30)
	    blcon.sprite_index= 18/* spr_blconsm */
	}
	if(con == 11 and not instance_exists(782/* OBJ_WRITER */)) {
	    // obj_sansb_body
	    with(517) fac= 1
	    con= 12
	}
	if(p_cut == 1) {
	    caster_stop(cutsfx)
	    caster_play(cutsfx, 0.8, 1.4)
	    snd_stop(20)
	    snd_play(20/* snd_arrow */)
	    p_cut= 0
	}
	if(p_power == 1) {
	    dopower= 0
	    if(GS.osflavor == 2 and hit_try >= 23) dopower= 1
	    if(dopower == 0) {
	        caster_stop(beam_up_sfx)
	        caster_play(beam_up_sfx, 0.8, 1.2)
	    }
	    p_power= 0
	}
	if(p_beam == 1) {
	    caster_stop(beamsfx)
	    caster_play(beamsfx, 0.8, 1.2)
	    if(GS.osflavor == 1) caster_stop(beamsfx_a)
	    caster_play(beamsfx_a, 0.6, 1.2)
	    p_beam= 0
	}
	if(timer_on == 1 and GS.turntimer <= 0) {
	    if(hit_try >= 15 and hit_try < 23) instance_create(0, 0, 510/* obj_menubone_maker */)
	    GS.mnfight= 3
	    GS.movement= 0
	    timer_on= 0
	    // obj_bonestab
	    with(502) instance_destroy()
	    // obj_sans_shaker
	    with(512) instance_destroy()
	    // obj_bonewall_normal
	    with(500) instance_destroy()
	    // obj_bonewall
	    with(501) instance_destroy()
	    // obj_boneplat
	    with(515) instance_destroy()
	    // obj_sans_bonebul
	    with(499) instance_destroy()
	    // obj_gasterblaster
	    with(498) instance_destroy()
	    // obj_boneloop_v
	    with(503) instance_destroy()
	    // obj_gasterbl_gen
	    with(518) instance_destroy()
	    // obj_3platgen
	    with(514) instance_destroy()
	}
	if(drama == 1 and instance_exists(782/* OBJ_WRITER */) and OBJ_WRITER.stringno == 2) {
	    d_music= caster_load("music/chokedup.ogg")
	    caster_loop(d_music, 0.8, 0.9)
	    drama= 2
	}
	if(GS.debug == 1 and Input.is_key_pressed(81) and hit_try < 12) {
	    hit_try= 12
	    hit_reached= 11
	}
	if(GS.debug == 1 and Input.is_key_pressed(69) and hit_try < 22) {
	    hit_try= 22
	    hit_reached= 21
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
