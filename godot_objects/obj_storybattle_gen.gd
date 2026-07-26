# Auto-converted from GameMaker: obj_storybattle_gen
extends Node2D

func _ready():
	skipper= 0
	ini_open("undertale.ini")
	tale= ini_read_real("General", "Tale", 0)
	ini_close()
	if(tale > 0) skipper= 1
	off= 0
	activetimer= -6
	GS.turntimer= 15
	GS.myfight= -1
	GS.mnfight= -1
	flowey= 0
	shake= 0
	if(scr_murderlv() < 16) {
	    GS.turntimer= 15
	    GS.myfight= -1
	    GS.mnfight= -1
	    GS.hurtanim[0]= 0
	    GS.hurtanim[1]= 0
	    GS.hurtanim[2]= 0
	    GS.monstertype[0]= 2
	    GS.monstertype[1]= 2
	    GS.monstertype[2]= 2
	    if(GS.flag[450] == 0) {
	        con= 5
	        m1= instance_create(100, 140, 213/* obj_froggit */)
	        m2= instance_create(450, 140, 213/* obj_froggit */)
	    }
	    if(GS.flag[450] == 1) {
	        con= 10
	        m1= instance_create(100, 140, 206/* obj_whimsun */)
	        m2= instance_create(450, 140, 206/* obj_whimsun */)
	    }
	    if(GS.flag[450] == 2) {
	        con= 15
	        m1= instance_create(80, 140, 212/* obj_moldsmal */)
	        m2= instance_create(270, 140, 212/* obj_moldsmal */)
	        m3= instance_create(470, 140, 212/* obj_moldsmal */)
	    }
	    if(GS.flag[450] == 3) {
	        con= 25
	        m1= instance_create(100, 140, 207/* obj_migosp */)
	        m2= instance_create(450, 140, 207/* obj_migosp */)
	    }
	    if(GS.flag[450] == 4) {
	        con= 30
	        m1= instance_create(80, 140, 208/* obj_vegetoid */)
	        m2= instance_create(270, 140, 208/* obj_vegetoid */)
	        m3= instance_create(470, 140, 208/* obj_vegetoid */)
	    }
	    if(GS.flag[450] == 5) {
	        con= 40
	        m1= instance_create(100, 140, 209/* obj_loox */)
	        m2= instance_create(450, 140, 209/* obj_loox */)
	    }
	    if(GS.flag[450] == 6) {
	        con= 50
	        m1= instance_create(50, 20, 252/* obj_snowdrake */)
	        m2= instance_create(450, 20, 252/* obj_snowdrake */)
	    }
	    if(GS.flag[450] == 7) {
	        con= 60
	        m1= instance_create(70, 110, 216/* obj_icecap */)
	        m2= instance_create(260, 110, 216/* obj_icecap */)
	        m3= instance_create(460, 110, 216/* obj_icecap */)
	    }
	    if(GS.flag[450] == 8) {
	        con= 70
	        m1= instance_create(80, 140, 256/* obj_woshua */)
	        m2= instance_create(270, 140, 256/* obj_woshua */)
	        m3= instance_create(470, 140, 256/* obj_woshua */)
	    }
	    if(GS.flag[450] == 9) {
	        con= 80
	        m1= instance_create(80, 130, 259/* obj_shyren */)
	        m2= instance_create(270, 130, 259/* obj_shyren */)
	        m3= instance_create(470, 130, 259/* obj_shyren */)
	    }
	    if(GS.flag[450] == 10) {
	        con= 90
	        m1= instance_create(80, 140, 199/* obj_dummymonster */)
	        m2= instance_create(270, 140, 199/* obj_dummymonster */)
	        m3= instance_create(470, 140, 199/* obj_dummymonster */)
	    }
	    if(GS.flag[450] == 11) {
	        con= 100
	        GS.monsterinstance[0]= instance_create(0, 20, 378/* obj_finalknight */)
	        obj_finalknight.myself= 1
	        GS.monsterinstance[1]= instance_create(470, 80, 369/* obj_wizard */)
	        obj_wizard.myself= 1
	    }
	    if(GS.flag[450] == 12) {
	        con= 110
	        GS.monsterinstance[0]= instance_create(80, 118, 385/* obj_finalfroggit */)
	        GS.monsterinstance[1]= instance_create(270, 118, 385/* obj_finalfroggit */)
	        GS.monsterinstance[2]= instance_create(470, 118, 385/* obj_finalfroggit */)
	    }
	    if(GS.flag[450] == 13) {
	        con= 120
	        GS.monsterinstance[0]= instance_create(80, 140, 394/* obj_whimsalot */)
	        GS.monsterinstance[1]= instance_create(270, 140, 394/* obj_whimsalot */)
	        GS.monsterinstance[2]= instance_create(470, 140, 394/* obj_whimsalot */)
	    }
	    if(GS.flag[450] == 14) {
	        con= 130
	        GS.monsterinstance[0]= instance_create(80, 130, 387/* obj_astigmatism */)
	        GS.monsterinstance[1]= instance_create(270, 130, 387/* obj_astigmatism */)
	        GS.monsterinstance[2]= instance_create(470, 130, 387/* obj_astigmatism */)
	    }
	    if(GS.flag[450] == 15) {
	        con= 140
	        m1= instance_create(80, 160, 212/* obj_moldsmal */)
	        m2= instance_create(270, 120, 209/* obj_loox */)
	        m3= instance_create(470, 140, 207/* obj_migosp */)
	    }
	    if(GS.flag[450] == 16) {
	        con= 150
	        GS.monsterinstance[0]= instance_create(40, 10, 343/* obj_pyrope */)
	        GS.monsterinstance[1]= instance_create(200, 120, 337/* obj_vulkin */)
	        GS.monsterinstance[2]= instance_create(430, 120, 337/* obj_vulkin */)
	    }
	    if(GS.flag[450] == 17) {
	        con= 160
	        activetimer= -45
	        m1= instance_create(270, 120, 213/* obj_froggit */)
	    }
	} else  {
	    flowey= 1
	    shake= 0
	    GS.faceemotion= 1
	    floweyx= 281
	    floweyy= 134
	    $Alarm4.start((15) / 30.0)
	    if(GS.flag[450] == 0) con= 299
	    if(GS.flag[450] == 1) con= 304
	    if(GS.flag[450] == 2) con= 309
	    if(GS.flag[450] == 3) con= 314
	    if(GS.flag[450] == 4) con= 319
	    if(GS.flag[450] == 5) con= 324
	    if(GS.flag[450] == 6) con= 329
	    if(GS.flag[450] == 7) con= 334
	    if(GS.flag[450] == 8) con= 339
	    if(GS.flag[450] == 9) con= 344
	    if(GS.flag[450] == 10) con= 349
	    if(GS.flag[450] == 11) con= 354
	    if(GS.flag[450] == 12) con= 359
	    if(GS.flag[450] == 13) con= 364
	    if(GS.flag[450] == 14) con= 369
	    if(GS.flag[450] == 15) con= 374
	    if(GS.flag[450] == 16) con= 379
	    if(GS.flag[450] == 17) {
	        con= 389
	        GS.faceemotion= 10
	    }
	}

