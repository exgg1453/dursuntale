# Auto-converted from GameMaker: obj_undyneboss
# GM parent: obj_monsterparent
extends Node2D

func _ready():
	scr_monstersetup(0, 0, 0, 0, 0)
	image_speed= 0
	part1= 273
	mypart1= _spawn("part1", x, y)
	hurtanim= 0
	hurtsound= 43
	talked= 0
	whatiheard= -1
	attacked= 0
	killed= 0
	GS.heard= 0
	takedamage= 0
	image_speed= 0
	mercymod= -9999999999
	joketold= 0
	sha= 0
	siner= 0
	// obj_battlebg
	with(185) instance_destroy()
	instance_create(0, 0, 267/* obj_boxsiner */)
	green= 0
	darkify= 0
	con= 0
	greenlock= 0
	songplayed= 0
	revert= 0
	lesson= 1
	order= 1
	rating= 16
	prevhp= GS.hp
	hitno= 0
	damagecause= 0
	borderspec= 0
	ratingb= 0
	defadjust= 0
	died= 0
	blconx= x + 180
	blcony= y + 10
	shakify= 0
	uncancel= 0
	hitfirst= 0
	berserk= 0
	mercied= 0
	GS.flag[99]++
	if(GS.flag[99] == 1) {
	    GS.flag[351]= 1500
	    if(GS.flag[98] == 2) GS.flag[351]= 1400
	}
	if(GS.flag[99] == 2) GS.faceemotion= 1
	if(GS.flag[99] == 3) GS.faceemotion= 4
	if(GS.flag[99] > 3) GS.faceemotion= 5
	GS.monsterhp[myself]= GS.flag[351]
	ht= 200
	wd= 250

func _gm_event_1_0():
	scr_monsterdefeat(0, 0, 0, 0, 0)
	with(mypart1) instance_destroy()

func _gm_event_2_11():
	GS.mnfight= 4

func _gm_event_2_10():
	if(obj_heart.sprite_index == 34) {
	    obj_heart.sprite_index= 39/* spr_heartgreen */
	    obj_heart.movement= 3
	    green= 0
	    if(order == 9 or order == 15 or order == 24)
	        $Alarm11.start((15) / 30.0)
	} else  {
	    green= 0
	    obj_heart.sprite_index= 34/* spr_heart */
	    obj_heart.movement= 1
	}
	if(lesson == 7 or lesson == 12 or lesson == 21) {
	    GS.turntimer= 60
	    xbullet= instance_create(-10, obj_heart.y, 679/* blt_parent_noborder */)
	    xbullet.dmg= 6
	    if(lesson == 7) xbullet.velocity.x= 11
	    if(lesson == 12) xbullet.velocity.x= 13
	    if(lesson == 21) xbullet.velocity.x= 14
	    xbullet.sprite_index= 1448/* spr_undynespear_r */
	}

func _gm_event_2_9():
	caster_free(-3)
	room_goto(GS.currentroom)

func _gm_event_2_7():
	GS.mnfight= 3

