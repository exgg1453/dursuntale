# Auto-converted from GameMaker: obj_adate
extends Node2D

func _ready():
	caster_free(-3)
	GS.interact= 0
	instance_create(0, 0, 147/* obj_fader */)
	GS.faceemotion= 0
	GS.facechoice= 0
	face_speed= 0.2
	face_index= 0
	cn= -2
	$Alarm4.start((15) / 30.0)
	skip= 0
	GS.inbattle= 1
	choice= 0
	choicer= 0
	GS.border= 11
	SCR_BORDERSETUP(0)
	instance_create(0, 0, 759/* obj_uborder */)
	instance_create(0, 0, 761/* obj_dborder */)
	instance_create(0, 0, 758/* obj_lborder */)
	instance_create(0, 0, 760/* obj_rborder */)
	datemusic= caster_load("music/date.ogg")
	lab= caster_load("music/lab.ogg")
	datevolume= 1
	sha= 0
	haty= 0
	blcon= 5475834
	present= 0
	obj_adate_body.x= get_viewport_rect().size.x
	GS.flag[20]= 0
	fadeamt= 0
	fadeouter= 0
	pitch= 1

func _gm_event_2_4():
	cn++

func _process(delta: float):
	if(cn == -1) {
	    GS.typer= 1
	    GS.msc= 0
	    GS.msg[0]= "        DATING^1  STAR^5T^2.^2.^2.^3?%%"
	    instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	    cn= 0
	}
	if(cn == 0 and not instance_exists(782/* OBJ_WRITER */)) {
	    // OBJ_WRITER
	    with(782) instance_destroy()
	    al= 176
	    xx= obj_adate_body.x
	    yy= obj_adate_body.y
	    GS.faceemotion= 0
	    GS.facechoice= 0
	    GS.msc= 0
	    GS.typer= 74
	    GS.msg[0]= "Uhhh^1, sorry^2!&I\'m still getting&dressed!/%%"
	    scr_blcon(xx - 250, yy, 1)
	    cn= 2
	}
	if(cn == 2 and not instance_exists(782/* OBJ_WRITER */)) {
	    cn= 3
	    $Alarm4.start((60) / 30.0)
	}
	if(cn == 4) {
	    al.x-= 8
	    if(al.x < 350) cn= 5
	}
	if(cn == 5) {
	    xx= obj_adate_body.x
	    yy= obj_adate_body.y
	    GS.faceemotion= 5
	    GS.flag[20]= 3
	    GS.msc= 0
	    GS.typer= 74
	    GS.msg[0]= "H-how do I look?/"
	    GS.msg[1]= "My friend helped me&pick out this&dress./"
	    GS.msg[2]= "\\E1S\\M0he\'s got a great&sense of.../"
	    GS.msg[3]= "\\E0Um^1, anyway^1!&Let\'s do this thing!/%%"
	    scr_blcon(xx - 260, yy, 1)
	    cn= 6
	}
	if(cn == 6 and not instance_exists(782/* OBJ_WRITER */)) {
	    cn= 6.1
	    $Alarm4.start((55) / 30.0)
	    GS.currentsong= caster_play(datemusic, 1, 1)
	    GS.typer= 1
	    GS.msc= 0
	    GS.msg[0]= "        DATING^3  START^3.%%"
	    instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	}
	if(cn == 7.1) {
	    mfo= instance_create(0, 0, 92/* obj_musfadeout */)
	    // OBJ_WRITER
	    with(782) instance_destroy()
	    GS.typer= 74
	    GS.faceemotion= 9
	    GS.flag[20]= 4
	    GS.msg[0]= "H-h-hey^1, w-w-wait!/"
	    GS.msg[1]= "Actually^1, we still&can\'t start the&date yet!!!/%%"
	    scr_blcon(xx - 260, yy, 1)
	    cn= 8
	}
	if(cn == 8 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.typer= 1
	    GS.msc= 0
	    GS.msg[0]= "        DATING..^1.  STOP^4?%%"
	    instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	    cn= 9
	}
	if(cn == 9 and not instance_exists(782/* OBJ_WRITER */)) {
	    with(mfo) instance_destroy()
	    GS.typer= 74
	    GS.currentsong= caster_loop(lab, 1, 1)
	    GS.faceemotion= 9
	    GS.flag[20]= 0
	    GS.msg[0]= "Umm^1, I\'ve gotta give&you items to raise&your affection&statistic^1, first!/"
	    GS.msg[1]= "That\'ll increase the&chance of a successful&outcome to the&date!/"
	    GS.msg[2]= "\\E6Right...?/"
	    GS.msg[3]= "\\E0Anyway^1, d-don\'t worry^1!&I\'m prepared!/"
	    GS.msg[4]= "\\E5I-I\'ve been&stockpiling gifts&in anticipation&for a date like this!/"
	    GS.msg[5]= "\\E7F\\M6-first^1, I\'ve got.../"
	    GS.msg[6]= "\\E5Some metal armor&polish!/"
	    GS.msg[7]= "\\E3.../"
	    GS.msg[8]= "\\E6Um^1, maybe you can\'t&use that./"
	    GS.msg[9]= "\\E5But!!!/"
	    GS.msg[10]= "I also brought some&waterproof cream for&your scales!/"
	    GS.msg[11]= "\\E3Your^1, uh..^1.&Scales.../"
	    GS.msg[12]= "\\E6Uh^1, well^1, how about.../"
	    GS.msg[13]= "This magical spear&repair kit^1, that I.../"
	    GS.msg[14]= "\\E7Um.../"
	    GS.msg[15]= "\\E5Hey^1, let\'s forget&about the items!/"
	    GS.msg[16]= "\\E0L\\M0et\'s just start&the date!/%%"
	    scr_blcon(xx - 260, yy, 1)
	    cn= 10
	}
	if(cn == 10) {
	    if(instance_exists(782/* OBJ_WRITER */)) {
	        if(OBJ_WRITER.stringno == 6) {
	            GS.flag[20]= 5
	            al.item= 1
	            al.aa= 0
	        }
	        if(OBJ_WRITER.stringno == 8) {
	            GS.flag[20]= 6
	            al.item= 0
	            al.aa= 0
	        }
	        if(OBJ_WRITER.stringno == 10) {
	            GS.flag[20]= 5
	            al.item= 1
	            al.aa= 1
	        }
	        if(OBJ_WRITER.stringno == 12) {
	            GS.flag[20]= 6
	            al.item= 0
	            al.aa= 1
	        }
	        if(OBJ_WRITER.stringno == 13) {
	            GS.flag[20]= 5
	            al.item= 1
	            al.aa= 2
	        }
	        if(OBJ_WRITER.stringno == 15) {
	            GS.flag[20]= 6
	            al.item= 0
	            al.aa= 2
	        }
	    } else  {
	        cn= 11
	        mfo= instance_create(0, 0, 92/* obj_musfadeout */)
	        mfo.fadespeed= 0.02
	        GS.typer= 1
	        GS.msc= 0
	        GS.msg[0]= "        DATING!^1!  START!^3!%%"
	        instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	    }
	}
	if(cn == 11 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.typer= 74
	    GS.faceemotion= 0
	    GS.flag[20]= 0
	    GS.msg[0]= "Yeah!!^1!&Let\'s^1, uh^1, date!/%%"
	    scr_blcon(xx - 260, yy, 1)
	    cn= 12
	}
	if(cn == 12 and not instance_exists(782/* OBJ_WRITER */)) {
	    cn= 13
	    $Alarm4.start((90) / 30.0)
	}
	if(cn == 14) {
	    GS.faceemotion= 1
	    cn= 15
	    $Alarm4.start((60) / 30.0)
	}
	if(cn == 16) {
	    GS.faceemotion= 2
	    cn= 17
	    $Alarm4.start((60) / 30.0)
	}
	if(cn == 18) {
	    GS.faceemotion= 3
	    cn= 19
	    $Alarm4.start((60) / 30.0)
	}
	if(cn == 20 and not instance_exists(782/* OBJ_WRITER */)) {
	    with(mfo) instance_destroy()
	    GS.typer= 74
	    GS.faceemotion= 3
	    GS.flag[20]= 0
	    GS.msg[0]= "... uh.../"
	    GS.msg[1]= "\\E4Do you..^3. like..^3.&Anime...^2?/*"
	    scr_blcon(xx - 260, yy, 1)
	    cn= 21
	}
	if(cn == 21 and not instance_exists(782/* OBJ_WRITER */) and OBJ_WRITER.stringno == 1 and OBJ_WRITER.halt != 0) {
	    choice= 0
	    choicer= 1
	    GS.typer= 1
	    GS.msg[0]= "                              &   Yes             No       &                            "
	    iii= instance_create(GS.idealborder[0], GS.idealborder[2], 785/* OBJ_INSTAWRITER */)
	    with(iii) halt= 0
	    cn= 22
	}
	if(cn == 22 and choicer == 2) {
	    if(instance_exists(782/* OBJ_WRITER */)) {
	        // OBJ_WRITER
	        with(782) instance_destroy()
	    }
	    cn= 23
	    choicer= 0
	    $Alarm4.start((10) / 30.0)
	}
	if(cn == 24) {
	    GS.typer= 74
	    if(choice == 0) {
	        GS.faceemotion= 6
	        GS.msg[0]= "H-hey^1!&Me too!!/%%"
	    } else  {
	        GS.faceemotion= 6
	        GS.msg[0]= "Oh./%%"
	    }
	    scr_blcon(xx - 260, yy, 1)
	    cn= 25
	}
	if(cn == 25 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.faceemotion= 3
	    $Alarm4.start((100) / 30.0)
	    cn= 26
	}
	if(cn == 27) {
	    GS.typer= 74
	    GS.faceemotion= 6
	    GS.flag[20]= 0
	    GS.msg[0]= "Hey^1!&Let\'s!^1!&Go somewhere!!!/"
	    GS.msg[1]= "\\E7But where\'s a good&place to go on&a date...?/"
	    GS.msg[2]= "\\E2.../"
	    GS.msg[3]= "\\E0I\'ve got it!!!/"
	    GS.msg[4]= "\\E5Let\'s go to the&garbage dump!!!/%%"
	    scr_blcon(xx - 260, yy, 1)
	    cn= 28
	}
	if(cn == 28 and not instance_exists(782/* OBJ_WRITER */)) {
	    al.velocity.x= -8
	    snd_play(50/* snd_escaped */)
	    cn= 28.1
	    $Alarm4.start((20) / 30.0)
	}
	if(cn == 29.1) {
	    fadeouter= 1
	    cn= 29
	    $Alarm4.start((30) / 30.0)
	}
	if(cn == 30) {
	    instance_create(0, 0, 174/* obj_garbagebg */)
	    watersfx= caster_load("music/ambientwater.ogg")
	    GS.currentsong= caster_loop(watersfx, 0, 0.9)
	    mfi= instance_create(0, 0, 152/* obj_musfadein */)
	    fadeouter= 2
	    // obj_adate_body
	    with(176) instance_destroy()
	    GS.faceemotion= 0
	    GS.flag[20]= 0
	    al= instance_create(get_viewport_rect().size.x + 160, 180, 176/* obj_adate_body */)
	    trashcan= instance_create(500, al.y + al.sprite_height * 2 - 20, 175/* obj_adate_trashcan */)
	    al.velocity.x= -8
	    cn= 31
	}
	if(cn == 31 and al.x < 350) {
	    al.velocity.x= 0
	    al.x= 350
	    cn= 32
	    if(skip == 1) cn= 110
	}
	if(cn == 32) {
	    xx= al.x
	    yy= al.y
	    GS.msc= 0
	    GS.typer= 74
	    GS.faceemotion= 0
	    GS.flag[20]= 0
	    GS.msg[0]= "Here we are!/"
	    GS.msg[1]= "This is where Undyne&and I come all&the time.../"
	    GS.msg[2]= "\\E1We find all sorts&of great stuff&here./"
	    GS.msg[3]= "\\E5Heh^1, she\'s&really.../"
	    GS.msg[4]= "\\E6Uh.../%%"
	    scr_blcon(xx - 260, yy, 1)
	    cn= 33
	}
	if(cn == 33 and not instance_exists(782/* OBJ_WRITER */)) {
	    mfo= instance_create(0, 0, 92/* obj_musfadeout */)
	    mfo.fadespeed= 0.04
	    GS.faceemotion= 3
	    cn= 34
	    $Alarm4.start((50) / 30.0)
	}
	if(cn == 35) {
	    with(mfo) instance_destroy()
	    datetense= caster_load("music/date_tense.ogg")
	    GS.currentsong= caster_loop(datetense, 1, 1)
	    GS.typer= 74
	    GS.faceemotion= 3
	    GS.flag[20]= 2
	    GS.msg[0]= "Oh no./"
	    GS.msg[1]= "\\E9That\'s her over&there./"
	    GS.msg[2]= "\\M4I c-can\'t let her&see me on a date&with you!/"
	    GS.msg[3]= "\\E6Why...?/"
	    GS.msg[4]= "\\M0Because^1, uh..^1.&Well.../"
	    GS.msg[5]= "\\E9Oh no^1, here she&comes!!/%%"
	    scr_blcon(xx - 260, yy, 1)
	    cn= 36
	    nowy= al.y
	}
	if(cn == 36 and not instance_exists(782/* OBJ_WRITER */)) {
	    al.x-= 10
	    if(al.y > nowy - 22) al.y--
	    if(al.x < trashcan.x - 240) cn= 37
	}
	if(cn == 37) {
	    if(al.y > nowy - 22) al.y--
	    al.z_index= 2
	    al.x+= 10
	    if(al.x > trashcan.x - 70) cn= 38
	}
	if(cn == 38) {
	    GS.facechoice= 1
	    und= instance_create(-100, trashcan.y + 10, 177/* obj_adate_ubody */)
	    und.y-= und.sprite_height * 2 + 66
	    und.velocity.x= 16
	    cn= 39
	}
	if(cn == 39 and und.x > 80) {
	    und.x= 80
	    und.velocity.x= 0
	    cn= 40
	    $Alarm4.start((15) / 30.0)
	}
	if(cn == 41) {
	    GS.typer= 39
	    xxx= und.x
	    yyy= und.y
	    GS.msg[0]= " Hey!^1!& There you are!!/"
	    GS.msg[1]= "\\F2 I^1, uh^1, realized^1,& if you deliver that&  thing.../"
	    GS.msg[2]= "\\F3 It might be a bad& idea./"
	    GS.msg[3]= "\\F4 So I\'m gonna do& it!!^1!& Give it to me!!!/"
	    GS.msg[4]= "\\F3 Huh!^1?& You don\'t have it!?/"
	    GS.msg[5]= "\\F4 Ngggaaahhh!!/"
	    GS.msg[6]= " Have you at least& seen her!?/*"
	    scr_blcon(xxx + 100, yyy + 20, 0)
	    cn= 42
	}
	if(cn == 42 and not instance_exists(782/* OBJ_WRITER */) and OBJ_WRITER.stringno == 6 and OBJ_WRITER.halt != 0) {
	    al.shake= 2
	    choice= 0
	    choicer= 1
	    GS.typer= 1
	    GS.msg[0]= "                              &   Yeah            Nope     &                            "
	    iii= instance_create(GS.idealborder[0], GS.idealborder[2], 785/* OBJ_INSTAWRITER */)
	    with(iii) halt= 0
	    cn= 43
	}
	if(cn == 43 and choicer == 2) {
	    if(instance_exists(782/* OBJ_WRITER */)) {
	        // OBJ_WRITER
	        with(782) instance_destroy()
	    }
	    cn= 44
	    choicer= 0
	    $Alarm4.start((10) / 30.0)
	}
	if(cn == 45) {
	    al.shake= 0
	    GS.typer= 39
	    if(choice == 0) {
	        GS.facechoice= 0
	        GS.msg[0]= " Yes?/"
	        GS.msg[1]= "\\F6 So she\'s somewhere& around here.../"
	        GS.msg[2]= "\\F0 Thanks^1.& I\'ll keep looking./%%"
	    } else  {
	        GS.facechoice= 1
	        GS.msg[0]= " No???/"
	        GS.msg[1]= " But she wasn\'t& at home.../"
	        GS.msg[2]= "\\F3 Where the heck& could she be!?/%%"
	    }
	    scr_blcon(xxx + 100, yyy + 20, 0)
	    cn= 46
	}
	if(cn == 46 and not instance_exists(782/* OBJ_WRITER */)) {
	    mfo= instance_create(0, 0, 92/* obj_musfadeout */)
	    und.velocity.x= 20
	    cn= 47
	    $Alarm4.start((40) / 30.0)
	}
	if(cn == 48) {
	    // obj_musfadeout
	    with(92) instance_destroy()
	    cn= 49
	    GS.flag[20]= 0
	    GS.faceemotion= 3
	}
	if(cn == 49) {
	    al.z_index= 2
	    al.x-= 10
	    if(al.x < trashcan.x - 240) cn= 50
	}
	if(cn == 50 and not instance_exists(782/* OBJ_WRITER */)) {
	    al.z_index= 0
	    al.x+= 10
	    if(al.y < nowy) al.y+= 4
	    if(al.x > xx) {
	        al.y= nowy
	        cn= 51
	        al.x= xx
	    }
	}
	if(cn == 51) {
	    cn= 52
	    lab= caster_load("music/lab.ogg")
	    $Alarm4.start((20) / 30.0)
	}
	if(cn == 53) {
	    GS.currentsong= caster_loop(lab, 1, 0.75)
	    GS.typer= 74
	    GS.faceemotion= 3
	    GS.flag[20]= 0
	    GS.msg[0]= "\\E2Oh my god.../"
	    GS.msg[1]= "\\E6W... well^1, I guess&it\'s obvious^1, huh?/"
	    GS.msg[2]= "\\E7I...^1 uh..^1.&I really like her./"
	    GS.msg[3]= "\\E9I mean^1, more than&I like other people!/"
	    GS.msg[4]= "\\E7I\'m sorry./"
	    GS.msg[5]= "\\E6I j-just figured^1,&y-you know.../"
	    GS.msg[6]= "\\E7It\'d be f-fun to&go on like^1, a cute^1,&kind of.../"
	    GS.msg[7]= "\\E6P\\M3retend date with you^1?&T-to make you feel&better?/"
	    GS.msg[8]= "\\E7.../"
	    GS.msg[9]= "\\E6Well^1, it sounds even&worse when I put it&like that./"
	    GS.msg[10]= "\\E8I\\M0\'m sorry^1.&I messed up again./"
	    GS.msg[11]= "\\E7Undyne\'s the person I..^1.&Um..^1. really want to&go on a date with./"
	    GS.msg[12]= "But, I mean..^1.&She\'s way out of&my league./"
	    GS.msg[13]= "\\E9N-not that you&aren\'t^1, um^1, cool!/"
	    GS.msg[14]= "\\E7B-but..^1. Undyne.../"
	    GS.msg[15]= "She\'s so confident..^1.&And strong..^1.&And funny.../"
	    GS.msg[16]= "\\E8And I\'m just a&nobody./"
	    GS.msg[17]= "\\M3A fraud./"
	    GS.msg[18]= "I\'m the royal&scientist^1, but.../"
	    GS.msg[19]= "\\M0All I\'ve ever done&is hurt people./"
	    GS.msg[20]= "\\E7I\'ve told her so&many lies^1, she thinks&I\'m.../"
	    GS.msg[21]= "\\E6She thinks I\'m a&lot cooler than I&actually am./"
	    GS.msg[22]= "\\E7If she gets close&to me^1, she\'ll.../"
	    GS.msg[23]= "\\E8She\'ll find out the&truth about me./"
	    GS.msg[24]= "\\E7.../"
	    GS.msg[25]= "\\E7What should I do?/*"
	    scr_blcon(xx - 260, yy, 1)
	    cn= 54
	}
	if(cn == 54 and not instance_exists(782/* OBJ_WRITER */) and OBJ_WRITER.stringno == 25 and OBJ_WRITER.halt != 0) {
	    choice= 0
	    choicer= 1
	    GS.typer= 1
	    GS.msg[0]= "                              &   Tell her        Keep     &   the truth       lying    "
	    iii= instance_create(GS.idealborder[0], GS.idealborder[2], 785/* OBJ_INSTAWRITER */)
	    with(iii) halt= 0
	    cn= 55
	}
	if(cn == 55 and choicer == 2) {
	    if(instance_exists(782/* OBJ_WRITER */)) {
	        // OBJ_WRITER
	        with(782) instance_destroy()
	    }
	    cn= 56
	    choicer= 0
	    $Alarm4.start((10) / 30.0)
	}
	if(cn == 57) {
	    GS.typer= 74
	    if(choice == 0) {
	        GS.faceemotion= 9
	        GS.msg[0]= "\\E9The truth...?/"
	        GS.msg[1]= "\\M4But if I tell her&that^1, she\'ll hate&me./"
	        GS.msg[2]= "\\E6I\\M0sn\'t it better&this way?/"
	        GS.msg[3]= "To live a lie where&both people are&happy.../"
	        GS.msg[4]= "\\E7Or a truth where&neither of us&are?/"
	        GS.msg[5]= "They say " + chr(ord('"')) + "be&your" + chr(ord('"')) + "/"
	        GS.msg[6]= "\\E8But I don\'t&really like who&" + chr(ord('"')) + "myself" + chr(ord('"')) + " is./"
	        GS.msg[7]= "\\E7I\'d rather just&be whatever makes&people like me./"
	        GS.msg[8]= "\\E6Eheheh.../"
	        GS.msg[9]= "\\E7.../"
	        GS.msg[10]= "\\E8.../"
	        GS.msg[11]= "No, you\'re right./"
	        GS.msg[12]= "Every day I\'m&scared.../"
	        GS.msg[13]= "\\E7Scared what will&happen if people&learn the truth&on their own./"
	        GS.msg[14]= "\\M3They\'ll all get&hurt because of&me.../"
	        GS.msg[15]= "\\E9B\\M4ut how can I&tell UNDYNE the&tr..^1. truth?/"
	        GS.msg[16]= "\\E8I d-don\'t have the&confidence.../"
	        GS.msg[17]= "\\E9I\'m going to mess&it up^1!&How can I&practice!?/%%"
	    } else  {
	        GS.faceemotion= 7
	        GS.flag[20]= 4
	        GS.msg[0]= "Yeah..^1. yeah^1, you\'re&right!/"
	        GS.msg[1]= "\\E6I\\M0\'ve come this far^1,&I c-can\'t tell&her now!/"
	        GS.msg[2]= "\\E7Sh-she\'d be really&hurt if she found&out^1, right?/"
	        GS.msg[3]= "\\E5S-so it\'ll just&be^1, uh^1, a little&secret!/"
	        GS.msg[4]= "\\M1What people don\'t&know can\'t hurt&them!!/"
	        GS.msg[5]= "\\M0Th-thank God I\'ve&got an honest&friend like you!!/"
	        GS.msg[6]= ".../"
	        GS.msg[7]= "\\E3.../"
	        GS.msg[8]= "\\M1B..^1. but what if she&finds out on her&own^1, somehow?/"
	        GS.msg[9]= "\\E7O\\M0r if I ever&m-mess up.../"
	        GS.msg[10]= "\\M4Sh-she\'d find out&the truth^1, and.../"
	        GS.msg[11]= "\\E8Pr-probably be even&more hurt than if&I told her my/"
	        GS.msg[12]= "\\E6N\\M0-not to mention^1,&l-lying so far..^1.&h..^1. has.../"
	        GS.msg[13]= "\\E8Been really&stressful^1, and scary./"
	        GS.msg[14]= "\\E3.../"
	        GS.msg[15]= "\\E4I think I\'m going&to have to tell&her the truth./"
	        GS.msg[16]= "\\E9B-but how!?/"
	        GS.msg[17]= "\\E8I..^1. I don\'t have&the confidence.../"
	        GS.msg[18]= "\\E7How am I supposed&to practice&something like that!?/%%"
	    }
	    scr_blcon(xx - 260, yy, 1)
	    cn= 58
	}
	if(cn == 58 and not instance_exists(782/* OBJ_WRITER */)) {
	    cn= 59
	    $Alarm4.start((10) / 30.0)
	}
	if(cn == 60) {
	    choice= 0
	    choicer= 1
	    GS.typer= 1
	    GS.msg[0]= "   Let\'s           Obviously&   Roleplay        Let\'s    &   It              Roleplay"
	    iii= instance_create(GS.idealborder[0], GS.idealborder[2], 785/* OBJ_INSTAWRITER */)
	    with(iii) halt= 0
	    cn= 61
	}
	if(cn == 61 and choicer == 2) {
	    if(instance_exists(782/* OBJ_WRITER */)) {
	        // OBJ_WRITER
	        with(782) instance_destroy()
	    }
	    cn= 62
	    choicer= 0
	    $Alarm4.start((10) / 30.0)
	}
	if(cn == 63) {
	    GS.msc= 0
	    xx= al.x
	    yy= al.y
	    if(skip == 1) {
	        caster_stop(-3)
	        GS.currentsong= caster_loop(lab, 1, 0.75)
	    }
	    GS.typer= 74
	    GS.faceemotion= 4
	    GS.flag[20]= 0
	    GS.msg[0]= "\\E4R..^1. roleplay?/"
	    GS.msg[1]= "\\E3.../"
	    GS.msg[2]= "\\E5.\\M1.. That actually&sounds kind of&fun!/"
	    GS.msg[3]= "\\M0OK^1, which one of&us will be Undyne?/*"
	    scr_blcon(xx - 260, yy, 1)
	    cn= 64
	}
	if(cn == 64 and not instance_exists(782/* OBJ_WRITER */) and OBJ_WRITER.stringno == 3 and OBJ_WRITER.halt != 0) {
	    choice= 0
	    choicer= 1
	    GS.typer= 1
	    GS.msg[0]= "                              &   I\'ll be         You\'ll be&   Undyne          Undyne   "
	    iii= instance_create(GS.idealborder[0], GS.idealborder[2], 785/* OBJ_INSTAWRITER */)
	    with(iii) halt= 0
	    cn= 65
	}
	if(cn == 65 and choicer == 2) {
	    if(instance_exists(782/* OBJ_WRITER */)) {
	        // OBJ_WRITER
	        with(782) instance_destroy()
	    }
	    if(choice == 0) cn= 69
	    else  cn= 89
	    choicer= 0
	    $Alarm4.start((10) / 30.0)
	}
	if(cn == 70) {
	    GS.typer= 74
	    GS.faceemotion= 6
	    GS.flag[20]= 0
	    GS.msg[0]= "Oh^1. Right^1.&Obviously^1.&Ehehe./"
	    GS.msg[1]= "\\E2A\\M1hem./"
	    GS.msg[2]= "\\E0H-hi\\M3 Undyne..^1.&H-how are you doing&today?/*"
	    scr_blcon(xx - 260, yy, 1)
	    cn= 71
	}
	if(cn == 71 and not instance_exists(782/* OBJ_WRITER */) and OBJ_WRITER.stringno == 2 and OBJ_WRITER.halt != 0) {
	    choice= 0
	    choicer= 1
	    GS.typer= 1
	    GS.msg[0]= "                              &   I\'m fine.       YOur &                      cute, "
	    iii= instance_create(GS.idealborder[0], GS.idealborder[2], 785/* OBJ_INSTAWRITER */)
	    with(iii) halt= 0
	    cn= 72
	}
	if(cn == 72 and choicer == 2) {
	    if(instance_exists(782/* OBJ_WRITER */)) {
	        // OBJ_WRITER
	        with(782) instance_destroy()
	    }
	    cn= 73
	    choicer= 0
	    $Alarm4.start((10) / 30.0)
	}
	if(cn == 74) {
	    GS.typer= 74
	    GS.flag[20]= 0
	    if(choice == 0) {
	        GS.msg[0]= "\\E5Ha^1! Ha^1!&Glad to hear it!!/"
	        GS.msg[1]= "\\E3.../"
	        GS.msg[2]= "\\E4Uhhh^1, so I\'d like&to^1, um^1, talk to&you about&something./%%"
	    } else  {
	        GS.msg[0]= "\\E5Th..^1. thanks!/"
	        GS.msg[1]= "\\E6You say that to me&a lot^1, and I&never know what&to say!!/"
	        GS.msg[2]= "\\E6But I know^1, you just^1,&mean it platonically^1,&because we\'re just&friends!/"
	        GS.msg[3]= "\\M1Eheheh!!!/"
	        GS.msg[4]= "\\E3.../"
	        GS.msg[5]= "\\E4Uhhh^1, so I\'d like&to^1, um^1, talk to&you about&something./%%"
	    }
	    scr_blcon(xx - 260, yy, 1)
	    cn= 74.1
	}
	if(cn == 74.1 and not instance_exists(782/* OBJ_WRITER */)) {
	    cn= 74.2
	    $Alarm4.start((20) / 30.0)
	}
	if(cn == 75.2) cn= 75
	if(cn == 75 and not instance_exists(782/* OBJ_WRITER */)) {
	    choice= 0
	    choicer= 1
	    GS.typer= 1
	    GS.msg[0]= "                              &   What is it,     THEN SHe&   Alphys.         Kisses YOu"
	    iii= instance_create(GS.idealborder[0], GS.idealborder[2], 785/* OBJ_INSTAWRITER */)
	    with(iii) halt= 0
	    cn= 76
	}
	if(cn == 76 and choicer == 2) {
	    if(instance_exists(782/* OBJ_WRITER */)) {
	        // OBJ_WRITER
	        with(782) instance_destroy()
	    }
	    cn= 77
	    choicer= 0
	    $Alarm4.start((10) / 30.0)
	}
	if(cn == 78) {
	    GS.typer= 74
	    GS.flag[20]= 0
	    if(choice == 0) {
	        GS.msg[0]= "\\E3Umm, you see..^1.&I..^1. I.../"
	        GS.msg[1]= "\\M3I..^1. I h-haven\'t been&exactly truthful&w-w-with you.../"
	        GS.msg[2]= "\\E4Y\\M4..^1. you see^1, I..^1. I.../"
	        GS.msg[3]= "\\E9Oh^1, forget it!/"
	        GS.msg[4]= "\\M0Undyne!!!/"
	        GS.msg[5]= "I..^1. I want to&tell you how I&feel!/"
	        GS.msg[6]= "\\M4Y-you\'re so brave^1,&a-and s-strong..^1.&A-and nice.../"
	        GS.msg[7]= "Y-you always listen&t-to me when I talk&about n-n-nerdy&stuff.../"
	        GS.msg[8]= "\\E0Y-you always d-d-do&your best to m-make&me f-f-feel&special.../"
	        GS.msg[9]= "\\E3L-like t-telling me&that y-you\'ll b-beat&up anyone that&g-gets in my way.../%%"
	    } else  {
	        GS.msg[0]= "\\E9WH-WHAT!?/"
	        GS.msg[1]= "\\M1UNDYNE WOULD NEVER^1,&UH..../"
	        GS.msg[2]= "\\E3.../"
	        GS.msg[3]= "\\M0.../"
	        GS.msg[4]= "\\E4I kiss her back..^1.&S..^1. softly.../"
	        GS.msg[5]= "\\M4I..^1. l-look gently&into her eyes.../%%"
	    }
	    scr_blcon(xx - 260, yy, 1)
	    cn= 79
	}
	if(cn == 79 and not instance_exists(782/* OBJ_WRITER */)) {
	    pitch= 0.75
	    al.shake= 2
	    GS.typer= 75
	    if(choice == 0) {
	        GS.flag[20]= 7
	        GS.faceemotion= 11
	        GS.msg[0]= "UNDYNE!!!/"
	        GS.msg[1]= "I CAN\'T TAKE THIS&ANY LONGER!!!/"
	        GS.msg[2]= "I\'M MADLY IN LOVE&WITH YOU!!!/"
	        GS.msg[3]= "HOLD ME^1, UNDYNE!^1!&HOLD ME!!!/%%"
	    } else  {
	        GS.flag[20]= 7
	        GS.faceemotion= 11
	        GS.msg[0]= "I START HOLLERING!!/"
	        GS.msg[1]= "UNDYNE!!!^1!&I LOVE YOU!!!/"
	        GS.msg[2]= "UNDYNE!!^1!&KISS ME AGAIN^1,&UNDYNE!!!/%%"
	    }
	    scr_blcon(xx - 260, yy, 1)
	    cn= 110
	}
	if(cn == 90) {
	    GS.typer= 74
	    GS.faceemotion= 9
	    GS.flag[20]= 0
	    GS.msg[0]= "\\E9M\\M0-m-me^1?&Undyne???/"
	    GS.msg[1]= "\\E7Uh^1, uh^1, uh^1, uh^1,&ok!/"
	    GS.msg[2]= "\\E6I\'ll say what I&think she\'d say^1,&and you..^1. ummm..../"
	    GS.msg[3]= "\\E5You show me what&I\'m supposed to do!/"
	    GS.msg[4]= "\\E2*\\M1ahem*/"
	    GS.msg[5]= "\\E0N\\M2gahhhh!!^1!&Hey^1, Alphys!&You look cute&today!/"
	    GS.msg[6]= "\\E5Which I say often^1!&But platonically&because I would&NEVER like you./*"
	    scr_blcon(xx - 260, yy, 1)
	    cn= 91
	}
	if(cn == 91 and not instance_exists(782/* OBJ_WRITER */) and OBJ_WRITER.stringno == 6 and OBJ_WRITER.halt != 0) {
	    choice= 0
	    choicer= 1
	    GS.typer= 1
	    GS.msg[0]= "   Hi Undyne!      Yo your&   Can we          one hot&   talk?           hotbaby"
	    iii= instance_create(GS.idealborder[0], GS.idealborder[2], 785/* OBJ_INSTAWRITER */)
	    with(iii) halt= 0
	    cn= 92
	}
	if(cn == 92 and choicer == 2) {
	    if(instance_exists(782/* OBJ_WRITER */)) {
	        // OBJ_WRITER
	        with(782) instance_destroy()
	    }
	    cn= 93
	    choicer= 0
	    $Alarm4.start((10) / 30.0)
	}
	if(cn == 94) {
	    GS.typer= 74
	    GS.flag[20]= 0
	    if(choice == 0) {
	        GS.flag[20]= 3
	        GS.faceemotion= 2
	        GS.msg[0]= "Talk^1, to you^1?&Hmmm..^1.&I guess so./"
	        GS.msg[1]= "I often seem&excited to listen&to you for some&reason./"
	        GS.msg[2]= "\\E4I will make intent&eye contact with you&so you sweat while&you talk./"
	        GS.msg[3]= "\\E0So^1, what is it?/%%"
	    } else  {
	        GS.flag[20]= 1
	        GS.faceemotion= 9
	        GS.msg[0]= "What!^1?&A... alphys!?/"
	        GS.msg[1]= "What\'s gotten into&you!?/"
	        GS.msg[2]= "\\E9H\\M2-hotbaby!^1?&How dare you call&me that!?/"
	        GS.msg[3]= "\\E5First off^1, I\'m a&baby KNIGHT!/"
	        GS.msg[4]= "Captain of the&babies!!!/"
	        GS.msg[5]= "Treat my position&with respect^1, or I&will strike you&down!/"
	        GS.msg[6]= "\\M3Uh^1, now pretend&I\'m suplexing a&boulder for no&reason./"
	        GS.msg[7]= "\\E9U\\M0m^1! Anyway^1!&What do you&want to say^1,&Alphys!?/%%"
	    }
	    scr_blcon(xx - 260, yy, 1)
	    cn= 94.1
	}
	if(cn == 94.1 and not instance_exists(782/* OBJ_WRITER */)) {
	    cn= 94.2
	    $Alarm4.start((20) / 30.0)
	}
	if(cn == 95.2) cn= 95
	if(cn == 95 and not instance_exists(782/* OBJ_WRITER */)) {
	    choice= 0
	    choicer= 1
	    GS.typer= 1
	    GS.msg[0]= "   Let\'s tell      Alphys&   Undyne the      gives u&   truth           a kiss,"
	    iii= instance_create(GS.idealborder[0], GS.idealborder[2], 785/* OBJ_INSTAWRITER */)
	    with(iii) halt= 0
	    cn= 96
	}
	if(cn == 96 and choicer == 2) {
	    if(instance_exists(782/* OBJ_WRITER */)) {
	        // OBJ_WRITER
	        with(782) instance_destroy()
	    }
	    cn= 97
	    choicer= 0
	    $Alarm4.start((10) / 30.0)
	}
	if(cn == 98) {
	    GS.typer= 74
	    GS.flag[20]= 0
	    if(choice == 0) {
	        GS.flag[20]= 4
	        GS.faceemotion= 9
	        GS.msg[0]= "What!?/"
	        GS.msg[1]= "So you\'ve been&lying to me the&whole time.../"
	        GS.msg[2]= "\\E7Alphys!!^1!&I can\'t believe you!/"
	        GS.msg[3]= "\\E8You w-worthless&slime!/"
	        GS.msg[4]= "\\E9How could you&betray our&friendship!!/"
	        GS.msg[5]= "\\E8After how much I&trusted you!!!/%%"
	    } else  {
	        GS.flag[20]= 1
	        GS.faceemotion= 9
	        GS.msg[0]= "WH-WHAT!^1?&I WOULD NEVER.../"
	        GS.msg[1]= "\\M0Alphys^1!&What are you&d-doing!/"
	        GS.msg[2]= "I s-say^1, pushing&you away from&me.../"
	        GS.msg[3]= "\\E3You sh-shouldn\'t&k-kiss me...!!/"
	        GS.msg[4]= "\\E3.../"
	        GS.msg[5]= "\\E4.../"
	        GS.msg[6]= "\\E3B-but^1, y-you\'re so&good at it.../"
	        GS.msg[7]= "\\E5B-b-b-because of what&you learned from&th-those d-d-dating&video games.../"
	        GS.msg[8]= "I...^1.&I c-c-can\'t help but&k-k-kiss you back.../%%"
	    }
	    scr_blcon(xx - 260, yy, 1)
	    cn= 99
	}
	if(cn == 99 and not instance_exists(782/* OBJ_WRITER */)) {
	    pitch= 0.75
	    al.shake= 2
	    GS.typer= 75
	    if(choice == 0) {
	        GS.flag[20]= 7
	        GS.faceemotion= 11
	        GS.msg[0]= "ALPHYS^1!&I\'LL NEVER LOVE YOU!/"
	        GS.msg[1]= "NEVER WILL YOU FEEL&MY PASSIONATE&EMBRACE!!!/"
	        GS.msg[2]= "I^1, UNDYNE^1, WILL&NEVER KISS YOU&WITH MY BEAUTIFUL&LIPS!!!/%%"
	    } else  {
	        GS.flag[20]= 7
	        GS.faceemotion= 11
	        GS.msg[0]= "NGAHHHH!!^1!&NGAHHH!!!!/"
	        GS.msg[1]= "I\'M UNDYNE AND I\'M&PILING ON THE&SMOOCHES!!!/%%"
	    }
	    scr_blcon(xx - 260, yy, 1)
	    cn= 110
	}
	if(cn == 110 and instance_exists(782/* OBJ_WRITER */)) {
	    if(pitch < 2) pitch+= 0.01
	    caster_set_pitch(GS.currentsong, pitch)
	}
	if(cn == 110 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.facechoice= 5
	    // obj_adate_ubody
	    with(177) instance_destroy()
	    und= instance_create(-100, trashcan.y + 10, 177/* obj_adate_ubody */)
	    und.y-= und.sprite_height * 2 + 66
	    und.velocity.x= 20
	    cn= 111
	}
	if(cn == 111 and und.x > 60) {
	    obj_adate_body.set= 1
	    obj_adate_body.shake= 0
	    GS.faceemotion= 8
	    und.x= 60
	    und.velocity.x= 0
	    cn= 112
	    $Alarm4.start((15) / 30.0)
	}
	if((cn == 111 or cn == 112) and caster_is_playing(GS.currentsong)) {
	    if(pitch > 0) pitch-= 0.04
	    else  caster_stop(GS.currentsong)
	    caster_set_pitch(GS.currentsong, pitch)
	    caster_set_volume(GS.currentsong, pitch / 2)
	}
	if(cn == 113) {
	    caster_stop(GS.currentsong)
	    GS.typer= 39
	    xxx= und.x
	    yyy= und.y
	    GS.msg[0]= "WHAT did you just&say?/%%"
	    scr_blcon(xxx + 90, yyy + 20, 0)
	    cn= 113.1
	}
	if(cn == 113.1 and not instance_exists(782/* OBJ_WRITER */)) {
	    cn= 113.2
	    $Alarm4.start((5) / 30.0)
	    al.velocity.x= 10
	}
	if(cn == 114.2) cn= 114
	if(cn == 114 and not instance_exists(782/* OBJ_WRITER */)) {
	    xx= al.x
	    yy= al.y
	    al.velocity.x= 0
	    GS.typer= 74
	    GS.faceemotion= 1
	    GS.flag[20]= 0
	    GS.msg[0]= "\\E1U..^1. Undyne^1!&I..^1. was..^1. just.../%%"
	    scr_blcon(xx - 250, yy, 1)
	    cn= 115
	}
	if(cn == 115 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.typer= 39
	    xxx= und.x
	    yyy= und.y
	    GS.msg[0]= "\\F6Hey^1, woah^1, wait&a second!/"
	    GS.msg[1]= "Your outfit\'s really&cute^1!&What\'s the occasion?/"
	    GS.msg[2]= "\\F0.\\E0../"
	    GS.msg[3]= "\\F2W\\E1ait a second./"
	    GS.msg[4]= "\\F1Are you two.../"
	    GS.msg[5]= "\\F3On a date?/%%"
	    scr_blcon(xxx + 90, yyy + 20, 0)
	    cn= 116
	}
	if(cn == 116 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.typer= 74
	    GS.faceemotion= 1
	    GS.flag[20]= 0
	    GS.msg[0]= "\\E1UHHH^1, \\F4YES!/"
	    GS.msg[1]= "\\E7I mean^1, \\F5UHHH NO!/"
	    GS.msg[2]= "\\E3I mean^1, \\F7we were^1,& bu^1t%"
	    GS.msg[3]= "\\E1I mean^1, actually we&were \\F3only romantically&roleplaying as you!/%%"
	    scr_blcon(xx - 250, yy, 1)
	    cn= 117
	}
	if(cn == 117 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.typer= 39
	    xxx= und.x
	    yyy= und.y
	    GS.msg[0]= "\\F3WHAT???/%%"
	    scr_blcon(xxx + 90, yyy + 20, 0)
	    cn= 118
	}
	if(cn == 118 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.typer= 74
	    GS.faceemotion= 8
	    GS.flag[20]= 0
	    GS.msg[0]= "\\E8I MEAN!!!/"
	    GS.msg[1]= "\\E3I mean.../"
	    GS.msg[2]= "Undyne..^1.&I.../%%"
	    scr_blcon(xx - 250, yy, 1)
	    cn= 119
	}
	if(cn == 119 and not instance_exists(782/* OBJ_WRITER */)) {
	    confession= caster_load("music/confession.ogg")
	    GS.currentsong= caster_loop(confession, 1, 1)
	    GS.typer= 74
	    GS.faceemotion= 7
	    GS.flag[20]= 0
	    GS.msg[0]= "\\F4I\'ve been lying to&you!/%%"
	    scr_blcon(xx - 250, yy, 1)
	    cn= 120
	}
	if(cn == 120 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.typer= 39
	    xxx= und.x
	    yyy= und.y
	    GS.msg[0]= "\\F3WHAT??^1?&ABOUT WHAT???/%%"
	    scr_blcon(xxx + 90, yyy + 20, 0)
	    cn= 121
	}
	if(cn == 121 and not instance_exists(782/* OBJ_WRITER */)) {
	    trashcan.z_index= 90
	    al.z_index= -1
	    und.z_index= 0
	    GS.typer= 74
	    GS.faceemotion= 3
	    GS.flag[20]= 0
	    GS.msg[0]= "About... well.../"
	    GS.msg[1]= "\\E2Everything!/%%"
	    scr_blcon(xx - 250, yy, 1)
	    cn= 122
	}
	if(cn == 122 and not instance_exists(782/* OBJ_WRITER */)) {
	    al.velocity.x= -10
	    cn= 121.1
	    $Alarm4.start((15) / 30.0)
	}
	if(cn == 122.1) {
	    xx= al.x
	    al.velocity.x= 0
	    GS.msg[0]= "\\E7I told you that& seaweed was like...&scientifically&important...%"
	    GS.msg[1]= "\\F5Really, I just...&I just use it to&make ice cream^1!%%"
	    scr_blcon(xx + 110, yy, 0)
	    cn= 122.3
	}
	if(cn == 122.3 and not instance_exists(782/* OBJ_WRITER */)) {
	    al.velocity.x= -10
	    cn= 121.4
	    $Alarm4.start((5) / 30.0)
	}
	if(cn == 122.4) {
	    xx= al.x
	    al.velocity.x= 0
	    GS.msg[0]= "And those human&history books I&keep reading...%"
	    GS.msg[1]= "\\F7Those are just&dorky comic books^1!%%"
	    scr_blcon(xx + 110, yy, 0)
	    cn= 122.5
	}
	if(cn == 122.5 and not instance_exists(782/* OBJ_WRITER */)) {
	    al.velocity.x= -10
	    cn= 121.6
	    $Alarm4.start((5) / 30.0)
	}
	if(cn == 122.6) {
	    xx= al.x
	    al.velocity.x= 0
	    GS.msg[0]= "And the history&movies..^1.&those..^2.%"
	    GS.msg[1]= "\\F2Those are just^1, uh^1,&anime^2!&They aren\'t real^2!%%"
	    scr_blcon(xx + 110, yy, 0)
	    cn= 122.8
	}
	if(cn == 122.8 and not instance_exists(782/* OBJ_WRITER */)) {
	    al.velocity.x= -9
	    cn= 121.9
	    $Alarm4.start((5) / 30.0)
	}
	if(cn == 122.9) {
	    xx= al.x
	    al.velocity.x= 0
	    GS.msg[0]= "And that time I&told you I was&busy with work on&the phone..^1. I...%"
	    GS.msg[1]= "\\F9Was just eating&frozen yogurt in&my pajamas!%"
	    GS.msg[2]= "\\E3That time I...%%"
	    scr_blcon(xx + 110, yy, 0)
	    cn= 125
	}
	if(cn == 125 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.typer= 39
	    xxx= und.x
	    yyy= und.y
	    GS.msg[0]= "Alphys./%%"
	    scr_blcon(xxx + 90, yyy - 10, 0)
	    cn= 127
	}
	if(cn == 127 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.typer= 74
	    GS.faceemotion= 5
	    GS.flag[20]= 0
	    GS.msg[0]= "\\E5I..^1. I just wanted to&impress you!/"
	    GS.msg[1]= "I just wanted you&to think I was&smart and cool./"
	    GS.msg[2]= "That I wasn\'t&some..^1.&nerdy loser./%%"
	    scr_blcon(xx + 110, yy, 0)
	    cn= 130
	}
	if(cn == 130 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.typer= 39
	    xxx= und.x
	    yyy= und.y
	    und.visible= 0
	    al.visible= 0
	    thrower= instance_create(und.x - 34, und.y - 56, 172/* obj_ua_throwtest */)
	    GS.msg[0]= "Alphys./%%"
	    scr_blcon(xxx + 90, yyy - 10, 0)
	    cn= 131
	}
	if(cn == 131 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.typer= 74
	    GS.faceemotion= 5
	    GS.flag[20]= 0
	    GS.msg[0]= "\\E5Undyne^1, I..^1.&I really think you\'re&neat^1, OK.../%%"
	    scr_blcon(xx + 110, yy, 0)
	    cn= 132
	}
	if(cn == 132 and not instance_exists(782/* OBJ_WRITER */)) {
	    thrower.con= 1
	    GS.typer= 39
	    xxx= und.x
	    yyy= und.y
	    GS.msg[0]= "Alphys./"
	    GS.msg[1]= "Shhhh./"
	    GS.msg[2]= "Shhhhhh./%%"
	    scr_blcon(xxx + 140, yyy + 40, 0)
	    cn= 133
	}
	if(cn == 133 and not instance_exists(782/* OBJ_WRITER */)) {
	    cn= 134
	    $Alarm4.start((30) / 30.0)
	}
	if(cn == 135) {
	    caster_stop(GS.currentsong)
	    thrower.con= 3
	    cn= 136
	    $Alarm4.start((100) / 30.0)
	}
	if(cn == 137) {
	    with(thrower) instance_destroy()
	    GS.facechoice= 0
	    und.set= 1
	    und.visible= 1
	    with(trashcan) {
	        fadein= 1
	        con= 1
	    }
	    cn= 138
	    $Alarm4.start((90) / 30.0)
	}
	if(cn == 139) {
	    utheme= caster_load("music/undynetruetheme.ogg")
	    GS.currentsong= caster_loop(utheme, 0.9, 1)
	    GS.msg[0]= "\\F0Alphys!/"
	    GS.msg[1]= "I..^1. think you\'re&neat^1, too, I guess./"
	    GS.msg[2]= "\\F1But, you\'ve gotta&realize.../"
	    GS.msg[3]= "\\F2Most of what you&said really doesn\'t&matter to me./"
	    GS.msg[4]= "I don\'t care if&you\'re watching kid&cartoons or reading&history books./"
	    GS.msg[5]= "\\F3To me^1, ALL of&that stuff is&just NERDY CRAP!/"
	    GS.msg[6]= "What I like about&you is that you\'re&PASSIONATE^1!&You\'re ANALYTICAL!!/"
	    GS.msg[7]= "It doesn\'t matter&what it is^1!&YOU CARE ABOUT IT!!/"
	    GS.msg[8]= "\\F4100-PERCENT!^1!&AT MAXIMUM POWER!!!/"
	    GS.msg[9]= "\\F5... so^1, you don\'t&have to lie to me./"
	    GS.msg[10]= "\\F0I don\'t want you&to have to lie to&anyone anymore./"
	    GS.msg[11]= "\\F6Alphys..^1. I want to&help you become&happy with who&you are!/"
	    GS.msg[12]= "\\F5And I know just&the training you&need to do that!/%%"
	    GS.typer= 39
	    xxx= und.x
	    yyy= und.y
	    scr_blcon(xxx + 90, yyy - 10, 0)
	    cn= 140
	}
	if(cn == 140 and not instance_exists(782/* OBJ_WRITER */)) {
	    trashcan.shake= 3
	    cn= 141
	    $Alarm4.start((30) / 30.0)
	}
	if(cn == 142) {
	    trashcan.shake= 0
	    GS.faceemotion= 0
	    trashcan.aturn= 1
	    cn= 143
	    $Alarm4.start((30) / 30.0)
	}
	if(cn == 144) {
	    xx= trashcan.x
	    yy= trashcan.y - trashcan.sprite_height * 2 + 20
	    GS.typer= 74
	    GS.faceemotion= 0
	    GS.msg[0]= "Undyne..^1.&You.../"
	    GS.msg[1]= "\\E4Y-you\'re gonna train&me...?/%%"
	    scr_blcon(xx - 320, yy, 1)
	    cn= 145
	}
	if(cn == 145 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.msg[0]= "\\F2Pffft^1, what^1?&ME?/%%"
	    GS.typer= 39
	    xxx= und.x
	    yyy= und.y
	    scr_blcon(xxx + 90, yyy - 10, 0)
	    cn= 146
	}
	if(cn == 146 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.faceemotion= 0
	    caster_stop(GS.currentsong)
	    pap= instance_create(400, 400, 173/* obj_adate_papyrus */)
	    cn= 147
	    $Alarm4.start((110) / 30.0)
	}
	if(cn == 148) {
	    GS.faceemotion= 3
	    GS.msg[0]= "\\F6Nah^1, I\'m gonna&get Papyrus to&do it./%%"
	    GS.typer= 39
	    scr_blcon(xxx + 90, yyy + 120, 0)
	    cn= 149
	}
	if(cn == 149 and not instance_exists(782/* OBJ_WRITER */)) {
	    pap.con= 2
	    cn= 150
	    $Alarm4.start((60) / 30.0)
	}
	if(cn == 151) {
	    GS.faceemotion= 2
	    GS.typer= 22
	    GS.msg[0]= "GET THOSE BONES&SHAKIN\'!!!/"
	    GS.msg[1]= "IT\'S TIME TO JOG&100 LAPS^1, HOOTING&ABOUT HOW GREAT&WE ARE!!!/%%"
	    scr_blcon(pap.x - 150, pap.y - 80, 1)
	    cn= 153
	}
	if(cn == 153 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.faceemotion= 2
	    GS.msg[0]= "Ready^1?&I\'m about to start&the timer!/%%"
	    GS.typer= 39
	    scr_blcon(xxx + 90, yyy + 20, 0)
	    cn= 155
	}
	if(cn == 155 and not instance_exists(782/* OBJ_WRITER */)) {
	    xx= trashcan.x
	    yy= trashcan.y - trashcan.sprite_height * 2 + 20
	    GS.typer= 74
	    GS.faceemotion= 0
	    GS.msg[0]= "\\E5 & &    U-Undyne.../"
	    GS.msg[1]= "\\E1 & &    I\'ll do my&    best...!/%%"
	    scr_blcon(xx - 80, yy - 140, 2)
	    cn= 156
	}
	if(cn == 156 and not instance_exists(782/* OBJ_WRITER */)) {
	    // obj_musfadeout
	    with(92) instance_destroy()
	    pap.velocity.x= 10
	    trashcan.velocity.x= 10
	    cn= 157
	    $Alarm4.start((80) / 30.0)
	}
	if(cn == 158) {
	    und.set= 0
	    GS.facechoice= 1
	    caster_free(-3)
	    GS.currentsong= caster_load("music/undynetruetheme.ogg")
	    caster_loop(GS.currentsong, 0.65, 2)
	    GS.msg[0]= "\\F3OH MY GOD!!!/"
	    GS.msg[1]= "\\F5She was kidding^1,&right!? /"
	    GS.msg[2]= "Those cartoons..^1.&those comics.../"
	    GS.msg[3]= "\\F7Those are still&REAL^1, right!?/"
	    GS.msg[4]= "\\F8ANIME\'S REAL^1,&RIGHT?!?!/%%"
	    GS.typer= 39
	    scr_blcon(xxx + 90, yyy - 20, 0)
	    cn= 158.1
	}
	if(cn == 158.1 and not instance_exists(782/* OBJ_WRITER */)) {
	    $Alarm4.start((15) / 30.0)
	    cn= 158.2
	}
	if(cn == 159.2) cn= 159
	if(cn == 159 and not instance_exists(782/* OBJ_WRITER */)) {
	    choice= 0
	    choicer= 1
	    GS.typer= 1
	    GS.msg[0]= "   Anime is        Anime &   Real            is not &                   real"
	    iii= instance_create(GS.idealborder[0], GS.idealborder[2], 785/* OBJ_INSTAWRITER */)
	    with(iii) halt= 0
	    cn= 160
	}
	if(cn == 160 and choicer == 2) {
	    if(instance_exists(782/* OBJ_WRITER */)) {
	        // OBJ_WRITER
	        with(782) instance_destroy()
	    }
	    cn= 161
	    choicer= 0
	    $Alarm4.start((10) / 30.0)
	}
	if(cn == 162) {
	    if(choice == 0) {
	        GS.msg[0]= "HA HA HA!!!/"
	        GS.msg[1]= "I KNEW IT!!!/"
	        GS.msg[2]= "GIGANTIC SWORDS!!^1!&MAGICAL PRINCESSES^1!&HERE I COME!!!/%%"
	    } else  {
	        GS.msg[0]= "\\F3No..^1. NO!!!!/"
	        GS.msg[1]= "I CAN FEEL MY&HEART BREAKING&INTO PIECES!!!/%%"
	    }
	    GS.typer= 39
	    scr_blcon(xxx + 90, yyy - 20, 0)
	    cn= 163
	}
	if(cn == 163 and not instance_exists(782/* OBJ_WRITER */)) {
	    mfo= instance_create(0, 0, 92/* obj_musfadeout */)
	    cn= 164
	    $Alarm4.start((20) / 30.0)
	}
	if(cn == 165 and not instance_exists(782/* OBJ_WRITER */)) {
	    if(choice == 0) {
	        GS.msg[0]= "\\F6.../"
	        GS.msg[1]= "Uhh^1, thanks for&taking care of&Alphys./"
	        GS.msg[2]= "\\F9I didn\'t get to&say what I wanted&to^1, but.../"
	        GS.msg[3]= "\\F0Things seem like&they\'re going to get&better for her./"
	        GS.msg[4]= "\\F6Well^1, I gotta go&catch up with&them!/"
	        GS.msg[5]= "Later!/%%"
	    } else  {
	        GS.msg[0]= "\\F3.../"
	        GS.msg[1]= "\\F5... no^1, I can&survive this.../"
	        GS.msg[2]= "\\F3I have to be strong./"
	        GS.msg[3]= "\\F9For Alphys./"
	        GS.msg[4]= "\\F0Thank you^1, human^1,&for telling me&the truth./"
	        GS.msg[5]= "\\F9I\'ll try my best to&live in this&world.../"
	        GS.msg[6]= "\\F0See you later!/%%"
	    }
	    GS.typer= 39
	    scr_blcon(xxx + 90, yyy - 20, 0)
	    cn= 166
	}
	if(cn == 166 and not instance_exists(782/* OBJ_WRITER */)) {
	    und.velocity.x= 20
	    cn= 167
	    $Alarm4.start((30) / 30.0)
	}
	if(cn == 168) {
	    instance_create(0, 0, 149/* obj_unfader */)
	    cn= 169
	    $Alarm4.start((12) / 30.0)
	}
	if(cn == 170) {
	    ini_open("undertale.ini")
	    adhd= ini_read_real("Alphys", "AD", 0)
	    ini_write_real("Alphys", "AD", adhd + 1)
	    ini_close()
	    instance_create(0, 0, 148/* obj_persistentfader */)
	    GS.flag[492]= 0
	    GS.flag[493]= 10
	    get_tree().change_scene_to_file("res://godot_rooms/113.tscn")
	}
	if(instance_exists(188/* obj_blconwideslave */)) scr_textskip()
	if(cn == 999 and not instance_exists(782/* OBJ_WRITER */)) {
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
	    cn= 100
	}
	if(cn == 100 and not instance_exists(782/* OBJ_WRITER */) and OBJ_WRITER.stringno == 6 and OBJ_WRITER.halt != 0) {
	    choice= 0
	    choicer= 1
	    GS.typer= 1
	    GS.msg[0]= "                              &   Yes             No       &                            "
	    iii= instance_create(GS.idealborder[0], GS.idealborder[2], 785/* OBJ_INSTAWRITER */)
	    with(iii) halt= 0
	    cn= 101
	}
	if(cn == 102 and choicer == 2) {
	    if(instance_exists(782/* OBJ_WRITER */)) {
	        // OBJ_WRITER
	        with(782) instance_destroy()
	    }
	    cn= 103
	    choicer= 0
	    $Alarm4.start((10) / 30.0)
	}
	if(cn == 104) {
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
	    cn= 105
	}

func _on_outside_room():
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
	if(fadeouter == 1) {
	    if(fadeamt < 1) fadeamt+= 0.04
	    draw_set_color(0)
	    draw_set_alpha(fadeamt)
	    draw_rectangle(-10, -10, 999, 999, 0)
	    draw_set_alpha(1)
	}
	if(fadeouter == 2) {
	    if(fadeamt > 0) fadeamt-= 0.04
	    else  fadeouter= 0
	    draw_set_color(0)
	    draw_set_alpha(fadeamt)
	    draw_rectangle(-10, -10, 999, 999, 0)
	    draw_set_alpha(1)
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
