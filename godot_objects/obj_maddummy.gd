# Auto-converted from GameMaker: obj_maddummy
# GM parent: obj_monsterparent
extends Node2D

func _ready():
	scr_monstersetup(0, 0, 0, 0, 0)
	image_speed= 0
	part1= 288
	mypart1= _spawn("part1", x + 50, y + 10)
	hurtanim= 0
	hurtsound= 43
	talked= 0
	whatiheard= -1
	attacked= 0
	killed= 0
	GS.heard= 0
	takedamage= 0
	mercymod= -9999
	sha= 0
	shb= 0
	hurtsies= 0
	con= 0
	con2= 0
	talko= 0
	GS.faceemotion= 0
	next= 1
	hp= 300
	maxhp= 300
	drawhp= 0
	siner= 0
	type2= 0
	con3= 0
	blcon= 98786756545
	ht= 100
	wd= 100
	soundbuffer= 0

func _gm_event_1_0():
	if(mercymod > 10 and GS.monsterhp[myself] == GS.monstermaxhp[myself])
	    GS.goldreward[3]+= 10
	scr_monsterdefeat(0, 0, 0, 0, 0)
	with(mypart1) instance_destroy()

func _gm_event_2_11():
	room_goto(GS.currentroom)

func _gm_event_2_10():
	if(con2 == 0) {
	    next= 0
	    con2= 1
	    talko= 3
	    GS.typer= 33
	    GS.msg[0]= "\\E1OWWWW^1, you&DUMMIES!!/"
	    GS.msg[1]= "\\XWatch where you\'re&aiming your \\RMAGIC\\X &attacks!/"
	    GS.msg[2]= "\\E3.../"
	    GS.msg[3]= "\\XHey^1!&You^1! \\E2Forget&I said anything&about \\RMAGIC\\X!!!/%%"
	    blcon= instance_create(xstart + 100, ystart, 187/* obj_blconwdflowey */)
	    blconwdS= instance_create(blcon.x + 25, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	}

func _gm_event_2_9():
	drawhp= 0

func _gm_event_2_8():
	if(con == 3) con= 4
	if(con == 1) {
	    GS.typer= 33
	    GS.msg[0]= "Foolish^1.&Foolish^1!&FOOLISH!/"
	    GS.msg[1]= "Even if you attack&my vessel^1, you\'ll&NEVER hurt me!/"
	    GS.msg[2]= "I\'m still&incorporeal^1, you&DUMMY!!!/%%"
	    blcon= instance_create(xstart + 100, ystart, 187/* obj_blconwdflowey */)
	    blconwdS= instance_create(blcon.x + 25, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	    hurtsies= 0
	    con= 2
	}

func _gm_event_2_7():
	if(hurtsies == 2) {
	    if(GS.monsterhp[myself] >= 1) {
	        GS.hurtanim[myself]= 0
	        frame= 0
	        GS.myfight= 0
	        GS.mnfight= 1
	    } else  {
	        GS.myfight= 0
	        GS.mnfight= 1
	        killed= 1
	        instance_destroy()
	    }
	    hurtsies= 0
	}
	if(hurtsies == 1) {
	    snd_play(51/* snd_damage */)
	    with(mypart1) event_user(1)
	    hurtsies= 2
	    $Alarm7.start((25) / 30.0)
	    if(con == 2) {
	        $Alarm7.start((-1) / 30.0)
	        $Alarm8.start((30) / 30.0)
	    }
	}

func _gm_event_2_6():
	GS.typer= 33
	blcontype= 0
	if(con != 5) {
	    gg= floor(random(3))
	    mycommand= round(random(100))
	    if(mycommand >= 0 and mycommand < 25)
	        GS.msg[0]= "Foolish.&Foolish!&FOOLISH!"
	    if(mycommand >= 25) GS.msg[0]= "Futile.&Futile!&FUTILE!"
	    if(mycommand >= 50) GS.msg[0]= "Pitiful.&Pitiful!&PITIFUL!"
	    if(mycommand >= 75) GS.msg[0]= "Feeble.&Feeble!&FEEBLE!"
	    if(con3 > 0 and con3 < 8) {
	        if(con3 == 1)
	            GS.msg[0]= " I\'ll defeat you and& take your SOUL!"
	        if(con3 == 2)
	            GS.msg[0]= " I\'ll use your SOUL& to cross the barrier!"
	        if(con3 == 3)
	            GS.msg[0]= " I\'ll stand in the& window of a fancy& store!"
	        if(con3 == 4)
	            GS.msg[0]= "\\E3 THEN EVERYTHING I& WANT WILL BE MINE!"
	        if(con3 == 5)
	            GS.msg[0]= "\\E2 Huh?& Yeah, I guess& that\'ll avenge my& cousin."
	        if(con3 == 6) GS.msg[0]= "\\E0 What was their name& again...?"
	        if(con3 == 7) GS.msg[0]= " Whatever.& Whatever!& WHATEVER!!"
	        blcontype= 1
	    }
	    if(con2 > 13 and con2 <= 117.5) {
	        if(con2 == 14) GS.msg[0]= "DUMMY&BOTS!&MAGIC&MISSILE!"
	        if(con2 == 15) GS.msg[0]= "DUMMY&BOTS!&TRY&AGAIN!"
	        if(con2 == 16) GS.msg[0]= "DUMMY&BOTS!&You\'re&awful???"
	        if(con2 == 17.5) GS.msg[0]= "DUMMY&BOTS!&FINAL&ATTACK!"
	        blcontype= 0
	    }
	    con3++
	    if(blcontype == 0)
	        blcon= instance_create(xstart + 95, ystart - 25, 186/* obj_blconsm */)
	    if(blcontype == 1)
	        blcon= instance_create(xstart + 100, ystart, 187/* obj_blconwdflowey */)
	} else  {
	    if(con == 5) {
	        mycommand= round(random(100))
	        caster_resume(GS.batmusic)
	        GS.typer= 33
	        GS.faceemotion= 2
	        GS.msg[0]= " (Wait^1, is DUMMY& a compliment...?)"
	        blcon= instance_create(xstart + 100, ystart, 187/* obj_blconwdflowey */)
	        blcontype= 1
	        con= 6
	    }
	}
	GS.msg[1]= "%%%"
	blconwd= instance_create(blcon.x + 15, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	GS.border= 6
	obj_heart.x= round((GS.idealborder[0] + GS.idealborder[1]) / 2) - 8
	obj_heart.y= round((GS.idealborder[2] + GS.idealborder[3]) / 2) - 8

func _gm_event_2_5():
	with(blconwd) instance_destroy()
	with(blcon) instance_destroy()
	talked= 0
	whatiheard= -1
	GS.mnfight= 2
	GS.border= 7
	GS.faceemotion= 0

func _gm_event_2_4():
	con2++

func _gm_event_2_3():
	if(frame != 1) {
	    frame= 1
	    with(mypart1) {
	        event_user(0)
	        mode= 99
	    }
	}
	if(sha == 0) sha= x
	x= sha + shudder
	if(shudder < 0) shudder= -(shudder + 1)
	else  shudder= -shudder
	if(shudder == 0) {
	    sha= 0
	    snd_play(51/* snd_damage */)
	    if(con > 1) GS.hurtanim[myself]= 2
	    else  {
	        GS.hurtanim[myself]= 0
	        con= 1
	        $Alarm7.start((-1) / 30.0)
	        hurtsies= 0
	        $Alarm8.start((80) / 30.0)
	    }
	    with(mypart1) event_user(0)
	    exit
	} else  {
	    $Alarm3.start((2) / 30.0)
	    exit
	}

func _process(delta: float):
	soundbuffer++
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
	    $Alarm5.start((130) / 30.0)
	    $Alarm6.start((1) / 30.0)
	    talked= 1
	    GS.heard= 0
	}
	if(keyboard_multicheck_pressed(13/* ENTER */) and alarm[5] > 5 and obj_lborder.x == GS.idealborder[0] and alarm[6] < 0)
	    $Alarm5.start((2) / 30.0)
	if(GS.hurtanim[myself] == 1) {
	    shudder= 1
	    $Alarm3.start((GS.damagetimer) / 30.0)
	    GS.hurtanim[myself]= 3
	}
	if(GS.hurtanim[myself] == 2 and hurtsies == 0 and not instance_exists(782/* OBJ_WRITER */)) {
	    $Alarm7.start((30) / 30.0)
	    hurtsies= 1
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
	    pop= scr_monstersum()
	    GS.turntimer= 160
	    GS.firingrate= 25
	    if(pop == 3) GS.firingrate*= 2.4
	    if(pop == 2) GS.firingrate*= 1.7
	    if(con2 > 0) hp-= 5
	    if(con2 == 0) {
	        GS.turntimer= 360
	        gen= instance_create(GS.idealborder[0] + random(c_borderwidth(0)) - 20, GS.idealborder[2] - 40, 659/* blt_dummybullet */)
	        gen= instance_create(GS.idealborder[0] + random(c_borderwidth(0)) - 20, GS.idealborder[2] - 45, 659/* blt_dummybullet */)
	        gen= instance_create(GS.idealborder[0] + random(c_borderwidth(0)) - 20, GS.idealborder[2] - 50, 659/* blt_dummybullet */)
	        gen= instance_create(GS.idealborder[0] + random(c_borderwidth(0)) - 20, GS.idealborder[2] - 130, 659/* blt_dummybullet */)
	        gen= instance_create(GS.idealborder[0] + random(c_borderwidth(0)) - 20, GS.idealborder[2] - 135, 659/* blt_dummybullet */)
	        gen= instance_create(GS.idealborder[0] + random(c_borderwidth(0)) - 20, GS.idealborder[2] - 140, 659/* blt_dummybullet */)
	        gen= instance_create(GS.idealborder[0] + random(c_borderwidth(0)) - 20, GS.idealborder[2] - 220, 659/* blt_dummybullet */)
	        gen= instance_create(GS.idealborder[0] + random(c_borderwidth(0)) - 20, GS.idealborder[2] - 225, 659/* blt_dummybullet */)
	        gen= instance_create(GS.idealborder[0] + random(c_borderwidth(0)) - 20, GS.idealborder[2] - 230, 659/* blt_dummybullet */)
	        blt_parent_noborder.side= 2
	        repeat(6)  {
	            gen= instance_create(GS.idealborder[0] + 30 + random(c_borderwidth(0) - 70), GS.idealborder[3] + 310 + random(10), 659/* blt_dummybullet */)
	            gen.side= 3
	            gen= instance_create(GS.idealborder[0] + 30 + random(c_borderwidth(0) - 70), GS.idealborder[3] + 360 + random(10), 659/* blt_dummybullet */)
	            gen.side= 3
	            gen= instance_create(GS.idealborder[0] + 30 + random(c_borderwidth(0) - 70), GS.idealborder[3] + 410 + random(10), 659/* blt_dummybullet */)
	            gen.side= 3
	        }
	    }
	    if(con2 == 2) {
	        GS.turntimer= 260
	        gen= instance_create(GS.idealborder[0] + random(c_borderwidth(0)) - 20, GS.idealborder[2] - 40, 659/* blt_dummybullet */)
	        gen= instance_create(GS.idealborder[0] + random(c_borderwidth(0)) - 20, GS.idealborder[2] - 50, 659/* blt_dummybullet */)
	        gen= instance_create(GS.idealborder[0] + random(c_borderwidth(0)) - 20, GS.idealborder[2] - 60, 659/* blt_dummybullet */)
	        gen= instance_create(GS.idealborder[0] + random(c_borderwidth(0)) - 20, GS.idealborder[2] - 70, 659/* blt_dummybullet */)
	        gen= instance_create(GS.idealborder[0] + random(c_borderwidth(0)) - 20, GS.idealborder[2] - 80, 659/* blt_dummybullet */)
	        blt_parent_noborder.side= 2
	        gen= instance_create(GS.idealborder[0] - 150, GS.idealborder[2] + random(80), 659/* blt_dummybullet */)
	        gen.side= 0
	        gen= instance_create(GS.idealborder[0] - 160, GS.idealborder[2] + random(80), 659/* blt_dummybullet */)
	        gen.side= 0
	        gen= instance_create(GS.idealborder[0] - 170, GS.idealborder[2] + random(80), 659/* blt_dummybullet */)
	        gen.side= 0
	        gen= instance_create(GS.idealborder[0] - 180, GS.idealborder[2] + random(80), 659/* blt_dummybullet */)
	        gen.side= 0
	        gen= instance_create(GS.idealborder[0] - 190, GS.idealborder[2] + random(80), 659/* blt_dummybullet */)
	        gen.side= 0
	        gen= instance_create(GS.idealborder[1] + 270, GS.idealborder[2] + random(80), 659/* blt_dummybullet */)
	        gen.side= 1
	        gen= instance_create(GS.idealborder[1] + 280, GS.idealborder[2] + random(80), 659/* blt_dummybullet */)
	        gen.side= 1
	        gen= instance_create(GS.idealborder[1] + 290, GS.idealborder[2] + random(80), 659/* blt_dummybullet */)
	        gen.side= 1
	        gen= instance_create(GS.idealborder[1] + 300, GS.idealborder[2] + random(80), 659/* blt_dummybullet */)
	        gen.side= 1
	        gen= instance_create(GS.idealborder[1] + 310, GS.idealborder[2] + random(80), 659/* blt_dummybullet */)
	        gen.side= 1
	        repeat(6)  {
	            gen= instance_create(GS.idealborder[0] + 30 + random(c_borderwidth(0) - 70), GS.idealborder[3] + 400 + random(10), 659/* blt_dummybullet */)
	            gen.side= 3
	            gen= instance_create(GS.idealborder[0] + 30 + random(c_borderwidth(0) - 70), GS.idealborder[3] + 470 + random(10), 659/* blt_dummybullet */)
	            gen.side= 3
	            gen= instance_create(GS.idealborder[0] + 30 + random(c_borderwidth(0) - 70), GS.idealborder[3] + 540 + random(10), 659/* blt_dummybullet */)
	            gen.side= 3
	        }
	        blt_parent_noborder.dmg= GS.monsteratk[myself]
	    }
	    if(con2 == 3 and hp >= 255) {
	        GS.turntimer= 220
	        g= 0
	        repeat(6)  {
	            g++
	            gen= instance_create(GS.idealborder[0] - 50 - g * 5, GS.idealborder[2] + 100 + random(60), 659/* blt_dummybullet */)
	            gen.side= 0
	        }
	        g= 0
	        repeat(6)  {
	            g++
	            gen= instance_create(GS.idealborder[1] + 150 + g * 5, GS.idealborder[2] + random(60), 659/* blt_dummybullet */)
	            gen.side= 1
	        }
	        g= 0
	        repeat(6)  {
	            g++
	            gen= instance_create(GS.idealborder[0] - 150 - g * 5, GS.idealborder[2] + random(60), 659/* blt_dummybullet */)
	            gen.side= 0
	        }
	        g= 0
	        repeat(6)  {
	            g++
	            gen= instance_create(GS.idealborder[1] + 50 + g * 5, GS.idealborder[2] + 100 + random(60), 659/* blt_dummybullet */)
	            gen.side= 1
	        }
	        repeat(6)  {
	            gen= instance_create(GS.idealborder[0] + 30 + random(c_borderwidth(0) - 70), GS.idealborder[3] + 270 + random(10), 659/* blt_dummybullet */)
	            gen.side= 3
	            gen= instance_create(GS.idealborder[0] + 30 + random(c_borderwidth(0) - 70), GS.idealborder[3] + 310 + random(10), 659/* blt_dummybullet */)
	            gen.side= 3
	            gen= instance_create(GS.idealborder[0] + 30 + random(c_borderwidth(0) - 70), GS.idealborder[3] + 360 + random(10), 659/* blt_dummybullet */)
	            gen.side= 3
	        }
	        blt_parent_noborder.dmg= GS.monsteratk[myself]
	    }
	    if(con2 == 3 and hp >= 999) {
	        GS.turntimer= 160
	        repeat(4)  {
	            gen= instance_create(GS.idealborder[0] + 30 + random(c_borderwidth(0) - 70), GS.idealborder[3] + 30 + random(10), 659/* blt_dummybullet */)
	            gen.side= 3
	            gen= instance_create(GS.idealborder[0] + 30 + random(c_borderwidth(0) - 70), GS.idealborder[3] + 90 + random(10), 659/* blt_dummybullet */)
	            gen.side= 3
	            gen= instance_create(GS.idealborder[0] + 30 + random(c_borderwidth(0) - 70), GS.idealborder[3] + 150 + random(10), 659/* blt_dummybullet */)
	            gen.side= 3
	            gen= instance_create(GS.idealborder[0] + 30 + random(c_borderwidth(0) - 70), GS.idealborder[3] + 210 + random(10), 659/* blt_dummybullet */)
	            gen.side= 3
	        }
	        blt_parent_noborder.dmg= GS.monsteratk[myself]
	    }
	    if(con2 == 3 and hp < 255) {
	        con2= 4
	        GS.turntimer= 160
	        repeat(4)  {
	            gen= instance_create(GS.idealborder[0] + 30 + random(c_borderwidth(0) - 70), GS.idealborder[3] + 30 + random(10), 659/* blt_dummybullet */)
	            gen.side= 3
	            gen= instance_create(GS.idealborder[0] + 30 + random(c_borderwidth(0) - 70), GS.idealborder[3] + 90 + random(10), 659/* blt_dummybullet */)
	            gen.side= 3
	            gen= instance_create(GS.idealborder[0] + 30 + random(c_borderwidth(0) - 70), GS.idealborder[3] + 150 + random(10), 659/* blt_dummybullet */)
	            gen.side= 3
	            gen= instance_create(GS.idealborder[0] + 30 + random(c_borderwidth(0) - 70), GS.idealborder[3] + 210 + random(10), 659/* blt_dummybullet */)
	            gen.side= 3
	        }
	        blt_parent_noborder.dmg= GS.monsteratk[myself]
	    }
	    if(con2 == 5 and type2 == 3) {
	        type2= 4
	        GS.turntimer= 240
	        choice= floor(random(4)) + 2
	        i= 0
	        while(i < 7) {
	            if(i != choice and i != choice + 1) {
	                gen= instance_create(GS.idealborder[0] - 40, GS.idealborder[3] - 25 - i * 25, 659/* blt_dummybullet */)
	                gen.side= 0
	                gen.type= 1
	            }
	            i++
	        }
	        choice= floor(random(4)) + 2
	        i= 0
	        while(i < 7) {
	            if(i != choice and i != choice + 1) {
	                gen= instance_create(GS.idealborder[1] + 20, GS.idealborder[3] - 25 - i * 25, 659/* blt_dummybullet */)
	                gen.side= 1
	                gen.type= 1
	            }
	            i++
	        }
	        choice= floor(random(7))
	        i= 0
	        while(i < 7) {
	            if(i != choice and i != choice + 1) {
	                gen= instance_create(GS.idealborder[0] + 10 + i * 25, GS.idealborder[2] - 150, 659/* blt_dummybullet */)
	                gen.side= 2
	                gen.type= 1
	            }
	            i++
	        }
	        repeat(4)  {
	            gen= instance_create(GS.idealborder[0] + 30 + random(c_borderwidth(0) - 70), GS.idealborder[3] + 290 + random(10), 659/* blt_dummybullet */)
	            gen.side= 3
	            gen= instance_create(GS.idealborder[0] + 30 + random(c_borderwidth(0) - 70), GS.idealborder[3] + 300 + random(10), 659/* blt_dummybullet */)
	            gen.side= 3
	            gen= instance_create(GS.idealborder[0] + 30 + random(c_borderwidth(0) - 70), GS.idealborder[3] + 310 + random(10), 659/* blt_dummybullet */)
	            gen.side= 3
	        }
	        blt_parent_noborder.dmg= GS.monsteratk[myself]
	    }
	    if(con2 == 5 and type2 == 2) {
	        type2= 3
	        GS.turntimer= 220
	        choice= floor(random(3)) + 2
	        choice2= floor(random(3)) + 2
	        choice3= floor(random(3)) + 2
	        i= 0
	        while(i < 7) {
	            if(i != choice and i != choice + 1) {
	                gen= instance_create(GS.idealborder[0] + 10 + i * 25, GS.idealborder[2] - 50, 659/* blt_dummybullet */)
	                gen.side= 2
	                gen.type= 1
	            }
	            if(i != choice2 and i != choice2 + 1) {
	                gen= instance_create(GS.idealborder[0] + 10 + i * 25, GS.idealborder[2] - 110, 659/* blt_dummybullet */)
	                gen.side= 2
	                gen.type= 1
	            }
	            if(i != choice3 and i != choice3 + 1) {
	                gen= instance_create(GS.idealborder[0] + 10 + i * 25, GS.idealborder[2] - 170, 659/* blt_dummybullet */)
	                gen.side= 2
	                gen.type= 1
	            }
	            i++
	        }
	        repeat(4)  {
	            gen= instance_create(GS.idealborder[0] + 30 + random(c_borderwidth(0) - 70), GS.idealborder[3] + 260 + random(10), 659/* blt_dummybullet */)
	            gen.side= 3
	            gen= instance_create(GS.idealborder[0] + 30 + random(c_borderwidth(0) - 70), GS.idealborder[3] + 270 + random(10), 659/* blt_dummybullet */)
	            gen.side= 3
	            gen= instance_create(GS.idealborder[0] + 30 + random(c_borderwidth(0) - 70), GS.idealborder[3] + 280 + random(10), 659/* blt_dummybullet */)
	            gen.side= 3
	        }
	        blt_parent_noborder.dmg= GS.monsteratk[myself]
	    }
	    if(con2 == 5 and type2 == 1) {
	        type2= 2
	        GS.turntimer= 160
	        choice= floor(random(4)) + 2
	        i= 0
	        while(i < 7) {
	            if(i != choice and i != choice + 1) {
	                gen= instance_create(GS.idealborder[0] - 40, GS.idealborder[3] - 25 - i * 25, 659/* blt_dummybullet */)
	                gen.side= 0
	                gen.type= 1
	            }
	            i++
	        }
	        choice= floor(random(4)) + 2
	        i= 0
	        while(i < 7) {
	            if(i != choice and i != choice + 1) {
	                gen= instance_create(GS.idealborder[1] + 110, GS.idealborder[3] - 25 - i * 25, 659/* blt_dummybullet */)
	                gen.side= 1
	                gen.type= 1
	            }
	            i++
	        }
	        repeat(4)  {
	            gen= instance_create(GS.idealborder[0] + 30 + random(c_borderwidth(0) - 70), GS.idealborder[3] + 160 + random(10), 659/* blt_dummybullet */)
	            gen.side= 3
	            gen= instance_create(GS.idealborder[0] + 30 + random(c_borderwidth(0) - 70), GS.idealborder[3] + 170 + random(10), 659/* blt_dummybullet */)
	            gen.side= 3
	            gen= instance_create(GS.idealborder[0] + 30 + random(c_borderwidth(0) - 70), GS.idealborder[3] + 180 + random(10), 659/* blt_dummybullet */)
	            gen.side= 3
	        }
	        blt_parent_noborder.dmg= GS.monsteratk[myself]
	    }
	    if(con2 == 5 and type2 == 0) {
	        type2= 1
	        GS.turntimer= 175
	        choice= floor(random(7))
	        i= 0
	        while(i < 7) {
	            if(i != choice and i != choice + 1) {
	                gen= instance_create(GS.idealborder[0] + 10 + i * 25, GS.idealborder[2] - 50, 659/* blt_dummybullet */)
	                gen.side= 2
	                gen.type= 1
	            }
	            i++
	        }
	        repeat(4)  {
	            gen= instance_create(GS.idealborder[0] + 30 + random(c_borderwidth(0) - 70), GS.idealborder[3] + 170 + random(10), 659/* blt_dummybullet */)
	            gen.side= 3
	            gen= instance_create(GS.idealborder[0] + 30 + random(c_borderwidth(0) - 70), GS.idealborder[3] + 180 + random(10), 659/* blt_dummybullet */)
	            gen.side= 3
	            gen= instance_create(GS.idealborder[0] + 30 + random(c_borderwidth(0) - 70), GS.idealborder[3] + 190 + random(10), 659/* blt_dummybullet */)
	            gen.side= 3
	        }
	        blt_parent_noborder.dmg= GS.monsteratk[myself]
	    }
	    if(type2 == 4) type2= 0
	    if(con2 == 17.5) {
	        GS.turntimer= 460
	        con2= 17
	        choice= floor(random(3)) + 2
	        i= 0
	        while(i < 7) {
	            if(i != choice and i != choice + 1) {
	                gen= instance_create(GS.idealborder[0] - 60, GS.idealborder[3] - 25 - i * 25, 659/* blt_dummybullet */)
	                gen.side= 0
	                gen.type= 1
	            }
	            i++
	        }
	        choice= floor(random(3)) + 2
	        i= 0
	        while(i < 7) {
	            if(i != choice and i != choice + 1) {
	                gen= instance_create(GS.idealborder[1] + 100, GS.idealborder[3] - 25 - i * 25, 659/* blt_dummybullet */)
	                gen.side= 1
	                gen.type= 1
	            }
	            i++
	        }
	        choice= floor(random(3)) + 2
	        i= 0
	        while(i < 7) {
	            if(i != choice and i != choice + 1) {
	                gen= instance_create(GS.idealborder[0] - 240, GS.idealborder[3] - 25 - i * 25, 659/* blt_dummybullet */)
	                gen.side= 0
	                gen.type= 1
	            }
	            i++
	        }
	        choice= floor(random(3)) + 2
	        i= 0
	        while(i < 7) {
	            if(i != choice and i != choice + 1) {
	                gen= instance_create(GS.idealborder[1] + 280, GS.idealborder[3] - 25 - i * 25, 659/* blt_dummybullet */)
	                gen.side= 1
	                gen.type= 1
	            }
	            i++
	        }
	        choice= floor(random(2)) + 2
	        i= 0
	        while(i < 7) {
	            if(i != choice and i != choice + 1) {
	                gen= instance_create(GS.idealborder[0] - 440, GS.idealborder[3] - 25 - i * 25, 659/* blt_dummybullet */)
	                gen.side= 0
	                gen.type= 1
	            }
	            i++
	        }
	        choice= floor(random(3)) + 2
	        i= 0
	        while(i < 7) {
	            if(i != choice and i != choice + 1) {
	                gen= instance_create(GS.idealborder[1] + 360, GS.idealborder[3] - 25 - i * 25, 659/* blt_dummybullet */)
	                gen.side= 1
	                gen.type= 1
	            }
	            i++
	        }
	        gen= instance_create(GS.idealborder[0] + 170, GS.idealborder[3] + 60, 659/* blt_dummybullet */)
	        gen.side= 3
	        gen.type= 4
	        gen.sprite_index= 113/* spr_dummybot */
	        gen= instance_create(GS.idealborder[0] + 100, GS.idealborder[2] - 360, 659/* blt_dummybullet */)
	        gen.side= 2
	        gen.type= 4
	        gen.sprite_index= 113/* spr_dummybot */
	        i= 0
	        while(i < 6) {
	            gen= instance_create(GS.idealborder[0] + 20 + i * 30, GS.idealborder[3] + 690, 659/* blt_dummybullet */)
	            gen.side= 3
	            gen.sprite_index= 113/* spr_dummybot */
	            gen.type= 4
	            gen= instance_create(GS.idealborder[0] - 700, GS.idealborder[2] + 30 + i * 30, 659/* blt_dummybullet */)
	            gen.type= 4
	            gen.side= 0
	            gen.sprite_index= 113/* spr_dummybot */
	            gen= instance_create(GS.idealborder[1] + 690, GS.idealborder[2] + 30 + i * 30, 659/* blt_dummybullet */)
	            gen.type= 4
	            gen.sprite_index= 113/* spr_dummybot */
	            gen.side= 1
	            i++
	        }
	        blt_parent_noborder.dmg= GS.monsteratk[myself]
	    }
	    if(con2 == 16) {
	        GS.turntimer= 280
	        i= 0
	        while(i < 5) {
	            gen= instance_create(GS.idealborder[0] + 180 - i * 40, GS.idealborder[3] + 20 + i * 10, 659/* blt_dummybullet */)
	            gen.side= 3
	            gen= instance_create(GS.idealborder[0] - 110 - i * 10, GS.idealborder[2] + 150 - i * 30, 659/* blt_dummybullet */)
	            gen.side= 0
	            gen= instance_create(GS.idealborder[0] + 20 + i * 40, GS.idealborder[2] - 200 - i * 10, 659/* blt_dummybullet */)
	            gen.side= 2
	            gen= instance_create(GS.idealborder[1] + 280 + i * 10, GS.idealborder[2] + 30 + i * 30, 659/* blt_dummybullet */)
	            gen.side= 1
	            i++
	        }
	        blt_parent_noborder.type= 4
	        blt_dummybullet.sprite_index= 113/* spr_dummybot */
	        blt_parent_noborder.dmg= GS.monsteratk[myself]
	        con2= 17.5
	    }
	    if(con2 == 15) {
	        GS.turntimer= 180
	        i= 0
	        while(i < 3) {
	            gen= instance_create(GS.idealborder[0] + 20 + i * 60, GS.idealborder[3] + 20, 659/* blt_dummybullet */)
	            gen.side= 3
	            gen= instance_create(GS.idealborder[0] - 40, GS.idealborder[2] + 30 + i * 60, 659/* blt_dummybullet */)
	            gen.side= 0
	            gen= instance_create(GS.idealborder[1] + 20, GS.idealborder[2] + 30 + i * 60, 659/* blt_dummybullet */)
	            gen.side= 1
	            i++
	        }
	        blt_parent_noborder.type= 4
	        blt_dummybullet.sprite_index= 113/* spr_dummybot */
	        blt_parent_noborder.dmg= GS.monsteratk[myself]
	        con2= 16
	    }
	    if(con2 == 14) {
	        GS.turntimer= 180
	        gen= instance_create(GS.idealborder[0] + 20, GS.idealborder[3] + 20, 659/* blt_dummybullet */)
	        gen.side= 3
	        gen= instance_create(GS.idealborder[0] + 50, GS.idealborder[3] + 20, 659/* blt_dummybullet */)
	        gen.side= 3
	        gen= instance_create(GS.idealborder[0] + 80, GS.idealborder[3] + 20, 659/* blt_dummybullet */)
	        gen.side= 3
	        gen= instance_create(GS.idealborder[0] + 110, GS.idealborder[3] + 20, 659/* blt_dummybullet */)
	        gen.side= 3
	        gen= instance_create(GS.idealborder[0] + 140, GS.idealborder[3] + 20, 659/* blt_dummybullet */)
	        gen.side= 3
	        blt_parent_noborder.type= 4
	        blt_dummybullet.sprite_index= 113/* spr_dummybot */
	        blt_parent_noborder.dmg= GS.monsteratk[myself]
	        con2= 15
	    }
	    gen.myself= myself
	    if(mycommand >= 0)
	        GS.msg[0]= "* Mad Dummy is doing an armless&  ska dance."
	    if(mycommand >= 25)
	        GS.msg[0]= "* Mad Dummy is bossing around&  its bullets."
	    if(mycommand >= 50)
	        GS.msg[0]= "* Mad Dummy glares into a&  mirror^1, then turns to you&  with the same expression."
	    if(mycommand >= 75) GS.msg[0]= "* Mad Dummy is hopping mad."
	    if(mycommand >= 90)
	        GS.msg[0]= "* Smells like a clothing&  store."
	    if(GS.monsterhp[myself] < 30)
	        GS.msg[0]= "* This message will NEVER&  happen."
	    if(con2 == 5)
	        GS.msg[0]= "* Mad Dummy is getting cotton&  all over the dialogue box."
	    attacked= 1
	}
	if(GS.myfight == 2 and whatiheard != -1 and GS.heard == 0) {
	    if(whatiheard == 0) {
	        GS.msc= 0
	        GS.msg[0]= "* MAD DUMMY - ATK 30 DEF YES&* Because they\'re a ghost^1,&  physical attacks will fail./^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	        whatiheard= 9
	    }
	    if(whatiheard == 1) {
	        GS.msc= 0
	        GS.msg[0]= "* You tell Aaron to go away./^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	        mercymod= -10
	    }
	    if(whatiheard == 3) {
	        GS.flag[147]= 1
	        GS.msc= 0
	        GS.msg[0]= "* You talk to the DUMMY^1.&* .../"
	        GS.msg[1]= "* It doesn\'t seem much for&  conversation./"
	        GS.msg[2]= "* No one is happy with this./^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    GS.heard= 1
	}
	if(is_instance_valid(mypart1)) {
	    mypart1.x= x + 50
	    mypart1.y= y + 10
	}
	if(GS.myfight == 4 and GS.mercyuse == 0) {
	    script_execute(163/* scr_mercystandard */)
	    if(mercy < 0) instance_destroy()
	}
	if(mercymod == 222 and not instance_exists(782/* OBJ_WRITER */)) {
	    script_execute(163/* scr_mercystandard */)
	    if(mercy < 0) instance_destroy()
	}
	if(con == 4 and not instance_exists(782/* OBJ_WRITER */)) {
	    with(blcon) instance_destroy()
	    GS.mnfight= 1
	    GS.myfight= 0
	    talked= 0
	    con= 5
	    mycommand= random(100)
	}
	if(con == 2 and not instance_exists(782/* OBJ_WRITER */)) {
	    with(blcon) instance_destroy()
	    con= 3
	    with(mypart1) event_user(1)
	    snd_play(51/* snd_damage */)
	    $Alarm8.start((30) / 30.0)
	}
	if(talko == 3 and not instance_exists(782/* OBJ_WRITER */)) {
	    with(blcon) instance_destroy()
	    talko= 0
	    next= 1
	    if(con2 == 1) {
	        con2= 2
	        GS.faceemotion= 0
	        GS.msg[0]= "* Mad Dummy is looking&  nervous."
	    }
	}
	if(talko == 2 and not instance_exists(782/* OBJ_WRITER */)) {
	    with(blcon) instance_destroy()
	    talko= 1
	}
	if(talko == 1 and not instance_exists(782/* OBJ_WRITER */)) {
	    hurtsies= 2
	    $Alarm7.start((2) / 30.0)
	    talko= 0
	}
	if(next == 1 and GS.turntimer < 2 and GS.mnfight == 2) {
	    GS.turntimer= -1
	    GS.mnfight= 3
	}
	if(con2 == 3) {
	    siner++
	    x= xstart + sin(siner / 20) * 90
	    y-= sin(siner / 5) * 2
	}
	if(con2 == 4) {
	    with(mypart1) {
	        rotmod= 1.4
	        speedmod= 2.4
	    }
	    siner= 0
	    x= xstart
	    y= ystart
	    con2= 5
	}
	if(con2 == 5) {
	    if(GS.mnfight < 2) siner+= 0.25
	    if(GS.mnfight == 2) {
	        sinadd= GS.turntimer / 500 - 0.16
	        if(sinadd < 0.02) sinadd= 0
	        siner+= sinadd
	    }
	    x= xstart + sin(siner / 4) * 200
	    y= ystart + sin(siner / 2) * 50
	    if(GS.mnfight == 3)
	        GS.msg[0]= "* Mad Dummy is getting cotton&  all over the dialogue box."
	}
	if(con2 == 6) {
	    if(distance_to_point(xstart, ystart) < 20 and speed > 0) {
	        speed-= 0.5
	        move_towards_point(xstart, ystart, speed)
	    }
	    if(speed == 0) {
	        con2= 7
	        GS.typer= 33
	        GS.msg[0]= "\\E1HEY GUYS!/%%"
	        blcon= instance_create(xstart + 100, ystart, 187/* obj_blconwdflowey */)
	        blconwdS= instance_create(blcon.x + 25, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	    }
	}
	if(con2 == 7 and not instance_exists(782/* OBJ_WRITER */)) {
	    with(mypart1) {
	        rotmod= 0.3
	        speedmod= 0.1
	    }
	    GS.turntimer= 333
	    with(blcon) instance_destroy()
	    repeat(8)  {
	        gen= instance_create(GS.idealborder[0] + 30 + random(c_borderwidth(0) - 70), GS.idealborder[3] + 10 + random(10), 659/* blt_dummybullet */)
	        gen.side= 3
	        gen.type= 2
	        gen.dmg= 1
	        gen= instance_create(GS.idealborder[0] + 30 + random(c_borderwidth(0) - 70), GS.idealborder[2] - 40 + random(10), 659/* blt_dummybullet */)
	        gen.side= 2
	        gen.type= 2
	        gen.dmg= 1
	        gen= instance_create(GS.idealborder[0] - 26 - random(10), GS.idealborder[3] - 25 - random(200), 659/* blt_dummybullet */)
	        gen.side= 0
	        gen.type= 2
	        gen.dmg= 1
	        gen= instance_create(GS.idealborder[1] + 26 + random(10), GS.idealborder[3] - 25 - random(200), 659/* blt_dummybullet */)
	        gen.side= 1
	        gen.type= 2
	        gen.dmg= 1
	    }
	    con2= 8
	    $Alarm4.start((30) / 30.0)
	}
	if(con2 == 9) {
	    con2= 10
	    GS.typer= 33
	    GS.msg[0]= "\\E0Dummies^1.&Dummies^1!&DUMMIES!/"
	    GS.msg[1]= "\\E1Remember how I&said NOT to&shoot at me?/"
	    GS.msg[2]= "\\E0Well.../"
	    GS.msg[3]= "\\E3FAILURES^1!&YOU\'RE FIRED^1!&YOU\'RE ALL BEING&REPLACED!!!/%%"
	    blcon= instance_create(xstart + 100, ystart, 187/* obj_blconwdflowey */)
	    blconwdS= instance_create(blcon.x + 25, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	}
	if(con2 == 10) {
	    GS.turntimer= 999
	    if(instance_exists(782/* OBJ_WRITER */)) {
	        if(OBJ_WRITER.stringno == 3) {
	            with(mypart1) {
	                rotmod= 2
	                speedmod= 7
	            }
	            blt_dummybullet.sprite_index= 116/* spr_dummybullet_shock */
	        }
	    } else  {
	        with(mypart1) {
	            rotmod= 0.1
	            speedmod= 0.1
	        }
	        // blt_dummybullet
	        with(659) {
	            event_user(2)
	            speed= 1
	            sprite_index= 115/* spr_dummybullet_sad */
	        }
	        with(blcon) instance_destroy()
	        con2= 11
	        $Alarm4.start((40) / 30.0)
	    }
	}
	if(con2 == 12) {
	    GS.turntimer= 10
	    con2= 13
	    GS.typer= 33
	    GS.msc= 0
	    GS.msg[0]= "\\E0Hahaha^1.&Hahaha^1!&HAHAHA!/"
	    GS.msg[1]= "Now you\'ll see&my true power:/"
	    GS.msg[2]= "Relying on people&that aren\'t garbage!/%%"
	    blcon= instance_create(xstart + 100, ystart, 187/* obj_blconwdflowey */)
	    blconwdS= instance_create(blcon.x + 25, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	    talko= 3
	    GS.msg[0]= "* Mechanical whirrs fill&  the room."
	}
	if(con2 == 13) {
	    if(instance_exists(782/* OBJ_WRITER */)) {
	        if(OBJ_WRITER.stringno == 0) {
	            with(mypart1) {
	                rotmod= 0.8
	                speedmod= 10
	            }
	        }
	        if(OBJ_WRITER.stringno == 1) {
	            with(mypart1) {
	                rotmod= 1.4
	                speedmod= 2
	            }
	        }
	    } else  con2= 14
	    siner= 0
	}
	if(con2 == 14 or con2 == 15 or con2 == 16 or con2 == 17 or con2 == 17.5) {
	    siner+= 0.2
	    x= xstart + sin(siner / 2) * 60
	    y-= sin(siner * 2) * 8
	    if(con2 == 17 and GS.turntimer < 30) {
	        move_towards_point(xstart, ystart, 10)
	        next= 0
	        con2= 18
	    }
	}
	if(con2 == 18) {
	    con2= 19
	    GS.typer= 33
	    with(mypart1) GS.msc= 0
	    rotmod= 0.1
	    speedmod= 0.2
	    GS.msg[0]= "\\E2(N..^1. no way!)/"
	    GS.msg[1]= "\\E2(These guys are&even WORSE than&the other guys!)/"
	    GS.msg[2]= "\\E3Who cares^1.&Who cares^1!&WHO CARES!!/"
	    GS.msg[3]= "I DON\'T NEED&FRIENDS!!!/%%"
	    blcon= instance_create(xstart + 100, ystart, 187/* obj_blconwdflowey */)
	    blconwdS= instance_create(blcon.x + 25, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	}
	if(con2 == 19) {
	    if(distance_to_point(xstart, ystart) < 30 and speed > 0) {
	        speed--
	        move_towards_point(xstart, ystart, speed)
	    }
	    if(instance_exists(782/* OBJ_WRITER */)) {
	        if(OBJ_WRITER.stringno == 3) {
	            with(mypart1) {
	                rotmod= 2.2
	                speedmod= 5
	            }
	        }
	    } else  {
	        con2= 20
	        $Alarm4.start((40) / 30.0)
	        GS.turntimer= 999
	        knife= instance_create(x - 50, y, 658/* blt_dummyknife */)
	        GS.faceemotion= 0
	        with(blcon) instance_destroy()
	    }
	}
	if(con2 == 21) {
	    GS.msg[0]= "\\E3I\'VE GOT&KNIVES!!!/%%"
	    blcon= instance_create(xstart + 100, ystart, 187/* obj_blconwdflowey */)
	    blconwdS= instance_create(blcon.x + 25, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	    con2= 22
	}
	if(con2 == 22) {
	    GS.turntimer= 999
	    if(not instance_exists(782/* OBJ_WRITER */)) {
	        with(blcon) instance_destroy()
	        with(knife) move_towards_point(obj_heart.x + 10, obj_heart.y + 10, 9)
	        snd_play(20/* snd_arrow */)
	        con2= 23
	        $Alarm4.start((90) / 30.0)
	    }
	}
	if(con2 == 24) {
	    $Alarm4.start((30) / 30.0)
	    con2= 25
	}
	if(con2 == 25) {
	    with(mypart1) {
	        if(rotmod > 0) rotmod-= 0.2
	        if(speedmod > 0) speedmod-= 0.2
	    }
	}
	if(con2 == 26) {
	    sprite_index= 273/* spr_dummymask */
	    GS.msg[0]= "\\E0I\'m..^1./"
	    GS.msg[1]= "\\E2Out of knives./"
	    GS.msg[2]= "\\E3BUT IT DOESN\'T&MATTER!!!/"
	    GS.msg[3]= "YOU CAN\'T HURT&ME AND I CAN\'T&HURT YOU!/"
	    GS.msg[4]= "YOU\'LL BE STUCK&FIGHTING ME.../"
	    GS.msg[5]= "Forever./"
	    GS.msg[6]= "Forever!/"
	    GS.msg[7]= "FOREVER!!!!/"
	    GS.msg[8]= "AHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHA%"
	    GS.msg[9]= "AHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHA%"
	    GS.msg[10]= "AHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHA%"
	    GS.msg[11]= "AHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHA%"
	    with(mypart1) {
	        rotmod= 0
	        speedmod= 0
	    }
	    blcon= instance_create(xstart + 100, ystart, 187/* obj_blconwdflowey */)
	    blconwdS= instance_create(blcon.x + 25, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	    con2= 27
	}
	if(con2 == 27 and instance_exists(782/* OBJ_WRITER */)) {
	    if(OBJ_WRITER.stringno == 2) {
	        with(mypart1) {
	            rotmod= 2.5
	            speedmod= 5
	        }
	    }
	    if(OBJ_WRITER.stringno == 3) {
	        with(mypart1) {
	            rotmod= 3
	            speedmod= 6
	        }
	    }
	    if(OBJ_WRITER.stringno == 4) {
	        with(mypart1) {
	            rotmod= 5
	            speedmod= 6
	        }
	    }
	    if(OBJ_WRITER.stringno == 5) {
	        with(mypart1) {
	            rotmod= 0
	            speedmod= 0
	        }
	    }
	    if(OBJ_WRITER.stringno == 6) {
	        with(mypart1) {
	            rotmod= 2
	            speedmod= 2
	        }
	    }
	    if(OBJ_WRITER.stringno == 7) {
	        with(mypart1) {
	            rotmod= 8
	            speedmod= 3
	        }
	    }
	    if(OBJ_WRITER.stringno == 8) {
	        with(mypart1) {
	            rotmod= 12
	            speedmod= 3
	        }
	    }
	    if(OBJ_WRITER.stringno == 9) {
	        repeat(23)  {
	            blt= instance_create(x + 10 + random(20), -10 - random(1100), 633/* blt_crybullet2 */)
	            blt.dmg= 0
	            blt.gravity= 0
	            blt.friction= 0
	            size= 1 + random(1)
	            blt.scale.x= size
	            blt.scale.y= size
	            blt.velocity.y= 6
	            blt.velocity.x/= 4
	            blt.gravity_direction= 270
	            GS.turntimer= 9999
	        }
	        con2= 28
	    }
	}
	if(con2 == 30) {
	    GS.msg[0]= "\\E2Wh..^1.&What the heck is&this!?/"
	    GS.msg[1]= "\\E3Ergh^1!&Acid rain!?!/"
	    GS.msg[2]= "Oh^1, FORGET IT^1!&I\'m outta here!/%%"
	    blcon= instance_create(xstart + 100, ystart, 187/* obj_blconwdflowey */)
	    blconwdS= instance_create(blcon.x + 25, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	    con2= 31
	}
	if(con2 == 31 and not instance_exists(782/* OBJ_WRITER */)) {
	    with(blcon) instance_destroy()
	    // blt_crybullet2
	    with(633) instance_destroy()
	    snd_play(48/* snd_slidewhist */)
	    velocity.x= 4
	    con2= 32
	    $Alarm4.start((120) / 30.0)
	}
	if(con2 == 33) {
	    blook= instance_create(xstart - 20, -200, 1363/* obj_npc_marker */)
	    blook.modulate.a= 0
	    blook.visible= 1
	    blook.scale.x= 2
	    blook.scale.y= 2
	    blook.sprite_index= 185/* spr_napstabattle_leg */
	    blook.image_speed= 0.25
	    blook.velocity.y= 4
	    con2= 34
	}
	if(con2 == 34) {
	    blook.modulate.a+= 0.025
	    if(blook.y > 14) {
	        con2= 35
	        blook.velocity.y= 0
	        $Alarm4.start((30) / 30.0)
	    }
	}
	if(con2 == 36) {
	    GS.typer= 33
	    GS.msg[0]= "... sorry^1, i&interrupted you^1,&didn\'t i?/"
	    GS.msg[1]= "as soon as i came&over^1, your friend&immediately left.../"
	    GS.msg[2]= "oh no..^1.&you guys looked&like you were having&fun.../"
	    GS.msg[3]= "oh no..^1.&i just wanted to&say hi.../"
	    GS.msg[4]= "oh no.................................................%%"
	    if(GS.flag[36] == 0) {
	        GS.msg[3]= "oh wait..^1. didn\'t you&attack me before.../"
	        GS.msg[4]= "uhhh..^1.&that\'s awkward./"
	        GS.msg[5]= "sorry^1.&have a nice day./%%"
	    }
	    blcon= instance_create(xstart + 100, ystart, 187/* obj_blconwdflowey */)
	    blconwdS= instance_create(blcon.x + 25, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	    con2= 37
	}
	if(con2 == 37) {
	    if(instance_exists(782/* OBJ_WRITER */)) {
	        if(OBJ_WRITER.stringno == 4 or OBJ_WRITER.stringno == 5)
	            blook.modulate.a-= 0.03
	    } else  {
	        con2= 38
	        with(blcon) instance_destroy()
	        $Alarm4.start((60) / 30.0)
	    }
	}
	if(con2 == 39) {
	    $Alarm11.start((10) / 30.0)
	    instance_create(0, 0, 149/* obj_unfader */)
	    con2= 40
	}

func _gm_event_7_17():
	if(soundbuffer > 0) {
	    snd_play(51/* snd_damage */)
	    soundbuffer= -3
	}

func _gm_event_7_13():
	$Alarm10.start((30) / 30.0)
	if(con2 == 0) {
	    next= 0
	    with(mypart1) {
	        rotmod= 0.4
	        speedmod= 1
	    }
	}
	hp--
	if(hp < 275 and con2 < 3) con2= 3
	if(hp <= 195 and con2 == 5) {
	    next= 0
	    con2= 6
	    move_towards_point(xstart, ystart, 8)
	    GS.turntimer+= 80
	}
	if(con2 == 14) con2= 15
	if(con2 == 28) {
	    // OBJ_WRITER
	    with(782) instance_destroy()
	    with(blcon) instance_destroy()
	    con2= 29
	    caster_free(GS.batmusic)
	    with(mypart1) {
	        rotmod= 0
	        speedmod= 0
	    }
	    $Alarm4.start((60) / 30.0)
	}

func _on_outside_room():
	draw_self_border_e()
	if(GS.debug == 1) {
	    draw_set_color(255)
	    draw_text(x + 200, y, hp)
	}

func _gm_event_9_65():
	if(GS.debug == 1) {
	    con2= 17.5
	    hp= 180
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
