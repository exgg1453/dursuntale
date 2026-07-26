# Auto-converted from GameMaker: obj_darksans1
extends Node2D

func _ready():
	dsprite= 1353
	usprite= 1362
	lsprite= 1367
	rsprite= 1363
	dtsprite= 1353
	utsprite= 1362
	ltsprite= 1367
	rtsprite= 1363
	scr_depth()
	lafftrax= 0
	conversation= 0
	velocity.x= 0.75
	GS.interact= 1
	image_speed= 0.1
	hh= instance_create(0, 0, 92/* obj_musfadeout */)
	hh.fadespeed= 0.5
	uuu= instance_create(0, 0, 89/* obj_walknoise */)
	y= obj_mainchara.y - 1
	shakehand= 0
	murder= 0
	if(scr_murderlv() >= 2) murder= 1

func _gm_event_2_9():
	conversation++

func _gm_event_2_8():
	lafftrax++
	if(lafftrax == 1) conversation= 21
	if(lafftrax == 2) conversation= 23

func _gm_event_2_7():
	conversation= 20
	$Alarm8.start((11) / 30.0)

func _gm_event_2_6():
	if(lafftrax == 0) {
	    caster_play(rshot, 1, 1)
	    sprite_index= 1356/* spr_sans_shrug1 */
	}
	if(lafftrax == 1) {
	    caster_play(rshot, 1, 1)
	    sprite_index= 1358/* spr_sans_shrug2 */
	}
	conversation= 17

func _gm_event_2_4():
	GS.faceemotion= 0
	GS.facechoice= 3
	GS.typer= 17
	obj_mainchara.visible= 1
	sprite_index= 1363/* spr_sans_r */
	frame= 0
	obj_mainchara.facing= 3
	GS.facing= 3
	caster_loop(GS.currentsong, 1, 1)
	GS.msg[0]= "* heheh... the old whoopee&  cushion in the hand&  trick./"
	GS.msg[1]= "* it\'s ALWAYS funny./"
	GS.msg[2]= "* anyways^1,&  you\'re a human, right?/"
	GS.msg[3]= "\\E1* that\'s hilarious./"
	if(M1 > 0) {
	    GS.msg[0]= "* heh^1, the old whoopee&  cushion in the hand&  trick.../"
	    GS.msg[1]= "\\E1* wait a sec..^1.&* have you heard it before&  or something?/"
	    GS.msg[2]= "\\E1* you turned around before&  i said to..^1.&* ... weird./"
	    GS.msg[3]= "* ... whatever^1.&* you\'re a human^1, right?/"
	}
	GS.msg[4]= "\\E0* i\'m sans^1.&* sans the skeleton./"
	GS.msg[5]= "* im actually supposed to&  be on watch for&  humans right now./"
	GS.msg[6]= "* but..^1. y\'know.../"
	GS.msg[7]= "\\E1* i dont really care about&  capturing anybody./"
	GS.msg[8]= "\\E0* now my brother^1,&  papyrus.../"
	GS.msg[9]= "* he\'s a human-hunting&  FANATIC./"
	GS.msg[10]= "\\E1* hey^1, actually^1, I think&  that\'s him over there./"
	GS.msg[11]= "\\E0* i have an idea^1.&* go through this gate&  thingy./"
	GS.msg[12]= "* yeah, go right through^1.&* my bro made the bars&  too wide to stop anyone./%%"
	if(scr_murderlv() >= 2) {
	    GS.msg[0]= "* heheh... the old whoopee&  cushion in the hand&  trick./"
	    GS.msg[1]= "* it\'s ALWAYS funny./"
	    GS.msg[2]= "* .../"
	    GS.msg[3]= "\\E1* that\'s^1, uh^1.&* your cue to laugh./"
	    GS.msg[4]= "\\E2* or^1, uh^1, to emote&  at all...?/"
	    GS.msg[5]= "\\E0* .../"
	    GS.msg[6]= "\\E1* (gee^1, lady^1, you really&  know how to pick&  \'em, huh...?)/"
	    GS.msg[7]= "\\E2* OK^1, that\'s fine^1.&* everyone\'s got their&  own sense of humor./"
	    GS.msg[8]= "\\E0* i\'m sans^1.&* sans the skeleton./"
	    GS.msg[9]= "* im actually supposed to&  be on watch for&  humans right now./"
	    GS.msg[10]= "* but..^1. y\'know.../"
	    GS.msg[11]= "\\E1* i dont really care about&  capturing anybody./"
	    GS.msg[12]= "\\E0* now my brother^1,&  papyrus.../"
	    GS.msg[13]= "* he\'s a human-hunting&  FANATIC./"
	    GS.msg[14]= "\\E1* hey^1, actually^1, I think&  that\'s him over there./"
	    GS.msg[15]= "\\E0* i have an idea^1.&* go through this gate&  thingy./"
	    GS.msg[16]= "* yeah, go right through^1.&* my bro made the bars&  too wide to stop anyone./%%"
	}
	instance_create(0, 0, 779/* obj_dialoguer */)
	conversation= 6