func _gm_event_2_6():
	if(obj_heart.sprite_index == 39 and died == 0) {
	    if(GS.monsterhp[myself] < GS.monstermaxhp[myself] * 0.75 and lesson < 5) {
	        lesson= 6
	        order= 6
	        damagecause= 1
	    }
	    if(GS.monsterhp[myself] < GS.monstermaxhp[myself] * 0.5 and lesson < 11) {
	        lesson= 11
	        order= 12
	        damagecause= 2
	    }
	    if(GS.monsterhp[myself] < GS.monstermaxhp[myself] * 0.2 and lesson < 20) {
	        lesson= 20
	        order= 22
	        damagecause= 3
	        rating+= 2
	    }
	}
	if(order == 12 and GS.flag[99] < 2) GS.flag[99]= 2
	if(order == 22 and GS.flag[99] < 3) GS.flag[99]= 3
	if(lesson > 19 and obj_heart.sprite_index == 34 and defadjust == 0) {
	    GS.monsterdef[myself]= -15
	    if(GS.monsterhp[myself] > GS.monstermaxhp[myself] * 0.3)
	        GS.monsterdef[myself]= -25
	    if(GS.monsterhp[myself] > GS.monstermaxhp[myself] * 0.4)
	        GS.monsterdef[myself]= -35
	    if(GS.monsterhp[myself] > GS.monstermaxhp[myself] * 0.5)
	        GS.monsterdef[myself]= -50
	    if(GS.monsterhp[myself] > GS.monstermaxhp[myself] * 0.75)
	        GS.monsterdef[myself]= -70
	    if(GS.monsterhp[myself] == GS.monstermaxhp[myself])
	        GS.monsterdef[myself]= -90
	    defadjust= 1
	}
	blcontype= 0
	uncancel= 0
	gg= floor(random(3))
	mycommand= round(random(100))
	GS.msg[0]= "Ngahhh!"
	if(mycommand < 20) GS.msg[0]= "Bring&it on!"
	if(mycommand < 40) GS.msg[0]= "C\'mon!"
	if(mycommand < 60) GS.msg[0]= "Fuhuhu!"
	if(mycommand < 80) GS.msg[0]= "Ngahh!!"
	if(mycommand < 100) GS.msg[0]= "Urahhh!!"
	if(damagecause > 0) {
	    if(damagecause == 1)
	        GS.msg[0]= "\\E1  You\'re strong...&  But not strong&  enough!"
	    if(damagecause == 2)
	        GS.msg[0]= "\\E4  You\'re a pain in&  the neck, huh?"
	    if(damagecause == 3)
	        GS.msg[0]= "\\E5  DIE ALREADY, YOU&  LITTLE BRAT!"
	    blcontype= 1
	}
	GS.msg[1]= "%%%"
	GS.typer= 39
	if(order > 0) {
	    if(order == 1) {
	        uncancel= 1
	        blcontype= 1
	        GS.msg[0]= "  \\XAs long as you\'re&  \\GGREEN\\X you \\RCAN\'T&  ESCAPE\\X!/"
	        GS.msg[1]= "  \\XUnless you learn&  to \\Rface danger&  head-on\\X.../"
	        GS.msg[2]= "  You won\'t last&  a SECOND against&  ME!/%%"
	    }
	    if(order == 2) {
	        uncancel= 1
	        blcontype= 1
	        if(mercied > 0)
	            GS.msg[0]= "  You^1?&  Sparing ME^1?&  Fuhuhuhu!/"
	        GS.msg[1]= "  How insulting^1!&  I\'d NEVER&  surrender to the&  likes of you!/%%"
	        GS.msg[0]= "  Not bad^1!&  Then how about&  THIS!?/%%"
	        if(hitno > 0 and hitfirst == 3) {
	            GS.msg[0]= "\\E0  I wanted this to&  be a fair fight./"
	            GS.msg[1]= "\\E1  I thought if I&  beat you like&  this.../"
	            GS.msg[2]= "  It\'d truly show&  how strong&  monsters can be./"
	            GS.msg[3]= "\\E4  BUT NOW???/"
	            GS.msg[4]= "\\E5  I DON\'T CARE!/"
	            GS.msg[5]= "  I\'M NOT YOUR&  FREAKING&  KINDERGARTEN&  TEACHER!/"
	            GS.msg[6]= "\\E1  Unless your&  kindergarten&  teacher.../"
	            GS.msg[7]= "\\E5  DOES THIS!/%%"
	            rating= 6
	            berserk= 1
	            order= 12
	            lesson= 11
	            hitfirst++
	        }
	        if(hitno > 0 and hitfirst == 2) {
	            GS.msg[0]= "\\E5  WHAT ARE YOU&  DOING?/"
	            GS.msg[1]= "  JUST FACE&  UPWARDS!!!/"
	            GS.msg[2]= "  IT\'S NOT HARD!/"
	            GS.msg[3]= "\\E0 %%"
	            order= 1
	            lesson= 1
	            hitfirst++
	        }
	        if(hitno > 0 and hitfirst == 1) {
	            GS.msg[0]= "\\E4  Look./"
	            GS.msg[1]= "\\E4  I gave you a&  spear to block&  the bullets with./"
	            GS.msg[2]= "\\E4  Do I have to&  explain this&  any more&  clearly?/"
	            GS.msg[3]= "\\E0 %%"
	            order= 1
	            lesson= 1
	            hitfirst++
	        }
	        if(hitno > 0 and hitfirst == 0) {
	            GS.msg[0]= "\\E1  \\XWhen I said&  \\Rface towards&  danger\\X.../"
	            GS.msg[1]= "\\E4  I meant face&  towards the&  bullets!/"
	            GS.msg[2]= "\\E0 %%"
	            order= 1
	            lesson= 1
	            hitfirst++
	        }
	    }
	    if(order == 3) {
	        blcontype= 1
	        GS.msg[0]= "  For years,&  we\'ve dreamed&  of a happy&  ending..."
	    }
	    if(order == 4) {
	        blcontype= 1
	        GS.msg[0]= "  And now,&  sunlight is&  just within&  our reach!"
	    }
	    if(order == 5) {
	        blcontype= 1
	        GS.msg[0]= "  I won\'t let&  you snatch it&  away from&  us!"
	    }
	    if(order == 6) {
	        GS.msg[0]= "\\E1  NGAHHH!&  Enough warming&  up!/%%"
	        blcontype= 1
	        uncancel= 1
	    }
	    if(order == 7) {
	        blcontype= 1
	        GS.msg[0]= "  Heh...&  You\'re tough!"
	        if(mercied > 0) {
	            uncancel= 1
	            GS.msg[0]= "  Mercy^1!&  Ha!/"
	            GS.msg[1]= "  I still can\'t&  believe YOU&  want to spare&  ME!/%%"
	        }
	    }
	    if(order == 8) {
	        blcontype= 1
	        GS.msg[0]= "  But even if&  you could&  beat me..."
	        if(mercied > 0) GS.msg[0]= "  But even if&  I spared&  YOU..."
	    }
	    if(order == 9) {
	        blcontype= 1
	        GS.msg[0]= "\\X  No human has&  EVER made it&  past&  \\RASGORE\\X!"
	    }
	    if(order == 10) {
	        blcontype= 1
	        GS.msg[0]= "  Honestly^1,&  killing you&  now is an act&  of mercy...!"
	    }
	    if(order == 11) {
	        blcontype= 1
	        GS.msg[0]= "  ..."
	    }
	    if(GS.flag[99] > 1) {
	        if(order == 9) {
	            blcontype= 1
	            GS.msg[0]= "  Honestly, I\'m&  doing you&  a favor..."
	        }
	        if(order == 10) {
	            blcontype= 1
	            GS.msg[0]= "\\X  No human has&  EVER made it&  past&  \\RASGORE\\X!"
	        }
	        if(order == 11) {
	            blcontype= 1
	            GS.msg[0]= "\\E1  Killing you&  now is an act&  of mercy!"
	        }
	    }
	    if(order == 12 and hitfirst < 3) {
	        GS.msg[0]= "\\E4  So STOP being&  so damn&  resilient!/%%"
	        blcontype= 1
	        uncancel= 1
	    }
	    if(order == 13) {
	        blcontype= 1
	        GS.msg[0]= "  What the&  hell are&  humans made&  out of!?"
	    }
	    if(order == 14) {
	        blcontype= 1
	        GS.msg[0]= "  Anyone else&  would be DEAD&  by now!"
	    }
	    if(order == 15) {
	        blcontype= 1
	        GS.msg[0]= "  Alphys told me&  humans were&  determined..."
	    }
	    if(order == 16) {
	        blcontype= 1
	        GS.msg[0]= "  I see now what&  she meant by&  that!"
	    }
	    if(order == 17) {
	        blcontype= 1
	        GS.msg[0]= "  But I\'m&  determined,&  too!"
	    }
	    if(order == 18) {
	        blcontype= 1
	        GS.msg[0]= "  Determined to&  end this&  RIGHT NOW!"
	    }
	    if(order == 19) {
	        blcontype= 1
	        GS.msg[0]= "  ... RIGHT NOW!"
	    }
	    if(order == 20) {
	        blcontype= 1
	        GS.msg[0]= "  ... RIGHT...&  ...&  ... NOW!!"
	    }
	    if(order == 21) {
	        blcontype= 1
	        GS.msg[0]= "  Ha...&  Ha..."
	    }
	    if(order == 22) {
	        GS.msg[0]= "\\E5  NGAHHH!!!&  DIE ALREADY, YOU&  LITTLE BRAT!/%%"
	        blcontype= 1
	        uncancel= 1
	    }
	    if(order == 23) {
	        blcontype= 1
	        GS.msg[0]= "  YOU\'RE GETTING&  IN MY WAY!"
	        if(mercied > 0)
	            GS.msg[0]= "  I WILL NEVER&  TAKE MERCY FROM&  THE LIKES OF YOU!"
	    }
	    if(order == 24) {
	        blcontype= 1
	        GS.msg[0]= "  I WILL NOT&  BE DEFEATED!"
	        if(mercied > 0) GS.msg[0]= "  YOU! WILL!&  NEVER! SPARE! ME!"
	    }
	    if(order > 24) {
	        blcontype= 1
	        GS.msg[0]= "  ..."
	    }
	}
	if(order < 0) {
	    if(order == -40)
	        GS.msg[0]= "  Come on^1, is that&  all you\'ve got!?/%%"
	    if(order == -39) {
	        GS.msg[0]= "  ... pathetic./"
	        GS.msg[1]= "  You\'re going to&  have to try&  harder than that!/%%"
	    }
	    if(order == -38)
	        GS.msg[0]= "  S-see how strong&  we are when we&  believe in&  ourselves?/%%"
	    if(order == -37) {
	        GS.msg[0]= "  H... heh.../"
	        GS.msg[1]= "  Had enough yet?/%%"
	    }
	    if(order == -36) {
	        GS.msg[0]= "\\E7  .../"
	        GS.msg[1]= "  ... I won\'t..^1.&  ... give up.../%%"
	    }
	    if(order == -35) GS.msg[0]= "\\E7.../%%"
	    blcontype= 1
	    uncancel= 1
	}
	if(blcontype == 0)
	    blcon= instance_create(x + 245, y + 52, 186/* obj_blconsm */)
	if(blcontype == 1)
	    blcon= instance_create(blconx, blcony, 187/* obj_blconwdflowey */)
	blconwd= instance_create(blcon.x + 15, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	if(mycommand > 50 and obj_heart.sprite_index != 39)
	    borderspec= 1
	else  borderspec= 0
	GS.border= 6
	obj_heart.x= round((GS.idealborder[0] + GS.idealborder[1]) / 2) - 8
	obj_heart.y= round((GS.idealborder[2] + GS.idealborder[3]) / 2) - 8
	if(obj_heart.sprite_index == 39) {
	    GS.border= 13
	    obj_heart.x= get_viewport_rect().size.x / 2 - 8
	    obj_heart.y= obj_uborder.y + 34
	    greenlock= 1
	} else  {
	    if(borderspec == 1) {
	        obj_heart.x= get_viewport_rect().size.x / 2 - 8
	        obj_heart.y= obj_uborder.y + 34
	        GS.border= 14
	    }
	}
	damagecause= 0

func _gm_event_2_5():
	with(blconwd) instance_destroy()
	with(blcon) instance_destroy()
	talked= 0
	whatiheard= -1
	GS.mnfight= 2
	if(borderspec == 0) GS.border= 7
	if(obj_heart.sprite_index == 39) {
	    GS.border= 12
	    event_user(2)
	}

func _gm_event_2_4():
	con++

func _gm_event_2_3():
	if(frame != 1 and frame != 2) {
	    with(mypart1) instance_destroy()
	    dmgwriter= instance_create(x, y + 80, 189/* obj_dmgwriter */)
	    dmgwriter.negative= 1
	    GS.damage= takedamage
	    with(dmgwriter) dmg= GS.damage
	    if(GS.monsterhp[myself] - takedamage < 1 and died == 0)
	        tempdie= 1
	    if(tempdie == 1) {
	        shudder= 16
	        caster_free(GS.batmusic)
	    }
	    frame= 1
	    if(died == 1) frame= 2
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
	    if(tempdie == 1) $Alarm3.start((4) / 30.0)
	    exit
	}

func _process(delta: float):
	if(GS.mnfight == 4 and attacked == 1) {
	    if(hitno > 0) {
	        if(hitno == 1) rating++
	        if(hitno > 1) rating+= 2
	        if(berserk == 1) rating--
	    } else  {
	        if(rating >= 10 and lesson > 5) rating-= 2
	        else  {
	            if(rating > 8) rating--
	        }
	        if(berserk == 1 and rating > 6) rating--
	    }
	    attacked= 0
	    GS.mnfight= 5
	    if(GS.border == 12) GS.border= 13
	    SCR_BORDERSETUP()
	    $Alarm7.start((10) / 30.0)
	    if(instance_exists(262/* obj_undynesiner2 */)) {
	        // obj_undynesiner2
	        with(262) event_user(1)
	    }
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
	    $Alarm5.start((110) / 30.0)
	    $Alarm6.start((1) / 30.0)
	    talked= 1
	    GS.heard= 0
	    if(order == -35) {
	        GS.mnfight= 99
	        GS.bmenuno= 4
	        obj_heart.x= -400
	        $Alarm5.start((-2) / 30.0)
	        $Alarm6.start((-2) / 30.0)
	        con= 60
	    }
	}
	if(keyboard_multicheck_pressed(13/* ENTER */) and uncancel == 0 and alarm[5] > 5 and obj_lborder.x == GS.idealborder[0] and alarm[6] < 0)
	    $Alarm5.start((2) / 30.0)
	if(uncancel == 1) {
	    $Alarm5.start((100) / 30.0)
	    if(not instance_exists(782/* OBJ_WRITER */)) {
	        $Alarm5.start((1) / 30.0)
	        uncancel= 0
	    }
	}
	if(GS.hurtanim[myself] == 1) {
	    tempdie= 0
	    shudder= 8
	    if(GS.monsterhp[myself] < 1 and died == 0) shudder= 16
	    $Alarm3.start((GS.damagetimer) / 30.0)
	    GS.hurtanim[myself]= 3
	}
	if(GS.hurtanim[myself] == 2) {
	    GS.monsterhp[myself]-= takedamage
	    with(dmgwriter) $Alarm2.start((15) / 30.0)
	    if(GS.monsterhp[myself] >= 1) {
	        mypart1= _spawn("part1", x, y)
	        GS.hurtanim[myself]= 0
	        frame= 0
	        GS.myfight= 0
	        GS.mnfight= 1
	    } else  {
	        GS.myfight= 0
	        GS.mnfight= 1
	        if(died == 0) {
	            caster_stop(GS.batmusic)
	            deadmusic1= caster_load("music/endingexcerpt1.ogg")
	            deadmusic2= caster_load("music/endingexcerpt2.ogg")
	            con= 50
	            obj_heart.sprite_index= 34/* spr_heart */
	            // obj_boxsiner
	            with(267) fade= 1
	            order= -40
	            lesson= -40
	            died= 1
	            GS.mnfight= 99
	        }
	        mypart1= _spawn("part1", x, y)
	        GS.hurtanim[myself]= 0
	        frame= 0
	    }
	}
	if(greenlock == 1 and GS.mnfight > 0) {
	    if(obj_heart.sprite_index == 39) obj_heart.y= obj_uborder.y + 34
	    else  greenlock= 0
	} else  greenlock= 0
	if(darkify == 1) {
	    if(pseudodarker.modulate.a < 0.5)
	        pseudodarker.modulate.a+= 0.04
	    else  darkify= 2
	    obj_borderparent.modulate.a= 1 - pseudodarker.modulate.a
	}
	if(darkify == 3) {
	    if(pseudodarker.modulate.a > 0)
	        pseudodarker.modulate.a-= 0.04
	    obj_borderparent.modulate.a= 1 - pseudodarker.modulate.a
	    if(pseudodarker.modulate.a <= 0) {
	        darkify= 0
	        with(pseudodarker) instance_destroy()
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
	    hitno= 0
	    xx= get_viewport_rect().size.x / 2
	    yy= get_viewport_rect().size.y / 2
	    GS.turntimer= 200
	    GS.firingrate= 15
	    if(obj_heart.sprite_index == 39) {
	        gen= instance_create(xx, yy, 263/* obj_spearblocker */)
	        gen.lesson= lesson
	        gen.rating= rating
	        gen.dmg= GS.monsteratk[myself]
	        with(gen) event_user(1)
	    } else  {
	        if(mycommand <= 50) {
	            event_user(2)
	            ratingb++
	            lesson--
	            if(ratingb > 9) ratingb= 9
	            GS.firingrate= 19 - ratingb
	            gen= instance_create(x, y, 270/* obj_spearbulletfollowgen */)
	            gen.dmg= GS.monsteratk[myself]
	        } else  {
	            borderspec= 1
	            ratingb++
	            lesson--
	            if(ratingb > 9) ratingb= 9
	            GS.firingrate= 23 - ratingb
	            gen= instance_create(x, y, 269/* obj_risespearbulletgen */)
	            gen.dmg= GS.monsteratk[myself]
	        }
	    }
	    gen.myself= myself
	    if(GS.monsterhp[myself] < GS.monstermaxhp[myself]) {
	        if(mycommand >= 0) GS.msg[0]= "* The wind is howling..."
	        if(mycommand >= 20)
	            GS.msg[0]= "* Undyne flips her spear&  impatiently."
	        if(mycommand >= 40)
	            GS.msg[0]= "* Flower pollen drifts in&  front of you."
	        if(mycommand >= 60) GS.msg[0]= "* Water rushes around you."
	        if(mycommand >= 80)
	            GS.msg[0]= "* The spears pause for a&  moment."
	    }
	    if(GS.monsterhp[myself] >= GS.monstermaxhp[myself] / 2) {
	        if(mycommand >= 0)
	            GS.msg[0]= "* Undyne points heroically&  towards the sky."
	        if(mycommand >= 10)
	            GS.msg[0]= "* Undyne flips her spear&  impatiently."
	        if(mycommand >= 20)
	            GS.msg[0]= "* Undyne suplexes a huge&  boulder^1, just because&  she can."
	        if(mycommand >= 30) GS.msg[0]= "* Undyne bounces impatiently."
	        if(mycommand >= 40)
	            GS.msg[0]= "* Undyne flashes a menacing&  smile."
	        if(mycommand >= 50)
	            GS.msg[0]= "* Undyne draws her finger&  across her neck."
	        if(mycommand >= 60)
	            GS.msg[0]= "* Undyne holds her fist in&  front of her and shakes&  her head."
	        if(mycommand >= 70) GS.msg[0]= "* Undyne towers threateningly."
	        if(mycommand >= 80)
	            GS.msg[0]= "* Undyne thinks of her friends&  and pounds the ground&  with her fists."
	        if(mycommand >= 90) GS.msg[0]= "* Smells like sushi."
	        if(order > 22) {
	            if(mycommand >= 0)
	                GS.msg[0]= "* Undyne\'s eye is twitching&  involuntarily."
	            if(mycommand >= 25)
	                GS.msg[0]= "* Undyne is smashing spears&  on the ground."
	            if(mycommand >= 50)
	                GS.msg[0]= "* Undyne\'s eyes dart around&  to see if this is&  a prank."
	            if(mycommand >= 75) GS.msg[0]= "* Undyne is hyperventilating."
	            if(mycommand >= 90) GS.msg[0]= "* Smells like angry fish."
	        }
	    }
	    if(order == -40)
	        GS.msg[0]= "* Undyne is smiling as if&  nothing is wrong."
	    if(order == -39) GS.msg[0]= "* Undyne\'s body is wavering."
	    if(order == -38)
	        GS.msg[0]= "* Undyne\'s body is losing&  its shape."
	    if(order == -37) GS.msg[0]= "* Undyne\'s body..."
	    if(order == -36) GS.msg[0]= "* ..."
	    attacked= 1
	    order++
	    lesson++
	}
	if(GS.mnfight == 3 and darkify > 0 and darkify != 3)
	    darkify= 3
	if(GS.myfight == 2 and whatiheard != -1 and GS.heard == 0) {
	    if(whatiheard == 0) {
	        GS.msc= 0
	        GS.msg[0]= "* UNDYNE - ATK 50 DEF 20&* The heroine that NEVER gives&  up./^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    if(whatiheard == 1) {
	        GS.msc= 0
	        chal_e= 0
	        if(rating == 8) {
	            rating= 7
	            chal_e= 1
	        }
	        if(rating == 9) {
	            rating= 8
	            chal_e= 1
	        }
	        if(rating == 10) {
	            rating= 9
	            chal_e= 1
	        }
	        if(rating == 11) {
	            rating= 10
	            chal_e= 1
	        }
	        if(rating == 12) {
	            rating= 10
	            chal_e= 1
	        }
	        if(rating == 13) {
	            rating= 11
	            chal_e= 1
	        }
	        if(rating == 14) {
	            rating= 11
	            chal_e= 1
	        }
	        if(rating == 15) {
	            rating= 12
	            chal_e= 1
	        }
	        if(rating == 16) {
	            rating= 12
	            chal_e= 1
	        }
	        if(chal_e == 0)
	            GS.msg[0]= "* You tell UNDYNE her attacks&  are too easy^1.&* She doesn\'t care./^"
	        if(chal_e == 1) {
	            if(ratingb < 6) ratingb++
	            GS.msg[0]= "* You tell UNDYNE her attacks&  are too easy^1.&* The bullets get faster./^"
	            if(rating == 7)
	                GS.msg[0]= "* You tell UNDYNE her attacks&  are too easy^1.&* The bullets get unfair./^"
	        }
	        if(con >= 50) GS.msg[0]= "* Didn\'t work./^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    if(whatiheard == 3) {
	        GS.msc= 0
	        GS.msg[0]= "* Hamburger Helpers./^"
	        plead_e= 0
	        if(ratingb == 7) {
	            ratingb= 6
	            plead_e= 1
	        }
	        if(ratingb == 8) {
	            ratingb= 7
	            plead_e= 1
	        }
	        if(ratingb == 9) {
	            ratingb= 7
	            plead_e= 1
	        }
	        if(rating == 9) {
	            rating= 10
	            plead_e= 1
	        }
	        if(rating == 8) {
	            rating= 10
	            plead_e= 1
	        }
	        if(rating == 7) {
	            rating= 9
	            plead_e= 1
	        }
	        if(plead_e == 0)
	            GS.msg[0]= "* You told Undyne you didn\'t&  want to fight^1.&* But nothing happened./^"
	        if(plead_e == 1) {
	            GS.msg[0]= "* You told Undyne you just&  want to be friends.&* She remembers someone.../"
	            GS.msg[1]= "* Her attacks became a little&  less extreme./^"
	        }
	        if(con >= 50) GS.msg[0]= "* Didn\'t work./^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    GS.heard= 1
	}
	siner++
	if(instance_exists(267/* obj_boxsiner */))
	    obj_boxsiner.x= obj_boxsiner.xstart + sin(siner / 24) * 40
	if(GS.myfight == 4 and GS.mercyuse == 0) {
	    mercied++
	    script_execute(163/* scr_mercystandard */)
	}
	if(obj_heart.sprite_index == 39 and GS.mnfight == 2)
	    obj_heart.movement= 3
	if(con == 0) {
	    con= 1
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 1) {
	    GS.bmenuno= 4
	    obj_heart.x= get_viewport_rect().size.x / 2 - obj_heart.sprite_width / 2
	    obj_heart.y= get_viewport_rect().size.y / 2 - obj_heart.sprite_height / 2
	    GS.myfight= 0
	    GS.mnfight= 99
	}
	if(con == 2) {
	    if(GS.flag[99] < 4) {
	        event_user(1)
	        con= 3.1
	        $Alarm4.start((30) / 30.0)
	    } else  con= 4.1
	}
	if(con == 4.1) {
	    GS.typer= 39
	    GS.msg[0]= "En guarde!/%%"
	    if(GS.flag[99] == 2) {
	        GS.msg[0]= "\\E1  You won\'t get&  away from me&  this time!/%%"
	        lesson= 8
	        order= 9
	    }
	    if(GS.flag[99] == 3) {
	        GS.msg[0]= "\\E4  You\'ve escaped&  from me for&  the LAST time!/%%"
	        lesson= 13
	        order= 15
	    }
	    if(GS.flag[99] == 4) {
	        GS.msg[0]= "\\E5  STOP RUNNING&  AWAY!!!/%%"
	        lesson= 22
	        order= 22
	    }
	    if(GS.flag[99] > 4) {
	        GS.msg[0]= "\\E5  COME BACK HERE^1,&  YOU LITTLE&  PUNK!!/%%"
	        lesson= 22
	        order= 22
	    }
	    scr_blcon_x(blconx, blcony)
	    con= 5
	}
	if(con == 5 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.msg[0]= "* Undyne attacks!"
	    caster_loop(GS.batmusic, 0.82, 1)
	    GS.myfight= 0
	    GS.mnfight= 3
	    con= 6
	}
	if(GS.mnfight == 2 and GS.turntimer < 1 and obj_heart.sprite_index == 34)
	    GS.mnfight= 4
	if(con == 50) {
	    with(mypart1) instance_destroy()
	    frame= 2
	    shakify= 1
	    myfight= 0
	    mnfight= 99
	    GS.bmenuno= 4
	    GS.border= 4
	    SCR_BORDERSETUP()
	    con= 51
	    GS.msc= 0
	    GS.typer= 40
	    GS.msg[0]= "Ngahhh.../"
	    GS.msg[1]= "You were stronger...&Than I thought.../"
	    GS.msg[2]= "So then..^1.&... this is where..^1.&... it ends.../"
	    GS.msg[3]= ".../%%"
	    scr_blcon_x(blconx, blcony)
	}
	if(con == 51) {
	    obj_heart.x= obj_uborder.y + 20
	    obj_heart.x= get_viewport_rect().size.x / 2 - 8
	}
	if(con == 51 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 50.1
	    shakify= 3
	    $Alarm4.start((60) / 30.0)
	}
	if(con == 51.1) {
	    shakify= 0
	    x= xstart
	    y= ystart
	    frame= 3
	    GS.faceemotion= 8
	    GS.typer= 40
	    GS.msg[0]= "  No.../%%"
	    scr_blcon_x(blconx, blcony)
	    con= 52
	}
	if(con == 53 and not instance_exists(782/* OBJ_WRITER */)) {
	    event_user(1)
	    con= 54
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 52 and not instance_exists(782/* OBJ_WRITER */)) {
	    shakify= 0
	    frame= 0
	    GS.typer= 41
	    mypart1= _spawn("part1", x, y)
	    with(mypart1) event_user(4)
	    caster_play(deadmusic1, 1, 1)
	    GS.msg[0]= "NO!/"
	    GS.msg[1]= "I won\'t die!/"
	    GS.msg[2]= "Alphys..^1.&Asgore..^1.&Papyrus.../"
	    GS.msg[3]= "Everyone is counting&on me to protect&them!/"
	    GS.msg[4]= "NNNNGAH!/%%"
	    scr_blcon_x(blconx, blcony)
	    con= 53
	}
	if(con == 55) {
	    GS.typer= 41
	    GS.msg[0]= "Human!/"
	    GS.msg[1]= "In the name of&everybody\'s hopes&and dreams.../"
	    GS.msg[2]= "I WILL DEFEAT YOU!/%%"
	    scr_blcon_x(blconx, blcony)
	    con= 56
	}
	if(con == 56 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.msg[0]= "* Undyne looks determined."
	    GS.myfight= 0
	    GS.mnfight= 3
	    con= 57
	}
	if(con == 60) {
	    caster_free(deadmusic1)
	    caster_free(deadmusic2)
	    GS.faceemotion= 7
	    GS.typer= 40
	    GS.msc= 0
	    GS.msg[0]= ".../"
	    GS.msg[1]= "Ha..^1. ha.../"
	    GS.msg[2]= "... Alphys.../"
	    GS.msg[3]= "This is what I&  was afraid of.../"
	    GS.msg[4]= "This is why I&  never told you.../"
	    GS.msg[5]= ".../%%"
	    scr_blcon_x(blconx, blcony)
	    con= 61
	}
	if(con == 61 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.faceemotion= 8
	    // obj_undynesiner2
	    with(262) event_user(1)
	    GS.msg[0]= "No..^1.&No!/"
	    GS.msg[1]= "Not yet!/"
	    GS.msg[2]= "I won\'t die!/%%"
	    scr_blcon_x(blconx, blcony)
	    con= 62
	}
	if(con == 62 and not instance_exists(782/* OBJ_WRITER */)) {
	    // obj_undynesiner2
	    with(262) event_user(1)
	    GS.typer= 42
	    GS.msg[0]= "NGAHHHHHHHH!!^2! %%"
	    scr_blcon_x(blconx, blcony)
	    con= 63
	}
	if(con == 63 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 64
	    GS.typer= 42
	    // obj_undynesiner2
	    with(262) event_user(1)
	    $Alarm4.start((120) / 30.0)
	    GS.msg[0]= " I WON\'T DIE^3! %%"
	    scr_blcon_x(blconx, blcony)
	}
	if(con == 65 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 66
	    GS.typer= 43
	    with(melter) frame= 1
	    $Alarm4.start((120) / 30.0)
	    GS.msg[0]= " I WON\'T DIE^3! %%"
	    scr_blcon_x(blconx, blcony)
	}
	if(con == 67 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 68
	    GS.typer= 44
	    with(melter) frame= 2
	    $Alarm4.start((120) / 30.0)
	    GS.msg[0]= " I WON\'T DIE^3! %%"
	    scr_blcon_x(blconx, blcony)
	}
	if(con == 69 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 70
	    GS.typer= 45
	    with(melter) frame= 3
	    $Alarm4.start((120) / 30.0)
	    GS.msg[0]= " I^2 WON\'T^2 %%"
	    scr_blcon_x(blconx, blcony)
	}
	if(con == 71 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.vaporspeed= 0
	    GS.monstersprite= 278
	    ddd= instance_create(melter.x, melter.y, 157/* obj_vaporized */)
	    ddd.image_speed= 0
	    ddd.frame= 1
	    GS.kills++
	    GS.xp+= 500
	    scr_levelup()
	    with(melter) instance_destroy()
	    con= 72
	    $Alarm4.start((200) / 30.0)
	}
	if(con == 73) {
	    instance_create(x, y, 149/* obj_unfader */)
	    GS.flag[350]= 1
	    GS.plot= 122
	    $Alarm9.start((10) / 30.0)
	    con= 74
	}
	GS.flag[351]= GS.monsterhp[myself]
	if(obj_heart.sprite_index == 34) GS.mercy= 0
	if(obj_heart.sprite_index == 39) GS.mercy= 1
	if(died == 1) GS.mercy= 1
	if(died == 1 and con >= 53 and con < 60 and caster_is_playing(deadmusic1) == 0 and caster_is_playing(deadmusic2) == 0)
	    caster_loop(deadmusic2, 1, 1)
	if(shakify > 0) {
	    x= xstart + random(shakify)
	    y= ystart + random(shakify)
	}
	if(GS.debug == 1 and Input.is_key_pressed(85))
	    GS.monsterhp[myself]= 2

func _gm_event_7_12():
	darkify= 1
	pseudodarker= instance_create(-20, -20, 1363/* obj_npc_marker */)
	pseudodarker.visible= 1
	pseudodarker.image_speed= 0
	pseudodarker.sprite_index= 996/* spr_pixblk */
	pseudodarker.z_index= 2
	pseudodarker.modulate.a= 0
	pseudodarker.scale.x= 600
	pseudodarker.scale.y= 600

func _gm_event_7_11():
	if(green == 0) {
	    $Alarm10.start((10) / 30.0)
	    // obj_undyneb_body
	    with(273) event_user(2)
	    green= 2
	}

func _gm_event_9_65():
	if(GS.debug == 1) {
	    lesson--
	    order--
	}

func _gm_event_9_55():
	if(GS.debug == 1) GS.hp= 999

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
