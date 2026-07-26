# Auto-converted from GameMaker: obj_mettatonex
# GM parent: obj_monsterparent
extends Node2D

func _ready():
	ini_open("undertale.ini")
	ini_write_real("Mettaton", "BossMet", 1)
	ini_close()
	ratings= instance_create(20, 10, 402/* obj_ratingsmaster */)
	scr_monstersetup()
	image_speed= 0
	if(instance_exists(408/* obj_mettb_body */)) {
	    part1= 408
	    mypart1= 408
	} else  {
	    part1= 408
	    mypart1= _spawn("part1", 240, 116)
	}
	mypart1.z_index= 10
	$Alarm9.start((8) / 30.0)
	hurtanim= 0
	hurtsound= 115
	talked= 0
	whatiheard= -1
	attacked= 0
	killed= 0
	GS.heard= 0
	takedamage= 0
	mercymod= -100000
	sha= 0
	shb= 0
	obj_heart.shot= 1
	obj_heart.sprite_index= 2094/* spr_heartyellow_flip */
	con= 0
	i= 0
	repeat(99)  {
	    GS.failure[i]= 0
	    i++
	}
	GS.attacktype= 26
	GS.specialdam[0]= 0
	GS.specialdam[1]= 0
	GS.specialdam[2]= 0
	turns= 0
	qualify= 0
	ht= 200
	wd= 200
	// obj_battlebg
	with(185) instance_destroy()

func _gm_event_2_9():
	mypart1.parent= GS.monsterinstance[myself]

func _gm_event_2_8():
	snd_play(hurtsound)

