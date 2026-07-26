# Auto-converted from GameMaker: obj_sosorry
# GM parent: obj_monsterparent
extends Node2D

func _ready():
	scr_monstersetup()
	dmg= GS.monsteratk[myself]
	image_speed= 0
	part1= 457
	mypart1= _spawn("part1", x + 100, y + 40)
	part1.dmg= dmg
	$Alarm9.start((8) / 30.0)
	hurtanim= 0
	hurtsound= 96
	talked= 0
	whatiheard= -1
	attacked= 0
	killed= 0
	GS.heard= 0
	takedamage= 0
	mercymod= -9999
	sha= 0
	shb= 0
	ht= 100
	wd= 200
	myplot= 0
	hitplot= 0
	prevhp= GS.monsterhp[myself]
	goodot= 0
	d_con= 0
	p_con= 0
	p_mode= 0
	n_con= 0

func _gm_event_1_0():
	if(killed == 0) {
	    GS.flag[281]= 2
	    GS.goldreward[3]+= 100
	    x+= 19
	    y-= 24
	} else  GS.flag[281]= 1
	scr_monsterdefeat(0, 0, 0, 0, 0)
	with(mypart1) instance_destroy()

func _gm_event_2_10():
	d_con++

func _gm_event_2_9():
	mypart1.parent= GS.monsterinstance[myself]

func _gm_event_2_8():
	snd_play(hurtsound)

