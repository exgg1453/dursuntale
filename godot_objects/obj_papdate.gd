# Auto-converted from GameMaker: obj_papdate
extends Node2D

func _ready():
	instance_create(0, 0, 147/* obj_fader */)
	GS.faceemotion= 0
	GS.facechoice= 0
	face_speed= 0.2
	face_index= 0
	cn= -2
	$Alarm2.start((15) / 30.0)
	GS.inbattle= 1
	joke= 0
	choice= 0
	choicer= 0
	GS.border= 11
	SCR_BORDERSETUP(0)
	instance_create(0, 0, 759/* obj_uborder */)
	instance_create(0, 0, 761/* obj_dborder */)
	instance_create(0, 0, 758/* obj_lborder */)
	instance_create(0, 0, 760/* obj_rborder */)
	datemusic= caster_load("music/date.ogg")
	datefight= caster_load("music/date_fight.ogg")
	datetense= caster_load("music/date_tense.ogg")
	datevolume= 1
	sha= 0
	haty= 0
	blcon= 5475834
	present= 0
	graph= 4384134
	friendgraph= instance_create(256, -64, 161/* obj_friendgraph */)
	textskip= 1

func _gm_event_2_3():
	if(sha == 0) sha= x
	x= sha + shudder
	if(shudder < 0) shudder= -(shudder + 1)
	else  shudder= -shudder
	if(shudder == 0) {
	    sha= 0
	    cn++
	    exit
	} else  {
	    $Alarm3.start((3) / 30.0)
	    if(cn > 60) $Alarm3.start((2) / 30.0)
	    if(cn > 71) $Alarm3.start((1) / 30.0)
	    exit
	}

func _gm_event_2_2():
	cn++

