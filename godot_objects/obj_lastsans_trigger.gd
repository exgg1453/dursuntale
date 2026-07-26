# Auto-converted from GameMaker: obj_lastsans_trigger
extends Node2D

func _ready():
	con= 0
	if(GS.plot > 200) instance_destroy()
	scale.y= 6
	murder= 0
	if(scr_murderlv() >= 16) murder= 1

func _gm_event_2_4():
	con++

func _process(delta: float):
	if(con == 1) {
	    m= instance_create(0, 0, 92/* obj_musfadeout */)
	    m.fadespeed= 0.03
	    remx= view_xview[0]
	    obj_mainchara.cutscene= 1
	    view_object[0]= -4
	    obj_mainchara.x= 800
	    con= 0.5
	    ss= 0
	    $Alarm4.start((60) / 30.0)
	    ini_open("undertale.ini")
	    sf2= ini_read_real("Sans", "F", 0)
	    ini_close()
	    if(sf2 >= 3 and murder == 1) {
	        with(m) fadespeed= 0.1
	        $Alarm4.start((5) / 30.0)
	    }
	}
	if(con == 1.5) con= 2
	if(con == 2) {
	    view_xview[0]++
	    if(view_xview[0] >= 680 and ss == 0) {
	        ss= 1
	        sans= scr_marker(920, obj_mainchara.y, 1366)
	        sans.z_index= 1500
	    }
	    if(sf2 >= 3 and murder == 1)
	        view_xview[0]+= 3
	    if(view_xview[0] >= 750) {
	        con= 3
	        view_xview[0]= 750
	    }
	}
	if(con == 3) {
	    with(m) instance_destroy()
	    con= 3.1
	    $Alarm4.start((40) / 30.0)
	    if(sf2 >= 3 and murder == 1) $Alarm4.start((10) / 30.0)
	}
	if(con == 4.1) {
	    if(murder == 0) {
	        ini_open("undertale.ini")
	        endmet= ini_read_real("Sans", "EndMet", 0)
	        ini_close()
	        if(endmet == 0) {
	            ch= caster_load("music/churchbell.ogg")
	            caster_play(ch, 0.8, 1)
	            con= 4
	            $Alarm4.start((310) / 30.0)
	        }
	        if(endmet == 1) {
	            ch= caster_load("music/churchbell.ogg")
	            caster_play(ch, 0.8, 1.5)
	            con= 4
	            $Alarm4.start((206.666666666667) / 30.0)
	        }
	    } else  con= 100
	}
	if(con == 5) {
	    ini_open("undertale.ini")
	    endmet= ini_read_real("Sans", "EndMet", 0)
	    ini_write_real("Sans", "EndMet", 1)
	    ml1= ini_read_real("Sans", "MeetLv1", 0)
	    pass= ini_read_real("Sans", "Pass", 0)
	    ini_close()
	    GS.typer= 10
	    if(endmet == 1) GS.typer= 100
	    GS.msc= 0
	    GS.facechoice= 0
	    GS.faceemotion= 0
	    GS.msg[0]= "* So you finally made it./"
	    GS.msg[1]= "* The end of your journey&  is at hand./"
	    GS.msg[2]= "* In a few moments^1, you&  will meet the king./"
	    GS.msg[3]= "* Together.../"
	    GS.msg[4]= "* You will determine the&  future of this world./"
	    GS.msg[5]= "* That\'s then./"
	    GS.msg[6]= "* Now./"
	    GS.msg[7]= "* You will be judged./"
	    GS.msg[8]= "* You will be judged for&  your every action./"
	    GS.msg[9]= "* You will be judged for&  every EXP you\'ve earned./"
	    GS.msg[10]= "* What\'s EXP?/"
	    GS.msg[11]= "* It\'s an acronym./"
	    GS.msg[12]= "\\W* It stands for " + chr(ord('"')) + "\\Rexecution&  points\\W." + chr(ord('"')) + "/"
	    GS.msg[13]= "* A way of quantifying the&  pain you have inflicted on&  others./"
	    GS.msg[14]= "* When you kill someone^1,&  your EXP increases./"
	    GS.msg[15]= "* When you have enough EXP^1,&  your LOVE increases./"
	    GS.msg[16]= "* LOVE^1, too^1, is an&  acronym./"
	    GS.msg[17]= "\\W* It stands for " + chr(ord('"')) + "\\RLevel of&  Violence\\W." + chr(ord('"')) + "/"
	    GS.msg[18]= "* A way of measuring someone\'s&  capacity to hurt./"
	    GS.msg[19]= "* The more you kill^1, the&  easier it becomes to&  distance your/"
	    GS.msg[20]= "* The more you distance&  yourself^1, the less you&  will hurt./"
	    GS.msg[21]= "* The more easily you&  can bring yourself to&  hurt others./%%"
	    con= 6
	    if(pass > 0 and GS.lv == 1 and GS.kills == 0) {
	        GS.msg[0]= "* So you finally made it.../%%"
	        con= 26
	    }
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    if(GS.kills > 0) con= 5.1
	}
	if(con == 5.1 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 4.2
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 5.2 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.currentsong= caster_load("music/chokedup.ogg")
	    caster_loop(GS.currentsong, 1, 1)
	    GS.typer= 10
	    if(endmet == 1) GS.typer= 100
	    GS.msc= 0
	    GS.facechoice= 0
	    GS.faceemotion= 0
	    GS.msg[0]= "* Now^1, you understand./"
	    GS.msg[1]= "* It\'s time to begin your&  judgment./"
	    GS.msg[2]= "* Look inside your/"
	    GS.msg[3]= "* Have you really done the&  right thing?/"
	    GS.msg[4]= "* And^1, considering what&  you\'ve done.../"
	    GS.msg[5]= "* What will you do now?/"
	    GS.msg[6]= "* Take a moment to think&  about this./%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 10
	}
	if(con == 6 and not instance_exists(782/* OBJ_WRITER */)) {
	    ini_open("undertale.ini")
	    ml1= ini_read_real("Sans", "MeetLv1", 0)
	    ini_write_real("Sans", "MeetLv1", ml1 + 1)
	    ini_close()
	    GS.currentsong= caster_load("music/chokedup.ogg")
	    caster_loop(GS.currentsong, 1, 1)
	    GS.facechoice= 3
	    GS.faceemotion= 3
	    GS.typer= 10
	    GS.msg[0]= "\\TS* .../"
	    GS.msg[1]= "\\Ts*\\E0 ... but you^1.&* you never gained&  any LOVE./"
	    GS.msg[2]= "\\E1* \'course^1, that doesn\'t&  mean you\'re completely&  innocent or naive./"
	    GS.msg[3]= "\\E0* just that you kept&  a certain tenderness&  in your heart./"
	    GS.msg[4]= "* no matter the struggles&  or hardships you&  faced.../"
	    GS.msg[5]= "* you strived to do the&  right thing./"
	    GS.msg[6]= "* you refused to hurt&  anyone./"
	    GS.msg[7]= "* even when you ran&  away^1, you did it&  with a smile./"
	    GS.msg[8]= "* you never gained LOVE^1,&  but you gained love./"
	    GS.msg[9]= "* does that make sense?/"
	    GS.msg[10]= "* maybe not./"
	    GS.msg[11]= "\\E3* ..^1.&* now./"
	    GS.msg[12]= "\\E0* you\'re about to face&  the greatest challenge&  of your entire journey./"
	    GS.msg[13]= "* your actions here.../"
	    GS.msg[14]= "* will determine the&  fate of the entire&  world./"
	    GS.msg[15]= "* if you refuse to&  fight.../"
	    GS.msg[16]= "* asgore will take&  your soul and&  destroy humanity./"
	    GS.msg[17]= "* but if you kill&  asgore and go&  home.../"
	    GS.msg[18]= "* monsters will remain&  trapped underground./"
	    GS.msg[19]= "* what will you do?/"
	    GS.msg[20]= "\\E3* .../"
	    GS.msg[21]= "* well^1, if i were you^1,&  i would have thrown&  in the towel by now./"
	    GS.msg[22]= "\\E1* but you didn\'t get&  this far by giving&  up^1, did you?/"
	    GS.msg[23]= "\\E0* that\'s right./"
	    GS.msg[24]= "* you have something&  called " + chr(ord('"')) + "determination." + chr(ord('"')) + "/"
	    GS.msg[25]= "* so as long as you&  hold on.../"
	    GS.msg[26]= "* so as long as you&  do what\'s in your&  heart.../"
	    GS.msg[27]= "* i believe you can do&  the right thing./"
	    GS.msg[28]= "\\E3* alright./"
	    GS.msg[29]= "\\E0* we\'re all counting&  on you, kid./"
	    GS.msg[30]= "\\E2* good luck./%%"
	    con= 7
	    if(ml1 > 0) con= 26
	    instance_create(0, 0, 779/* obj_dialoguer */)
	}
	if(con == 7 and not instance_exists(782/* OBJ_WRITER */)) {
	    view_xview[0]--
	    if(view_xview[0] < 681) {
	        with(sans) instance_destroy()
	    }
	    if(view_xview[0] <= remx) con= 8
	}
	if(con == 8) {
	    view_object[0]= 1570
	    obj_mainchara.cutscene= 0
	    con= 9
	    GS.plot= 201
	    GS.interact= 0
	    instance_destroy()
	}
	if(con == 10 and not instance_exists(782/* OBJ_WRITER */)) {
	    ini_open("undertale.ini")
	    ml2= ini_read_real("Sans", "MeetLv2", 0)
	    ini_write_real("Sans", "MeetLv2", ml2 + 1)
	    ini_close()
	    GS.interact= 1
	    if(GS.flag[67] == 1 or ml2 == 0) {
	        con= 11
	        $Alarm4.start((300) / 30.0)
	    } else  {
	        con= 22
	        $Alarm4.start((60) / 30.0)
	    }
	}
	if(con == 12 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.facechoice= 3
	    GS.faceemotion= 3
	    GS.typer= 10
	    GS.msc= 0
	    GS.msg[0]= "\\TS* .../"
	    GS.msg[1]= "\\Ts*\\E0 truthfully^1, it doesn\'t&  really matter what you&  said./"
	    GS.msg[2]= "\\E0* all that\'s important is&  that you were honest&  with your/"
	    GS.msg[3]= "* what happens now.../"
	    GS.msg[4]= "* we leave up to you./%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 7
	    if(GS.flag[67] == 1) con= 15
	}
	if(con == 15 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.facechoice= 3
	    GS.faceemotion= 3
	    GS.typer= 17
	    GS.msc= 835
	    GS.msg[0]= "pepis/%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 16
	}
	if(con == 20 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.msc= 0
	    GS.faceemotion= 4
	    GS.facechoice= 3
	    GS.typer= 21
	    GS.msg[0]= "* Then why\'d you&  kill my&  brother?/%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    caster_free(-3)
	    con= 7
	}
	if(con == 21 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.msc= 0
	    GS.faceemotion= 4
	    GS.facechoice= 3
	    GS.typer= 21
	    GS.msg[0]= "* You dirty brother&  killer./%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    caster_free(-3)
	    con= 7
	}
	if(con == 23 and not instance_exists(782/* OBJ_WRITER */)) {
	    ini_open("undertale.ini")
	    ml= ini_read_real("Sans", "MeetLv", 0)
	    ini_write_real("Sans", "MeetLv", GS.lv)
	    ini_close()
	    GS.facechoice= 3
	    GS.faceemotion= 1
	    GS.typer= 17
	    GS.msg[0]= "* huh^1?&* you look bored./"
	    GS.msg[1]= "\\E1* i get the feeling&  you aren\'t gonna learn&  anything from this./"
	    GS.msg[2]= "\\E0* well^1, guess I gotta&  judge you then./"
	    GS.msg[3]= "* come on^1.&* really?/%%"
	    if(GS.lv == 2) {
	        GS.msg[3]= "* lv2..^1.&* seems like you messed&  up the slightest amount./"
	        GS.msg[4]= "\\E1* welp^1.&* that\'s pretty sad./"
	        GS.msg[5]= "\\E3* you probably weren\'t&  even aware of what you&  were doing.../"
	        GS.msg[6]= "* and when you learned^1,&  it was too late./"
	        GS.msg[7]= "\\E2* nah^1, just kidding./"
	        GS.msg[8]= "\\E1* who gets to lv2 on&  accident^1?&* get outta here./%%"
	    }
	    if(GS.lv == 3) {
	        GS.msg[3]= "\\E3* lv3.../"
	        GS.msg[4]= "\\E1* 3\'s just an ok number^1,&  i guess./"
	        GS.msg[5]= "\\E2* i\'ll give you a C+./"
	        GS.msg[6]= "\\E1* you can do better^1,&  right?/%%"
	    }
	    if(GS.lv >= 4) {
	        GS.msg[3]= "\\E3* hmmm..^1.&* over lv3^1, huh./"
	        GS.msg[4]= "\\E0* you killed some people&  on purpose^1, didn\'t you?/"
	        GS.msg[5]= "\\E1* that\'s probably bad./"
	        GS.msg[6]= "\\E3* though^1, maybe some&  of it was in self-&  defense.../"
	        GS.msg[7]= "\\E1* i don\'t know^1.&* help me out here./"
	        GS.msg[8]= "* i wasn\'t watching./"
	        GS.msg[9]= "\\E2* anyways^1, don\'t do that./%%"
	    }
	    if(GS.lv >= 10) {
	        GS.msg[3]= "\\E3* hmmm..^1.&* over lv9^1, huh./"
	        GS.msg[4]= "\\E0* that\'s over halfway to&  lv20^1, the maximum./"
	        GS.msg[5]= "\\E1* but don\'t think that&  means you\'re still 50-&  percent good./"
	        GS.msg[6]= "\\E3* 50-percent^1, 20-percent./"
	        GS.msg[7]= "\\E4* those are both still&  failing grades./"
	        GS.msg[8]= "\\E1* besides^1.&* chances are.../"
	        GS.msg[9]= "* i\'ve already tried to&  steer you in the right&  direction./"
	        GS.msg[10]= "\\E0* so what can i say?/"
	        GS.msg[11]= "\\E3* what can i say that&  will change the mind of&  a being like you...?/%%"
	    }
	    if(GS.lv >= 15) {
	        GS.msg[3]= "\\E3* hmmm..^1.&* over lv14^1, huh./"
	        GS.msg[4]= "\\E1* well^1, hmmm..^1.&* judgment-wise.../"
	        GS.msg[5]= "\\E4* you\'re a pretty bad&  person./"
	        GS.msg[6]= "* you wander around^1,&  looking for people.../"
	        GS.msg[7]= "* killing them to take&  their money./"
	        GS.msg[8]= "\\E3* that\'s just plain&  messed up./"
	        GS.msg[9]= "\\E1* and what\'s worse^1, is&  that as bad as you&  are.../"
	        GS.msg[10]= "\\E2* you aren\'t anywhere near&  as bad as you could&  be./"
	        GS.msg[11]= "\\E1* you pretty much suck&  at being evil./"
	        GS.msg[12]= "\\E1* honestly^1, it\'s super&  embarrassing./"
	        GS.msg[13]= "\\E2* but maybe you\'d be&  better.../"
	        GS.msg[14]= "\\E1* at not killing anyone?/"
	        GS.msg[15]= "\\E2* crazy idea^1, huh?/"
	        GS.msg[16]= "\\E0* let me know how that&  one goes./%%"
	    }
	    if(GS.lv == ml + 1) {
	        GS.faceemotion= 1
	        GS.msg[3]= "* ... huh?/"
	        GS.msg[4]= "\\E0* what\'s with that look&  in your eye?/"
	        GS.msg[5]= "\\E3* did you go through and&  kill someone.../"
	        GS.msg[6]= "\\E3* just to see what i\'d&  say about it?/"
	        GS.msg[7]= "\\E1* wow^1./"
	        GS.msg[8]= "\\E2* you\'re a pretty gross&  person^1, huh?/%%"
	    }
	    if(GS.lv == ml) {
	        GS.msg[3]= "\\E1* huh^1?&* you STILL look bored./"
	        GS.msg[4]= "\\E2* okay then^1, consider&  our session over./%%"
	    }
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    caster_free(-3)
	    con= 7
	}
	if(con == 26 and not instance_exists(782/* OBJ_WRITER */)) {
	    ini_open("undertale.ini")
	    ml1= ini_read_real("Sans", "MeetLv1", 0)
	    ini_write_real("Sans", "MeetLv1", ml1 + 1)
	    pass= ini_read_real("Sans", "Pass", 0)
	    ini_close()
	    GS.facechoice= 3
	    GS.faceemotion= 1
	    GS.typer= 17
	    GS.msg[0]= "\\E3* .../"
	    GS.msg[1]= "\\E1* wait a second./"
	    GS.msg[2]= "\\E1* that look on your&  face while i was&  talking.../"
	    GS.msg[3]= "\\E2* you\'ve already heard&  my spiel^1, haven\'t you?/"
	    GS.msg[4]= "\\E3* i suspected something&  like this./"
	    GS.msg[5]= "\\E3* you\'re always acting&  like you know what\'s&  going to happen./"
	    GS.msg[6]= "\\E1* like you\'ve seen it&  all before./"
	    GS.msg[7]= "\\E3* so..^1.&* i have a request for&  you./"
	    GS.msg[8]= "\\W*\\E1 i kind of have a&  \\Ysecret codeword\\W &  that only i know./"
	    GS.msg[9]= "\\E0* so i know if someone&  tells it to me.../"
	    GS.msg[10]= "\\E1* they\'ll have to be a&  time traveller./"
	    GS.msg[11]= "\\E2* crazy^1, right?/"
	    GS.msg[12]= "\\E1* anyway^1, here it is.../"
	    GS.msg[13]= "\\E3* (whisper^1, whisper)/"
	    GS.msg[14]= "\\E2* i\'m counting on you to&  come back here and&  tell me that./"
	    GS.msg[15]= "\\E1* see you later./%%"
	    if(pass == 1) {
	        GS.msg[0]= "\\E0* .../"
	        GS.msg[1]= "\\E1* huh^1?&* do you have something&  to say to me?/"
	        GS.msg[2]= "\\E2* what^1? a codeword^1?&* can you speak a&  little louder?/"
	        GS.msg[3]= "\\E3* .../"
	        GS.msg[4]= "* did you.../"
	        GS.msg[5]= "\\E2* ... just say " + chr(ord('"')) + "i\'m a&  stupid doodoo butt?" + chr(ord('"')) + "/"
	        GS.msg[6]= "\\E1* wow^1.&* i can\'t believe you&  would say that./"
	        GS.msg[7]= "\\E3* not only is that&  completely infantile.../"
	        GS.msg[8]= "\\E2* but it\'s also my&  secret codeword./"
	        GS.msg[9]= "\\E3* that^1, however^1, isn\'t&  good enough./"
	        GS.msg[10]= "\\W*\\E1 what you need is the&  \\Ysecret\\W secret codeword./"
	        GS.msg[11]= "\\E2* it\'s only for people&  that know the secret&  codeword./"
	        GS.msg[12]= "\\E0* anyway^1, here it is.../"
	        GS.msg[13]= "\\E4* (whimsper^1, whimsper).../"
	        GS.msg[14]= "\\E2* i\'m counting on you to&  come back here and&  tell me that./"
	        GS.msg[15]= "\\E1* see you later./%%"
	    }
	    if(pass == 2) {
	        GS.msg[0]= "\\E0* .../"
	        GS.msg[1]= "\\E1* huh^1?&* do you have something&  to say to me?/"
	        GS.msg[2]= "\\E2* what^1? a codeword^1?&* can you speak a&  little louder?/"
	        GS.msg[3]= "\\E3* .../"
	        GS.msg[4]= "* did you.../"
	        GS.msg[5]= "\\E2* ... just say " + chr(ord('"')) + "i\'m the&  legendary fartmaster?" + chr(ord('"')) + "/"
	        GS.msg[6]= "\\E1* wow./"
	        GS.msg[7]= "\\E1* that\'s..^1. uh..^1.&* really childish./"
	        GS.msg[8]= "\\E2* why would you think&  that was a secret&  secret codeword?/"
	        GS.msg[9]= "\\E1* whoever told you that&  is a dirty liar./"
	        GS.msg[10]= "\\E2* i don\'t have a secret&  secret codeword./"
	        GS.msg[11]= "\\E3* however./"
	        GS.msg[12]= "\\E2* i do have a secret&  secret triple-secret&  codeword./"
	        GS.msg[13]= "\\E1* which you just said./"
	        GS.msg[14]= "\\E2* so^1, i guess you\'re&  qualified./"
	        GS.msg[15]= "\\E2* here\'s the key to my&  room./"
	        GS.msg[16]= "\\E3* it\'s time.../"
	        GS.msg[17]= "* you learned the truth./"
	        GS.msg[18]= "\\TS \\F0 \\T0 %"
	        GS.msg[19]= "* (When you looked^1, the key was&  already on your keychain.)/%%"
	        GS.flag[497]= 1
	    }
	    if(pass == 3) {
	        GS.msg[0]= "\\E0* .../"
	        GS.msg[1]= "\\E1* huh^1?&* triple secret codeword?/"
	        GS.msg[2]= "\\E2* nah^1, i\'m out of&  material./"
	        GS.msg[3]= "\\TS \\F0 \\T0 %"
	        GS.msg[4]= "* (You felt something on your&  keychain.)/%%"
	        GS.flag[497]= 1
	    }
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 30
	}
	if(con == 30 and not instance_exists(782/* OBJ_WRITER */)) {
	    if(OBJ_WRITER.stringno == 13 and pass == 0) {
	        ini_open("undertale.ini")
	        ini_write_real("Sans", "Pass", 1)
	        ini_close()
	    }
	    if(OBJ_WRITER.stringno == 13 and pass == 1) {
	        ini_open("undertale.ini")
	        ini_write_real("Sans", "Pass", 2)
	        ini_close()
	    }
	    if(OBJ_WRITER.stringno == 19 and pass == 2) {
	        ini_open("undertale.ini")
	        ini_write_real("Sans", "Pass", 3)
	        ini_close()
	    }
	}
	if(con == 30 and not instance_exists(782/* OBJ_WRITER */)) con= 7
	if(con == 100) {
	    obj_mainchara.visible= 0
	    mc= scr_marker(obj_mainchara.x, obj_mainchara.y, 1045)
	    mc.z_index= obj_mainchara.z_index
	    mc.image_blend= 0
	    GS.msc= 0
	    GS.facechoice= 3
	    GS.faceemotion= 0
	    GS.typer= 17
	    ini_open("undertale.ini")
	    sansf= ini_read_real("Sans", "F", 0)
	    sansk= ini_read_real("Sans", "SK", 0)
	    ini_close()
	    GS.msg[0]= "\\E0* heya./"
	    GS.msg[1]= "\\E1* you\'ve been busy^1,&  huh?/"
	    GS.msg[2]= "* .../"
	    GS.msg[3]= "\\E0* so^1, i\'ve got a&  question for ya./"
	    GS.msg[4]= "\\E3* do you think even&  the worst person can&  change...?/"
	    GS.msg[5]= "\\E3* that everybody can be&  a good person^1, if&  they just try?/%%"
	    con= 101
	    if(sansf == 1) {
	        GS.msg[0]= "\\E0* heya./"
	        GS.msg[1]= "\\E1* you look frustrated&  about something./"
	        GS.msg[2]= "\\E4* guess i\'m pretty good&  at my job^1, huh?/%%"
	        con= 111
	    }
	    if(sansf == 2) {
	        GS.msg[0]= "\\E0* hmm^1.&* that expression.../"
	        GS.msg[1]= "\\E1* that\'s the expression&  of someone who\'s died&  twice in a row./"
	        GS.msg[2]= "\\E2* suffice to say^1, you&  look really..^1.&* unsatisfied./"
	        GS.msg[3]= "\\E3* all right./"
	        GS.msg[4]= "\\E4* how \'bout we make it&  a third?/%%"
	        con= 111
	    }
	    if(sansf == 3) {
	        GS.msg[0]= "\\E0* hmm^1.&* that expression.../"
	        GS.msg[1]= "\\E1* that\'s the expression&  of someone who\'s died&  thrice in a row./"
	        GS.msg[2]= "\\E3* .../"
	        GS.msg[3]= "\\E1* hey^1, what comes after&  " + chr(ord('"')) + "thrice^1," + chr(ord('"')) + " anyway?/"
	        GS.msg[4]= "\\E4* wanna help me find out?/%%"
	        con= 111
	    }
	    if(sansf == 4) {
	        GS.msg[0]= "\\E0* hmm^1.&* that expression.../"
	        GS.msg[1]= "\\E1* that\'s the expression&  of someone who\'s died&  quice in a row./"
	        GS.msg[2]= "\\E1* quice^1?&* frice?/"
	        GS.msg[3]= "\\E4* welp^1, won\'t have to&  use it again anyways./%%"
	        con= 111
	    }
	    if(sansf == 5) {
	        GS.msg[0]= "\\E0* hmm^1.&* that expression.../"
	        GS.msg[1]= "\\E1* that\'s the expression&  of someone who\'s died&  five times in a row./"
	        GS.msg[2]= "\\E2* convenient^1, huh^1?&* that\'s one for each&  finger./"
	        GS.msg[3]= "\\E3* but soon.../%%"
	        GS.msg[4]= "\\E4* you\'ll need a cool&  mutant hand to count&  all of your deaths./%%"
	        con= 111
	    }
	    if(sansf == 6) {
	        GS.msg[0]= "\\E0* hmm^1.&* that expression.../"
	        GS.msg[1]= "\\E1* that\'s the expression&  of someone who\'s died&  six times in a row./"
	        GS.msg[2]= "\\E2* that\'s the number of&  fingers on a mutant&  hand./"
	        GS.msg[3]= "\\E3* but soon.../%%"
	        GS.msg[4]= "\\E4* you\'ll need to find&  a mutant hand with&  even more fingers./%%"
	        con= 111
	    }
	    if(sansf == 7) {
	        GS.msg[0]= "\\E0* hmm^1.&* that expression.../"
	        GS.msg[1]= "\\E1* that\'s the expression&  of someone who\'s died&  seven times in a row./"
	        GS.msg[2]= "\\E0* hey^1, that\'s good^1.&* seven\'s supposed to be&  a lucky number./"
	        GS.msg[3]= "\\E2* who knows^1, maybe&  you\'ll hit the&  jackpot.../%%"
	        GS.msg[4]= "\\E4* and that number will&  multiply tenfold./%%"
	        con= 111
	    }
	    if(sansf == 8) {
	        GS.msg[0]= "\\E0* hmm^1.&* that expression.../"
	        GS.msg[1]= "\\E1* that\'s the expression&  of someone who\'s died&  eight times in a row./"
	        GS.msg[2]= "\\E2* that\'s the number of&  fingers on a spider./"
	        GS.msg[3]= "\\E3* but soon.../%%"
	        GS.msg[4]= "\\E1* wait^1, don\'t spiders&  have legs?/%%"
	        con= 111
	    }
	    if(sansf == 9) {
	        GS.msg[0]= "\\E0* hmm^1.&* that expression.../"
	        GS.msg[1]= "\\E1* that\'s the expression&  of someone who\'s died&  seven times in a row./"
	        GS.msg[2]= "\\E1* .../"
	        GS.msg[3]= "\\E2* nope^1, wait^1, that\'s&  definitely nine^1, sorry./"
	        GS.msg[4]= "\\E4* or was it ten?/%%"
	        con= 111
	    }
	    if(sansf == 10) {
	        GS.msg[0]= "\\E0* hmm^1.&* that expression.../"
	        GS.msg[1]= "\\E1* that\'s the expression&  of someone who\'s died&  ten times in a row./"
	        GS.msg[2]= "\\E2* hey^1, congrats^1!&* the big one-oh!/"
	        GS.msg[3]= "\\E1* let\'s invite all your&  friends over for a&  big shindig./"
	        GS.msg[4]= "\\E2* we can have pie^1, and&  hot dogs^1, and.../"
	        GS.msg[5]= "\\E3* hmmm..^1. wait^1.&* something\'s not right./"
	        GS.msg[6]= "\\E4* you don\'t have any&  friends./%%"
	        con= 111
	    }
	    if(sansf == 11) {
	        GS.msg[0]= "\\E0* hmm^1.&* that expression.../"
	        GS.msg[1]= "\\E1* that\'s the expression&  of someone who\'s died&  eleven times in a row./"
	        GS.msg[2]= "\\E2* well^1, give or take./"
	        GS.msg[3]= "\\E1* there\'s nuance to&  this stuff./"
	        GS.msg[4]= "\\E2* don\'t think i\'ll be&  able to count very&  well from here./"
	        GS.msg[5]= "\\E1* count for me^1, ok?/"
	        GS.msg[6]= "\\E4* we\'ll start from 12./%%"
	        con= 111
	    }
	    if(sansf >= 12) {
	        GS.msg[0]= "\\E0* let\'s just get to&  the point./%%"
	        con= 111
	    }
	    if(sansk > 0) {
	        GS.msg[0]= "\\E0* .../"
	        GS.msg[1]= "\\E1* that expression that&  you\'re wearing.../"
	        GS.msg[2]= "\\E3* .../"
	        GS.msg[3]= "\\E4* well^1, i won\'t grace&  it with a description./%%"
	    }
	    if(sansk > 1) {
	        GS.msg[0]= "\\E0* .../"
	        GS.msg[1]= "\\E1* that expression that&  you\'re wearing.../"
	        GS.msg[2]= "\\E3* .../"
	        GS.msg[3]= "\\E4* you\'re really kind&  of a freak^1, huh?/%%"
	    }
	    instance_create(0, 0, 779/* obj_dialoguer */)
	}
	if(con == 101 and not instance_exists(782/* OBJ_WRITER */)) {
	    mc.frame= 1
	    mc.velocity.x= 0.5
	    con= 102
	    $Alarm4.start((10) / 30.0)
	}
	if(con == 103) {
	    mc.velocity.x= 0
	    mc.frame= 0
	    con= 104
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 105) {
	    GS.msg[0]= "\\E3* heh heh heh heh.../"
	    GS.msg[1]= "\\E1* all right./"
	    GS.msg[2]= "\\E3* well^1, here\'s a better&  question./"
	    GS.msg[3]= "\\E4* do you wanna have&  a bad time?/"
	    GS.msg[4]= "\\E3* \'cause if you take&  another step&  forward.../"
	    GS.msg[5]= "\\E4* you are REALLY not&  going to like what&  happens next./%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 106
	}
	if(con == 106 and not instance_exists(782/* OBJ_WRITER */)) {
	    mc.frame= 1
	    mc.velocity.x= 0.5
	    con= 107
	    $Alarm4.start((10) / 30.0)
	}
	if(con == 108) {
	    mc.velocity.x= 0
	    mc.frame= 0
	    con= 109
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 110) {
	    GS.msg[0]= "\\E3* welp./"
	    GS.msg[1]= "\\E3* sorry^1, old lady./"
	    GS.msg[2]= "* this is why i never&  make promises./%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 111
	}
	if(con == 111 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.battlegroup= 95
	    GS.mercy= 1
	    instance_create(0, 0, 142/* obj_battler */)
	    con= 112
	    $Alarm4.start((32) / 30.0)
	}
	if(con == 113) {
	    with(sans) instance_destroy()
	    GS.interact= 0
	    // obj_mainchara
	    with(1570) cutscene= 0
	    view_object[0]= 1570
	    with(mc) instance_destroy()
	    obj_mainchara.visible= 1
	    instance_destroy()
	    exit
	} else  exit

func _on_alarm_0_timeout():
	if(con == 0 and GS.interact == 0) {
	    GS.interact= 1
	    con= 1
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