func _gm_event_2_6():
	GS.msc= 0
	// OBJ_WRITER
	with(782) instance_destroy()
	turns++
	textsize= 0
	gg= floor(random(3))
	mycommand= round(random(100))
	GS.msg[0]= ".../%%"
	if(turns == 1) {
	    textsize= 0
	    GS.msg[0]= "Lights!&Camera!&Action!/%%"
	}
	if(turns == 2) {
	    textsize= 0
	    GS.msg[0]= "Drama!&Romance!&Blood-&shed!/%%"
	}
	if(turns == 3) {
	    textsize= 0
	    GS.msg[0]= "I\'m the&idol&everyone&craves!/%%"
	}
	if(turns == 4) {
	    textsize= 0
	    GS.msg[0]= "Smile&for the&camera!/%%"
	}
	if(turns == 5) {
	    textsize= 1
	    GS.msg[0]= "Oooh, it\'s time&for a pop quiz!/"
	    GS.msg[1]= "I hope you brought&a keyboard.../"
	    GS.msg[2]= "This one\'s an&essay question!/%%"
	}
	if(turns == 6) {
	    textsize= 1
	    GS.msg[0]= "Your essay really&showed everyone&your heart./"
	    GS.msg[1]= "Why don\'t I show&you mine?/%%"
	    obj_mettb_body.dancewait= 20
	}
	if(turns == 7) {
	    obj_mettb_body.dancewait= 18
	    textsize= 0
	    GS.msg[0]= "Ooooh,&I\'m just&warming&up!/%%"
	}
	if(turns == 8) {
	    textsize= 1
	    GS.msg[0]= "But how are you&on the dance floor!?/%%"
	    obj_mettb_body.dancewait= 15
	}
	if(turns == 9) {
	    textsize= 0
	    GS.msg[0]= "Can you&keep up&the&pace!?/%%"
	    obj_mettb_body.dancewait= 12
	}
	if(turns == 10) {
	    GS.msg[0]= "Lights!&Camera&Bombs!/%%"
	    obj_mettb_body.dancewait= 9
	}
	if(turns == 11) {
	    GS.msg[0]= "Things&are&blowing&up!/%%"
	    obj_mettb_body.dancewait= 6
	}
	if(turns == 12) {
	    obj_mettb_body.dancewait= 3
	    textsize= 1
	    GS.msg[0]= "Time for our union-&regulated break!/%%"
	}
	if(turns == 13) {
	    obj_mettb_body.dancewait= 60
	    textsize= 1
	    GS.msg[0]= "We\'ve grown so&distant, darling.../"
	    GS.msg[1]= "How about another&heart-to-heart?/%%"
	}
	if(turns == 14) {
	    textsize= 1
	    obj_mettb_body.dancewait= 80
	    obj_mettb_body.face_set= 1
	    GS.faceemotion= 8
	    GS.msg[0]= "A.. arms?&Wh... who needs arms&with legs like&these?/"
	    GS.msg[1]= "I\'m still going&to win!/%%"
	}
	if(turns == 15) {
	    obj_mettb_body.face_set= 1
	    GS.faceemotion= 8
	    textsize= 0
	    obj_mettb_body.dancewait= 120
	    GS.msg[0]= "Come on&...!/%%"
	}
	if(turns == 16) {
	    obj_mettb_body.face_set= 1
	    GS.faceemotion= 8
	    obj_mettb_body.dancewait= 180
	    GS.msg[0]= "The show&...&must go&on!/%%"
	}
	if(turns == 17) {
	    obj_mettb_body.face_set= 1
	    GS.faceemotion= 8
	    obj_mettb_body.dancewait= 240
	    GS.msg[0]= "Dr...&Drama!&A...&Action!/%%"
	}
	if(turns == 18) {
	    textsize= 1
	    obj_mettb_body.dance= -1
	    obj_mettb_body.face_set= 1
	    GS.faceemotion= 5
	    GS.msg[0]= "\\E5L... lights...&C... camera.../"
	    GS.msg[1]= "Enough of this!&Do you really want&humanity to perish!?/"
	    GS.msg[2]= "\\E7... or do you just&believe in yourself&that much?/%%"
	}
	if(turns == 19) {
	    textsize= 1
	    obj_mettb_body.face_set= 1
	    GS.faceemotion= 5
	    obj_mettb_body.dance= -1
	    GS.msg[0]= "Haha, how inspiring!/"
	    GS.msg[1]= "Well, darling!&It\'s either me&or you!/"
	    GS.msg[2]= "\\E4But I think we both&already know who\'s&going to win./"
	    GS.msg[3]= "\\E8Witness the true&power of humanity\'s&star!/%%"
	}
	if(turns == 20) {
	    textsize= 1
	    obj_mettb_body.face_set= 1
	    GS.faceemotion= 7
	    obj_mettb_body.dance= -1
	    GS.msg[0]= "... then.../"
	    GS.msg[1]= "\\E8Are YOU the star?/"
	    GS.msg[2]= "Can you really&protect humanity!?/%%"
	}
	GS.typer= 51
	if(textsize == 0) {
	    blcon= instance_create(x + 200, y, 186/* obj_blconsm */)
	    blconwd= instance_create(blcon.x + 10, blcon.y - 10, 784/* OBJ_NOMSCWRITER */)
	} else  {
	    blcon= instance_create(x + 200, y, 187/* obj_blconwdflowey */)
	    blconwd= instance_create(blcon.x + 20, blcon.y - 10, 784/* OBJ_NOMSCWRITER */)
	}
	GS.border= 24
	if(turns == 14 or turns == 15 or turns == 23)
	    GS.border= 27
	if(turns == 10 or turns == 11 or turns == 18 or turns == 24)
	    GS.border= 26
	if(turns == 6) {
	    with(mypart1) event_user(1)
	}
	if(turns == 13) {
	    with(mypart1) event_user(1)
	}
	if(turns == 19) {
	    with(mypart1) event_user(1)
	}
	if(turns == 20) {
	    with(mypart1) event_user(1)
	}
	if(turns == 25) {
	    with(mypart1) event_user(1)
	}
	if(turns == 5) GS.border= 0
	obj_heart.x= round((GS.idealborder[0] + GS.idealborder[1]) / 2) - 8
	obj_heart.y= round((GS.idealborder[2] + GS.idealborder[3]) / 2) - 8
	talked= 2

func _gm_event_2_4():
	con++