func _process(delta: float):
	if(instance_exists(187/* obj_blconwdflowey */) and textskip == 1)
	    scr_textskip()
	if(cn == -1) {
	    GS.typer= 1
	    GS.msc= 0
	    if(GS.flag[66] == 1) GS.msg[0]= "        DATING^1  START!^5 %%"
	    else  GS.msg[0]= "        HANGOUT^1 START!^5 %%"
	    instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	    cn= 0
	}
	if(cn == 0 and not instance_exists(782/* OBJ_WRITER */))
	    face_index= 0
	if(cn == 0 and not instance_exists(782/* OBJ_WRITER */)) {
	    caster_loop(datemusic, 1, 1)
	    GS.faceemotion= 0
	    GS.facechoice= 0
	    GS.msc= 0
	    blcon= instance_create(x + 145, y + 22, 187/* obj_blconwdflowey */)
	    GS.typer= 22
	    GS.msg[0]= "HERE WE ARE!^1!&"
	    if(GS.flag[66] == 1) GS.msg[0]+= "ON OUR DATE!!/"
	    else  GS.msg[0]+= "HANGING OUT!!/"
	    GS.msg[1]= "\\E3I\'VE ACTUALLY&NEVER DONE THIS&BEFORE./"
	    GS.msg[2]= "\\E0BUT DON\'T WORRY!!!/"
	    GS.msg[3]= "YOU CAN\'T SPELL&\'PREPARED\' WITHOUT&SEVERAL LETTERS&FROM MY NAME!!!/%%"
	    blconwd= instance_create(blcon.x + 25, blcon.y + 10, 782/* OBJ_WRITER */)
	    cn= 1
	}
	if(cn == 1 and not instance_exists(782/* OBJ_WRITER */)) {
	    with(blcon) instance_destroy()
	    GS.facechoice= 5
	    frame= 0
	    image_speed= 0.25
	    snd_play(47/* snd_grab */)
	    cn= 2
	}
	if(cn == 2 and frame >= 2) {
	    image_speed= 0
	    frame= 2
	    cn= 3
	    $Alarm2.start((10) / 30.0)
	}
	if(cn == 4) {
	    blcon= instance_create(x + 145, y + 22, 187/* obj_blconwdflowey */)
	    GS.typer= 22
	    GS.msg[0]= "I SNAGGED AN&OFFICIAL&"
	    if(GS.flag[66] == 1)
	        GS.msg[0]+= "DATING RULEBOOK"
	    else  GS.msg[0]+= "HANGOUT GUIDEBOOK"
	    GS.msg[0]+= "&FROM THE LIBRARY!/"
	    GS.msg[1]= "WE\'RE READY TO&HAVE A GREAT&TIME!/"
	    GS.msg[2]= "\\F4 \\E8 %"
	    GS.msg[3]= "LET\'S SEE.../"
	    GS.msg[4]= "\\XSTEP ONE..^1. PRESS&THE [ C ] KEY ON&YOUR KEYBOARD FOR&"
	    if(GS.flag[66] == 1)
	        GS.msg[4]+= "" + chr(ord('"')) + "\\RDATING HUD\\X." + chr(ord('"')) + "/"
	    else  GS.msg[4]+= "" + chr(ord('"')) + "\\RFRIENDSHIP HUD\\X." + chr(ord('"')) + "/"
	    if(joke == 1) {
	        GS.msg[5]= "\\E3I THINK YOU&ALREADY DID&THAT.../%%"
	        cn= 6
	        $Alarm2.start((-1) / 30.0)
	    } else  GS.msg[4]+= "%%"
	    blconwd= instance_create(blcon.x + 25, blcon.y + 10, 782/* OBJ_WRITER */)
	    cn= 5.1
	}
	if(cn == 5.1) {
	    if(not instance_exists(782/* OBJ_WRITER */) and is_instance_valid(blcon)) {
	        with(blcon) instance_destroy()
	        if(joke == 0) $Alarm2.start((400) / 30.0)
	    }
	    if(joke == 1) {
	        GS.msg[5]= "\\E3I THINK YOU&ALREADY DID&THAT.../%%"
	        cn= 4.3
	        $Alarm2.start((90) / 30.0)
	    }
	}
	if(cn == 5.3) {
	    GS.faceemotion= 0
	    cn= 6
	}
	if(cn == 6.1) {
	    GS.msg[0]= "\\E3.../"
	    GS.msg[1]= "\\E3OKAY^1, FORGET IT./%%"
	    blcon= instance_create(x + 145, y + 22, 187/* obj_blconwdflowey */)
	    blconwd= instance_create(blcon.x + 25, blcon.y + 10, 782/* OBJ_WRITER */)
	    cn= 6
	}
	if(cn < 5.2 and joke == 0 and keyboard_multicheck_pressed(2/* UNKNOWN(2) */)) {
	    if(cn == 5.1) {
	        if(instance_exists(782/* OBJ_WRITER */)) {
	            // OBJ_WRITER
	            with(782) instance_destroy()
	        }
	        if(is_instance_valid(blcon)) {
	            with(blcon) instance_destroy()
	        }
	    }
	    snd_play(110/* snd_swallow */)
	    joke= 1
	    graph= instance_create(256, -20, 165/* obj_daygraph */)
	    graph.friction= 0.2
	    graph.velocity.y= 4
	    graph2= instance_create(-440, 64, 164/* obj_specialgraph */)
	    graph2.velocity.x= 10
	    graph2.friction= 0.1
	    graph3= instance_create(-460, 160, 168/* obj_populationgraph */)
	    graph3.velocity.x= 10
	    graph3.friction= 0.1
	    graph4= instance_create(-420, 256, 163/* obj_egggraph */)
	    graph4.velocity.x= 10
	    graph4.friction= 0.1
	    graph5= instance_create(980, 80, 167/* obj_radar */)
	    graph5.velocity.x= -10
	    graph5.friction= 0.1
	    graph6= instance_create(1020, 244, 166/* obj_crimegraph */)
	    graph6.velocity.x= -10
	    graph6.friction= 0.1
	}
	if(cn == 6 and not instance_exists(782/* OBJ_WRITER */)) {
	    if(is_instance_valid(blcon)) {
	        with(blcon) instance_destroy()
	    }
	    blcon= instance_create(x + 145, y + 22, 187/* obj_blconwdflowey */)
	    GS.typer= 22
	    if(joke == 1)
	        GS.msg[0]= "\\E0WOWIE!!^1!&I FEEL SO&INFORMED!!!/"
	    else  GS.msg[0]= " %"
	    GS.msg[1]= "I THINK WE\'RE&READY FOR STEP&TWO!!!/"
	    GS.msg[2]= "\\F4 \\E8 %"
	    GS.msg[3]= "" + chr(ord('"')) + "STEP TWO..^1.&ASK THEM&"
	    if(GS.flag[66] == 1) GS.msg[3]+= "ON A DATE." + chr(ord('"')) + "/"
	    else  GS.msg[3]+= "TO HANG OUT." + chr(ord('"')) + "/"
	    GS.msg[4]= "\\E0A\\F0HEM!/"
	    GS.msg[5]= "\\E1HUMAN^1!&I^1, THE GREAT&PAPYRUS.../"
	    if(GS.flag[66] == 1)
	        GS.msg[6]= "WILL GO ON&A DATE WITH&YOU!!!/*"
	    else  GS.msg[6]= "WILL HANG OUT&WITH YOU!!!/*"
	    blconwd= instance_create(blcon.x + 25, blcon.y + 10, 782/* OBJ_WRITER */)
	    cn= 7
	}
	if(cn == 7 and not instance_exists(782/* OBJ_WRITER */) and OBJ_WRITER.stringno == 6 and OBJ_WRITER.halt != 0) {
	    choice= 0
	    choicer= 1
	    GS.typer= 1
	    GS.msg[0]= "                              &   Yes             No       &                            "
	    iii= instance_create(GS.idealborder[0], GS.idealborder[2], 785/* OBJ_INSTAWRITER */)
	    with(iii) halt= 0
	    cn= 8
	}
	if(cn == 8 and choicer == 2) {
	    if(is_instance_valid(blconwd)) {
	        with(blconwd) instance_destroy()
	    }
	    if(instance_exists(782/* OBJ_WRITER */)) {
	        // OBJ_WRITER
	        with(782) instance_destroy()
	    }
	    if(is_instance_valid(blcon)) {
	        with(blcon) instance_destroy()
	    }
	    cn= 9
	    choicer= 0
	    $Alarm2.start((10) / 30.0)
	}
	if(cn == 10) {
	    blcon= instance_create(x + 145, y + 22, 187/* obj_blconwdflowey */)
	    GS.typer= 22
	    if(choice == 0) {
	        GS.faceemotion= 9
	        GS.facechoice= 3
	        GS.msg[0]= "R-REALLY??^1?&WOWIE!!!/"
	    } else  {
	        GS.faceemotion= 0
	        GS.facechoice= 4
	        GS.msg[0]= "FORTUNATELY^1, IT&ONLY SAYS TO&ASK!!!/"
	    }
	    GS.msg[1]= "\\E0I GUESS THAT&MEANS IT\'S&TIME FOR PART&THREE!!!/"
	    GS.msg[2]= "\\F4 \\E8 %"
	    GS.msg[3]= "" + chr(ord('"')) + "STEP THREE..^1.&PUT ON NICE&CLOTHES TO&SHOW YOU CARE!" + chr(ord('"')) + "/"
	    GS.msg[4]= "\\E3.../%%"
	    blconwd= instance_create(blcon.x + 25, blcon.y + 10, 782/* OBJ_WRITER */)
	    cn= 11
	}
	if(cn == 11 and not instance_exists(782/* OBJ_WRITER */)) {
	    if(is_instance_valid(blcon)) {
	        with(blcon) instance_destroy()
	    }
	    datevolume-= 0.02
	    if(datevolume < 0.05) {
	        datevolume= 0
	        cn= 12
	        caster_stop(datemusic)
	    }
	    caster_set_volume(datemusic, datevolume)
	    joke= 0
	}
	if(cn == 12) {
	    blcon= instance_create(x + 145, y + 22, 187/* obj_blconwdflowey */)
	    GS.typer= 22
	    GS.facechoice= 0
	    GS.msg[0]= "\\E3WAIT A SECOND./%%"
	    blconwd= instance_create(blcon.x + 25, blcon.y + 10, 782/* OBJ_WRITER */)
	    cn= 13
	}
	if(cn == 13 and not instance_exists(782/* OBJ_WRITER */)) {
	    caster_loop(datetense, 1, 1)
	    cn= 14
	    GS.msg[0]= "" + chr(ord('"')) + "WEAR CLOTHING..." + chr(ord('"')) + "/"
	    GS.msg[1]= "THAT THING ON&YOUR BODY.../"
	    if(GS.armor == 4)
	        GS.msg[1]= "THAT BANDAGE&HANGING OFF&OF YOU.../"
	    if(GS.armor == 12) GS.msg[1]= "THAT RIBBON IN&YOUR HAIR.../"
	    if(GS.armor == 15)
	        GS.msg[1]= "THAT BANDANNA&AROUND YOUR&HEAD.../"
	    if(GS.armor == 24) GS.msg[1]= "THAT TUTU AROUND&YOUR WAIST.../"
	    if(GS.armor == 44) GS.msg[1]= "THOSE GLASSES ON&YOUR FACE.../"
	    if(GS.armor == 46) GS.msg[1]= "THAT APRON YOU&PUT ON.../"
	    if(GS.armor == 48) GS.msg[1]= "THAT COWBOY HAT&ON YOUR HEAD.../"
	    if(GS.armor == 50) GS.msg[1]= "THAT LOCKET&AROUND YOUR NECK./"
	    GS.msg[2]= "\\E1YOU\'RE WEARING&CLOTHING RIGHT&NOW!!!/"
	    GS.msg[3]= "\\E3NOT ONLY THAT.../"
	    GS.msg[4]= "\\E1EARLIER TODAY^1,&YOU WERE ALSO&WEARING CLOTHING!/"
	    GS.msg[5]= "\\F3 \\E2 %"
	    GS.msg[6]= "NO..^1.&COULD IT BE???/"
	    GS.msg[7]= "\\F0 \\E1 %"
	    if(GS.flag[66] == 1)
	        GS.msg[8]= "YOU\'VE WANTED TO&DATE ME FROM&THE VERY&BEGINNING!??/*"
	    else 
	        GS.msg[8]= "YOU\'VE WANTED TO&HANG OUT WITH&ME FROM THE&VERY BEGINNING!??/*"
	    blconwd= instance_create(blcon.x + 25, blcon.y + 10, 782/* OBJ_WRITER */)
	}
	if(cn == 14 and not instance_exists(782/* OBJ_WRITER */) and OBJ_WRITER.stringno == 8 and OBJ_WRITER.halt != 0) {
	    choice= 0
	    choicer= 1
	    GS.typer= 1
	    GS.msg[0]= "                              &   Yes             No       &                            "
	    iii= instance_create(GS.idealborder[0], GS.idealborder[2], 785/* OBJ_INSTAWRITER */)
	    with(iii) halt= 0
	    cn= 15
	}
	if(cn == 15 and choicer == 2) {
	    if(is_instance_valid(blconwd)) {
	        with(blconwd) instance_destroy()
	    }
	    if(instance_exists(782/* OBJ_WRITER */)) {
	        // OBJ_WRITER
	        with(782) instance_destroy()
	    }
	    if(instance_exists(782/* OBJ_WRITER */)) {
	        // OBJ_WRITER
	        with(782) instance_destroy()
	    }
	    if(is_instance_valid(blcon)) {
	        with(blcon) instance_destroy()
	    }
	    cn= 16
	    choicer= 0
	}
	if(cn == 16) {
	    caster_stop(datetense)
	    snd_play(51/* snd_damage */)
	    shudder= 10
	    GS.faceemotion= 6
	    $Alarm3.start((1) / 30.0)
	    instance_create(0, 0, 118/* obj_flasher */)
	    g= instance_create(0, 0, 184/* obj_shaker */)
	    g.vshake= 4
	    g.hshake= 4
	    g.shakespeed= 2
	    cn= 17
	    joke= 2
	    if(instance_exists(162/* obj_graphparent */)) obj_graphparent.die= 1
	}
	if(cn == 18) {
	    cn= 19
	    $Alarm2.start((20) / 30.0)
	}
	if(cn == 20) {
	    cn= 20.1
	    GS.typer= 22
	    blcon= instance_create(x + 145, y + 22, 187/* obj_blconwdflowey */)
	    if(choice == 0) {
	        GS.msg[0]= "NO!!/"
	        GS.msg[1]= "YOU PLANNED IT&ALL!!!/"
	        if(GS.flag[66] == 1) {
	            GS.msg[2]= "YOU\'RE WAY BETTER&AT DATING THAN&I AM!!!/"
	            GS.msg[3]= "\\XN\\E6-NOOOO!!!&YOUR \\BDATING POWER\\X &...!!!/%%"
	        } else  {
	            GS.msg[2]= "YOU\'RE WAY BETTER&AT HANGING OUT&THAN I AM!!!/"
	            GS.msg[3]= "\\XN\\E6-NOOOO!!!&YOUR \\BFRIENDSHIP&POWER\\X!!!/%%"
	        }
	    } else  {
	        GS.msg[0]= "\\E3DESPITE THAT^1, YOU&CHOSE TO WEAR&CLOTHING TODAY^1, OF&ALL DAYS...?/"
	        if(GS.flag[66] == 1) {
	            GS.msg[1]= "\\E2WAS YOUR INTEREST&IN ME.../"
	            GS.msg[3]= "\\XN\\E6-NOOOO!!!&YOUR \\BDATING POWER\\X &...!!!/%%"
	        } else  {
	            GS.msg[1]= "\\E2WAS YOUR&FRIENDSHIP.../"
	            GS.msg[3]= "\\XN\\E6-NOOOO!!!&YOUR \\BFRIENDSHIP&POWER\\X!!!/%%"
	        }
	        GS.msg[2]= "\\F3PREDESTINED!?!?/"
	    }
	    blconwd= instance_create(blcon.x + 25, blcon.y + 10, 782/* OBJ_WRITER */)
	}
	if(cn == 20.1 and not instance_exists(782/* OBJ_WRITER */)) {
	    friendgraph.y= 64
	    friendgraph.ideallength= 50
	    if(not is_instance_valid(blcon)) {
	        with(blcon) instance_destroy()
	    }
	    snd_play(51/* snd_damage */)
	    shudder= 10
	    GS.faceemotion= 6
	    $Alarm3.start((1) / 30.0)
	    instance_create(0, 0, 118/* obj_flasher */)
	    g= instance_create(0, 0, 184/* obj_shaker */)
	    g.vshake= 4
	    g.hshake= 4
	    g.shakespeed= 2
	    cn= 19.2
	}
	if(cn == 20.2) {
	    cn= 20.3
	    $Alarm2.start((20) / 30.0)
	}
	if(cn == 21.3 and not instance_exists(782/* OBJ_WRITER */)) {
	    if(is_instance_valid(blcon)) {
	        with(blcon) instance_destroy()
	    }
	    cn= 22
	    $Alarm2.start((10) / 30.0)
	    friendgraph.velocity.y= -8
	}
	if(cn == 23) {
	    cn= 24
	    GS.typer= 22
	    GS.faceemotion= 7
	    blcon= instance_create(x + 145, y + 22, 187/* obj_blconwdflowey */)
	    GS.msg[0]= "NYEH!/"
	    GS.msg[1]= "NYEH HEH HEH!!!/%%"
	    blconwd= instance_create(blcon.x + 25, blcon.y + 10, 782/* OBJ_WRITER */)
	}
	if(cn == 24 and not instance_exists(782/* OBJ_WRITER */)) {
	    cn= 25
	    caster_loop(datefight, 0.85, 1)
	    graph3= instance_create(-100, 160, 168/* obj_populationgraph */)
	    graph3.velocity.x= 6
	    graph3.friction= 0.1
	    graph3.tough= 1
	    GS.msg[0]= "\\F0DON\'T THINK YOU\'VE&BESTED ME YET!/"
	    GS.msg[1]= "I^1, THE GREAT&PAPYRUS.../"
	    if(GS.flag[66] == 1) {
	        GS.msg[2]= "HAVE NEVER BEEN&BEATEN AT DATING^1,&AND I NEVER WILL!/"
	        GS.msg[7]= "JUST IN CASE&SOMEBODY HAPPENS&TO ASK ME ON&A DATE!!!/"
	    } else  {
	        GS.msg[2]= "HAVE NEVER BEEN&BEATEN AT HANGING&OUT^1, AND I NEVER&WILL!/"
	        GS.msg[7]= "JUST IN CASE&SOMEONE WANTS&TO HANG OUT!/"
	    }
	    GS.msg[3]= "\\E0I CAN EASILY&KEEP UP WITH&YOU!!!/"
	    GS.msg[4]= "\\E1YOU SEE^1,&I^1, TOO^1, CAN WEAR&CLOTHING!!!/"
	    GS.msg[5]= "\\E3IN FACT.../"
	    GS.msg[6]= "\\E1I ALWAYS WEAR MY&" + chr(ord('"')) + "SPECIAL" + chr(ord('"')) + " CLOTHES&UNDERNEATH MY&REGULAR CLOTHES!!/"
	    GS.msg[8]= "\\E0BEHOLD!!!/%%"
	    blconwd= instance_create(blcon.x + 25, blcon.y + 10, 782/* OBJ_WRITER */)
	}
	if(cn == 25 and not instance_exists(782/* OBJ_WRITER */)) {
	    if(not is_instance_valid(blcon)) {
	        with(blcon) instance_destroy()
	    }
	    velocity.x= 20
	    $Alarm2.start((30) / 30.0)
	    cn= 26
	}
	if(cn == 27) {
	    GS.facechoice= 1
	    velocity.x= -20
	    cn= 28
	    $Alarm2.start((30) / 30.0)
	}
	if(cn == 29 and not instance_exists(782/* OBJ_WRITER */)) {
	    velocity.x= 0
	    blcon= instance_create(x + 145, y + 22, 187/* obj_blconwdflowey */)
	    cn= 30
	    GS.msg[0]= "\\E1NYEH!&WHAT DO YOU&THINK OF MY&SECRET STYLE!?!/*"
	    blconwd= instance_create(blcon.x + 25, blcon.y + 10, 782/* OBJ_WRITER */)
	}
	if(cn == 30 and not instance_exists(782/* OBJ_WRITER */) and OBJ_WRITER.halt != 0) {
	    choice= 0
	    choicer= 1
	    GS.typer= 1
	    GS.msg[0]= "                              &   I love it       I hate it&                            "
	    iii= instance_create(GS.idealborder[0], GS.idealborder[2], 785/* OBJ_INSTAWRITER */)
	    with(iii) halt= 0
	    cn= 31
	}
	if(cn == 31 and choicer == 2) {
	    if(is_instance_valid(blconwd)) {
	        with(blconwd) instance_destroy()
	    }
	    if(instance_exists(782/* OBJ_WRITER */)) {
	        // OBJ_WRITER
	        with(782) instance_destroy()
	    }
	    if(instance_exists(782/* OBJ_WRITER */)) {
	        // OBJ_WRITER
	        with(782) instance_destroy()
	    }
	    if(is_instance_valid(blcon)) {
	        with(blcon) instance_destroy()
	    }
	    cn= 33
	    choicer= 0
	    $Alarm2.start((10) / 30.0)
	}
	if(cn == 34) {
	    GS.typer= 22
	    blcon= instance_create(x + 145, y + 22, 187/* obj_blconwdflowey */)
	    cn= 35
	    GS.msg[0]= "\\E6NO!!!/"
	    if(choice == 0) GS.msg[1]= "A GENUINE&COMPLIMENT...!!!/%%"
	    else 
	        GS.msg[1]= "YOUR HONESTY...^1!&IT SHOWS HOW&MUCH YOU REALLY&CARE!!!/%%"
	    blconwd= instance_create(blcon.x + 25, blcon.y + 10, 782/* OBJ_WRITER */)
	}
	if(cn == 35 and not instance_exists(782/* OBJ_WRITER */)) {
	    friendgraph.y= 64
	    friendgraph.velocity.y= 0
	    friendgraph.ideallength= 100
	    if(not is_instance_valid(blcon)) {
	        with(blcon) instance_destroy()
	    }
	    snd_play(51/* snd_damage */)
	    shudder= 10
	    GS.faceemotion= 6
	    $Alarm3.start((1) / 30.0)
	    instance_create(0, 0, 118/* obj_flasher */)
	    g= instance_create(0, 0, 184/* obj_shaker */)
	    g.vshake= 4
	    g.hshake= 4
	    g.shakespeed= 2
	    cn= 36
	}
	if(cn == 37) {
	    cn= 38
	    datevolume= 1
	    $Alarm2.start((20) / 30.0)
	    if(instance_exists(168/* obj_populationgraph */)) {
	        obj_populationgraph.velocity.x= -6
	        obj_populationgraph.friction= 0
	    }
	}
	if(cn == 39) {
	    datevolume-= 0.02
	    if(datevolume < 0.05) {
	        datevolume= 0
	        cn= 40
	        caster_stop(datefight)
	    }
	    caster_set_volume(datefight, datevolume)
	}
	if(cn == 40) {
	    if(instance_exists(168/* obj_populationgraph */)) {
	        // obj_populationgraph
	        with(168) instance_destroy()
	    }
	    GS.typer= 22
	    blcon= instance_create(x + 145, y + 22, 187/* obj_blconwdflowey */)
	    cn= 41
	    GS.msg[0]= "\\E3HOWEVER.../"
	    GS.msg[1]= "\\XY\\E0OU DON\'T TRULY&UNDERSTAND THE\\R &HIDDEN POWER\\X OF&THIS OUTFIT!!!/"
	    GS.msg[2]= "\\E3THEREFORE.../%%"
	    blconwd= instance_create(blcon.x + 25, blcon.y + 10, 782/* OBJ_WRITER */)
	}
	if(cn == 41 and not instance_exists(782/* OBJ_WRITER */)) {
	    cn= 42
	    caster_loop(datetense, 1, 1)
	    GS.msg[0]= "\\E1WHAT YOU JUST&SAID IS INVALID!!!/"
	    if(GS.flag[66] == 1)
	        GS.msg[1]= "THIS DATE WON\'T&ESCALATE ANY&FURTHER!!!/"
	    if(GS.flag[66] == 0)
	        GS.msg[1]= "THIS HANG-OUT&WON\'T ESCALATE&ANY FURTHER!/"
	    GS.msg[2]= "\\X.\\E7.. UNLESS&YOU FIND \\RMY&SECRET\\X!!/"
	    GS.msg[3]= "BUT THAT WON\'T&HAPPEN!!/%%"
	    blconwd= instance_create(blcon.x + 25, blcon.y + 10, 782/* OBJ_WRITER */)
	    friendgraph.ideallength= 80
	}
	if(cn == 42 and not instance_exists(782/* OBJ_WRITER */)) {
	    textskip= 0
	    GS.idealborder[2]+= 35
	    cn= 43
	    $Alarm2.start((15) / 30.0)
	}
	if(cn == 44 and not instance_exists(782/* OBJ_WRITER */)) {
	    friendgraph.velocity.y= -8
	    if(is_instance_valid(blcon)) {
	        with(blcon) instance_destroy()
	    }
	    GS.typer= 1
	    GS.msg[0]= "* (Move and inspect with [Z].)"
	    iii= instance_create(GS.idealborder[0], GS.idealborder[2], 785/* OBJ_INSTAWRITER */)
	    with(iii) halt= 999
	    instance_create(320, GS.idealborder[2] - 30, 749/* obj_dateheart */)
	    cn= 45
	}
	if(cn == 47) {
	    textskip= 1
	    if(is_instance_valid(iii)) {
	        with(iii) instance_destroy()
	    }
	    GS.idealborder[2]-= 35
	    cn= 48
	    GS.typer= 22
	    blcon= instance_create(x + 145, y + 22, 187/* obj_blconwdflowey */)
	    GS.msg[0]= "\\E3MY HAT...?/"
	    GS.msg[1]= "\\E8MY HAT./"
	    GS.msg[2]= "\\E0MY HAT!/"
	    GS.msg[3]= "NYEH HEH HEH!/%%"
	    blconwd= instance_create(blcon.x + 25, blcon.y + 10, 782/* OBJ_WRITER */)
	}
	if(cn == 48 and not instance_exists(782/* OBJ_WRITER */)) {
	    with(blcon) instance_destroy()
	    haty--
	    if(haty < -23) cn= 49
	}
	if(cn == 49) {
	    cn= 50
	    blcon= instance_create(x + 145, y + 22, 187/* obj_blconwdflowey */)
	    GS.msg[0]= "W-WELL THEN..^1.&YOU FOUND MY&SECRET!/"
	    GS.msg[1]= "I SUPPOSE I HAVE&NO CHOICE!/"
	    GS.msg[2]= "IT\'S A PRESENT.../"
	    GS.msg[3]= "A PRESENT J-JUST&FOR YOU!!!/"
	    GS.msg[4]= "GO AHEAD^1!&OPEN IT!/*"
	    blconwd= instance_create(blcon.x + 25, blcon.y + 10, 782/* OBJ_WRITER */)
	}
	if(cn == 50 and not instance_exists(782/* OBJ_WRITER */) and OBJ_WRITER.halt != 0 and OBJ_WRITER.stringno == 3) {
	    choice= 0
	    choicer= 1
	    GS.typer= 1
	    GS.msg[0]= "                              &   Open it         Don\'t    &                            "
	    iii= instance_create(GS.idealborder[0], GS.idealborder[2], 785/* OBJ_INSTAWRITER */)
	    with(iii) halt= 0
	    cn= 51
	}
	if(cn == 51 and choicer == 2) {
	    if(is_instance_valid(blconwd)) {
	        with(blconwd) instance_destroy()
	    }
	    if(instance_exists(782/* OBJ_WRITER */)) {
	        // OBJ_WRITER
	        with(782) instance_destroy()
	    }
	    if(instance_exists(782/* OBJ_WRITER */)) {
	        // OBJ_WRITER
	        with(782) instance_destroy()
	    }
	    if(is_instance_valid(blcon)) {
	        with(blcon) instance_destroy()
	    }
	    cn= 52
	    choicer= 0
	    $Alarm2.start((10) / 30.0)
	}
	if(cn == 53) {
	    GS.typer= 22
	    cn= 54
	    if(choice == 1) {
	        GS.msg[0]= "\\E2YOU CAN\'T EVEN&BRING YOURSELF TO&HARM MY DELICATE&WRAPPING??/"
	        GS.msg[1]= "\\E7N-NO..^1.&THAT TECHNIQUE!/"
	        GS.msg[2]= "\\E6IT\'S TOO STRONG!/"
	        GS.msg[3]= "\\E7COUNTERATTACK^1!&I\'LL OPEN THE&PRESENT MYSELF!!/%%"
	        blcon= instance_create(x + 145, y + 22, 187/* obj_blconwdflowey */)
	        blconwd= instance_create(blcon.x + 25, blcon.y + 10, 782/* OBJ_WRITER */)
	    }
	}
	if(cn == 54 and not instance_exists(782/* OBJ_WRITER */)) {
	    if(is_instance_valid(blcon)) {
	        with(blcon) instance_destroy()
	    }
	    snd_play(108/* snd_item */)
	    present= 1
	    cn= 55
	    $Alarm2.start((30) / 30.0)
	}
	if(cn == 56) {
	    cn= 57
	    GS.msg[0]= "\\E0DO YOU KNOW WHAT&THIS IS?/*"
	    blcon= instance_create(x + 145, y + 22, 187/* obj_blconwdflowey */)
	    blconwd= instance_create(blcon.x + 25, blcon.y + 10, 782/* OBJ_WRITER */)
	}
	if(cn == 57 and not instance_exists(782/* OBJ_WRITER */) and OBJ_WRITER.halt != 0) {
	    choice= 0
	    choicer= 1
	    GS.typer= 1
	    GS.msg[0]= "                              &   Of course       No idea  &                            "
	    iii= instance_create(GS.idealborder[0], GS.idealborder[2], 785/* OBJ_INSTAWRITER */)
	    with(iii) halt= 0
	    cn= 58
	}
	if(cn == 58 and choicer == 2) {
	    if(is_instance_valid(blconwd)) {
	        with(blconwd) instance_destroy()
	    }
	    if(instance_exists(782/* OBJ_WRITER */)) {
	        // OBJ_WRITER
	        with(782) instance_destroy()
	    }
	    if(instance_exists(782/* OBJ_WRITER */)) {
	        // OBJ_WRITER
	        with(782) instance_destroy()
	    }
	    if(is_instance_valid(blcon)) {
	        with(blcon) instance_destroy()
	    }
	    cn= 59
	    choicer= 0
	    $Alarm2.start((10) / 30.0)
	}
	if(cn == 60) {
	    friendgraph.x= -180
	    friendgraph.y= 144
	    friendgraph.velocity.y= 0
	    caster_stop(datetense)
	    GS.typer= 22
	    if(choice == 0) {
	        GS.msg[0]= "\\E0" + chr(ord('"')) + "SPAGHETTI." + chr(ord('"')) + "/"
	        GS.msg[1]= "\\E3THAT\'S WHAT&YOU\'RE THINKING^1,&ISN\'T IT?/"
	        GS.msg[2]= "\\E0RIGHT!/"
	        GS.msg[3]= "\\E1BUT OH-SO WRONG!/%%"
	    } else  {
	        GS.msg[0]= "\\E0NYEH HEH HEH^1!&THAT\'S RIGHT./"
	        GS.msg[1]= "YOU HAVE NO IDEA!/"
	        GS.msg[2]= "\\E3THOUGH THIS&APPEARS TO BE&SPAGHETTI.../%%"
	    }
	    cn= 61
	    blcon= instance_create(x + 145, y + 22, 187/* obj_blconwdflowey */)
	    blconwd= instance_create(blcon.x + 25, blcon.y + 10, 782/* OBJ_WRITER */)
	}
	if(cn == 61 and not instance_exists(782/* OBJ_WRITER */)) {
	    friendgraph.velocity.x= 10
	    if(friendgraph.x > 90) friendgraph.velocity.x= 0
	    cn= 62
	    caster_loop(datefight, 0.85, 1)
	    GS.msg[0]= "\\E1THIS AIN\'T ANY&PLAIN OL\' PASTA!/"
	    GS.msg[1]= "\\E0THIS IS AN&ARTISAN\'S WORK!/"
	    GS.msg[2]= "\\E3SILKEN SPAGHETTI^1,&FINELY AGED IN&AN OAKEN CASK.../"
	    GS.msg[3]= "\\E0THEN COOKED BY&ME^1, MASTER CHEF&PAPYRUS!/"
	    GS.msg[4]= "\\E1HUMAN!!^1!&IT\'S TIME TO&END THIS!!/"
	    GS.msg[5]= "THERE\'S NO WAY&THIS CAN GO&ANY FURTHER!/"
	    GS.msg[6]= "EAT THIS^1!&MY ULTIMATE&TECHNIQUE!!!/*"
	    blconwd= instance_create(blcon.x + 25, blcon.y + 10, 782/* OBJ_WRITER */)
	}
	if(cn >= 61 and friendgraph.x > 70) friendgraph.velocity.x= 0
	if(cn == 62 and not instance_exists(782/* OBJ_WRITER */) and OBJ_WRITER.halt != 0 and OBJ_WRITER.stringno == 5) {
	    if(friendgraph.x > 90) friendgraph.velocity.x= 0
	    choice= 0
	    choicer= 1
	    GS.typer= 1
	    GS.msg[0]= "                              &   Eat it          Refuse   &                            "
	    iii= instance_create(GS.idealborder[0], GS.idealborder[2], 785/* OBJ_INSTAWRITER */)
	    with(iii) halt= 0
	    cn= 63
	}
	if(cn == 63 and choicer == 2) {
	    if(friendgraph.x > 90) friendgraph.velocity.x= 0
	    if(is_instance_valid(blconwd)) {
	        with(blconwd) instance_destroy()
	    }
	    if(instance_exists(782/* OBJ_WRITER */)) {
	        // OBJ_WRITER
	        with(782) instance_destroy()
	    }
	    if(instance_exists(782/* OBJ_WRITER */)) {
	        // OBJ_WRITER
	        with(782) instance_destroy()
	    }
	    if(is_instance_valid(blcon)) {
	        with(blcon) instance_destroy()
	    }
	    cn= 64
	    if(choice == 1) cn= 65.5
	    choicer= 0
	    $Alarm2.start((10) / 30.0)
	}
	if(cn == 65) {
	    cn= 66.5
	    GS.typer= 1
	    GS.msg[0]= "* (You take a small bite.)/"
	    GS.msg[1]= "* (Your face reflexively&  scrunches up.)/"
	    GS.msg[2]= "* (The taste is indescribable...)/%%"
	    iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	    with(iii) halt= 0
	}
	if(cn == 66.5 and instance_exists(782/* OBJ_WRITER */)) {
	    face_index= 0
	    if(friendgraph.x > 90) friendgraph.velocity.x= 0
	}
	if(cn == 66.5 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.typer= 22
	    if(is_instance_valid(iii)) {
	        with(iii) instance_destroy()
	    }
	    cn= 67
	    if(choice == 0) {
	        GS.msg[0]= "\\E0WHAT A PASSIONATE&EXPRESSION!!!/"
	        GS.msg[1]= "\\E3YOU MUST REALLY&LOVE MY COOKING!/"
	        GS.msg[2]= "\\E2AND BY EXTENSION^1,&ME!!!/"
	        GS.msg[3]= "\\E6MAYBE EVEN MORE&THAN I DO!!!/%%"
	    }
	    if(choice == 1) {
	        GS.msg[0]= "\\E3YOU MEAN.../"
	        GS.msg[1]= "\\E2YOU\'RE LETTING ME&HAVE IT INSTEAD?/"
	        GS.msg[2]= "\\E2BECAUSE YOU KNOW&HOW MUCH I LOVE&PASTA.../"
	        GS.msg[3]= "\\E6IMPOSSIBLE!^1!&TAKING MY PRESENT&AND TURNING IT&AROUND ON ME!/%%"
	    }
	    blcon= instance_create(x + 145, y + 22, 187/* obj_blconwdflowey */)
	    blconwd= instance_create(blcon.x + 25, blcon.y + 10, 782/* OBJ_WRITER */)
	}
	if(cn == 67 and not instance_exists(782/* OBJ_WRITER */)) {
	    cn= 68
	    friendgraph.ideallength= 100
	    GS.msg[0]= "AUGH!!^5!%%"
	    blconwd= instance_create(blcon.x + 25, blcon.y + 10, 782/* OBJ_WRITER */)
	    snd_play(51/* snd_damage */)
	    shudder= 10
	    GS.faceemotion= 6
	    $Alarm3.start((1) / 30.0)
	    instance_create(0, 0, 118/* obj_flasher */)
	    g= instance_create(0, 0, 184/* obj_shaker */)
	    g.vshake= 4
	    g.hshake= 4
	    g.shakespeed= 2
	}
	if(cn == 69) {
	    cn= 70
	    friendgraph.ideallength= 120
	    GS.msg[0]= "URRRGH!!^5!%%"
	    if(instance_exists(782/* OBJ_WRITER */)) {
	        // OBJ_WRITER
	        with(782) instance_destroy()
	    }
	    blconwd= instance_create(blcon.x + 25, blcon.y + 10, 782/* OBJ_WRITER */)
	    snd_play(51/* snd_damage */)
	    shudder= 14
	    GS.faceemotion= 6
	    $Alarm3.start((1) / 30.0)
	    instance_create(0, 0, 118/* obj_flasher */)
	    g= instance_create(0, 0, 184/* obj_shaker */)
	    g.vshake= 4
	    g.hshake= 4
	    g.shakespeed= 2
	}
	if(cn == 71) {
	    caster_stop(datefight)
	    cn= 72
	    friendgraph.ideallength= 999
	    GS.msg[0]= "NOOOOOOOO!!^4!%%"
	    if(instance_exists(782/* OBJ_WRITER */)) {
	        // OBJ_WRITER
	        with(782) instance_destroy()
	    }
	    blconwd= instance_create(blcon.x + 25, blcon.y + 10, 782/* OBJ_WRITER */)
	    snd_play(51/* snd_damage */)
	    shudder= 18
	    GS.faceemotion= 6
	    $Alarm3.start((1) / 30.0)
	    instance_create(0, 0, 118/* obj_flasher */)
	    g= instance_create(0, 0, 184/* obj_shaker */)
	    g.vshake= 4
	    g.hshake= 4
	    g.shakespeed= 2
	}
	if(cn == 73) {
	    with(blcon) instance_destroy()
	    cn= 74
	    g= instance_create(0, 0, 150/* obj_whitefader */)
	    g.tspeed= 0.01
	    $Alarm2.start((110) / 30.0)
	}
	if(cn == 75) {
	    friendgraph.x= 999
	    papyrus= caster_load("music/papyrus.ogg")
	    cn= 76
	    view_wview[0]= 320
	    view_hview[0]= 240
	    GS.typer= 22
	    if(GS.flag[66] == 1) {
	        GS.msg[0]= "HUMAN^1.&IT\'S CLEAR NOW./"
	        GS.msg[1]= "YOU\'RE MADLY IN&LOVE WITH ME./"
	        GS.msg[2]= "EVERYTHING YOU DO^1.&EVERYTHING&YOU SAY./"
	        GS.msg[3]= "IT\'S ALL BEEN&FOR MY SAKE./"
	        GS.msg[4]= "HUMAN^1. I WANT&YOU TO BE&HAPPY^1, TOO./"
	        GS.msg[5]= "IT\'S TIME FOR ME&TO EXPRESS MY&FEELINGS./"
	        GS.msg[6]= "IT\'S TIME THAT&I TOLD YOU./"
	        GS.msg[7]= "I^1, PAPYRUS.../%%"
	    } else  {
	        GS.msg[0]= "HUMAN^1.&IT\'S CLEAR NOW./"
	        GS.msg[1]= "YOU\'RE COMPLETELY&OBSESSED WITH ME./"
	        GS.msg[2]= "EVERYTHING YOU DO^1.&EVERYTHING&YOU SAY./"
	        GS.msg[3]= "IT\'S ALL BEEN&FOR MY SAKE./"
	        GS.msg[4]= "HUMAN^1. I WANT&YOU TO BE&HAPPY^1,TOO./"
	        GS.msg[5]= "IT\'S TIME FOR ME&TO EXPRESS MY&FEELINGS./"
	        GS.msg[6]= "IT\'S TIME THAT&I TOLD YOU./"
	        GS.msg[7]= "\\E8I^1, PAPYRUS.../%%"
	    }
	    myw= instance_create(60, 100, 782/* OBJ_WRITER */)
	    myw.z_index= -100000
	}
	if(cn == 76 and not instance_exists(782/* OBJ_WRITER */)) {
	    g.modulate.a= 1
	    g.tspeed= -0.05
	    cn= 77
	    $Alarm2.start((20) / 30.0)
	    view_hview[0]= 480
	    view_wview[0]= 640
	}
	if(cn == 78) {
	    cn= 79
	    GS.faceemotion= 8
	    if(GS.flag[66] == 1) {
	        GS.msg[0]= "I.../"
	        GS.msg[1]= "UM.../"
	        GS.msg[2]= "\\E4BOY^1, IS IT HOT&IN HERE^1, OR IS&IT JUST ME??/"
	        GS.msg[3]= "\\E4.../"
	        GS.msg[4]= "\\E5OH^1, SHOOT./"
	        GS.msg[5]= "HUMAN^1, I.../"
	        GS.msg[6]= "I\'M SORRY./"
	        GS.msg[7]= "I DON\'T LIKE YOU&THE WAY YOU&LIKE ME./"
	        GS.msg[8]= "\\E4ROMANTICALLY^1,&I MEAN./"
	        GS.msg[9]= "\\E6I MEAN^1, I TRIED&VERY HARD TO!/"
	        GS.msg[10]= "\\E8I THOUGHT THAT&BECAUSE YOU&FLIRTED WITH ME.../"
	        GS.msg[11]= "THAT I WAS&SUPPOSED&TO GO ON A&DATE WITH YOU./"
	        GS.msg[12]= "\\E0THEN^1, ON THE DATE^1,&FEELINGS WOULD&BLOSSOM FORTH!!!/"
	        GS.msg[13]= "\\E2I WOULD BE ABLE&TO MATCH YOUR&PASSION FOR ME!/"
	        GS.msg[14]= "\\E4BUT ALAS..^1.&I^1, THE GREAT&PAPYRUS.../"
	        GS.msg[15]= "\\E5HAVE FAILED./"
	        GS.msg[16]= "I FEEL JUST THE&SAME AS BEFORE./"
	        GS.msg[17]= "AND INSTEAD^1, BY&DATING YOU.../"
	        GS.msg[18]= "I HAVE ONLY DRAWN&YOU DEEPER.../"
	        GS.msg[19]= "\\E6INTO YOUR INTENSE&LOVE FOR ME!/"
	        GS.msg[20]= "\\E5A DARK PRISON OF&PASSION^1, WITH NO&ESCAPE./"
	        GS.msg[21]= "HOW COULD I HAVE&DONE THIS TO MY&DEAR FRIEND...?/"
	        GS.msg[22]= ".../"
	        GS.msg[23]= "\\E6NO^1! WAIT^1!&THAT\'S WRONG!/"
	        GS.msg[24]= "I CAN\'T FAIL AT&ANYTHING!!!/"
	        GS.msg[25]= "\\E1HUMAN!!^1!&I\'LL HELP YOU&THROUGH THESE&TRYING TIMES!!!/"
	        GS.msg[26]= "\\E0I\'LL KEEP BEING&YOUR COOL&FRIEND.../"
	        GS.msg[27]= "\\E8AND ACT LIKE THIS&ALL NEVER&HAPPENED./"
	        GS.msg[28]= "\\E0AFTER ALL^1, YOU&ARE VERY GREAT./"
	        GS.msg[29]= "\\E5IT WOULD BE&TRAGIC TO LOSE&YOUR FRIENDSHIP./"
	        GS.msg[30]= "\\E0SO PLEASE..../"
	        GS.msg[31]= "\\E5DON\'T CRY BECAUSE&I WON\'T KISS YOU./"
	        GS.msg[32]= "\\E4BECAUSE^1, I DON\'T&EVEN HAVE LIPS./"
	        GS.msg[33]= "\\E0AND HEY^1, SOMEDAY^1,&YOU\'LL FIND&SOMEONE AS&GREAT AS ME./"
	        GS.msg[34]= "\\E8WELL, NO^1.&THAT\'S NOT TRUE./"
	        GS.msg[35]= "\\E0BUT I\'LL HELP YOU&SETTLE FOR&SECOND BEST!!!/"
	        GS.msg[36]= "NYEH HEH HEH&HEH HEH!!!/%%"
	    } else  {
	        caster_loop(papyrus, 1, 1)
	        GS.faceemotion= 8
	        GS.msg[0]= "\\E8HMM.../"
	        GS.msg[1]= "\\E0WELL^1, I\'M FLATTERED&YOU CARE SO MUCH./"
	        GS.msg[2]= "\\E4BUT MAYBE COOL&IT A LITTLE BIT...?/"
	        GS.msg[3]= "\\E0YOU ARE A VERY&NICE PERSON./"
	        GS.msg[4]= "I\'M GLAD WE\'RE&FRIENDS./"
	        GS.msg[5]= "\\E8BUT^1, I THINK YOU&CAN REACH YOUR&MAX POTENTIAL,,,/"
	        GS.msg[6]= "\\E0IF YOU LIVE MORE&FOR YOUR OWN SAKE^1,&RATHER THAN JUST&FOR MINE./"
	        GS.msg[7]= "\\E8HMMM.../"
	        GS.msg[8]= "\\E0HEY^1, I KNOW THE&SOLUTION!!!/"
	        GS.msg[9]= "YOU SHOULD HANG&OUT WITH MY BOSS^1,&UNDYNE!!!/"
	        GS.msg[10]= "I THINK IF YOU&SPREAD YOUR FRIEND-&ENERGY OUT MORE.../"
	        GS.msg[11]= "YOU\'LL HAVE A MORE&HEALTHY LIFESTYLE./"
	        GS.msg[12]= "YEAH!!^1!&LET\'S BE FRIENDS&WITH UNDYNE!!!/"
	        GS.msg[13]= "NYEH HEH HEH&HEH HEH!!!/%%"
	    }
	    blcon= instance_create(x + 145, y + 22, 187/* obj_blconwdflowey */)
	    blconwd= instance_create(blcon.x + 25, blcon.y + 10, 782/* OBJ_WRITER */)
	}
	if(cn == 79 and not instance_exists(782/* OBJ_WRITER */)) {
	    with(blcon) instance_destroy()
	    cn= 80
	    velocity.x= 15
	    $Alarm2.start((60) / 30.0)
	}
	if(cn == 81) {
	    velocity.x= -30
	    cn= 82
	    $Alarm2.start((30) / 30.0)
	}
	if(cn == 83) {
	    velocity.x= 0
	    GS.msg[0]= "OH^1, AND IF YOU&EVER NEED TO&REACH ME.../"
	    GS.msg[1]= "\\XHERE\'S MY \\RPHONE&NUMBER\\X./"
	    GS.msg[2]= "YOU CAN CALL&ME ANY TIME!/"
	    GS.msg[3]= "\\E4PLATONICALLY./"
	    GS.msg[4]= "\\E0WELL^1, GOTTA GO^1!&NYEH HEH HEH!/%%"
	    scr_phoneget(210)
	    blcon= instance_create(x + 145, y + 22, 187/* obj_blconwdflowey */)
	    blconwd= instance_create(blcon.x + 25, blcon.y + 10, 782/* OBJ_WRITER */)
	    cn= 84
	}
	if(cn == 84 and not instance_exists(782/* OBJ_WRITER */)) {
	    velocity.x= 30
	    with(blcon) instance_destroy()
	    cn= 85
	    $Alarm2.start((30) / 30.0)
	    datevolume= 1
	}
	if(cn == 86) {
	    cn= 87
	    d= instance_create(0, 0, 150/* obj_whitefader */)
	    d.tspeed= 0.03
	    d.sprite_index= 996/* spr_pixblk */
	    $Alarm2.start((50) / 30.0)
	}
	if(cn == 87) {
	    datevolume-= 0.03
	    if(datevolume < 0.04) {
	        datevolume= 0
	        cn= 88
	    }
	    caster_set_volume(papyrus, datevolume)
	}
	if(cn == 88) {
	    GS.border= 0
	    SCR_BORDERSETUP()
	    GS.flag[88]= 4
	    ini_open("undertale.ini")
	    pd= ini_read_real("Papyrus", "PD", 0)
	    ini_write_real("Papyrus", "PD", pd + 1)
	    ini_close()
	    GS.interact= 0
	    instance_create(0, 0, 148/* obj_persistentfader */)
	    caster_free(-3)
	    get_tree().change_scene_to_file("res://godot_rooms/77.tscn")
	}