func _gm_event_2_6():
	goodot= 0
	GS.msc= 0
	if(prevhp == GS.monsterhp[myself]) {
	    goodot= 1
	    if(p_mode == 0) myplot++
	} else  {
	    goodot= 0
	    hitplot++
	}
	prevhp= GS.monsterhp[myself]
	gg= floor(random(3))
	mycommand= round(random(100))
	GS.msg[0]= "AHHHHHHH!!!!!/%%"
	if(myplot == 5 and p_mode == 1 and goodot == 1) {
	    GS.flag[20]= 1
	    GS.msg[0]= "\\E1AHHHHH!!!/%%"
	}
	if(hitplot == 1) {
	    GS.msg[0]= "\\E1Oh!&Whoops!&That hurt!/"
	    GS.msg[1]= "\\E2So sorry^1, I must&have gotten in the&way!/"
	    GS.msg[2]= "\\E1I really shouldn\'t&stand so close/"
	    GS.msg[3]= "\\E4Ah I\'m just being&troublesome/%%"
	}
	if(hitplot == 2) {
	    GS.msg[0]= "\\E4Darn it, I keep&getting in the way/"
	    GS.msg[1]= "\\E2So sorry, I\'m such&an oaf/"
	    GS.msg[2]= "\\E2Wandering in front&of you.../%%"
	}
	if(hitplot == 3) {
	    GS.msg[0]= "\\E1.../"
	    GS.msg[1]= "Are you...&trying to KILL me?/"
	    GS.msg[2]= "\\E4... so sorry, but&I\'ve had a really&tough year./"
	    GS.msg[3]= "I don\'t know if I&could take you&killing me on top&of everything./"
	    GS.msg[4]= "\\E2You should find&someone else to&kill.&So sorry./%%"
	}
	if(hitplot == 4) {
	    GS.msg[0]= "\\E1?????/"
	    GS.msg[1]= "\\E5I just said I\'m&not interested in&the offer!!/"
	    GS.msg[2]= "\\E5.../"
	    GS.msg[3]= "\\E2Sorry, I must not&have enunciated&clearly enough./"
	    GS.msg[4]= "\\E2I am not interested&in being killed.&Thank you very much./%%"
	}
	if(hitplot == 5) {
	    GS.msg[0]= "\\E5Look, stranger/"
	    GS.msg[1]= "\\E4I... I guess I\'m&going to have to&tell the truth./"
	    GS.msg[2]= "My whole life, I\'ve&never been worth a&lot of EXP./"
	    GS.msg[3]= "Everyone else at my&work, in my classes,/"
	    GS.msg[4]= "Would raise a&person\'s LV by 4&or 5 when&destroyed.../"
	    GS.msg[5]= "\\E1But me?/"
	    GS.msg[6]= "\\E6I wouldn\'t even&increase your LV&at LV 1./"
	    GS.msg[7]= "\\E4For this reason...&I...&I\'ve always been.../"
	    GS.msg[8]= "I\'ve never been&very good at&getting killed.&So.../"
	    GS.msg[9]= "\\E3I\'m flattered&that you...&Want to destroy me./"
	    GS.msg[10]= "\\E8But you are making&a big waste of&your time!!/"
	    GS.msg[11]= "\\E8Stop killing me!!!/%%"
	}
	if(hitplot == 6) {
	    GS.msg[0]= "\\E2OK, OK. Hm./"
	    GS.msg[1]= ".../"
	    GS.msg[2]= "\\E7If you stop killing&me, I\'ll pay you&200G./%%"
	}
	if(hitplot == 7) GS.msg[0]= "\\E8220G?/%%"
	if(hitplot == 8) {
	    GS.msg[0]= "\\E9.../"
	    GS.msg[1]= "\\E8300G?/%%"
	}
	if(hitplot == 9) {
	    GS.msg[0]= "\\E1W..^1.&Wait a second./"
	    GS.msg[1]= "\\E1You trying to&kill me...&C...&could it be...?/"
	    GS.msg[2]= "\\E6Because you&don\'t like me&very much...?/"
	    GS.msg[3]= "\\E2No, no, that&can\'t be!/"
	    GS.msg[4]= "This is just a&friendly, um,&killing between&acquaintances!!!/"
	    GS.msg[5]= "\\E8Pals... we\'re...&we\'re still pals,&right!!/"
	    GS.msg[6]= "\\E1OK, maybe not&PALS, but, uh,/"
	    GS.msg[7]= "\\E2Friendly strangers?/"
	    GS.msg[8]= "\\E8You know, just&one step away from&being buds!!!/"
	    GS.msg[9]= "\\E0I mean, I was&practically.../"
	    GS.msg[10]= "\\E0I was about to&crack open the&sparkling cider!/"
	    GS.msg[11]= "\\E2Pull out some&baguettes and some&swiss cheese!/"
	    GS.msg[12]= "\\E8BLOW ON A FREAKING&PARTY HORN!!!/%%"
	}
	if(hitplot == 10) {
	    GS.msg[0]= "\\E1N... no, you don\'t&like me either,&huh...?/"
	    GS.msg[1]= "\\E4Nobody likes me...&they\'re just putting&up with me/"
	    GS.msg[2]= "\\E6I\'m just annoying&you... I should just&leave/"
	    GS.msg[3]= "\\E1ARRRRRGHHHH!!!&Why am I such an&idiot??!?!!!!/"
	    GS.msg[4]= "How did I not&see it before!!!/"
	    GS.msg[5]= "\\E1You weren\'t killing&me because you&LIKED me!!!/"
	    GS.msg[6]= "\\E6NOBODY does that!/"
	    GS.msg[7]= " That\'s NOT a thing!/%%"
	}
	if(hitplot == 11) {
	    // obj_dmgwriter
	    with(189) instance_destroy()
	    GS.msg[0]= "\\E2Oh. Sorry. I was&being too loud.&Ugh./"
	    GS.msg[1]= "\\E4I\'m wasting your&time, aren\'t I...?/"
	    GS.msg[2]= "\\E9.../"
	    GS.msg[3]= "\\E1... whew, I feel&really...&strange./"
	    GS.msg[4]= "\\E2I think I need to&go home and lie&down./%%"
	    d_con= 1
	}
	if(goodot == 1) {
	    if(myplot == 1) {
	        GS.msg[0]= "\\E1Oh, I\'m so sorry!&How clumsy of me...&I\'ve bumped into you/"
	        GS.msg[1]= "\\E6I\'m such a klutz./"
	        GS.msg[2]= "I was just here to&find something to&draw, and.../"
	        GS.msg[3]= "\\E2Oh no, it\'s ok!&It\'s OK!/"
	        GS.msg[4]= "\\E0I\'ll give you a&gift to make up&for your troubles./"
	        GS.msg[5]= "\\E0Let me look in&my vest!/%%"
	    }
	    if(myplot == 2) {
	        GS.msg[0]= "\\E6Ummm, I couldn\'t&find anything I&want to give away./"
	        GS.msg[1]= "\\E2Wait, wait!/"
	        GS.msg[2]= "\\M4I\'ve got my notebook!/"
	        GS.msg[3]= "\\E0I can draw you a&picture in it!/"
	        GS.msg[4]= "\\E7I\'m quite the artist,&you know./"
	        GS.msg[5]= "\\E8I\'ll draw you a&GREAT picture!!!/%%"
	    }
	    if(myplot == 3) {
	        GS.flag[20]= 0
	        GS.msg[0]= "\\E6S.. sorry...&The drawing didn\'t&come out very well./"
	        GS.msg[1]= "\\E2Wait^1!&I know the problem!/"
	        GS.msg[2]= "\\M0I just have to&find a better piece&of paper for it!/%%"
	    }
	    if(myplot == 4) {
	        GS.msg[0]= "\\E6None of my papers&are good enough to&use.../"
	        GS.msg[1]= "\\E2IT\'S OK!!!/"
	        GS.msg[2]= "\\E8I know what I&can do!^1!&I\'ll use my magic&pencil!/"
	        GS.msg[3]= "\\E0It has to be under&some of these papers&somewhere!!!!/%%"
	    }
	    if(myplot == 5 and p_mode == 1) {
	        GS.flag[20]= 1
	        GS.msg[0]= "\\E1AHHHHH!!!/%%"
	    }
	    if(myplot == 5 and p_mode == 0) {
	        GS.msg[0]= "\\M5H\\E8ere!&I got it!/"
	        GS.msg[1]= "My magic pencil is&amazing!/"
	        GS.msg[2]= "\\E2Everything I draw&with it looks.../"
	        GS.msg[3]= "\\E8COMPLETELY REAL!/%%"
	        p_con= 1
	        p_mode= 1
	    }
	    if(myplot == 6) {
	        GS.flag[20]= 1
	        GS.msg[0]= "\\E1I\'ve messed up.&I\'ve really messed up.&Oh no./"
	        GS.msg[1]= "\\E2I\'ll just use a&regular pencil!&I\'ll try my best!/%%"
	    }
	    if(myplot == 7) {
	        mercymod= 222
	        GS.flag[20]= 3
	        GS.msg[0]= "\\E8Are you ready!?/"
	        GS.msg[1]= "\\E0I just finished./"
	        GS.msg[2]= "\\M6Here\'s your picture!&What do you think!?/"
	        GS.msg[3]= "\\E2It\'s a representation&of your deepest&essence.../"
	        GS.msg[4]= "\\E7It\'s great^1, right!?/"
	        GS.msg[5]= ".../"
	        GS.msg[6]= "\\E8(They think my art&is terrible.)/"
	        GS.msg[7]= "\\M0Well!/"
	        GS.msg[8]= "\\E2I\'ll leave you with&that thought!/"
	        GS.msg[9]= "\\E7Goodbye!/"
	        GS.msg[10]= "\\E8See you later!/"
	        GS.msg[11]= "\\E2Sayonara!/"
	        GS.msg[12]= "\\E1Nice knowing ya!/"
	        GS.msg[13]= "\\E7Hasta la vista./"
	        GS.msg[14]= "\\E9.../"
	        GS.msg[15]= "\\E2I should leave./%%"
	        n_con= 1
	    }
	}
	GS.typer= 111
	scr_blcon_x(x + 190, y + 20)
	blcon.z_index= -1500
	writer.z_index= -1600
	GS.border= 17
	if(p_mode == 0 and (myplot == 0 or myplot == 1 or myplot == 2 or myplot >= 5))
	    GS.border= 52
	obj_heart.x= round((GS.idealborder[0] + GS.idealborder[1]) / 2) - 8
	obj_heart.y= round((GS.idealborder[2] + GS.idealborder[3]) / 2) - 8
	talked= 2