func _gm_event_2_4():
	con++

func _process(delta: float):
	if(skipper == 1 and instance_exists(782/* OBJ_WRITER */)) {
	    if(keyboard_multicheck_pressed(1/* ANYKEY */) and alarm[4] > 10)
	        $Alarm4.start((10) / 30.0)
	    scr_textskip()
	}
	if(GS.turntimer < 2) {
	    instance_create(0, 0, 148/* obj_persistentfader */)
	    room_goto(GS.currentroom)
	    GS.invc= 0
	}
	if(GS.turntimer < 14 and not instance_exists(149/* obj_unfader */)) {
	    yyy= instance_create(0, 0, 149/* obj_unfader */)
	    yyy.tspeed= 0.08
	}
	if(off == 1) GS.turntimer--
	activetimer++
	if(con == 5 and activetimer == 15) {
	    GS.msc= 0
	    GS.typer= 55
	    GS.msg[0]= "A long time ago,&a human fell&into the RUINS./*"
	    blcon= instance_create(50, 20, 186/* obj_blconsm */)
	    blcon.sprite_index= 24/* spr_blconabove */
	    blconwd1= instance_create(80, 30, 782/* OBJ_WRITER */)
	    con= 6
	    $Alarm4.start((110) / 30.0)
	}
	if(con == 7 and instance_exists(782/* OBJ_WRITER */) and blconwd1.halt != 0) {
	    GS.msg[0]= "Injured by its&fall, the human&called out for&help./%%"
	    blcon2= instance_create(400, 20, 186/* obj_blconsm */)
	    blcon2.sprite_index= 24/* spr_blconabove */
	    blconwd2= instance_create(430, 30, 782/* OBJ_WRITER */)
	    con= 8
	}
	if(con == 8 and not is_instance_valid(blconwd2)) {
	    off= 1
	    // OBJ_WRITER
	    with(782) instance_destroy()
	    // obj_blconsm
	    with(186) instance_destroy()
	}
	if(con == 10 and activetimer == 15) {
	    GS.msc= 0
	    GS.typer= 55
	    GS.msg[0]= "ASRIEL^1, the king\'s&son^1, heard the&human\'s call./*"
	    blcon= instance_create(50, 20, 186/* obj_blconsm */)
	    blcon.sprite_index= 24/* spr_blconabove */
	    blconwd1= instance_create(80, 30, 782/* OBJ_WRITER */)
	    con= 11
	    $Alarm4.start((140) / 30.0)
	}
	if(con == 12 and instance_exists(782/* OBJ_WRITER */) and blconwd1.halt != 0) {
	    GS.msg[0]= "He brought the&human back to&the castle./%%"
	    blcon2= instance_create(400, 20, 186/* obj_blconsm */)
	    blcon2.sprite_index= 24/* spr_blconabove */
	    blconwd2= instance_create(430, 30, 782/* OBJ_WRITER */)
	    con= 13
	}
	if(con == 13 and not is_instance_valid(blconwd2)) {
	    off= 1
	    // OBJ_WRITER
	    with(782) instance_destroy()
	    // obj_blconsm
	    with(186) instance_destroy()
	}
	if(con == 15 and activetimer == 15) {
	    GS.msc= 0
	    GS.typer= 55
	    GS.msg[0]= "Over time^1, ASRIEL&and the human&became like&siblings./*"
	    blcon= instance_create(30, 20, 186/* obj_blconsm */)
	    blcon.sprite_index= 24/* spr_blconabove */
	    blconwd1= instance_create(60, 30, 782/* OBJ_WRITER */)
	    con= 16
	    $Alarm4.start((140) / 30.0)
	}
	if(con == 17) {
	    GS.msc= 0
	    GS.typer= 55
	    GS.msg[0]= "The King and&Queen treated the&human child as&their own./*"
	    blcon2= instance_create(220, 20, 186/* obj_blconsm */)
	    blcon2.sprite_index= 24/* spr_blconabove */
	    blconwd2= instance_create(250, 30, 782/* OBJ_WRITER */)
	    con= 18
	    $Alarm4.start((140) / 30.0)
	}
	if(con == 19 and instance_exists(782/* OBJ_WRITER */) and blconwd2.halt != 0) {
	    GS.msg[0]= "The underground&was full of&hope./%%"
	    blcon3= instance_create(420, 20, 186/* obj_blconsm */)
	    blcon3.sprite_index= 24/* spr_blconabove */
	    blconwd3= instance_create(450, 30, 782/* OBJ_WRITER */)
	    con= 20
	}
	if(con == 20 and not is_instance_valid(blconwd3)) {
	    off= 1
	    // OBJ_WRITER
	    with(782) instance_destroy()
	    // obj_blconsm
	    with(186) instance_destroy()
	}
	if(con == 25 and activetimer == 15) {
	    GS.msc= 0
	    GS.typer= 55
	    GS.msg[0]= "Then..^1.&One day.../*"
	    blcon= instance_create(50, 20, 186/* obj_blconsm */)
	    blcon.sprite_index= 24/* spr_blconabove */
	    blconwd1= instance_create(80, 30, 782/* OBJ_WRITER */)
	    con= 26
	    $Alarm4.start((70) / 30.0)
	}
	if(con == 27 and instance_exists(782/* OBJ_WRITER */) and blconwd1.halt != 0) {
	    GS.msg[0]= "The human became&very ill./%%"
	    blcon2= instance_create(400, 20, 186/* obj_blconsm */)
	    blcon2.sprite_index= 24/* spr_blconabove */
	    blconwd2= instance_create(430, 30, 782/* OBJ_WRITER */)
	    con= 28
	}
	if(con == 28 and not is_instance_valid(blconwd2)) {
	    off= 1
	    // OBJ_WRITER
	    with(782) instance_destroy()
	    // obj_blconsm
	    with(186) instance_destroy()
	}
	if(con == 30 and activetimer == 15) {
	    GS.msc= 0
	    GS.typer= 55
	    GS.msg[0]= "The sick human&had only one&request./*"
	    blcon= instance_create(30, 20, 186/* obj_blconsm */)
	    blcon.sprite_index= 24/* spr_blconabove */
	    blconwd1= instance_create(60, 30, 782/* OBJ_WRITER */)
	    con= 31
	    $Alarm4.start((80) / 30.0)
	}
	if(con == 32) {
	    GS.msc= 0
	    GS.typer= 55
	    GS.msg[0]= "To see the&flowers from&their village./*"
	    blcon2= instance_create(220, 20, 186/* obj_blconsm */)
	    blcon2.sprite_index= 24/* spr_blconabove */
	    blconwd2= instance_create(250, 30, 782/* OBJ_WRITER */)
	    con= 33
	    $Alarm4.start((90) / 30.0)
	}
	if(con == 34 and instance_exists(782/* OBJ_WRITER */) and blconwd2.halt != 0) {
	    GS.msg[0]= "But there was&nothing we could&do./%%"
	    blcon3= instance_create(420, 20, 186/* obj_blconsm */)
	    blcon3.sprite_index= 24/* spr_blconabove */
	    blconwd3= instance_create(450, 30, 782/* OBJ_WRITER */)
	    con= 35
	}
	if(con == 35 and not is_instance_valid(blconwd3)) {
	    off= 1
	    // OBJ_WRITER
	    with(782) instance_destroy()
	    // obj_blconsm
	    with(186) instance_destroy()
	}
	if(con == 40 and activetimer == 15) {
	    GS.msc= 0
	    GS.typer= 55
	    GS.msg[0]= "The next day./*"
	    blcon= instance_create(50, 20, 186/* obj_blconsm */)
	    blcon.sprite_index= 24/* spr_blconabove */
	    blconwd1= instance_create(80, 30, 782/* OBJ_WRITER */)
	    con= 41
	    $Alarm4.start((50) / 30.0)
	}
	if(con == 42 and instance_exists(782/* OBJ_WRITER */) and blconwd1.halt != 0) {
	    GS.msg[0]= "The next day./%%"
	    blcon2= instance_create(400, 20, 186/* obj_blconsm */)
	    blcon2.sprite_index= 24/* spr_blconabove */
	    blconwd2= instance_create(430, 30, 782/* OBJ_WRITER */)
	    con= 43
	}
	if(con == 43 and not is_instance_valid(blconwd2)) {
	    // OBJ_WRITER
	    with(782) instance_destroy()
	    // obj_blconsm
	    with(186) instance_destroy()
	    con= 44
	}
	if(con == 44) {
	    GS.msc= 0
	    GS.typer= 55
	    GS.msg[0]= ".../*"
	    blcon= instance_create(50, 20, 186/* obj_blconsm */)
	    blcon.sprite_index= 24/* spr_blconabove */
	    blconwd1= instance_create(80, 30, 782/* OBJ_WRITER */)
	    con= 45
	    $Alarm4.start((50) / 30.0)
	}
	if(con == 46 and instance_exists(782/* OBJ_WRITER */) and blconwd1.halt != 0) {
	    GS.msg[0]= "The human died./%%"
	    blcon2= instance_create(400, 20, 186/* obj_blconsm */)
	    blcon2.sprite_index= 24/* spr_blconabove */
	    blconwd2= instance_create(430, 30, 782/* OBJ_WRITER */)
	    con= 47
	}
	if(con == 47 and not is_instance_valid(blconwd2)) {
	    // OBJ_WRITER
	    with(782) instance_destroy()
	    // obj_blconsm
	    with(186) instance_destroy()
	    // obj_blconwdflowey
	    with(187) instance_destroy()
	    off= 1
	}
	if(con == 50 and activetimer == 15) {
	    GS.msc= 0
	    GS.typer= 55
	    GS.msg[0]= "ASRIEL^1, wracked&with grief^1,&absorbed the&human\'s SOUL./*"
	    blcon= instance_create(190, 20, 187/* obj_blconwdflowey */)
	    blconwd1= instance_create(230, 30, 782/* OBJ_WRITER */)
	    con= 51
	    $Alarm4.start((140) / 30.0)
	}
	if(con == 52 and instance_exists(782/* OBJ_WRITER */) and blconwd1.halt != 0) {
	    GS.msg[0]= "He transformed&into a being&with incredible&power./%%"
	    blcon2= instance_create(220, 130, 186/* obj_blconsm */)
	    blcon2.sprite_index= 30/* spr_blconwdshrt_l */
	    blconwd2= instance_create(260, 140, 782/* OBJ_WRITER */)
	    con= 47
	}
	if(con == 60 and activetimer == 15) {
	    GS.msc= 0
	    GS.typer= 55
	    GS.msg[0]= "With the human&SOUL^1, ASRIEL&crossed through&the barrier./*"
	    blcon= instance_create(30, 10, 186/* obj_blconsm */)
	    blcon.sprite_index= 24/* spr_blconabove */
	    blconwd1= instance_create(60, 20, 782/* OBJ_WRITER */)
	    con= 61
	    $Alarm4.start((140) / 30.0)
	}
	if(con == 62) {
	    GS.msc= 0
	    GS.typer= 55
	    GS.msg[0]= "He carried the&human\'s body&into the sunset./*"
	    blcon2= instance_create(220, 10, 186/* obj_blconsm */)
	    blcon2.sprite_index= 24/* spr_blconabove */
	    blconwd2= instance_create(250, 20, 782/* OBJ_WRITER */)
	    con= 63
	    $Alarm4.start((110) / 30.0)
	}
	if(con == 64 and instance_exists(782/* OBJ_WRITER */) and blconwd2.halt != 0) {
	    GS.msg[0]= "Back to the&village of the&humans./%%"
	    blcon3= instance_create(420, 10, 186/* obj_blconsm */)
	    blcon3.sprite_index= 24/* spr_blconabove */
	    blconwd3= instance_create(450, 20, 782/* OBJ_WRITER */)
	    con= 20
	}
	if(con == 70 and activetimer == 15) {
	    GS.msc= 0
	    GS.typer= 55
	    GS.msg[0]= "ASRIEL reached&the center of&the village./*"
	    blcon= instance_create(30, 10, 186/* obj_blconsm */)
	    blcon.sprite_index= 24/* spr_blconabove */
	    blconwd1= instance_create(60, 20, 782/* OBJ_WRITER */)
	    con= 71
	    $Alarm4.start((110) / 30.0)
	}
	if(con == 72) {
	    GS.msc= 0
	    GS.typer= 55
	    GS.msg[0]= "There^1, he&found a bed of&golden flowers./*"
	    blcon2= instance_create(220, 10, 186/* obj_blconsm */)
	    blcon2.sprite_index= 24/* spr_blconabove */
	    blconwd2= instance_create(250, 20, 782/* OBJ_WRITER */)
	    con= 73
	    $Alarm4.start((110) / 30.0)
	}
	if(con == 74 and instance_exists(782/* OBJ_WRITER */) and blconwd2.halt != 0) {
	    GS.msg[0]= "He carried&the human&onto it./%%"
	    blcon3= instance_create(420, 10, 186/* obj_blconsm */)
	    blcon3.sprite_index= 24/* spr_blconabove */
	    blconwd3= instance_create(450, 20, 782/* OBJ_WRITER */)
	    con= 20
	}
	if(con == 80 and activetimer == 15) {
	    GS.msc= 0
	    GS.typer= 55
	    GS.msg[0]= "Suddenly^1, screams&rang out./*"
	    blcon= instance_create(30, 10, 186/* obj_blconsm */)
	    blcon.sprite_index= 24/* spr_blconabove */
	    blconwd1= instance_create(60, 20, 782/* OBJ_WRITER */)
	    con= 81
	    $Alarm4.start((90) / 30.0)
	}
	if(con == 82) {
	    GS.msc= 0
	    GS.typer= 55
	    GS.msg[0]= "The villagers&saw ASRIEL&holding the&human\'s body./*"
	    blcon2= instance_create(220, 10, 186/* obj_blconsm */)
	    blcon2.sprite_index= 24/* spr_blconabove */
	    blconwd2= instance_create(250, 20, 782/* OBJ_WRITER */)
	    con= 83
	    $Alarm4.start((120) / 30.0)
	}
	if(con == 84 and instance_exists(782/* OBJ_WRITER */) and blconwd2.halt != 0) {
	    GS.msg[0]= "They thought&that he had&killed the&child./%%"
	    blcon3= instance_create(420, 10, 186/* obj_blconsm */)
	    blcon3.sprite_index= 24/* spr_blconabove */
	    blconwd3= instance_create(450, 20, 782/* OBJ_WRITER */)
	    con= 20
	}
	if(con == 90 and activetimer == 15) {
	    GS.msc= 0
	    GS.typer= 55
	    GS.msg[0]= "The humans&attacked him&with everything&they had./*"
	    blcon= instance_create(30, 10, 186/* obj_blconsm */)
	    blcon.sprite_index= 24/* spr_blconabove */
	    blconwd1= instance_create(60, 20, 782/* OBJ_WRITER */)
	    con= 91
	    $Alarm4.start((120) / 30.0)
	}
	if(con == 92) {
	    GS.msc= 0
	    GS.typer= 55
	    GS.msg[0]= "He was struck&with blow after&blow./*"
	    blcon2= instance_create(220, 10, 186/* obj_blconsm */)
	    blcon2.sprite_index= 24/* spr_blconabove */
	    blconwd2= instance_create(250, 20, 782/* OBJ_WRITER */)
	    con= 93
	    $Alarm4.start((100) / 30.0)
	}
	if(con == 94 and instance_exists(782/* OBJ_WRITER */) and blconwd2.halt != 0) {
	    GS.msg[0]= "ASRIEL had the&power to destroy&them all./%%"
	    blcon3= instance_create(420, 10, 186/* obj_blconsm */)
	    blcon3.sprite_index= 24/* spr_blconabove */
	    blconwd3= instance_create(450, 20, 782/* OBJ_WRITER */)
	    con= 20
	}
	if(con == 100 and activetimer == 15) {
	    GS.msc= 0
	    GS.typer= 55
	    GS.msg[0]= "But.../*"
	    blcon= instance_create(190, 20, 187/* obj_blconwdflowey */)
	    blconwd1= instance_create(230, 30, 782/* OBJ_WRITER */)
	    con= 101
	    $Alarm4.start((40) / 30.0)
	}
	if(con == 102 and instance_exists(782/* OBJ_WRITER */) and blconwd1.halt != 0) {
	    GS.msg[0]= "ASRIEL did not&fight back./%%"
	    blcon2= instance_create(220, 130, 186/* obj_blconsm */)
	    blcon2.sprite_index= 30/* spr_blconwdshrt_l */
	    blconwd2= instance_create(260, 140, 782/* OBJ_WRITER */)
	    con= 103
	}
	if(con == 103 and not is_instance_valid(blconwd2)) {
	    with(blcon2) instance_destroy()
	    // OBJ_WRITER
	    with(782) instance_destroy()
	    // obj_blconwdflowey
	    with(187) instance_destroy()
	    con= 104
	    $Alarm4.start((20) / 30.0)
	}
	if(con == 105) {
	    GS.msc= 0
	    GS.typer= 55
	    GS.msg[0]= "Clutching the&human.../*"
	    blcon= instance_create(190, 20, 187/* obj_blconwdflowey */)
	    blconwd1= instance_create(230, 30, 782/* OBJ_WRITER */)
	    con= 106
	    $Alarm4.start((50) / 30.0)
	}
	if(con == 107 and instance_exists(782/* OBJ_WRITER */) and blconwd1.halt != 0) {
	    GS.msg[0]= "ASRIEL smiled^1,&and walked away./%%"
	    blcon2= instance_create(220, 130, 186/* obj_blconsm */)
	    blcon2.sprite_index= 30/* spr_blconwdshrt_l */
	    blconwd2= instance_create(260, 140, 782/* OBJ_WRITER */)
	    con= 47
	}
	if(con == 110 and activetimer == 15) {
	    GS.msc= 0
	    GS.typer= 55
	    GS.msg[0]= "Wounded^1, ASRIEL&stumbled home./*"
	    blcon= instance_create(30, 10, 186/* obj_blconsm */)
	    blcon.sprite_index= 24/* spr_blconabove */
	    blconwd1= instance_create(60, 20, 782/* OBJ_WRITER */)
	    con= 111
	    $Alarm4.start((90) / 30.0)
	}
	if(con == 112) {
	    GS.msc= 0
	    GS.typer= 55
	    GS.msg[0]= "He entered the&castle and&collapsed./*"
	    blcon2= instance_create(220, 10, 186/* obj_blconsm */)
	    blcon2.sprite_index= 24/* spr_blconabove */
	    blconwd2= instance_create(250, 20, 782/* OBJ_WRITER */)
	    con= 113
	    $Alarm4.start((100) / 30.0)
	}
	if(con == 114 and instance_exists(782/* OBJ_WRITER */) and blconwd2.halt != 0) {
	    GS.msg[0]= "His dust spread&across the&garden./%%"
	    blcon3= instance_create(420, 10, 186/* obj_blconsm */)
	    blcon3.sprite_index= 24/* spr_blconabove */
	    blconwd3= instance_create(450, 20, 782/* OBJ_WRITER */)
	    con= 20
	}
	if(con == 120 and activetimer == 15) {
	    GS.msc= 0
	    GS.typer= 55
	    GS.msg[0]= "The kingdom fell&into despair./*"
	    blcon= instance_create(30, 10, 186/* obj_blconsm */)
	    blcon.sprite_index= 24/* spr_blconabove */
	    blconwd1= instance_create(60, 20, 782/* OBJ_WRITER */)
	    con= 121
	    $Alarm4.start((80) / 30.0)
	}
	if(con == 122) {
	    GS.msc= 0
	    GS.typer= 55
	    GS.msg[0]= "The king and&queen had lost&two children&in one night./*"
	    blcon2= instance_create(220, 10, 186/* obj_blconsm */)
	    blcon2.sprite_index= 24/* spr_blconabove */
	    blconwd2= instance_create(250, 20, 782/* OBJ_WRITER */)
	    con= 123
	    $Alarm4.start((120) / 30.0)
	}
	if(con == 124 and instance_exists(782/* OBJ_WRITER */) and blconwd2.halt != 0) {
	    GS.msg[0]= "The humans had&once again taken&everything&from us./%%"
	    blcon3= instance_create(420, 10, 186/* obj_blconsm */)
	    blcon3.sprite_index= 24/* spr_blconabove */
	    blconwd3= instance_create(450, 20, 782/* OBJ_WRITER */)
	    con= 20
	}
	if(con == 130 and activetimer == 15) {
	    GS.msc= 0
	    GS.typer= 55
	    GS.msg[0]= "The king decided&it was time to&end our&suffering./*"
	    blcon= instance_create(30, 10, 186/* obj_blconsm */)
	    blcon.sprite_index= 24/* spr_blconabove */
	    blconwd1= instance_create(60, 20, 782/* OBJ_WRITER */)
	    con= 131
	    $Alarm4.start((110) / 30.0)
	}
	if(con == 132) {
	    GS.msc= 0
	    GS.typer= 55
	    GS.msg[0]= "Every human who&falls down here&must die./*"
	    blcon2= instance_create(220, 10, 186/* obj_blconsm */)
	    blcon2.sprite_index= 24/* spr_blconabove */
	    blconwd2= instance_create(250, 20, 782/* OBJ_WRITER */)
	    con= 133
	    $Alarm4.start((100) / 30.0)
	}
	if(con == 134 and instance_exists(782/* OBJ_WRITER */) and blconwd2.halt != 0) {
	    GS.msg[0]= "With enough souls^1,&we can shatter&the barrier&forever./%%"
	    blcon3= instance_create(420, 10, 186/* obj_blconsm */)
	    blcon3.sprite_index= 24/* spr_blconabove */
	    blconwd3= instance_create(450, 20, 782/* OBJ_WRITER */)
	    con= 20
	}
	if(con == 140 and activetimer == 15) {
	    GS.msc= 0
	    GS.typer= 55
	    GS.msg[0]= "It\'s not long&now./%%"
	    blcon2= instance_create(220, 20, 186/* obj_blconsm */)
	    blcon2.sprite_index= 24/* spr_blconabove */
	    blconwd2= instance_create(250, 30, 782/* OBJ_WRITER */)
	    con= 141
	}
	if(con == 141 and not is_instance_valid(blconwd2)) {
	    // OBJ_WRITER
	    with(782) instance_destroy()
	    with(blcon2) instance_destroy()
	    GS.msg[0]= "King ASGORE&will let us&go.   /*"
	    blcon= instance_create(30, 20, 186/* obj_blconsm */)
	    blcon.sprite_index= 24/* spr_blconabove */
	    blconwd1= instance_create(60, 30, 782/* OBJ_WRITER */)
	    GS.msg[0]= "King ASGORE&will give us&hope./*"
	    blcon2= instance_create(220, 20, 186/* obj_blconsm */)
	    blcon2.sprite_index= 24/* spr_blconabove */
	    blconwd2= instance_create(250, 30, 782/* OBJ_WRITER */)
	    GS.msg[0]= "King ASGORE&will save us&all. /%%"
	    blcon3= instance_create(420, 20, 186/* obj_blconsm */)
	    blcon3.sprite_index= 24/* spr_blconabove */
	    blconwd3= instance_create(450, 30, 782/* OBJ_WRITER */)
	    con= 142
	}
	if(con == 142 and not is_instance_valid(blconwd3)) {
	    // obj_blconsm
	    with(186) instance_destroy()
	    // OBJ_WRITER
	    with(782) instance_destroy()
	    off= 1
	    con= 143
	}
	if(con == 150 and activetimer == 15) {
	    GS.msc= 0
	    GS.typer= 55
	    GS.msg[0]= "You should be&smiling^1, too./*"
	    blcon= instance_create(170, 15, 187/* obj_blconwdflowey */)
	    blconwd1= instance_create(210, 25, 782/* OBJ_WRITER */)
	    con= 151
	    $Alarm4.start((85) / 30.0)
	}
	if(con == 152) {
	    con= 153
	    GS.msg[0]= "Aren\'t&you&excited?/*"
	    blcon2= instance_create(300, 120, 186/* obj_blconsm */)
	    blconwd2= instance_create(325, 130, 782/* OBJ_WRITER */)
	    $Alarm4.start((60) / 30.0)
	}
	if(con == 154) {
	    con= 155
	    GS.msg[0]= "Aren\'t&you&happy?/%%"
	    blcon3= instance_create(530, 120, 186/* obj_blconsm */)
	    blconwd3= instance_create(555, 130, 782/* OBJ_WRITER */)
	}
	if(con == 155 and not is_instance_valid(blconwd3)) {
	    // obj_blconsm
	    with(186) instance_destroy()
	    // OBJ_WRITER
	    with(782) instance_destroy()
	    off= 1
	    con= 156
	}
	if(con == 160 and activetimer == 15) {
	    GS.msc= 0
	    GS.typer= 55
	    con= 161
	    GS.msg[0]= "You\'re going&to be free./%%"
	    blcon2= instance_create(220, 20, 186/* obj_blconsm */)
	    blcon2.sprite_index= 24/* spr_blconabove */
	    blconwd2= instance_create(250, 30, 782/* OBJ_WRITER */)
	}
	if(con == 161 and not is_instance_valid(blconwd2)) {
	    ini_open("undertale.ini")
	    ini_write_real("General", "Tale", 1)
	    ini_close()
	    con= 162
	    with(blcon2) instance_destroy()
	    off= 1
	}
	if(con == 300) {
	    GS.typer= 98
	    GS.msc= 0
	    GS.msg[0]= "\\E0Howdy^1, " + GS.charname + "!/"
	    GS.msg[1]= "You finally made&it home./"
	    GS.msg[2]= "\\E0Remember when we&used to play here?/"
	    GS.msg[3]= "\\E0Hee hee hee.../"
	    GS.msg[4]= "Boy!/"
	    GS.msg[5]= "\\E9Today\'s gonna be&just as fun./%%"
	    scr_blcon_x(floweyx + 90, floweyy - 10)
	    con= 301
	}
	if(con == 301 and not instance_exists(782/* OBJ_WRITER */)) {
	    off= 1
	    con= 302
	}
	if(con == 305) {
	    GS.typer= 98
	    GS.msc= 0
	    GS.msg[0]= "\\E1I remember when I&first woke up here^1,&in the garden./"
	    GS.msg[1]= "I was so scared./"
	    GS.msg[2]= "\\E2I couldn\'t feel my&arms or my legs.../"
	    GS.msg[3]= "\\E1My entire body had&turned into a&flower!/"
	    GS.msg[4]= "\\E5" + chr(ord('"')) + "Mom^1! Dad^1!&Somebody help me^1!" + chr(ord('"')) + "&I called out./"
	    GS.msg[5]= "\\E9But nobody came./%%"
	    scr_blcon_x(floweyx + 90, floweyy - 10)
	    con= 301
	}
	if(con == 310) {
	    GS.typer= 98
	    GS.msc= 0
	    GS.msg[0]= "\\E1Eventually^1, the king&found me^1, crying in&the garden./"
	    GS.msg[1]= "I explained what had&happened to him./"
	    GS.msg[2]= "Then he held me^1,&" + GS.charname + "./"
	    GS.msg[3]= "He held me with&tears in his eyes^1,&saying.../"
	    GS.msg[4]= "" + chr(ord('"')) + "There^1, there^1.&Everything is going&to be alright." + chr(ord('"')) + "/"
	    GS.msg[5]= "He was so..^1.&Emotional./"
	    GS.msg[6]= "\\E1But..^1.&For some reason.../"
	    GS.msg[7]= "\\E1I didn\'t feel&anything at all./%%"
	    scr_blcon_x(floweyx + 90, floweyy - 10)
	    con= 301
	}
	if(con == 315) {
	    GS.typer= 98
	    GS.msc= 0
	    GS.msg[0]= "\\E1I soon realized I&didn\'t feel ANYTHING&about ANYONE./"
	    GS.msg[1]= "My compassion had&disappeared!/"
	    GS.msg[2]= "\\E7And believe me^1,&it\'s not like I&wasn\'t trying./"
	    GS.msg[3]= "\\E3I wasted weeks with&that stupid king^1,&vainly hoping I would&feel something./"
	    GS.msg[4]= "\\E1But it became too&much for me./"
	    GS.msg[5]= "I ran away from&home./"
	    GS.msg[6]= "Eventually^1, I reached&the RUINS./"
	    GS.msg[7]= "\\E0Inside I found HER^1,&" + GS.charname + "./"
	    GS.msg[8]= "I thought of all&people^1, SHE could&make me feel whole&again./"
	    GS.msg[9]= "\\E1.../"
	    GS.msg[10]= "\\E7She failed./"
	    GS.msg[11]= "\\E6Ha ha.../%%"
	    scr_blcon_x(floweyx + 90, floweyy - 10)
	    con= 301
	}
	if(con == 320) {
	    GS.typer= 98
	    GS.msc= 0
	    GS.msg[0]= "\\E1I realized those two&were useless./"
	    GS.msg[1]= "I became despondent./"
	    GS.msg[2]= "I just wanted to&love someone./"
	    GS.msg[3]= "I just wanted to&care about someone./"
	    GS.msg[4]= GS.charname + "^1, you might&not believe this.../"
	    GS.msg[5]= "\\E2But I decided..^1.&It wasn\'t worth&living anymore./"
	    GS.msg[6]= "\\E7Not in a world&without love./"
	    GS.msg[7]= "\\E6Not in a world&without you./"
	    GS.msg[8]= "\\E1So.../"
	    GS.msg[9]= "\\E0I decided to follow&in your footsteps./"
	    GS.msg[10]= "\\E1I would erase myself&from existence./"
	    GS.msg[11]= "\\E1And you know what?/"
	    GS.msg[12]= "\\E0I succeeded./%%"
	    scr_blcon_x(floweyx + 90, floweyy - 10)
	    con= 301
	}
	if(con == 325) {
	    GS.typer= 98
	    GS.msc= 0
	    GS.msg[0]= "\\E1But as I left this&mortal coil.../"
	    GS.msg[1]= "I started to feel&apprehensive./"
	    GS.msg[2]= "\\E9If you don\'t have&a SOUL^1, what happens&when you...?/"
	    GS.msg[3]= "\\E1Something primal&started to burn&inside me./"
	    GS.msg[4]= "" + chr(ord('"')) + "No^1," + chr(ord('"')) + " I thought^1.&" + chr(ord('"')) + "I don\'t want to&die!" + chr(ord('"')) + "/"
	    GS.msg[5]= ".../"
	    GS.msg[6]= "Then I woke up./"
	    GS.msg[7]= "Like it was all&just a bad dream./"
	    GS.msg[8]= "I was back at the&garden./"
	    GS.msg[9]= "\\E0Back at my&" + chr(ord('"')) + "save point." + chr(ord('"')) + "/%%"
	    scr_blcon_x(floweyx + 90, floweyy - 10)
	    con= 301
	}
	if(con == 330) {
	    GS.typer= 98
	    GS.msc= 0
	    GS.msg[0]= "Interested^1, I decided&to experiment./"
	    GS.msg[1]= "Again and again^1, I&brought myself to&the edge of death./"
	    GS.msg[2]= "At any point^1, I&could have let this&world continue on&without me./"
	    GS.msg[3]= "But as long as I&was determined to&live.../"
	    GS.msg[4]= "\\E0I could go back./"
	    GS.msg[5]= "\\E6Amazing^1, isn\'t it^1,&" + GS.charname + "?/"
	    GS.msg[6]= "\\E0I was amazed^1, too./%%"
	    scr_blcon_x(floweyx + 90, floweyy - 10)
	    con= 301
	}
	if(con == 335) {
	    GS.typer= 98
	    GS.msc= 0
	    GS.msg[0]= "\\E1At first^1, I used my&powers for good./"
	    GS.msg[1]= "\\E0I became " + chr(ord('"')) + "friends" + chr(ord('"')) + "&with everyone./"
	    GS.msg[2]= "I solved all their&problems flawlessly./"
	    GS.msg[3]= "Their companionship&was amusing.../"
	    GS.msg[4]= "\\E1For a while. /"
	    GS.msg[5]= "\\E1As time repeated^1,&people proved&themselves&predictable./"
	    GS.msg[6]= "What would this&person say if I&gave them this?/"
	    GS.msg[7]= "What would they do&if I said this to&them?/"
	    GS.msg[8]= "Once you know the&answer^1, that\'s it./"
	    GS.msg[9]= "That\'s all they are./%%"
	    scr_blcon_x(floweyx + 90, floweyy - 10)
	    con= 301
	}
	if(con == 340) {
	    GS.typer= 98
	    GS.msc= 0
	    GS.msg[0]= "\\E1It all started&because I was&curious./"
	    GS.msg[1]= "\\E0Curious what would&happen if I killed&them./"
	    GS.msg[2]= "\\E2" + chr(ord('"')) + "I don\'t like this^1," + chr(ord('"')) + "&I told my/"
	    GS.msg[3]= "\\E1" + chr(ord('"')) + "I\'m just doing this&because I HAVE to&know what happens./"
	    GS.msg[4]= "\\E8Ha ha ha..^1.&What an excuse!/"
	    GS.msg[5]= "\\E9You of all people&must know how&liberating it is to&act this way./"
	    GS.msg[6]= "\\E8At least we\'re better&than those sickos&that stand around and&WATCH it happen.../"
	    GS.msg[7]= "\\E9Those pathetic people&that want to see it^1,&but are too weak to&do it themselves./"
	    GS.msg[8]= "\\E0I bet someone like&that\'s watching right&now^1, aren\'t they...?/%%"
	    scr_blcon_x(floweyx + 90, floweyy - 10)
	    con= 301
	}
	if(con == 345) {
	    GS.typer= 98
	    GS.msc= 0
	    GS.msg[0]= "\\E1Nowadays^1, even that\'s&grown tiring./"
	    GS.msg[1]= "\\E7You understand^1,&" + GS.charname + "./"
	    GS.msg[2]= "\\E6I\'ve done everything&this world has to&offer./"
	    GS.msg[3]= "\\E1I\'ve read every book^1.&I\'ve burned every&book./"
	    GS.msg[4]= "I\'ve won every game^1.&I\'ve lost every game./"
	    GS.msg[5]= "I\'ve appeased&everyone^1.&I\'ve killed everyone./"
	    GS.msg[6]= "Sets of numbers..^1.&Lines of dialogue..^1.&I\'ve seen them all./"
	    GS.msg[7]= "\\E1But you..^1.&YOU\'RE different./"
	    GS.msg[8]= "\\E0I never could&predict YOU^1, " + GS.charname + "./%%"
	    scr_blcon_x(floweyx + 90, floweyy - 10)
	    con= 301
	}
	if(con == 350) {
	    GS.typer= 98
	    GS.msc= 0
	    GS.msg[0]= "\\E1When I saw you in&the RUINS^1, I didn\'t&recognize you./"
	    GS.msg[1]= "\\E8I thought I could&frighten you^1, then&steal your SOUL./"
	    GS.msg[2]= "\\E1I failed./"
	    GS.msg[3]= "\\E0And when I tried&to load my save&file.../"
	    GS.msg[4]= "\\E1It didn\'t work./"
	    GS.msg[5]= "\\E9" + GS.charname + "..^1.&Your DETERMINATION!/"
	    GS.msg[6]= "\\E8Somehow^1, it\'s even&greater than mine!/%%"
	    scr_blcon_x(floweyx + 90, floweyy - 10)
	    con= 301
	}
	if(con == 355) {
	    GS.typer= 98
	    GS.msc= 0
	    GS.msg[0]= "\\E1I just have one&question for you^1,&" + GS.charname + "./"
	    GS.msg[1]= "How did you get&back to the RUINS&from here...?/"
	    GS.msg[2]= "\\E0... wait^1, I know./"
	    GS.msg[3]= "She must have taken&you when she left./"
	    GS.msg[4]= "\\E1And decided to give&you a proper burial^1,&rather than.../"
	    GS.msg[5]= "\\E0Hanging out in the&basement forever./"
	    GS.msg[6]= "\\E1... but^1, why then...?/"
	    GS.msg[7]= "What made you wake&up?/"
	    GS.msg[8]= "\\E6Did you hear me&calling you...?/%%"
	    scr_blcon_x(floweyx + 90, floweyy - 10)
	    con= 301
	}
	if(con == 360) {
	    GS.typer= 98
	    GS.msc= 0
	    GS.msg[0]= "\\E1It doesn\'t matter&now./"
	    GS.msg[1]= "\\E1I\'m so tired of&this^1, " + GS.charname + "./"
	    GS.msg[2]= "I\'m tired of all&these people./"
	    GS.msg[3]= "I\'m tired of all&these places./"
	    GS.msg[4]= "I\'m tired of being&a flower./"
	    GS.msg[5]= GS.charname + "./"
	    GS.msg[6]= "\\E0There\'s just one&thing left I want&to do./"
	    GS.msg[7]= "Let\'s finish what we&started./"
	    GS.msg[8]= "Let\'s free everyone./"
	    GS.msg[9]= "\\E8Then..^1. let\'s let&them see what&humanity is&REALLY like!/"
	    GS.msg[10]= "\\E6That despite it all.../"
	    GS.msg[11]= "\\E9This world is still&" + chr(ord('"')) + "kill or be killed!!" + chr(ord('"')) + "/%%"
	    scr_blcon_x(floweyx + 90, floweyy - 10)
	    con= 301
	}
	if(con == 365) {
	    GS.typer= 98
	    GS.msc= 0
	    GS.msg[0]= "\\E1Then...?/"
	    GS.msg[1]= "\\E7Well^1.&I had.../"
	    GS.msg[2]= "\\E9Been entertaining a&few ways to use&that power./"
	    GS.msg[3]= "\\E8Hee hee hee.../"
	    GS.msg[4]= "\\E1.../"
	    GS.msg[5]= "\\E1But seeing you here&changed my mind./"
	    GS.msg[6]= "\\E6" + GS.charname + "..^1.&I think if you\'re&around.../"
	    GS.msg[7]= "\\E7Just living in the&surface world&doesn\'t seem so bad./%%"
	    scr_blcon_x(floweyx + 90, floweyy - 10)
	    con= 301
	}
	if(con == 370) {
	    GS.typer= 98
	    GS.msc= 0
	    GS.msg[0]= "\\E0We don\'t even need&to leave to get&them this time./"
	    GS.msg[1]= "The king has six of&them locked away./"
	    GS.msg[2]= "\\E1I\'ve tried hundreds&of ways to get him&to show me them.../"
	    GS.msg[3]= "\\E3But he just won\'t./"
	    GS.msg[4]= "\\E1" + GS.charname + ".../"
	    GS.msg[5]= "\\E0I know he\'ll do it&for YOU./%%"
	    scr_blcon_x(floweyx + 90, floweyy - 10)
	    con= 301
	}
	if(con == 375) {
	    GS.typer= 98
	    GS.msc= 0
	    GS.msg[0]= "\\E0Why am I telling&you all of this?/"
	    GS.msg[1]= "\\E6" + GS.charname + "^1, I said it&before./"
	    GS.msg[2]= "\\E1Even after all this&time.../"
	    GS.msg[3]= "\\E0You\'re still the&only one that&understands me./"
	    GS.msg[4]= "\\E8You won\'t give me&any worthless pity!/%%"
	    scr_blcon_x(floweyx + 90, floweyy - 10)
	    con= 301
	}
	if(con == 380) {
	    GS.typer= 98
	    GS.msc= 0
	    GS.msg[0]= "\\E9Creatures like us.../"
	    GS.msg[1]= "\\E0Wouldn\'t hesitate to&KILL each other if&we got in each&other\'s way./"
	    GS.msg[2]= "\\E0So that\'s.../"
	    GS.msg[3]= "\\E1So..^1. that\'s..^1.&Why.../%%"
	    scr_blcon_x(floweyx + 90, floweyy - 10)
	    con= 381
	}
	if(con == 381 and instance_exists(782/* OBJ_WRITER */) and con == 381 and OBJ_WRITER.stringno == 1)
	    caster_free(GS.currentsong)
	if(con == 381 and not instance_exists(782/* OBJ_WRITER */)) {
	    caster_free(-3)
	    con= 382
	    $Alarm4.start((45) / 30.0)
	}
	if(con == 383) {
	    GS.currentsong= caster_load("music/prebattle1.ogg")
	    caster_loop(GS.currentsong, 0.9, 0.22)
	    shake= 1
	    GS.typer= 99
	    GS.msg[0]= "\\E2.../"
	    GS.msg[1]= "\\E2... ha..^1.&Ha.../"
	    GS.msg[2]= "\\E6... what\'s this..^1.&... feeling?/"
	    GS.msg[3]= "Why am I..^1.&Shaking?/"
	    GS.msg[4]= ".../"
	    GS.msg[5]= "Hey..^1. " + GS.charname + "..^1.&No hard feelings about&back then^1, right?/"
	    GS.msg[6]= ".../"
	    GS.msg[7]= "\\E4H-Hey^1, what are you&doing!?/"
	    GS.msg[8]= "B..^1. back off!!/%%"
	    scr_blcon_x(floweyx + 90, floweyy - 10)
	    con= 384
	}
	if(con == 384 and instance_exists(782/* OBJ_WRITER */) and OBJ_WRITER.stringno == 5)
	    GS.faceemotion= 10
	if(con == 384 and not instance_exists(782/* OBJ_WRITER */)) off= 1
	if(con == 390) {
	    shake= 0.75
	    GS.typer= 99
	    GS.msc= 0
	    GS.msg[0]= "I..^1. I\'ve changed&my mind about all&this./"
	    GS.msg[1]= "This isn\'t a good&idea anymore./"
	    GS.msg[2]= "Y-you should go back^1,&" + GS.charname + "./"
	    GS.msg[3]= "\\E0This place is fine&the way it is!/"
	    GS.msg[4]= ".../"
	    GS.msg[5]= "\\E4S-s-stop making that&creepy face!/"
	    GS.msg[6]= "This isn\'t funny!/"
	    GS.msg[7]= "You\'ve got a SICK&sense of humor!/%%"
	    scr_blcon_x(floweyx + 90, floweyy - 10)
	    con= 301
	}

func _on_outside_room():
	if(flowey == 1) {
	    scr_textskip()
	    draw_sprite_ext(166/* spr_floweynice */, 0, floweyx + random(shake) - random(shake), floweyy + random(shake) - random(shake), 2, 2, 0, 16777215, modulate.a)
	    draw_sprite_ext(646/* spr_floweyface_l3 */, GS.faceemotion, floweyx + random(shake) - random(shake), floweyy + random(shake) - random(shake), 2, 2, 0, 16777215, modulate.a)
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