func _on_outside_room():
	if(GS.facechoice == 3)
	    draw_sprite_ext(sprite_index, frame, x, y, 2, 2, 0, 16777215, 1)
	if(GS.faceemotion == 0) face= 771
	if(GS.faceemotion == 1) face= 779
	if(GS.faceemotion == 2) face= 775
	if(GS.faceemotion == 3) face= 780
	if(GS.faceemotion == 4) face= 772
	if(GS.faceemotion == 5) face= 781
	if(GS.faceemotion == 6) face= 782
	if(GS.faceemotion == 7) face= 773
	if(GS.faceemotion == 8) face= 778
	if(GS.faceemotion == 9) face= 774
	if(GS.facechoice == 0) sprite_index= 763/* spr_papdate */
	if(GS.facechoice == 1) sprite_index= 770/* spr_papdate_cool */
	if(GS.facechoice == 2) sprite_index= 764/* spr_papdate_coy */
	if(GS.facechoice == 3) sprite_index= 765/* spr_papdate_omg */
	if(GS.facechoice == 4) sprite_index= 766/* spr_papdate_bookread */
	if(GS.facechoice == 5) sprite_index= 767/* spr_papdate_bookhold */
	draw_sprite_ext(face, face_index, x + 40, y - 2, 2, 2, 0, 16777215, 1)
	face_index+= face_speed
	if(GS.facechoice != 3)
	    draw_sprite_ext(sprite_index, frame, x, y, 2, 2, 0, 16777215, 1)
	if(instance_exists(782/* OBJ_WRITER */)) {
	    if(OBJ_WRITER.halt == 0) face_speed= 0.25
	    else  {
	        face_index= 0
	        face_speed= 0
	    }
	} else  {
	    face_index= 0
	    face_speed= 0
	}
	if(GS.faceemotion == 8) face_speed= 0.13
	draw_set_color(16777215)
	if(GS.facechoice == 1) {
	    draw_sprite_ext(769/* spr_papdate_spaghetti */, present, x, y - 16, 2, 2, 0, 16777215, 1)
	    draw_sprite_ext(768/* spr_papdate_coolhat */, frame, x, y + haty - 16, 2, 2, 0, 16777215, 1)
	}
	if(choicer == 1) {
	    if(choice == 0)
	        draw_sprite(34/* spr_heart */, 0, GS.idealborder[0] + 40, GS.idealborder[2] + 60)
	    if(choice == 1)
	        draw_sprite(34/* spr_heart */, 0, GS.idealborder[0] + 300, GS.idealborder[2] + 60)
	    if(Input.is_action_pressed("move_right") or Input.is_action_pressed("move_left")) {
	        if(choice == 0) choice= 1
	        else  choice= 0
	    }
	    if(keyboard_multicheck_pressed(0/* NOKEY */)) choicer= 2
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