func _gm_event_2_3():
	if(shakehand == 2) {
	    frame= 2
	    conversation= 4
	}
	if(shakehand == 1) {
	    frame= 1
	    shakehand++
	    $Alarm3.start((60) / 30.0)
	}
	if(shakehand == 0) {
	    sprite_index= 1364/* spr_sans_r_darkhand */
	    obj_mainchara.visible= 0
	    frame= 0
	    fsound= caster_load("music/whoopee.ogg")
	    rshot= caster_load("music/rimshot.ogg")
	    GS.currentsong= caster_load("music/muscle.ogg")
	    GS.currentsong2= caster_load("music/papyrus.ogg")
	    shakehand= 2
	    $Alarm3.start((90) / 30.0)
	}

func _gm_event_2_2():
	image_speed= 0
	obj_mainchara.sprite_index= 1046/* spr_maincharal */
	obj_mainchara.facing= 3
	GS.facing= 3
	$Alarm3.start((60) / 30.0)

func _process(delta: float):
	if(conversation == 0 and x >= obj_mainchara.x - 23) {
	    x= obj_mainchara.x - 23
	    velocity.x= 0
	    image_speed= 0
	    conversation= 1
	    GS.typer= 21
	    GS.facechoice= 0
	    GS.faceemotion= 0
	    GS.msc= 0
	    frame= 0
	    if(instance_exists(89/* obj_walknoise */)) {
	        // obj_walknoise
	        with(89) instance_destroy()
	    }
	    GS.msg[0]= "* Human./"
	    GS.msg[1]= "* Don\'t you know how&  to greet a new pal?/"
	    GS.msg[2]= "* Turn around and shake&  my hand./%%"
	    ini_open("undertale.ini")
	    M1= ini_read_real("Sans", "M1", 0)
	    ini_write_real("Sans", "M1", M1 + 1)
	    ini_close()
	    if(M1 > 0) {
	        GS.msg[0]= "* Human./"
	        GS.msg[1]= " %"
	        GS.msg[2]= " %%"
	    }
	    instance_create(0, 0, 779/* obj_dialoguer */)
	}
	if(conversation == 1 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.interact= 1
	    obj_mainchara.sprite_index= 1043/* spr_maincharad */
	    obj_mainchara.facing= 0
	    GS.facing= 0
	    $Alarm2.start((50) / 30.0)
	    conversation= 2
	}
	if(sprite_index == 1364 and conversation == 4 and frame == 2) {
	    caster_play(fsound, 1, 1)
	    $Alarm4.start((180) / 30.0)
	    image_speed= 0
	    conversation= 5
	}
	if(conversation == 6 and not instance_exists(782/* OBJ_WRITER */)) {
	    obj_mainchara.visible= 0
	    mainact= instance_create(obj_mainchara.x, obj_mainchara.y, 1355/* obj_mainchara_actor */)
	    mainact.velocity.x= 4
	    obj_mainchara.velocity.x= 4
	    velocity.x= 4
	    image_speed= 0.25
	    conversation= 7
	}
	if(conversation == 7 and x >= 2440) {
	    velocity.x= 0
	    frame= 0
	    image_speed= 0
	    obj_mainchara_actor.velocity.x= 0
	    obj_mainchara_actor.image_speed= 0
	    obj_mainchara_actor.frame= 0
	    obj_mainchara.velocity.x= 0
	    GS.msg[0]= "* quick^1, behind that&  conveniently-shaped&  lamp./%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    conversation= 8
	    if(murder == 1) conversation= 50
	}
	if(conversation == 8 and not instance_exists(782/* OBJ_WRITER */)) {
	    obj_mainchara_actor.velocity.y= -1
	    obj_mainchara.velocity.y= -1
	    conversation= 9
	}
	if(conversation == 9 and obj_mainchara.y <= obj_convenientlamp.y) {
	    obj_mainchara_actor.velocity.y= 0
	    obj_mainchara.velocity.y= 0
	    obj_mainchara.y= obj_convenientlamp.y
	    obj_mainchara_actor.y= obj_convenientlamp.y
	    obj_mainchara.velocity.x= 1
	    obj_mainchara_actor.velocity.x= 1
	    hh= instance_create(0, 0, 92/* obj_musfadeout */)
	    hh.fadespeed= 0.01
	    conversation= 10
	}
	if(conversation == 10 and obj_mainchara.x >= obj_convenientlamp.x) {
	    obj_mainchara.velocity.x= 0
	    obj_mainchara_actor.velocity.x= 0
	    obj_mainchara_actor.image_speed= 0
	    obj_mainchara_actor.frame= 0
	    obj_mainchara.x= obj_convenientlamp.x
	    obj_mainchara_actor.x= obj_convenientlamp.x
	    obj_mainchara.y+= 60
	    pap= instance_create(get_viewport_rect().size.x, y - 12, 1031/* obj_papyrus_actor_mad */)
	    pap.sprite_index= 1336/* spr_papyrus_l_mad */
	    pap.direction= 180
	    pap.speed= 4
	    conversation= 11
	}
	if(conversation == 11 and obj_papyrus_actor_mad.x <= obj_papyrus_actor_mad.xstart - 140) {
	    GS.currentsong= GS.currentsong2
	    caster_loop(GS.currentsong, 0.5, 1)
	    obj_papyrus_actor_mad.speed= 0
	    obj_papyrus_actor_mad.image_speed= 0
	    obj_papyrus_actor_mad.sprite_index= 1337/* spr_papyrus_lt_mad */
	    GS.msg[0]= "* sup^1, bro?/"
	    scr_papface(1, 1)
	    GS.msg[2]= "YOU KNOW WHAT&" + chr(ord('"')) + "SUP,^1" + chr(ord('"')) + " BROTHER!/"
	    GS.msg[3]= "IT\'S BEEN EIGHT&DAYS AND YOU&STILL HAVEN\'T.../"
	    GS.msg[4]= "RECALIBRATED^1.&YOUR^1.&PUZZLES^1!/"
	    GS.msg[5]= "YOU JUST HANG&AROUND OUTSIDE&YOUR STATION!/"
	    GS.msg[6]= "WHAT ARE YOU&EVEN DOING?!?/"
	    scr_sansface(7, 0)
	    GS.msg[8]= "* staring at this lamp^1.&* it\'s really cool^1.&* do you wanna look?/%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    conversation= 12
	}
	if(conversation == 12 and not instance_exists(782/* OBJ_WRITER */)) {
	    obj_papyrus_actor_mad.fun= 1
	    obj_papyrus_actor_mad.sprite_index= 1308/* spr_papyrus_mad1 */
	    obj_papyrus_actor_mad.image_speed= 0.2
	    conversation= 13
	    GS.typer= 18
	    GS.faceemotion= 1
	    GS.facechoice= 4
	    GS.msg[0]= "NO!^1!&I DON\'T HAVE&TIME FOR THAT!!/"
	    GS.msg[1]= "WHAT IF A HUMAN&COMES THROUGH&HERE!?!/"
	    GS.msg[2]= "I WANT TO BE&READY!!!/"
	    GS.msg[3]= "I WILL BE THE ONE!&I MUST BE THE ONE!/"
	    GS.msg[4]= "I WILL CAPTURE A&HUMAN!/%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	}
	if(conversation == 13 and not instance_exists(782/* OBJ_WRITER */)) {
	    obj_papyrus_actor_mad.fun= 1
	    obj_papyrus_actor_mad.sprite_index= 1310/* spr_papyrus_cape */
	    obj_papyrus_actor_mad.image_speed= 0.25
	    conversation= 14
	    GS.faceemotion= 0
	    GS.facechoice= 4
	    GS.msg[0]= "THEN^1, I^1, THE&GREAT PAPYRUS.../"
	    GS.msg[1]= "WILL GET&ALL THE THINGS I&UTTERLY DESERVE!/"
	    GS.msg[2]= "RESPECT..^1.&RECOGNITION.../"
	    GS.msg[3]= "I WILL FINALLY&BE ABLE TO JOIN&THE ROYAL GUARD!/"
	    GS.msg[4]= "PEOPLE WILL ASK^1,&TO^1, BE MY^1,&" + chr(ord('"')) + "FRIEND?" + chr(ord('"')) + "/"
	    GS.msg[5]= "\\E2I WILL BATHE IN A&SHOWER OF KISSES&EVERY MORNING./%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	}
	if(conversation == 14 and not instance_exists(782/* OBJ_WRITER */)) {
	    obj_papyrus_actor_mad.fun= 0
	    obj_papyrus_actor_mad.sprite_index= 1334/* spr_papyrus_lt */
	    obj_papyrus_actor_mad.image_speed= 0
	    conversation= 15
	    GS.faceemotion= 0
	    GS.facechoice= 3
	    GS.typer= 17
	    GS.msg[0]= "* hmm.../"
	    GS.msg[1]= "\\E1* maybe this lamp will&  help you./%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	}
	if(conversation == 15 and not instance_exists(782/* OBJ_WRITER */)) {
	    obj_papyrus_actor_mad.fun= 1
	    obj_papyrus_actor_mad.sprite_index= 1309/* spr_papyrus_mad2 */
	    obj_papyrus_actor_mad.image_speed= 0.4
	    conversation= 16
	    GS.faceemotion= 1
	    GS.facechoice= 4
	    GS.typer= 18
	    GS.msg[0]= "SANS!^1! YOU ARE&NOT HELPING!^1!&YOU LAZYBONES!!/"
	    GS.msg[1]= "ALL YOU DO IS SIT&AND BOONDOGGLE!/"
	    GS.msg[2]= "YOU GET LAZIER&AND LAZIER&EVERY DAY!!!/"
	    scr_sansface(3, 0)
	    GS.msg[4]= "\\W* hey^1, take it easy^1.&* i\'ve gotten a \\Yton\\W &  of work done today./"
	    GS.msg[5]= "\\W*\\E2 a skele-\\Yton\\W./%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	}
	if(conversation == 16 and not instance_exists(782/* OBJ_WRITER */)) {
	    conversation= 18
	    $Alarm6.start((10) / 30.0)
	    rememberxview= view_xview[view_current]
	    rememberyview= view_yview[view_current]
	    view_object[view_current]= -4
	    obj_mainchara.cutscene= 1
	}
	if(conversation == 17) {
	}
	if(conversation == 18) {
	    if(x + sprite_width / 2 > view_xview[view_current] + view_wview[view_current] / 2)
	        view_xview[view_current]+= 3
	    if(y + sprite_height / 2 > view_yview[view_current] + view_hview[view_current] / 2)
	        view_yview[view_current]+= 9
	    view_hview[view_current]-= 12
	    view_wview[view_current]-= 16
	    $Alarm7.start((30) / 30.0)
	}
	if(conversation == 20) {
	    if(view_xview[view_current] > rememberxview)
	        view_xview[view_current]-= 3
	    if(view_yview[view_current] > rememberyview)
	        view_yview[view_current]-= 9
	    view_hview[view_current]+= 12
	    view_wview[view_current]+= 16
	}
	if(conversation == 21) {
	    obj_papyrus_actor_mad.fun= 0
	    obj_papyrus_actor_mad.sprite_index= 1337/* spr_papyrus_lt_mad */
	    conversation= 16
	    sprite_index= 1363/* spr_sans_r */
	    GS.faceemotion= 1
	    GS.facechoice= 4
	    GS.typer= 18
	    GS.msg[0]= "SANS!!!/"
	    scr_sansface(1, 1)
	    GS.msg[2]= "\\E1* come on^1.&* you\'re smiling./"
	    scr_papface(3, 4)
	    GS.msg[4]= "I AM AND I HATE IT!/"
	    GS.msg[5]= "\\E3SIGH.../"
	    GS.msg[6]= "\\E2WHY DOES SOMEONE&AS GREAT AS ME.../"
	    GS.msg[7]= "\\E3HAVE TO DO SO MUCH&JUST TO GET SOME&RECOGNITION.../"
	    scr_sansface(8, 1)
	    GS.msg[9]= "* wow^1, sounds like&  you\'re really working&  your../"
	    GS.msg[10]= "\\E2* down to the bone./%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	}
	if(conversation == 23) {
	    sprite_index= 1363/* spr_sans_r */
	    obj_papyrus_actor_mad.fun= 0
	    obj_papyrus_actor_mad.sprite_index= 1337/* spr_papyrus_lt_mad */
	    GS.faceemotion= 1
	    GS.facechoice= 4
	    GS.typer= 18
	    GS.msg[0]= "UGH!!!/"
	    GS.msg[1]= "I WILL ATTEND TO&MY PUZZLES.../"
	    GS.msg[2]= "\\E3AS FOR YOUR WORK?/"
	    GS.msg[3]= "PUT A LITTLE MORE,/"
	    GS.msg[4]= "\\E4" + chr(ord('"')) + "BACKBONE" + chr(ord('"')) + " INTO&IT!!!!/"
	    GS.msg[5]= "\\E2NYEHEHEHEHEHE&HEHEHEHEHEHE!!!/%%"
	    conversation= 24
	    instance_create(0, 0, 779/* obj_dialoguer */)
	}
	if(conversation == 24 and not instance_exists(782/* OBJ_WRITER */)) {
	    obj_papyrus_actor_mad.image_speed= 0.5
	    obj_papyrus_actor_mad.sprite_index= obj_papyrus_actor_mad.rsprite
	    obj_papyrus_actor_mad.velocity.x= 4
	    conversation= 25
	}
	if(conversation == 25 and obj_papyrus_actor_mad.x > obj_papyrus_actor_mad.xstart + 5) {
	    obj_papyrus_actor_mad.sprite_index= 1330/* spr_papyrus_l */
	    obj_papyrus_actor_mad.velocity.x= -1
	    obj_papyrus_actor_mad.image_speed= 0
	    conversation= 26
	}
	if(conversation == 26 and obj_papyrus_actor_mad.x < obj_papyrus_actor_mad.xstart - 50) {
	    obj_papyrus_actor_mad.velocity.x= 0
	    obj_papyrus_actor_mad.sprite_index= 1334/* spr_papyrus_lt */
	    obj_papyrus_actor_mad.frame= 0
	    GS.faceemotion= 2
	    GS.facechoice= 4
	    GS.typer= 18
	    GS.msg[0]= "HEH!/%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    conversation= 27
	}
	if(conversation == 27 and not instance_exists(782/* OBJ_WRITER */)) {
	    obj_papyrus_actor_mad.velocity.x= 1
	    obj_papyrus_actor_mad.sprite_index= 1328/* spr_papyrus_r */
	    conversation= 28
	    hh= instance_create(0, 0, 92/* obj_musfadeout */)
	    hh.fadespeed= 0.01
	}
	if(conversation == 28 and obj_papyrus_actor_mad.x > obj_papyrus_actor_mad.xstart) {
	    GS.faceemotion= 0
	    GS.facechoice= 3
	    GS.typer= 17
	    GS.msg[0]= "* ok^1, you can come out&  now./%%"
	    view_object[view_current]= 1570
	    obj_mainchara.cutscene= 0
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    conversation= 29
	}
	if(conversation == 29 and not instance_exists(782/* OBJ_WRITER */)) {
	    obj_mainchara.y-= 60
	    rememberx= obj_mainchara.x
	    obj_mainchara.velocity.x= -2
	    obj_mainchara_actor.velocity.x= -2
	    conversation= 30
	}
	if(conversation == 30 and instance_exists(1570/* obj_mainchara */) and obj_mainchara.x < rememberx - 30) {
	    obj_mainchara.facing= 0
	    GS.facing= 0
	    obj_mainchara.velocity.x= 0
	    // obj_mainchara_actor
	    with(1355) instance_destroy()
	    obj_mainchara.visible= 1
	    GS.plot= 36
	    GS.interact= 0
	    instance_create(80, 160, 1339/* obj_stalkerflowey */)
	    instance_create(x, y, 1021/* obj_sans_interactable1 */)
	    instance_create(2380, 0, 991/* obj_sansbyetrigger */)
	    instance_create(2680, 0, 991/* obj_sansbyetrigger */)
	    conversation= 32
	    instance_destroy()
	}
	if(conversation == 50 and not instance_exists(782/* OBJ_WRITER */)) {
	    hh= instance_create(0, 0, 92/* obj_musfadeout */)
	    hh.fadespeed= 0.01
	    GS.interact= 1
	    conversation= 51
	    $Alarm9.start((90) / 30.0)
	}
	if(conversation == 52) {
	    sprite_index= 1363/* spr_sans_r */
	    GS.faceemotion= 0
	    GS.facechoice= 3
	    GS.typer= 17
	    GS.msc= 0
	    GS.msg[0]= "* .../"
	    GS.msg[1]= "\\E1* uh^1, ok^1, i guess you&  don\'t have to./%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    conversation= 53
	}
	if(conversation == 53 and not instance_exists(782/* OBJ_WRITER */)) {
	    sprite_index= 1363/* spr_sans_r */
	    pap= instance_create(get_viewport_rect().size.x, y - 12, 1031/* obj_papyrus_actor_mad */)
	    pap.sprite_index= 1336/* spr_papyrus_l_mad */
	    pap.direction= 180
	    pap.speed= 4
	    conversation= 54
	}
	if(conversation == 54 and obj_papyrus_actor_mad.x <= obj_papyrus_actor_mad.xstart - 180) {
	    GS.currentsong= GS.currentsong2
	    caster_loop(GS.currentsong, 0.5, 1)
	    obj_papyrus_actor_mad.speed= 0
	    obj_papyrus_actor_mad.image_speed= 0
	    obj_papyrus_actor_mad.sprite_index= 1337/* spr_papyrus_lt_mad */
	    GS.facechoice= 0
	    GS.faceemotion= 0
	    GS.typer= 5
	    GS.msc= 0
	    scr_papface(0, 1)
	    GS.msg[1]= "SANS!!^1!&HAVE YOU FOUND A&HUMAN YET!??!/"
	    scr_sansface(2, 2)
	    GS.msg[3]= "* yeah./"
	    scr_papface(4, 0)
	    GS.msg[5]= "REALLY!?!^1?&WOWIE!!!/"
	    GS.msg[6]= "GUESS THAT\'S&SETTLED!!/%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    conversation= 55
	}
	if(conversation == 55 and not instance_exists(782/* OBJ_WRITER */)) {
	    obj_papyrus_actor_mad.image_speed= 0.5
	    obj_papyrus_actor_mad.sprite_index= 1328/* spr_papyrus_r */
	    obj_papyrus_actor_mad.velocity.x= 4
	    hh= instance_create(0, 0, 92/* obj_musfadeout */)
	    hh.fadespeed= 0.02
	    conversation= 56
	}
	if(conversation == 56 and obj_papyrus_actor_mad.x > obj_papyrus_actor_mad.xstart) {
	    GS.faceemotion= 0
	    GS.facechoice= 3
	    GS.typer= 17
	    GS.msg[0]= "* that worked out^1, huh?/%%"
	    view_object[view_current]= 1570
	    obj_mainchara.cutscene= 0
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    conversation= 58
	}
	if(conversation == 58 and not instance_exists(782/* OBJ_WRITER */)) {
	    obj_mainchara.facing= 0
	    GS.facing= 0
	    obj_mainchara.velocity.x= 0
	    // obj_mainchara_actor
	    with(1355) instance_destroy()
	    obj_mainchara.visible= 1
	    GS.plot= 36
	    GS.interact= 0
	    instance_create(80, 160, 1339/* obj_stalkerflowey */)
	    instance_create(x, y, 1021/* obj_sans_interactable1 */)
	    instance_create(2380, 0, 991/* obj_sansbyetrigger */)
	    instance_create(2680, 0, 991/* obj_sansbyetrigger */)
	    conversation= 59
	    instance_destroy()
	}

func _gm_event_9_74():
	if(GS.debug == 1) {
	    conversation= 16
	    velocity.x= 0
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