func _gm_event_2_3():
	if(mypart1.pause <= 0) {
	    dmgwriter= instance_create(x, y + 100, 189/* obj_dmgwriter */)
	    GS.damage= takedamage
	    with(dmgwriter) dmg= GS.damage
	    shk= instance_create(0, 0, 1669/* obj_objshake */)
	    shk.obj= mypart1
	    snd_play(51/* snd_damage */)
	    if(GS.monsterhp[myself] > GS.monstermaxhp[myself] / 2 and turns <= 12) {
	        mypart1.pause= 1
	        $Alarm8.start((11) / 30.0)
	    } else  mypart1.pause= 2
	    // obj_ratingsmaster
	    with(402) {
	        curtype= 4
	        event_user(0)
	    }
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
	    if(turns >= 19 and GS.ratings >= 10000) qualify= 1
	    if(turns < 19 and GS.ratings >= 12000) qualify= 1
	    if(qualify == 0) $Alarm6.start((1) / 30.0)
	    else  con= 90
	    talked= 1
	    GS.heard= 0
	}
	if(talked == 2 and not instance_exists(782/* OBJ_WRITER */))
	    event_user(1)
	if(GS.hurtanim[myself] == 1) {
	    shudder= 8
	    $Alarm3.start((GS.damagetimer) / 30.0)
	    GS.hurtanim[myself]= 3
	}
	if(GS.hurtanim[myself] == 2) {
	    GS.monsterhp[myself]-= takedamage
	    with(dmgwriter) $Alarm2.start((15) / 30.0)
	    if(GS.monsterhp[myself] >= 1) {
	        GS.hurtanim[myself]= 0
	        mypart1.pause= 0
	        GS.myfight= 0
	        GS.mnfight= 1
	    } else  {
	        if(killed == 0) {
	            GS.mnfight= -1
	            GS.myfight= -1
	            killed= 1
	            con= 50
	        }
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
	        GS.turntimer= 10
	        if(turns >= 1) {
	            GS.attacktype= 29 + turns
	            if(GS.attacktype == 54) {
	                turns-= 5
	                GS.attacktype= 49
	            }
	            if(GS.attacktype >= 50) {
	                if(GS.monsterdef[myself] >= -10)
	                    GS.monsterdef[myself]= -10
	                GS.monsterdef[myself]-= 5
	                if(GS.attacktype == 50) GS.attacktype= 38
	                if(GS.attacktype == 51) GS.attacktype= 54
	                if(GS.attacktype == 52) GS.attacktype= 56
	            }
	            instance_create(0, 0, 414/* obj_mettattackgen */)
	        }
	        if(mycommand >= 0) GS.msg[0]= "* Mettaton."
	        if(mycommand >= 25) GS.msg[0]= "* Mettaton."
	        if(mycommand >= 50) GS.msg[0]= "* Mettaton."
	        if(mycommand >= 75) GS.msg[0]= "* Mettaton."
	        if(mycommand >= 90) GS.msg[0]= "* Smells like Mettaton."
	        if(mercymod > 100) GS.msg[0]= "* Monster seems satisfied."
	        if(GS.monsterhp[myself] <= GS.monstermaxhp[myself] / 4)
	            GS.msg[0]= "* Mettaton has low HP."
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
	        GS.msg[0]= "* METTATON EX - ATK 47 DEF 47&* His weak point is his&  heart-shaped core./^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	        whatiheard= 9
	    }
	    if(whatiheard == 3) {
	        GS.msc= 0
	        GS.msg[0]= "* You say you aren\'t going&  to get hit at ALL./"
	        GS.msg[1]= "* Ratings gradually increase&  during Mettaton\'s turn./^"
	        // obj_ratingsmaster
	        with(402) boastmode= 1
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    if(whatiheard == 1) {
	        GS.msc= 0
	        GS.msg[0]= "* You posed dramatically^1.&* The audience nods./^"
	        if(GS.hp <= GS.maxhp / 2)
	            GS.msg[0]= "* Despite being hurt^1, you&  posed dramatically^1.&* The audience applauds./^"
	        if(GS.hp < GS.maxhp / 4)
	            GS.msg[0]= "* Despite being wounded^1, you&  posed dramatically^1.&* The audience gasps./^"
	        if(GS.hp <= 3)
	            GS.msg[0]= "* With the last of your power^1,&  you pose dramatically^1.&* The audience screams./^"
	        // obj_ratingsmaster
	        with(402) {
	            curtype= 11
	            event_user(0)
	        }
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    if(whatiheard == 4) {
	        GS.msc= 0
	        GS.msg[0]= "* You turn and scoff at the&  audience./"
	        GS.msg[1]= "* They\'re rooting for your&  destruction this turn!/^"
	        // obj_ratingsmaster
	        with(402) heel= 1
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    GS.heard= 1
	}
	if(con == 50) {
	    // obj_ratingsmaster
	    with(402) active= 0
	    // obj_dmgwriter
	    with(189) instance_destroy()
	    caster_free(-3)
	    // OBJ_WRITER
	    with(782) instance_destroy()
	    with(mypart1) {
	        hurt= 2
	        sineron= 0
	        pause= 3
	        dsf= 0.5
	    }
	    GS.faceemotion= 0
	    con= 51
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 52) {
	    GS.typer= 53
	    GS.msc= 0
	    GS.msg[0]= "H.. ha.../"
	    GS.msg[1]= "So I was wrong./"
	    GS.msg[2]= "Darling.../"
	    GS.msg[3]= "\\E1You really are&strong enough to&get past ASGORE./"
	    GS.msg[4]= "\\E0Well then.../"
	    GS.msg[5]= "It\'s time for&you to go./"
	    GS.msg[6]= "\\E0Don\'t worry about&me./"
	    GS.msg[7]= "I might seem like&I\'m dying now^1,&but.../"
	    GS.msg[8]= "\\E1Dr. Alphys can&always repair me./"
	    GS.msg[9]= "\\E0And... besides.../"
	    GS.msg[10]= "Even if I\'m not&cut out to be&a star.../"
	    GS.msg[11]= "\\E1I still got to&perform for a&human, didn\'t I?/"
	    GS.msg[12]= "So, thank you,&darling.../%%"
	    con= 53
	    scr_blcon_x(x + 180, y + 20)
	}
	if(con == 53 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 54
	    $Alarm4.start((45) / 30.0)
	}
	if(con == 54) {
	    with(mypart1) dsf-= 0.012
	}
	if(con == 55 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.typer= 54
	    with(mypart1) dsf= 0
	    GS.msg[0]= "\\E1You\'ve been a&great audience!/%%"
	    scr_blcon_x(x + 180, y + 20)
	    con= 56
	}
	if(con == 56 and not instance_exists(782/* OBJ_WRITER */)) {
	    explode= caster_load("music/explosion.ogg")
	    mypart1.fadewhite= 1
	    con= 57
	    $Alarm4.start((2) / 30.0)
	}
	if(con == 58) {
	    caster_play(explode, 1, 1)
	    GS.xp+= 800
	    scr_levelup()
	    GS.kills++
	    GS.flag[425]= 1
	    con= 59
	}
	if(con == 90) {
	    // obj_dmgwriter
	    with(189) instance_destroy()
	    GS.faceemotion= 0
	    mypart1.endface= 1
	    GS.typer= 51
	    GS.msc= 0
	    GS.msg[0]= "OOH^1, LOOK AT&THESE RATINGS!!!/"
	    GS.msg[1]= "\\E6THIS IS THE MOST&VIEWERS I\'VE EVER&HAD!!!/"
	    GS.msg[2]= "WE\'VE REACHED THE&VIEWER CALL-IN&MILESTONE!/"
	    GS.msg[3]= "\\E8ONE LUCKY VIEWER&WILL HAVE THE CHANCE&TO TALK TO ME.../"
	    GS.msg[4]= "\\E7... BEFORE I LEAVE&THE UNDERGROUND&FOREVER!!/"
	    GS.msg[5]= "\\E9LET\'S SEE WHO&CALLS IN FIRST!/%%"
	    con= 91
	    blc= scr_blcon_x(x + 180, y + 20)
	}
	if(con == 91 and instance_exists(782/* OBJ_WRITER */)) {
	    vol= caster_get_volume(GS.batmusic)
	    vol-= 0.02
	    caster_set_volume(GS.batmusic, vol)
	}
	if(con == 91 and not instance_exists(782/* OBJ_WRITER */)) {
	    caster_stop(GS.batmusic)
	    snd_play(104/* snd_phone */)
	    con= 93
	    $Alarm4.start((50) / 30.0)
	}
	if(con == 94 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.typer= 51
	    GS.msc= 0
	    GS.msg[0]= "\\E0HI^1, YOU\'RE ON TV!/"
	    GS.msg[1]= "WHAT DO YOU HAVE&TO SAY ON THIS^1,&OUR LAST SHOW???/%%"
	    con= 95
	    scr_blcon_x(x + 180, y + 20)
	}
	if(con == 95 and not instance_exists(782/* OBJ_WRITER */)) {
	    shblcon= instance_create(530, 200, 186/* obj_blconsm */)
	    shblcon.sprite_index= 27/* spr_shockblcon2 */
	    sadmett= caster_load("music/mettsad.ogg")
	    caster_loop(sadmett, 0.9, 1)
	    GS.typer= 92
	    GS.msg[0]= "...../"
	    GS.msg[1]= "oh......../"
	    GS.msg[2]= "\\E1hi..^1.&mettaton.../"
	    GS.msg[3]= "i really liked&watching your show.../"
	    GS.msg[4]= "my life is pretty&boring..^1. but.../"
	    GS.msg[5]= "seeing you on the&screen..^1. brought&excitement to my&life..^1. vicariously/"
	    GS.msg[6]= "i can\'t tell^1, but..^1.&i guess this is&the last episode...?/"
	    GS.msg[7]= "\\E3i\'ll miss you..^1.&mettaton....../"
	    GS.msg[8]= "... oh...^1. i didn\'t&mean to talk so&long.../"
	    GS.msg[9]= "\\E2oh........../%%"
	    instance_create(420, 60, 782/* OBJ_WRITER */)
	    con= 96
	}
	if(con == 96 and not instance_exists(782/* OBJ_WRITER */)) {
	    // obj_blconsm
	    with(186) instance_destroy()
	    GS.typer= 51
	    GS.msc= 0
	    GS.msg[0]= "NO^1, WAIT^1!&WAIT^1, BL.../"
	    GS.msg[1]= "\\E1H..^1.&THEY ALREADY HUNG&UP./"
	    GS.msg[2]= "\\E3.../"
	    GS.msg[3]= "\\E0I\'LL TAKE ANOTHER&CALLER!!!/%%"
	    con= 97
	    scr_blcon_x(x + 180, y + 20)
	}
	if(con == 97 and not instance_exists(782/* OBJ_WRITER */)) {
	    snd_play(104/* snd_phone */)
	    shblcon= instance_create(530, 200, 186/* obj_blconsm */)
	    shblcon.sprite_index= 27/* spr_shockblcon2 */
	    GS.typer= 92
	    GS.msg[0]= "\\E1Mettaton^1, your show&made us so happy!/%%"
	    instance_create(420, 60, 782/* OBJ_WRITER */)
	    con= 98
	}
	if(con == 98 and not instance_exists(782/* OBJ_WRITER */)) {
	    snd_play(104/* snd_phone */)
	    shblcon= instance_create(560, 200, 186/* obj_blconsm */)
	    shblcon.sprite_index= 27/* spr_shockblcon2 */
	    with(shblcon) z_index-= 4
	    GS.typer= 92
	    GS.msg[0]= "Mettaton^1, I don\'t&know what I\'ll&watch without you./%%"
	    instance_create(450, 60, 782/* OBJ_WRITER */)
	    con= 99
	}
	if(con == 99 and not instance_exists(782/* OBJ_WRITER */)) {
	    snd_play(104/* snd_phone */)
	    shblcon= instance_create(520, 200, 186/* obj_blconsm */)
	    shblcon.sprite_index= 27/* spr_shockblcon2 */
	    with(shblcon) z_index-= 8
	    GS.typer= 92
	    GS.msg[0]= "Mettaton^1, there\'s&a Mettaton-shaped&hole in my Mettaton-&shaped heart./%%"
	    instance_create(410, 60, 782/* OBJ_WRITER */)
	    con= 100
	}
	if(con == 100 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 101
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 101)
	    obj_blconsm.modulate.a-= 0.035
	if(con == 102) {
	    // obj_blconsm
	    with(186) instance_destroy()
	    GS.typer= 51
	    GS.msc= 0
	    GS.msg[0]= "\\E3AH..^1. I.../"
	    GS.msg[1]= "I SEE.../"
	    GS.msg[2]= "\\E4.../"
	    GS.msg[3]= "EVERYONE..^1.&THANK YOU SO MUCH./"
	    GS.msg[4]= ".../"
	    GS.msg[5]= "\\E0DARLING./"
	    GS.msg[6]= "\\E1PERHAPS..^1. IT MIGHT BE&BETTER IF I STAY&HERE FOR A WHILE./"
	    GS.msg[7]= "\\E2HUMANS ALREADY HAVE&STARS AND IDOLS^1,&BUT MONSTERS.../"
	    GS.msg[8]= "\\E0THEY ONLY HAVE ME./"
	    GS.msg[9]= "\\E1IF I LEFT..^1.&THE UNDERGROUND WOULD&LOSE ITS SPARK./"
	    GS.msg[10]= "\\E3I\'D LEAVE AN ACHING&VOID THAT CAN NEVER&BE FILLED./"
	    GS.msg[11]= "\\E0SO..^1. I THINK I\'LL&HAVE TO DELAY MY&BIG DEBUT./"
	    GS.msg[12]= "\\E2BESIDES./"
	    GS.msg[13]= "\\E1YOU\'VE PROVEN TO&BE VERY STRONG./"
	    GS.msg[14]= "\\E0PERHAPS..^1. EVEN STRONG&ENOUGH TO GET PAST&ASGORE./"
	    GS.msg[15]= "\\E0I\'M SURE YOU\'LL BE&ABLE TO PROTECT&HUMANITY./"
	    GS.msg[16]= "\\E4HA^1, HA.../"
	    GS.msg[17]= "IT\'S ALL FOR THE&BEST^1, ANYWAY./"
	    GS.msg[18]= "\\E3THE TRUTH IS^1, THIS&FORM\'S ENERGY&CONSUMPTION IS.../"
	    GS.msg[19]= "INEFFICIENT./"
	    GS.msg[20]= "IN A FEW MOMENTS^1,&I\'LL RUN OUT OF&BATTERY POWER^1, AND.../"
	    GS.msg[21]= "\\E4WELL./"
	    GS.msg[22]= "\\E0I\'LL BE ALRIGHT./"
	    GS.msg[23]= "\\E5KNOCK \'EM DEAD^1,&DARLING./"
	    GS.msg[24]= "\\E0AND EVERYONE..^1.&THANK YOU./"
	    GS.msg[25]= "YOU\'VE BEEN A&GREAT AUDIENCE!/%%"
	    con= 103
	    scr_blcon_x(x + 180, y + 20)
	}
	if(con == 103 and instance_exists(782/* OBJ_WRITER */)) {
	    if(OBJ_WRITER.stringno == 20) caster_set_volume(sadmett, 0.8)
	    if(OBJ_WRITER.stringno == 21) caster_set_volume(sadmett, 0.6)
	    if(OBJ_WRITER.stringno == 22) caster_set_volume(sadmett, 0.4)
	    if(OBJ_WRITER.stringno == 23) caster_set_volume(sadmett, 0.2)
	    if(OBJ_WRITER.stringno == 24) caster_set_volume(sadmett, 0.1)
	    if(OBJ_WRITER.stringno == 25) caster_set_volume(sadmett, 0)
	}
	if(con == 103 and not instance_exists(782/* OBJ_WRITER */)) {
	    impact= caster_load("music/create.ogg")
	    caster_play(impact, 1, 0.8)
	    mypart1.fadewhite= 1
	    con= 105
	}
	if(GS.myfight == 4 and GS.mercyuse == 0) script_execute(163/* scr_mercystandard */)

func _gm_event_7_11():
	with(blconwd) instance_destroy()
	with(blcon) instance_destroy()
	talked= 0
	GS.mnfight= 2

func _gm_event_7_0():
	if(GS.debug == 1) {
	    if(Input.is_key_pressed(65)) turns--
	    if(Input.is_key_pressed(83)) turns++
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