func _gm_event_2_4():
	p_con++

func _gm_event_2_3():
	if(mypart1.pause != 1) {
	    dmgwriter= instance_create(x, y - 24, 189/* obj_dmgwriter */)
	    if(takedamage > 0) takedamage= 100
	    GS.damage= takedamage
	    with(dmgwriter) dmg= GS.damage
	    mypart1.pause= 1
	    osh= instance_create(0, 0, 1669/* obj_objshake */)
	    osh.obj= mypart1
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
	    if(talked == 2 and instance_exists(782/* OBJ_WRITER */))
	        scr_textskip()
	    if(talked == 2 and not instance_exists(782/* OBJ_WRITER */)) {
	        event_user(2)
	        talked= 3
	    }
	    if(talked == 0) {
	        $Alarm6.start((1) / 30.0)
	        talked= 1
	        GS.heard= 0
	    }
	}
	if(GS.hurtanim[myself] == 1) {
	    shudder= 8
	    $Alarm3.start((GS.damagetimer) / 30.0)
	    GS.hurtanim[myself]= 3
	}
	if(GS.hurtanim[myself] == 2) {
	    GS.monsterhp[myself]-= takedamage
	    if(hitplot >= 10) GS.monsterhp[myself]= 0
	    with(dmgwriter) $Alarm2.start((15) / 30.0)
	    if(GS.monsterhp[myself] >= 1) {
	        GS.hurtanim[myself]= 0
	        mypart1.pause= 0
	        GS.myfight= 0
	        GS.mnfight= 1
	    } else  {
	        GS.myfight= 0
	        GS.mnfight= 1
	    }
	}
	if(GS.hurtanim[myself] == 5) {
	    GS.damage= 0
	    instance_create(x + sprite_width / 2 - 10, y - 24, 189/* obj_dmgwriter */)
	    // obj_dmgwriter
	    with(189) $Alarm2.start((30) / 30.0)
	    GS.myfight= 0
	    GS.mnfight= 1
	    GS.hurtanim[myself]= 0
	}
	if(GS.mnfight == 2) {
	    if(attacked == 0) {
	        if(talked == 3) talked= 0
	        pop= scr_monstersum()
	        GS.turntimer= 180
	        GS.firingrate= 10
	        if(p_mode == 0) {
	            if(myplot == 0 or myplot == 1) {
	                with(mypart1) {
	                    GS.turntimer= 170
	                    back= 1
	                    tailtype= 1
	                    armtype= 0
	                    tail_t= 0
	                    tailsiner= 8
	                }
	            }
	            if(myplot == 2) {
	                with(mypart1) {
	                    back= 1
	                    tailtype= 1
	                    armtype= 0
	                    tail_t= 0.3
	                    tailsiner= 8
	                }
	            }
	            if(myplot == 3) {
	                with(mypart1) {
	                    GS.turntimer= 240
	                    intense= 0
	                    back= 1
	                    tailtype= 0
	                    armtype= 1
	                    tail_t= 0
	                    tailsiner= 0
	                    diff= 3
	                }
	            }
	            if(myplot == 4) {
	                with(mypart1) {
	                    GS.turntimer= 240
	                    intense= 1
	                    back= 1
	                    tailtype= 0
	                    armtype= 1
	                    tail_t= 0
	                    tailsiner= 0
	                    diff= 3
	                }
	            }
	            if(myplot >= 5) {
	                with(mypart1) {
	                    GS.turntimer= 270
	                    intense= 0
	                    back= 1
	                    tailtype= 1
	                    armtype= 1
	                    tail_t= -0.2
	                    tailsiner= 8
	                    diff= 3
	                }
	            }
	        }
	        if(mycommand >= 0) GS.msg[0]= "* The enemy looks nervous."
	        if(mycommand >= 20) GS.msg[0]= "* The enemy looks anxious."
	        if(mycommand >= 40)
	            GS.msg[0]= "* The enemy taps his fingers&  together like jackhammers."
	        if(mycommand >= 60) GS.msg[0]= "* The enemy looks perturbed."
	        if(mycommand >= 72)
	            GS.msg[0]= "* The enemy tries to copy your&  movements so it fits in."
	        if(mycommand >= 86)
	            GS.msg[0]= "* The enemy uses a hypnotizing&  3D-tush-wiggle attack."
	        if(mycommand >= 96) GS.msg[0]= "* Smells... furry."
	        if(mercymod > 100) GS.msg[0]= "* Are we good here!?."
	        if(GS.monsterhp[myself] <= GS.monstermaxhp[myself] / 4)
	            GS.msg[0]= "* The enemy is apologizing to&  its visions of the Reaper."
	        attacked= 1
	    }
	    if(mercymod == 999999) {
	        GS.turntimer= -1
	        GS.mnfight= 3
	    }
	    whatiheard= -1
	}
	if(GS.myfight == 2 and whatiheard != -1 and GS.heard == 0) {
	    if(whatiheard == 0) {
	        GS.msc= 0
	        GS.msg[0]= "* SO SORRY&* This creature is definitely&  in the wrong time and space!/^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	        whatiheard= 9
	    }
	    if(whatiheard == 3) {
	        GS.msc= 0
	        ch= 0
	        ch= choose(0, 1, 2, 3, 4)
	        if(ch == 0)
	            GS.msg[0]= "* You wave^1.&* They\'re a bit preoccupied./^"
	        if(ch == 1)
	            GS.msg[0]= "* You say hello^1.&* They\'re a bit preoccupied./^"
	        if(ch == 2)
	            GS.msg[0]= "* You smile^1.&* They\'re a bit preoccupied./^"
	        if(ch == 3)
	            GS.msg[0]= "* You cough^1.&* They\'re a bit preoccupied./^"
	        if(ch == 4)
	            GS.msg[0]= "* You weep^1.&* They\'re a bit preoccupied./^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    if(whatiheard == 1) {
	        GS.msc= 0
	        GS.msg[0]= "* You execute some action./^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    if(whatiheard == 4) {
	        GS.msc= 0
	        GS.msg[0]= "* You execute some action./^"
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
	if(n_con == 1 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.border= 0
	    GS.typer= 1
	    obj_heart.x= -200
	    obj_heart.y= 900
	    obj_heart.visible= 0
	    GS.myfight= -5
	    GS.mnfight= 0
	}
	if(mercymod == 222 and not instance_exists(782/* OBJ_WRITER */))
	    instance_destroy()
	if(GS.turntimer <= 0 and GS.mnfight == 2) {
	    GS.mnfight= 3
	    with(mypart1) back= 0
	}
	if(d_con == 1 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.faceemotion= 4
	    GS.flag[20]= 0
	    with(mypart1) pause= 1
	    with(mypart1) intense= 0
	    with(mypart1) velocity.x= -2
	    velocity.x= -1
	    d_con= 2
	    $Alarm10.start((80) / 30.0)
	    // obj_doodlebug
	    with(454) instance_destroy()
	}
	if(d_con == 2) {
	    // obj_doodlebug_body
	    with(453) modulate.a-= 0.02
	}
	if(d_con == 3) {
	    velocity.x= 0
	    with(mypart1) velocity.x= 0
	    $Alarm10.start((30) / 30.0)
	    d_con= 4
	}
	if(d_con == 5) {
	    audio_stop_sound(GS.batmusic)
	    GS.msc= 0
	    GS.typer= 33
	    GS.msg[0]= "\\E0Oh^1, and.../"
	    GS.msg[1]= "\\E1About all this./"
	    GS.msg[2]= "\\E4Um./"
	    GS.msg[3]= "\\E2Sorry./%%"
	    scr_blcon_x(x + 170, y + 20)
	    blcon.z_index= -1500
	    writer.z_index= -1600
	    d_con= 6
	}
	if(d_con == 6 and not instance_exists(782/* OBJ_WRITER */)) {
	    visible= 0
	    sprite_index= 576/* spr_sorry_d */
	    killed= 1
	    x+= 19
	    x-= 70
	    y-= 24
	    GS.border= 0
	    GS.typer= 1
	    obj_heart.x= -200
	    obj_heart.y= 900
	    obj_heart.visible= 0
	    GS.myfight= -5
	    GS.mnfight= 0
	    instance_destroy()
	}
	if(p_con == 2) {
	    GS.monstertype[1]= 81
	    GS.monstertype[2]= 81
	    GS.monsterinstance[1]= instance_create(26, 88, 454/* obj_doodlebug */)
	    GS.monsterinstance[2]= instance_create(526, 88, 454/* obj_doodlebug */)
	    with(GS.monsterinstance[2]) specialmessage= 1
	    p_con= 3
	    $Alarm4.start((50) / 30.0)
	}
	if(p_con == 1 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.faceemotion= 1
	    snd_play(30/* snd_break2 */)
	    fl= instance_create(0, 0, 118/* obj_flasher */)
	    fl.z_index= -2000
	    p_con= 2
	    GS.mnfight= -6
	}
	if(p_con == 4) {
	    GS.msg[0]= "\\E1Uuuuhhhh, oh no!!&That\'s a little too&real!/%%"
	    GS.typer= 111
	    scr_blcon_x(x + 170, y + 20)
	    blcon.z_index= -1500
	    writer.z_index= -1600
	    p_con= 5
	}
	if(p_con == 5 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.flag[20]= 0
	    p_con= 0
	    GS.mnfight= 2
	}

func _gm_event_7_12():
	talked= 2
	if(p_con == 0) GS.mnfight= 2

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
