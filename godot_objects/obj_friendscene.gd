# Auto-converted from GameMaker: obj_friendscene
extends Node2D

func _ready():
	timer= 0
	skip= 0
	if(skip == 0) {
	    con= 0
	    ahit= instance_create(116, 16, 1677/* obj_asgore_firehit */)
	    $Alarm4.start((250) / 30.0)
	}
	if(skip == 1) con= 1
	if(skip == 2) con= 85
	sidecon= 0
	gowhite= 0
	wht= 0
	tor= 437827483
	und= 437827483
	sans= 437827483
	asg= 437827483
	al= 437827483
	pap= 437827483
	trickblack= 0
	lastwhite= 0
	border_d= 0
	ting_s= 0
	skiptext= 1
	leg_r= 0
	leg= 0
	legx= get_viewport_rect().size.x + 200

func _gm_event_2_4():
	con++

func _process_end(delta: float):
	if(border_d == 1) {
	    cx= 310
	    cx2= 330
	    cy= 290
	    cy2= 310
	    obj_heart.visible= 1
	    obj_heart.x= cx + 2
	    obj_heart.y= cy + 2
	}

func _process(delta: float):
	if(skiptext == 1) scr_textskip()
	if(con == 1) {
	    GS.faceemotion= 4
	    GS.border= 4
	    SCR_BORDERSETUP()
	    fallendown= caster_load("music/fallendown2.ogg")
	    tor= instance_create(640, 96, 1679/* obj_torielbody */)
	    tor.velocity.x= -10
	    con= 2
	}
	if(con == 2 and tor.x <= 256) {
	    caster_loop(fallendown, 1, 1)
	    tor.velocity.x= 0
	    tor.x= 248
	    con= 3
	    $Alarm4.start((15) / 30.0)
	}
	if(con == 4) {
	    GS.msc= 0
	    GS.typer= 8
	    GS.faceemotion= 4
	    GS.msg[0]= "\\E4What a miserable&creature^1, torturing&such a poor^1,&innocent, youth.../"
	    GS.msg[1]= "\\E0Do not be afraid^1,&my child./"
	    GS.msg[2]= "\\E0It is I^1, TORIEL^1,&your friend and&guardian./"
	    GS.msg[3]= "\\E1At first^1, I thought&I would let you&make your journey&alone.../"
	    GS.msg[4]= "\\E4But I could not&stop worrying about&you./"
	    GS.msg[5]= "\\E4Your adventure must&have been so&treacherous./"
	    GS.msg[6]= "\\E2... and ultimately^1,&it would burden you&with a horrible&choice./"
	    GS.msg[7]= "To leave this place^1,&you would have to&take the life of&another person./"
	    GS.msg[8]= "\\E2You would have to&defeat ASGORE./"
	    GS.msg[9]= "\\E4However..^1.&I realized.../"
	    GS.msg[10]= "\\E1I cannot allow that./"
	    GS.msg[11]= "It is not right to&sacrifice someone&simply to let&someone leave here./"
	    GS.msg[12]= "\\E4Is that not what&I have been trying to&prevent this&whole time?/"
	    GS.msg[13]= "\\E1So^1, for now^1, let&us suspend this&battle./"
	    GS.msg[14]= "\\E4As terrible as&ASGORE is.../"
	    GS.msg[15]= "\\E0He deserves mercy^1,&too./%%"
	    scr_blcon_x(tor.x + 135, tor.y - 30)
	    con= 5
	}
	if(con == 5 and not instance_exists(188/* obj_blconwideslave */)) {
	    con= 6
	    asg= instance_create(-340, 60, 1674/* obj_sadgore */)
	    asg.velocity.x= 8
	    tor.velocity.x= 8
	}
	if(con == 6 and asg.x > -130) {
	    asg.velocity.x= 0
	    tor.velocity.x= 0
	    con= 7
	    $Alarm4.start((10) / 30.0)
	}
	if(con == 8) {
	    GS.faceemotion= 1
	    GS.typer= 63
	    GS.msg[0]= "Tori..^1.&You&came&back...!/%%"
	    scr_blcon_x(asg.x + 300, asg.y)
	    obj_blconwideslave.sprite_index= 18/* spr_blconsm */
	    con= 9
	}
	if(con == 9 and not instance_exists(188/* obj_blconwideslave */)) {
	    GS.typer= 8
	    GS.msg[0]= "\\E5Do not " + chr(ord('"')) + "Tori" + chr(ord('"')) + " me^1,&Dreemurr!/"
	    GS.msg[1]= "\\E2You pathetic whelp./"
	    GS.msg[2]= "If you really wanted&to free our kind.../"
	    GS.msg[3]= "You could have gone&through the barrier&after you got ONE&SOUL.../"
	    GS.msg[4]= "... taken six SOULs&from the humans^1, then&come back and freed&everyone peacefully./"
	    GS.msg[5]= "\\E5But instead^1, you made&everyone live in&despair.../"
	    GS.msg[6]= "Because you would&rather wait here^1,&meekly hoping another&human never comes./%%"
	    scr_blcon_x(tor.x - 239, tor.y - 40)
	    obj_blconwideslave.sprite_index= 30/* spr_blconwdshrt_l */
	    con= 10
	}
	if(con == 10 and instance_exists(782/* OBJ_WRITER */)) {
	    if(OBJ_WRITER.stringno == 0) asg.face= 2
	    if(OBJ_WRITER.stringno == 1) asg.face= 3
	    if(OBJ_WRITER.stringno == 5) asg.face= 4
	}
	if(con == 10 and not instance_exists(188/* obj_blconwideslave */)) {
	    asg.face= 5
	    con= 11
	    $Alarm4.start((60) / 30.0)
	    $Alarm4.start((1) / 30.0)
	}
	if(con == 12) {
	    asg.face= 5
	    GS.typer= 63
	    GS.msg[0]= ".../"
	    GS.msg[1]= "... Tori.../"
	    GS.msg[2]= "You\'re right.../"
	    GS.msg[3]= "I am a miserable&creature.../"
	    GS.msg[4]= "... but^1, do you think&we can at least be&friends again?/%%"
	    scr_blcon_x(asg.x + 300, asg.y)
	    con= 13
	}
	if(con == 13 and instance_exists(782/* OBJ_WRITER */) and OBJ_WRITER.stringno == 4)
	    asg.face= 6
	if(con == 13 and not instance_exists(188/* obj_blconwideslave */)) {
	    asg.face= 6
	    con= 14
	    $Alarm4.start((60) / 30.0)
	    $Alarm4.start((1) / 30.0)
	}
	if(con == 15) {
	    GS.typer= 8
	    GS.msg[0]= "(Sigh.)/"
	    GS.msg[1]= "NO^1,&Asgore./%%"
	    scr_blcon_x(tor.x - 110, tor.y - 40)
	    obj_blconwideslave.sprite_index= 20/* spr_blconsm2 */
	    con= 16
	}
	if(con == 16 and instance_exists(782/* OBJ_WRITER */)) {
	    if(OBJ_WRITER.stringno == 0) GS.faceemotion= 10
	    if(OBJ_WRITER.stringno == 1) {
	        GS.faceemotion= 11
	        asg.face= 7
	    }
	}
	if(con == 16 and not instance_exists(188/* obj_blconwideslave */)) {
	    con= 16.1
	    $Alarm4.start((10) / 30.0)
	}
	if(con == 17.1) {
	    GS.faceemotion= 3
	    und= instance_create(700, 340, 1676/* obj_undyne_endingbody */)
	    und.velocity.x= -12
	    con= 18
	}
	if(con == 18) {
	    // obj_btparent
	    with(755) {
	        z_index= 300
	        modulate.a-= 0.08
	    }
	    // obj_mercybutton_shatter
	    with(480) {
	        z_index= 300
	        modulate.a-= 0.08
	    }
	    if(und.x <= 510) {
	        und.x= 500
	        und.velocity.x= 0
	        con= 19
	        $Alarm4.start((8) / 30.0)
	    }
	}
	if(con == 20) {
	    GS.msc= 0
	    GS.typer= 81
	    GS.msg[0]= "Ngahhhhhh!!^1!&ASGORE^1! Human!!/"
	    GS.msg[1]= "Nobody fight each&other!!!/"
	    GS.msg[2]= "Everyone\'s gonna&make friends^1, or&else I\'ll...!!/"
	    GS.msg[3]= "I\'ll.../"
	    GS.msg[4]= ".../%%"
	    scr_blcon_x(und.x - 260, und.y)
	    obj_blconwideslave.sprite_index= 30/* spr_blconwdshrt_l */
	    obj_blconwideslave.z_index= -1000
	    OBJ_WRITER.z_index= -2000
	    con= 21
	}
	if(con == 21 and instance_exists(782/* OBJ_WRITER */)) {
	    if(OBJ_WRITER.stringno == 2) GS.faceemotion= 9
	    if(OBJ_WRITER.stringno == 3) und.face= 17
	}
	if(con == 21 and not instance_exists(188/* obj_blconwideslave */)) {
	    con= 22
	    GS.typer= 8
	    GS.msg[0]= "Hello^1.&I am&TORIEL./"
	    GS.msg[1]= "Are you&the&human\'s&friend?/"
	    GS.msg[2]= "It is&nice to&meet&you./%%"
	    scr_blcon_x(tor.x - 110, tor.y - 40)
	    obj_blconwideslave.sprite_index= 20/* spr_blconsm2 */
	}
	if(con == 22 and not instance_exists(188/* obj_blconwideslave */)) {
	    con= 23
	    GS.typer= 81
	    und.face= 10
	    GS.msg[0]= "Uh^1,&yeah...?/"
	    GS.msg[1]= "Nice to&meet&you!/%%"
	    scr_blcon_x(und.x - 130, und.y)
	    obj_blconwideslave.sprite_index= 20/* spr_blconsm2 */
	}
	if(con == 23 and not instance_exists(188/* obj_blconwideslave */)) {
	    und.face= 10
	    GS.faceemotion= 0
	    if(und.x > 170) und.x-= 15
	    else  und.x= 160
	    if(und.y > 78) und.y-= 13
	    else  und.y= 68
	    if(und.x == 160 and und.y == 68) con= 25
	}
	if(con == 25) {
	    und.face= 16
	    GS.typer= 81
	    GS.msg[0]= "Hey&ASGORE^1,&is that&your ex?/"
	    GS.msg[1]= "Jeez^1.&That\'s&rough^1,&buddy./%%"
	    scr_blcon_x(und.x + 80, und.y - 30)
	    obj_blconwideslave.sprite_index= 18/* spr_blconsm */
	    con= 26
	}
	if(con == 26 and instance_exists(782/* OBJ_WRITER */) and OBJ_WRITER.stringno == 1) {
	    und.face= 4
	    asg.face= 8
	}
	if(con == 26 and not instance_exists(188/* obj_blconwideslave */)) {
	    GS.faceemotion= 9
	    con= 27
	    al= instance_create(660, 348, 1672/* obj_alphys_friendscene */)
	    al.velocity.x= -12
	    con= 28
	}
	if(con == 28 and al.x <= 470) {
	    al.velocity.x= 0
	    al.x= 460
	    con= 29
	    $Alarm4.start((10) / 30.0)
	}
	if(con == 30) {
	    und.face= 18
	    GS.typer= 74
	    GS.msg[0]= "H-hey^1!/"
	    GS.msg[1]= "Nobody&hurt&each&other!!/"
	    GS.msg[2]= ".../"
	    GS.msg[3]= ".../%%"
	    scr_blcon_x(al.x - 120, al.y)
	    blcon.sprite_index= 20/* spr_blconsm2 */
	    obj_blconwideslave.z_index= -1000
	    OBJ_WRITER.z_index= -2000
	    con= 31
	}
	if(con == 31 and instance_exists(782/* OBJ_WRITER */)) {
	    if(OBJ_WRITER.stringno == 2) al.face= 4
	    if(OBJ_WRITER.stringno == 3) al.face= 16
	}
	if(con == 31 and not instance_exists(188/* obj_blconwideslave */)) {
	    con= 32
	    $Alarm4.start((10) / 30.0)
	}
	if(con == 33) {
	    GS.typer= 8
	    GS.msg[0]= "Oh^1!&Are you&another&friend?/"
	    GS.msg[1]= "I am&TORIEL^1.&Hello!/%%"
	    scr_blcon_x(tor.x - 110, tor.y - 30)
	    obj_blconwideslave.sprite_index= 20/* spr_blconsm2 */
	    con= 34
	}
	if(con == 34 and not instance_exists(188/* obj_blconwideslave */)) {
	    GS.typer= 74
	    GS.msg[0]= "Uh^1,&h-h-hi!/"
	    GS.msg[1]= ".../"
	    GS.msg[2]= "(THERE\'S&TWO OF&THEM???)/%%"
	    scr_blcon_x(al.x - 120, al.y)
	    obj_blconwideslave.sprite_index= 20/* spr_blconsm2 */
	    obj_blconwideslave.z_index= -1000
	    OBJ_WRITER.z_index= -2000
	    con= 35
	}
	if(con == 35 and instance_exists(782/* OBJ_WRITER */)) {
	    if(OBJ_WRITER.stringno == 1) al.face= 17
	    if(OBJ_WRITER.stringno == 2) al.face= 4
	}
	if(con == 35 and not instance_exists(188/* obj_blconwideslave */)) {
	    al.face= 18
	    GS.faceemotion= 0
	    if(al.x > 230) al.x-= 10
	    else  al.x= 220
	    if(al.y > 114) al.y-= 12
	    else  al.y= 104
	    if(al.x == 220 and al.y == 104) {
	        al.face= 18
	        con= 36
	    }
	}
	if(con == 36) {
	    GS.faceemotion= 9
	    pap= instance_create(660, 300, 1671/* obj_papyrus_friendscene */)
	    pap.velocity.x= -16
	    con= 37
	}
	if(con == 37 and pap.x <= 478) {
	    pap.velocity.x= 0
	    pap.x= 468
	    con= 38
	    $Alarm4.start((10) / 30.0)
	}
	if(con == 39 and not instance_exists(188/* obj_blconwideslave */)) {
	    GS.msc= 0
	    GS.typer= 22
	    GS.msg[0]= "HEY^1!&NOBODY FIGHT&ANYONE!/"
	    GS.msg[1]= "IF ANYONE FIGHTS&ANYONE...!/"
	    GS.msg[2]= "THEN I\'LL!!^1!&BE FORCED!!!/"
	    GS.msg[3]= "TO ASK UNDYNE&FOR HELP!!!/%%"
	    scr_blcon_x(pap.x - 260, pap.y)
	    obj_blconwideslave.sprite_index= 30/* spr_blconwdshrt_l */
	    obj_blconwideslave.z_index= -1000
	    OBJ_WRITER.z_index= -2000
	    con= 40
	}
	if(con == 40 and instance_exists(782/* OBJ_WRITER */)) {
	    if(OBJ_WRITER.stringno == 1) pap.face= 1
	    if(OBJ_WRITER.stringno == 3) pap.face= 0
	}
	if(con == 40 and not instance_exists(188/* obj_blconwideslave */)) {
	    pap.face= 2
	    GS.typer= 8
	    GS.msg[0]= "Hello!/%%"
	    scr_blcon_x(tor.x - 110, tor.y - 30)
	    obj_blconwideslave.sprite_index= 20/* spr_blconsm2 */
	    con= 41
	}
	if(con == 41 and not instance_exists(188/* obj_blconwideslave */)) {
	    pap.face= 2
	    GS.typer= 22
	    GS.msg[0]= "OH^1!&HELLO^1, YOUR&MAJESTY!/"
	    GS.msg[1]= "PSST^1!&HEY^1, HUMAN.../"
	    GS.msg[2]= "DID ASGORE&SHAVE...?/"
	    GS.msg[3]= "AND..^1.&CLONE HIMSELF????/%%"
	    scr_blcon_x(pap.x - 260, pap.y)
	    obj_blconwideslave.z_index= -1000
	    obj_blconwideslave.sprite_index= 30/* spr_blconwdshrt_l */
	    OBJ_WRITER.z_index= -2000
	    con= 42
	}
	if(con == 42 and instance_exists(782/* OBJ_WRITER */)) {
	    if(OBJ_WRITER.stringno == 1) pap.face= 7
	    if(OBJ_WRITER.stringno == 2) pap.face= 5
	    if(OBJ_WRITER.stringno == 3) pap.face= 6
	}
	if(con == 42 and not instance_exists(188/* obj_blconwideslave */)) {
	    GS.faceemotion= 0
	    sans= instance_create(-108, 408, 1673/* obj_sans_friendscene */)
	    sans.velocity.x= 5
	    con= 43
	}
	if(con == 43 and sans.x >= 16) {
	    sans.x= 20
	    sans.velocity.x= 0
	    con= 44
	    $Alarm4.start((10) / 30.0)
	}
	if(con == 45) {
	    pap.face= 7
	    GS.faceemotion= 3
	    GS.typer= 80
	    GS.msg[0]= "hey&guys..^1.&what\'s&up?/%%"
	    scr_blcon_x(sans.x + 108, sans.y - 50)
	    obj_blconwideslave.sprite_index= 18/* spr_blconsm */
	    con= 46
	    obj_blconwideslave.z_index= -1000
	    OBJ_WRITER.z_index= -2000
	}
	if(con == 46 and not instance_exists(188/* obj_blconwideslave */)) {
	    pap.face= 2
	    GS.typer= 8
	    GS.msg[0]= "That&voice&...!!/%%"
	    scr_blcon_x(tor.x - 110, tor.y - 30)
	    obj_blconwideslave.sprite_index= 20/* spr_blconsm2 */
	    obj_blconwideslave.z_index= -1000
	    OBJ_WRITER.z_index= -2000
	    con= 47
	}
	if(con == 47 and not instance_exists(188/* obj_blconwideslave */)) {
	    pap.face= 7
	    GS.faceemotion= 6
	    if(pap.x < 560) pap.x+= 3
	    if(tor.x > 365) tor.x-= 10
	    else  tor.x= 360
	    if(tor.y < 360) tor.y+= 12
	    else  tor.y= 352
	    if(tor.x == 360 and tor.y == 352) con= 48
	}
	if(con == 48 and not instance_exists(188/* obj_blconwideslave */)) {
	    und.face= 13
	    asg.face= 9
	    al.face= 3
	    sans.face= 7
	    GS.typer= 8
	    GS.faceemotion= 6
	    GS.msg[0]= "Hello^1,&I think&we&may.../"
	    GS.msg[1]= "Know&each&other?/%%"
	    scr_blcon_x(tor.x - 110, tor.y - 30)
	    obj_blconwideslave.sprite_index= 20/* spr_blconsm2 */
	    obj_blconwideslave.z_index= -1000
	    OBJ_WRITER.z_index= -2000
	    con= 49
	}
	if(con == 49 and not instance_exists(188/* obj_blconwideslave */)) {
	    GS.typer= 80
	    sans.face= 8
	    GS.msg[0]= "oh hey..^1.&i recognize your&voice^1, too./%%"
	    scr_blcon_x(120, 360)
	    obj_blconwideslave.z_index= -1000
	    OBJ_WRITER.z_index= -2000
	    con= 50
	}
	if(con == 50 and not instance_exists(188/* obj_blconwideslave */)) {
	    asg.face= 10
	    al.face= 4
	    und.face= 19
	    GS.typer= 8
	    GS.msg[0]= "I am&TORIEL./"
	    GS.msg[1]= "So nice&to meet&you./%%"
	    scr_blcon_x(tor.x - 110, tor.y - 30)
	    obj_blconwideslave.sprite_index= 20/* spr_blconsm2 */
	    obj_blconwideslave.z_index= -1000
	    OBJ_WRITER.z_index= -2000
	    con= 51
	}
	if(con == 51 and not instance_exists(188/* obj_blconwideslave */)) {
	    GS.msg[0]= "the&name\'s&sans./"
	    GS.msg[1]= "and^1, uh^1,&same./%%"
	    sans.face= 9
	    GS.typer= 80
	    scr_blcon_x(120, 360)
	    obj_blconwideslave.sprite_index= 18/* spr_blconsm */
	    obj_blconwideslave.z_index= -1000
	    OBJ_WRITER.z_index= -2000
	    con= 52
	}
	if(con == 52 and not instance_exists(188/* obj_blconwideslave */)) {
	    sans.face= 7
	    GS.typer= 8
	    GS.faceemotion= 3
	    GS.msg[0]= "Oh^1!&Wait^1,&then...!/%%"
	    scr_blcon_x(tor.x - 110, tor.y - 30)
	    obj_blconwideslave.sprite_index= 20/* spr_blconsm2 */
	    obj_blconwideslave.z_index= -1000
	    OBJ_WRITER.z_index= -2000
	    con= 53
	}
	if(con == 53 and not instance_exists(188/* obj_blconwideslave */)) {
	    GS.faceemotion= 14
	    if(pap.x > 500) pap.x-= 5
	    if(tor.x > 128) tor.x-= 20
	    else  tor.x= 108
	    if(tor.x == 108) con= 54
	}
	if(con == 54) {
	    pap.face= 0
	    GS.msg[0]= "This must be your&brother^1, Papyrus!/"
	    GS.msg[1]= "Greetings^1, Papyrus^1!&It is so nice to&finally meet you!/"
	    GS.msg[2]= "Your brother has&told me so much&about you./%%"
	    GS.typer= 8
	    scr_blcon_x(tor.x + 135, tor.y - 30)
	    obj_blconwideslave.z_index= -1000
	    OBJ_WRITER.z_index= -2000
	    con= 55
	}
	if(con == 55 and instance_exists(782/* OBJ_WRITER */) and OBJ_WRITER.stringno == 1)
	    pap.face= 3
	if(con == 55 and not instance_exists(188/* obj_blconwideslave */)) {
	    GS.typer= 22
	    pap.face= 3
	    GS.msg[0]= "WOWIE.../"
	    GS.msg[1]= "I CAN\'T BELIEVE&ASGORE\'S CLONE&KNOWS WHO I&AM!!!/"
	    GS.msg[2]= "THIS IS THE BEST&DAY OF MY&LIFE!!!!!!!/%%"
	    scr_blcon_x(pap.x - 240, pap.y)
	    obj_blconwideslave.sprite_index= 30/* spr_blconwdshrt_l */
	    obj_blconwideslave.z_index= -1000
	    OBJ_WRITER.z_index= -2000
	    con= 56
	}
	if(con == 56 and not instance_exists(188/* obj_blconwideslave */)) {
	    GS.typer= 8
	    pap.face= 0
	    GS.msg[0]= "Hey^1, Papyrus.../"
	    GS.msg[1]= "What does a skeleton&tile his roof&with?/%%"
	    scr_blcon_x(tor.x + 135, tor.y - 30)
	    obj_blconwideslave.z_index= -1000
	    OBJ_WRITER.z_index= -2000
	    con= 57
	}
	if(con == 57 and not instance_exists(188/* obj_blconwideslave */)) {
	    pap.face= 7
	    GS.typer= 22
	    GS.msg[0]= "HMMM..^1.&SNOW-PROOF ROOF&TILES???/%%"
	    scr_blcon_x(pap.x - 240, pap.y)
	    obj_blconwideslave.sprite_index= 30/* spr_blconwdshrt_l */
	    obj_blconwideslave.z_index= -1000
	    OBJ_WRITER.z_index= -2000
	    con= 58
	}
	if(con == 58 and not instance_exists(188/* obj_blconwideslave */)) {
	    GS.msg[0]= "No^1, silly^1!&A skeleton tiles&his roof with.../"
	    GS.msg[1]= "SHIN-gles!!!/%%"
	    GS.typer= 8
	    scr_blcon_x(tor.x + 135, tor.y - 30)
	    obj_blconwideslave.z_index= -1000
	    OBJ_WRITER.z_index= -2000
	    con= 59
	}
	if(con == 59 and instance_exists(782/* OBJ_WRITER */) and OBJ_WRITER.stringno == 1)
	    pap.face= 8
	if(con == 59 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 60
	    $Alarm4.start((1) / 30.0)
	    sans.face= 8
	    GS.faceemotion= 12
	}
	if(con == 61 and not instance_exists(188/* obj_blconwideslave */)) {
	    pap.face= 4
	    GS.typer= 22
	    GS.msg[0]= "I CHANGED MY&MIND!!!/"
	    GS.msg[1]= "THIS IS THE WORST&DAY OF MY LIFE!!!/%%"
	    scr_blcon_x(pap.x - 240, pap.y)
	    obj_blconwideslave.sprite_index= 30/* spr_blconwdshrt_l */
	    obj_blconwideslave.z_index= -1000
	    OBJ_WRITER.z_index= -2000
	    con= 62
	}
	if(con == 62 and not instance_exists(188/* obj_blconwideslave */)) {
	    al.face= 18
	    und.face= 4
	    asg.face= 7
	    GS.typer= 81
	    GS.msg[0]= "Come on^1, ASGORE^1!&It\'s gonna be OK!/"
	    GS.msg[1]= "There are plenty&of fish in the&sea.../%%"
	    scr_blcon_x(und.x + 85, und.y - 50)
	    con= 63
	}
	if(con == 63 and instance_exists(782/* OBJ_WRITER */) and OBJ_WRITER.stringno == 1)
	    und.face= 11
	if(con == 63 and not instance_exists(188/* obj_blconwideslave */)) {
	    GS.typer= 74
	    und.face= 18
	    al.face= 9
	    asg.face= 8
	    GS.msg[0]= "Y-yeah^1, ASGORE!!/"
	    GS.msg[1]= "Undyne\'s totally&right about that&fish thing!/"
	    GS.msg[2]= "S-sometimes you\'ve&just got to^1, uh.../"
	    GS.msg[3]= "S-stop going after&furry boss monsters&and^1, uh.../"
	    GS.msg[4]= "J-just get to know&a really cute&fish...?/"
	    GS.msg[5]= ".../"
	    GS.msg[6]= "It\'s a metaphor./%%"
	    scr_blcon_x(al.x + 145, al.y)
	    con= 64
	}
	if(con == 64 and instance_exists(782/* OBJ_WRITER */)) {
	    if(OBJ_WRITER.stringno == 1) al.face= 10
	    if(OBJ_WRITER.stringno == 4) und.face= 12
	    if(OBJ_WRITER.stringno == 5) {
	        al.face= 15
	        und.face= 13
	    }
	    if(OBJ_WRITER.stringno == 6) {
	        al.face= 18
	        und.face= 11
	    }
	}
	if(con == 64 and not instance_exists(188/* obj_blconwideslave */)) {
	    GS.typer= 81
	    und.face= 18
	    GS.msg[0]= "Well./"
	    GS.msg[1]= "I think&it\'s a&good&analogy./%%"
	    scr_blcon_x(und.x + 85, und.y - 50)
	    obj_blconwideslave.sprite_index= 18/* spr_blconsm */
	    con= 65
	}
	if(con == 65 and instance_exists(782/* OBJ_WRITER */) and OBJ_WRITER.stringno == 1)
	    und.face= 11
	if(con == 65 and not instance_exists(188/* obj_blconwideslave */)) {
	    leg= 1
	    leg_r= 0
	    legx= get_viewport_rect().size.x + 200
	    al.face= 15
	    und.face= 13
	    pap.face= 2
	    GS.faceemotion= 4
	    asg.face= 9
	    con= 66
	    $Alarm4.start((15) / 30.0)
	}
	if(con == 67) {
	    GS.typer= 51
	    GS.msg[0]= "OH MY GOD!/"
	    GS.msg[1]= "\\XWILL YOU TWO&JUST \\RSMOOCH\\X &ALREADY!?/"
	    GS.msg[2]= "THE AUDIENCE IS&DYING FOR SOME&ROMANTIC ACTION!!!/%%"
	    scr_blcon_x(get_viewport_rect().size.x - 255, 20)
	    blcon.sprite_index= 30/* spr_blconwdshrt_l */
	    con= 68
	}
	if(con == 68 and not instance_exists(188/* obj_blconwideslave */)) {
	    leg= 2
	    GS.faceemotion= 13
	    pap.face= 7
	    GS.typer= 81
	    und.face= 6
	    GS.msg[0]= "HEY^1, SHUT UP!!!/"
	    GS.msg[1]= "Man^1, the nerve of&that guy!/"
	    GS.msg[2]= "Right^1,&Alphys!??/"
	    GS.msg[3]= ".../"
	    GS.msg[4]= "Uh^1, Alphys?/%%"
	    scr_blcon_x(und.x + 85, und.y - 50)
	    con= 69
	}
	if(con == 69 and instance_exists(782/* OBJ_WRITER */)) {
	    if(OBJ_WRITER.stringno == 1) und.face= 10
	    if(OBJ_WRITER.stringno == 2) und.face= 18
	    if(OBJ_WRITER.stringno == 4) und.face= 3
	}
	if(con == 69 and not instance_exists(188/* obj_blconwideslave */)) {
	    GS.typer= 74
	    al.face= 4
	    GS.msg[0]= ".../"
	    GS.msg[1]= "No./"
	    GS.msg[2]= "He\'s&right./"
	    GS.msg[3]= "LET\'S&DO&IT./%%"
	    scr_blcon_x(al.x + 145, al.y)
	    obj_blconwideslave.sprite_index= 18/* spr_blconsm */
	    con= 70
	}
	if(con == 70 and instance_exists(782/* OBJ_WRITER */)) {
	    if(OBJ_WRITER.stringno == 2) {
	        al.face= 3
	        und.face= 13
	    }
	    if(OBJ_WRITER.stringno == 3) al.face= 11
	}
	if(con == 70 and not instance_exists(188/* obj_blconwideslave */)) {
	    al.face= 18
	    und.face= 19
	    GS.typer= 81
	    GS.msg[0]= "??????????????/"
	    GS.msg[1]= "Well??^1? Uh??^1?&I guess??^1?&If you want to??^1?&Then????/"
	    GS.msg[2]= "Don\'t hold anything&back!!!/%%"
	    scr_blcon_x(und.x + 85, und.y - 50)
	    con= 71
	}
	if(con == 71 and instance_exists(782/* OBJ_WRITER */)) {
	    if(OBJ_WRITER.stringno == 1) und.face= 17
	    if(OBJ_WRITER.stringno == 2) und.face= 14
	}
	if(con == 71 and not instance_exists(188/* obj_blconwideslave */)) {
	    con= 72
	    $Alarm4.start((90) / 30.0)
	    und.smooch= 1
	    al.smooch= 1
	}
	if(con == 73) {
	    und.smooch= 2
	    al.smooch= 2
	    GS.faceemotion= 3
	    asg.face= 9
	    al.x+= 21
	    tor.x+= 12
	    if(tor.x > 212) tor.x= 218
	    tor.y-= 26
	    if(tor.y < 108) tor.y= 96
	    if(tor.x == 218 and tor.y == 96) con= 74
	}
	if(con == 74) {
	    GS.typer= 8
	    GS.msg[0]= "W-wait!/"
	    GS.msg[1]= "Not in&front of&the&human!/%%"
	    scr_blcon_x(tor.x + 125, tor.y - 80)
	    obj_blconwideslave.sprite_index= 18/* spr_blconsm */
	    con= 75
	}
	if(con == 75 and not instance_exists(188/* obj_blconwideslave */)) {
	    und.smooch= 0
	    und.s_i= 0
	    al.smooch= 0
	    con= 76
	    GS.typer= 74
	    al.face= 18
	    und.face= 14
	    GS.faceemotion= 6
	    GS.msg[0]= "Uhh^1, right^1!&S-sorry^1, I got a&little carried&away there./%%"
	    scr_blcon_x(al.x - 40, tor.y - 90)
	    obj_blconwideslave.sprite_index= 24/* spr_blconabove */
	}
	if(con == 76 and not instance_exists(188/* obj_blconwideslave */)) {
	    sans.face= 0
	    pap.face= 0
	    asg.face= 0
	    al.face= 0
	    und.face= 0
	    sidecon= 1
	    GS.typer= 8
	    GS.faceemotion= 0
	    GS.msg[0]= "Hee hee hee./"
	    GS.msg[1]= "My child^1, it seems&as if you must&stay here&for a while./"
	    GS.msg[2]= "\\E6But looking at&all the great&friends you have&made.../"
	    GS.msg[3]= "\\E0I think.../"
	    GS.msg[4]= "\\E7I think you will&be happy here./%%"
	    scr_blcon_x(tor.x - 35, tor.y + 170)
	    obj_blconwideslave.sprite_index= 25/* spr_blconbelow */
	    obj_blconwideslave.z_index= -1000
	    OBJ_WRITER.z_index= -2000
	    con= 77
	}
	if(con == 77 and not instance_exists(188/* obj_blconwideslave */) and sidecon == 2) {
	    con= 78
	    $Alarm4.start((40) / 30.0)
	}
	if(con == 79) {
	    GS.typer= 74
	    GS.faceemotion= 0
	    skiptext= 0
	    al.face= 15
	    GS.msg[0]= "H-hey^1, that&reminds me./"
	    GS.msg[1]= "Papyrus..^1.&YOU called&everyone here^1,&right?/"
	    GS.msg[2]= "Well^1, besides^1,&uh^1, her./"
	    GS.msg[3]= "Uh^1, anyway..^1.&If I got here&before you.../"
	    GS.msg[4]= "How did you know&how to call&everybody?/%%"
	    scr_blcon_x(al.x - 80, tor.y - 90)
	    obj_blconwideslave.sprite_index= 24/* spr_blconabove */
	    con= 80
	}
	if(con == 80 and not instance_exists(188/* obj_blconwideslave */)) {
	    pap.face= 7
	    GS.typer= 22
	    GS.msg[0]= "LET\'S&JUST&SAY.../%%"
	    scr_blcon_x(pap.x - 100, 8)
	    obj_blconwideslave.sprite_index= 20/* spr_blconsm2 */
	    con= 81
	}
	if(con == 81 and not instance_exists(188/* obj_blconwideslave */)) {
	    pap.face= 0
	    GS.typer= 83
	    GS.msg[0]= "A TINY&FLOWER&HELPED&ME./%%"
	    caster_free(fallendown)
	    scr_blcon_x(pap.x - 100, 8)
	    obj_blconwideslave.sprite_index= 20/* spr_blconsm2 */
	    con= 82
	}
	if(con == 82 and not instance_exists(188/* obj_blconwideslave */)) {
	    al.face= 9
	    GS.typer= 82
	    GS.msg[0]= "A tiny..^1.&flower?/%%"
	    GS.faceemotion= 1
	    scr_blcon_x(al.x - 80, tor.y - 90)
	    obj_blconwideslave.sprite_index= 24/* spr_blconabove */
	    con= 83
	}
	if(con == 83 and not instance_exists(188/* obj_blconwideslave */)) {
	    con= 84
	    $Alarm4.start((50) / 30.0)
	}
	if(con == 85) {
	    i= 0
	    snd_play(44/* snd_laz */)
	    gigavine[i]= instance_create(-100, 160, 1668/* obj_friendscene_gigavine */)
	    con= 86
	    $Alarm4.start((75) / 30.0)
	}
	if(con == 87) {
	    GS.border= 4
	    SCR_BORDERSETUP()
	    gowhite= 1
	    con= 88
	    snd_play(30/* snd_break2 */)
	    $Alarm4.start((80) / 30.0)
	}
	if(con == 89) {
	    GS.faceemotion= 0
	    flowey= instance_create(276, 296, 1667/* obj_flowey_friendscene */)
	    con= 90
	    $Alarm4.start((60) / 30.0)
	}
	if(con == 91) {
	    skiptext= 1
	    caster_loop(fmusic, 0.8, 0.9)
	    GS.typer= 6
	    GS.msg[0]= "\\E0You IDIOTS./"
	    GS.msg[1]= "\\E2While you guys were&having your little&pow-wow.../"
	    GS.msg[2]= "\\E6I took the human&SOULS!/"
	    GS.msg[3]= "\\E5And now^1, not only&are THOSE under my&power.../"
	    GS.msg[4]= "\\E6But all of your&FRIENDS\' SOULS are&gonna be mine^1, too!/"
	    GS.msg[5]= "\\E0Hee hee hee./"
	    GS.msg[6]= "\\E1And you know what&the best part is?/"
	    GS.msg[7]= "\\E5It\'s all your&fault./"
	    GS.msg[8]= "\\E6It\'s all because&you MADE THEM&love you./"
	    GS.msg[9]= "\\E7All the time you&spent listening to&them.../"
	    GS.msg[10]= "\\E2Encouraging them..^1.&Caring about them.../"
	    GS.msg[11]= "\\E0Without that^1, they&wouldn\'t have come&here./"
	    GS.msg[12]= "\\E7And now^1, with their&souls and the humans\'&together.../"
	    GS.msg[13]= "\\E5I will achieve my&REAL FORM./"
	    GS.msg[14]= "\\E0Hee hee.../"
	    GS.msg[15]= "\\E3Huh?/"
	    GS.msg[16]= "\\E1WHY am I still&doing this?/"
	    GS.msg[17]= "\\E7Don\'t you get it?/"
	    GS.msg[18]= "\\E0This is all just&a GAME./"
	    GS.msg[19]= "\\E3If you leave the&underground satisfied^1,&you\'ll " + chr(ord('"')) + "win" + chr(ord('"')) + " the&game./"
	    GS.msg[20]= "\\E4If you " + chr(ord('"')) + "win^1," + chr(ord('"')) + " you&won\'t want to " + chr(ord('"')) + "play" + chr(ord('"')) + "&with me anymore./"
	    GS.msg[21]= "\\E0And what would I&do then?/"
	    GS.msg[22]= "\\E6But this game&between us will&NEVER end./"
	    GS.msg[23]= "\\E5I\'ll hold victory&in front of you^1,&just within your&reach.../"
	    GS.msg[24]= "\\E6And then tear it&away just before&you grasp it./"
	    GS.msg[25]= "\\E8Over^1, and over^1,&and over.../"
	    GS.msg[26]= "\\E5Hee hee hee./"
	    GS.msg[27]= "\\E1Listen./"
	    GS.msg[28]= "\\E0If you DO defeat&me^1, I\'ll give you&your " + chr(ord('"')) + "happy ending." + chr(ord('"')) + "/"
	    GS.msg[29]= "\\E7I\'ll bring your&friends back./"
	    GS.msg[30]= "I\'ll destroy the&barrier./"
	    GS.msg[31]= "\\E0Everyone will&finally be&satisfied./"
	    GS.msg[32]= "\\E6But that WON\'T&happen./"
	    GS.msg[33]= "\\E8You...!/"
	    GS.msg[34]= "\\E0I\'ll keep you here&no matter what!/%%"
	    scr_blcon_x(flowey.x + 105, flowey.y - 20)
	    con= 92
	}
	if(con == 92 and not instance_exists(188/* obj_blconwideslave */)) {
	    flowey.con= 6
	    $Alarm4.start((60) / 30.0)
	    con= 93
	}
	if(con == 94) {
	    caster_free(-3)
	    snd_play(21/* snd_impact */)
	    border_d= 1
	    tx= 320
	    ty= 300
	    con= 94.1
	    $Alarm4.start((40) / 30.0)
	}
	if(con == 95.1) {
	    gen= instance_create(tx, ty, 1666/* obj_spinbulletgen_friendscene */)
	    con= 95
	    $Alarm4.start((60) / 30.0)
	}
	if(con == 96) {
	    GS.faceemotion= 0
	    GS.typer= 7
	    GS.msg[0]= "\\E0Even if it means&killing you&1.000.000 times!!!!/%%"
	    scr_blcon_x(flowey.x - 65, flowey.y - 110)
	    obj_blconwideslave.sprite_index= 24/* spr_blconabove */
	    con= 97
	}
	if(con == 97 and not instance_exists(188/* obj_blconwideslave */)) {
	    snd_play(52/* snd_floweylaugh */)
	    with(gen) event_user(0)
	    con= 98
	    $Alarm4.start((35) / 30.0)
	    done= 0
	    flowey.laugh= 1
	}
	if(con == 99) {
	    snd_stop(52)
	    snd_play(52/* snd_floweylaugh */)
	    done++
	    with(gen) event_user(0)
	    with(gen) instance_destroy()
	    gen= instance_create(tx, ty, 1666/* obj_spinbulletgen_friendscene */)
	    if(done == 1) {
	        con= 98
	        $Alarm4.start((35) / 30.0)
	    } else  {
	        con= 100
	        $Alarm4.start((35) / 30.0)
	    }
	}
	if(con == 101) {
	    snd_stop(52)
	    snd_play(52/* snd_floweylaugh */)
	    with(gen) event_user(0)
	    with(gen) instance_destroy()
	    gen= instance_create(tx, ty, 1666/* obj_spinbulletgen_friendscene */)
	    gen.spec= 2
	    gen.radius= 130
	    con= 102
	    $Alarm4.start((100) / 30.0)
	}
	if(con == 103) {
	    with(gen) event_user(0)
	    con= 104
	    $Alarm4.start((105) / 30.0)
	}
	if(con == 105) {
	    flowey.laugh= 2
	    con= 106
	    $Alarm4.start((60) / 30.0)
	}
	if(con == 106) {
	    // obj_wrapshock
	    with(1680) {
	        if(mf >= 0) mf-= 0.015
	    }
	}
	if(con == 107) {
	    flowey.laugh= 0
	    GS.faceemotion= 4
	    GS.typer= 6
	    GS.msg[0]= "What?/%%"
	    scr_blcon_x(flowey.x - 65, flowey.y - 110)
	    obj_blconwideslave.sprite_index= 24/* spr_blconabove */
	    con= 108
	}
	if(con == 108 and not instance_exists(188/* obj_blconwideslave */)) {
	    con= 109
	    $Alarm4.start((40) / 30.0)
	}
	if(con == 110) {
	    dontgiveup= caster_load("music/dontgiveup.ogg")
	    caster_loop(dontgiveup, 0.9, 1)
	    tor2.face= 1
	    GS.typer= 84
	    GS.msg[0]= "Do not be afraid^1,&my child.../"
	    GS.msg[1]= "No matter what&happens.../"
	    GS.msg[2]= "We will always&be there to&protect you!/%%"
	    scr_blcon_x(tor2.x - 5, tor2.y + 170)
	    obj_blconwideslave.sprite_index= 25/* spr_blconbelow */
	    blcon.z_index= -2000
	    OBJ_WRITER.z_index= -3000
	    con= 111
	}
	if(con == 111 and instance_exists(782/* OBJ_WRITER */) and OBJ_WRITER.stringno == 1)
	    tor2.face= 2
	if(con == 111 and not instance_exists(188/* obj_blconwideslave */)) {
	    snd_play(155/* snd_heal_c */)
	    GS.hp++
	    con= 112
	    $Alarm4.start((45) / 30.0)
	}
	if(con == 113) {
	    GS.faceemotion= 12
	    gen= instance_create(tx, ty, 1666/* obj_spinbulletgen_friendscene */)
	    with(gen) {
	        $Alarm0.start((-1) / 30.0)
	        $Alarm1.start((-1) / 30.0)
	        $Alarm2.start((1) / 30.0)
	        spec= 3
	    }
	    con= 114
	    $Alarm4.start((20) / 30.0)
	}
	if(con == 115) {
	    gen= instance_create(tx, ty, 1666/* obj_spinbulletgen_friendscene */)
	    with(gen) {
	        $Alarm0.start((-1) / 30.0)
	        $Alarm1.start((-1) / 30.0)
	        $Alarm3.start((1) / 30.0)
	        spec= 4
	    }
	    con= 116
	    $Alarm4.start((60) / 30.0)
	}
	if(con == 117) {
	    GS.faceemotion= 4
	    pap2.face= 1
	    GS.typer= 22
	    GS.msg[0]= "THAT\'S RIGHT^1,&HUMAN^1!&YOU CAN&WIN!!/"
	    GS.msg[1]= "JUST DO&WHAT I^1,&WOULD&DO.../"
	    GS.msg[2]= "BELIEVE&IN YOU!!!/%%"
	    scr_blcon_x(pap2.x - 45, pap2.y + 270)
	    obj_blconwideslave.sprite_index= 25/* spr_blconbelow */
	    con= 118
	}
	if(con == 118 and not instance_exists(188/* obj_blconwideslave */)) {
	    snd_play(155/* snd_heal_c */)
	    GS.hp++
	    und2.face= 1
	    GS.typer= 81
	    GS.msg[0]= "Hey^1! Human^1! If&you got past&ME^1, you can&do ANYTHING!/"
	    GS.msg[1]= "So don\'t worry^1!&We\'re with you&all the way!/%%"
	    scr_blcon_x(und2.x - 45, und2.y + 200)
	    obj_blconwideslave.sprite_index= 25/* spr_blconbelow */
	    con= 119
	}
	if(con == 119 and not instance_exists(188/* obj_blconwideslave */)) {
	    snd_play(155/* snd_heal_c */)
	    GS.hp++
	    sans2.face= 1
	    GS.typer= 80
	    GS.msg[0]= "huh^1?&you haven\'t&beaten&this guy yet?/"
	    GS.msg[1]= "come on^1, this&weirdo\'s got&nothin\' on you./%%"
	    scr_blcon_x(sans2.x - 25, sans2.y + 130)
	    obj_blconwideslave.sprite_index= 25/* spr_blconbelow */
	    blcon.z_index= -10
	    con= 120
	}
	if(con == 120 and not instance_exists(188/* obj_blconwideslave */)) {
	    snd_play(155/* snd_heal_c */)
	    GS.hp++
	    con= 121
	    $Alarm4.start((40) / 30.0)
	}
	if(con == 122) {
	    GS.faceemotion= 12
	    gen= instance_create(tx, ty, 1666/* obj_spinbulletgen_friendscene */)
	    with(gen) {
	        $Alarm0.start((-1) / 30.0)
	        $Alarm1.start((-1) / 30.0)
	        $Alarm2.start((1) / 30.0)
	        spec= 5
	    }
	    con= 123
	    $Alarm4.start((20) / 30.0)
	}
	if(con == 124) {
	    gen= instance_create(tx, ty, 1666/* obj_spinbulletgen_friendscene */)
	    with(gen) {
	        $Alarm0.start((-1) / 30.0)
	        $Alarm1.start((-1) / 30.0)
	        $Alarm3.start((1) / 30.0)
	        spec= 6
	    }
	    con= 125
	    $Alarm4.start((60) / 30.0)
	}
	if(con == 126 and not instance_exists(188/* obj_blconwideslave */)) {
	    GS.faceemotion= 14
	    al2.face= 1
	    GS.typer= 74
	    GS.msg[0]= "Technically^1, it\'s&impossible for you&to beat him.../"
	    GS.msg[1]= "B-but..^1.&Somehow^1, I know&you can do it!!/%%"
	    scr_blcon_x(al2.x - 75, al2.y + 190)
	    obj_blconwideslave.sprite_index= 25/* spr_blconbelow */
	    obj_blconwideslave.z_index= -10
	    con= 127
	}
	if(con == 127 and instance_exists(782/* OBJ_WRITER */) and OBJ_WRITER.stringno == 1)
	    al2.face= 2
	if(con == 127 and not instance_exists(188/* obj_blconwideslave */)) {
	    snd_play(155/* snd_heal_c */)
	    GS.hp++
	    GS.typer= 63
	    asg2.face= 2
	    GS.msg[0]= "Human^1, for the&future of&humans and&monsters...!/"
	    GS.msg[1]= "You have to stay&determined...!/%%"
	    scr_blcon_x(-10, asg2.y + 250)
	    obj_blconwideslave.sprite_index= 25/* spr_blconbelow */
	    con= 128
	}
	if(con == 128 and not instance_exists(188/* obj_blconwideslave */)) {
	    GS.faceemotion= 16
	    snd_play(155/* snd_heal_c */)
	    GS.hp++
	    con= 129
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 130) {
	    with(flowey) {
	        neut= 1
	        spec= 1
	        con= 6
	    }
	    biig= instance_create(0, 0, 1661/* obj_bringitinguys */)
	    con= 131
	    $Alarm4.start((60) / 30.0)
	}
	if(con == 132) {
	    GS.faceemotion= 17
	    con= 133
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 134) {
	    with(flowey) {
	        spec= 2
	        con= 6
	    }
	    con= 135
	    $Alarm4.start((110) / 30.0)
	}
	if(con == 136 and not instance_exists(188/* obj_blconwideslave */)) {
	    GS.typer= 78
	    skiptext= 0
	    GS.faceemotion= 18
	    GS.msg[0]= "Urrrgh..^1. NO!/"
	    GS.msg[1]= "Unbelievable!!/"
	    GS.msg[2]= "This can\'t be&happening...!/"
	    GS.msg[3]= "You..^1. YOU...!/%%"
	    scr_blcon_x(flowey.x - 65, flowey.y - 110)
	    obj_blconwideslave.sprite_index= 24/* spr_blconabove */
	    blcon.z_index= -2000
	    OBJ_WRITER.z_index= -3000
	    con= 137
	}
	if(con == 127 and instance_exists(782/* OBJ_WRITER */)) {
	    if(OBJ_WRITER.stringno == 2) GS.faceemotion= 19
	    if(OBJ_WRITER.stringno == 3) GS.faceemotion= 20
	}
	if(con == 137 and not instance_exists(188/* obj_blconwideslave */)) {
	    caster_free(dontgiveup)
	    snd_play(106/* snd_noise */)
	    flowey.laugh= 2
	    con= 138
	    $Alarm4.start((70) / 30.0)
	    // obj_wrapshock
	    with(1680) {
	        mf= 0
	        freeze= 1
	    }
	    // obj_friendscene_gigavine
	    with(1668) shimmy= 0
	    with(biig) event_user(0)
	    trickblack= 1
	}
	if(con == 139 and not instance_exists(188/* obj_blconwideslave */)) {
	    GS.typer= 77
	    hellsfx= caster_load("music/f_destroyed3.ogg")
	    GS.msg[0]= "I can\'t believe&you\'re all so&STUPID./%%"
	    scr_blcon_x(flowey.x - 65, flowey.y - 110)
	    obj_blconwideslave.sprite_index= 24/* spr_blconabove */
	    obj_blconwideslave.z_index= z_index - 10
	    OBJ_WRITER.z_index= z_index - 20
	    con= 140
	}
	if(con == 140 and not instance_exists(188/* obj_blconwideslave */)) {
	    caster_loop(hellsfx, 0.5, 0.6)
	    pit= 0.8
	    vol= 0.6
	    flowey.laugh= 1
	    // obj_wrapshock
	    with(1680) {
	        freeze= 0
	        shock= 1
	        s_timer= -999
	    }
	    // obj_friendscene_gigavine
	    with(1668) shimmy= 1
	    wht= 0
	    trickblack= 0
	    lastwhite= 1
	    con= 141
	    white= 0
	    z_index= -100000
	    GS.typer= 7
	    GS.msg[0]= "ALL OF YOUR SOULS&ARE MINE!!!/%%"
	    scr_blcon_x(flowey.x - 65, flowey.y - 110)
	    blcon.z_index= z_index + 2
	    OBJ_WRITER.z_index= z_index + 1
	    with(biig) event_user(1)
	    blcon.sprite_index= 24/* spr_blconabove */
	}
	if(con == 141) {
	    pit+= 0.007
	    vol+= 0.005
	    caster_set_pitch(hellsfx, pit)
	    caster_set_volume(hellsfx, vol)
	    // obj_wrapshock
	    with(1680) mf+= 0.02
	}
	if(sidecon == 1) {
	    if(sans.y < 140 or sans.y > 240) sans.y+= 12
	    else  {
	        sidecon= 2
	        sans.y= 152
	    }
	    if(sans.y > 680) {
	        sans.x= tor.x + 120
	        sans.y= -200
	        sans.z_index= tor.z_index + 1
	    }
	    if(pap.y > 50) {
	        pap.z_index= al.z_index + 1
	        pap.y-= 18
	        pap.x++
	    } else  pap.y= 40
	}
	if(border_d == 1) {
	    cx= 310
	    cx2= 330
	    cy= 290
	    cy2= 310
	    obj_heart.visible= 1
	    obj_heart.x= cx + 2
	    obj_heart.y= cy + 2
	}
	if(ting_s == 1) {
	    snd_stop(28)
	    snd_play(28/* snd_bell */)
	    ting_s= 0
	}

func _on_outside_room():
	if(gowhite == 1) {
	    wht+= 0.2
	    draw_set_alpha(wht)
	    draw_set_color(16777215)
	    draw_rectangle(-10, -10, 999, 999, 0)
	    draw_set_alpha(1)
	    if(wht > 1.5) {
	        gowhite= 2
	        fmusic= caster_load("music/yourbestfriend_3.ogg")
	        al2= instance_create(410, 0, 1680/* obj_wrapshock */)
	        al2.type= 4
	        with(al) instance_destroy()
	        und2= instance_create(110, 42, 1680/* obj_wrapshock */)
	        und2.type= 3
	        with(und) instance_destroy()
	        asg2= instance_create(-128, 10, 1680/* obj_wrapshock */)
	        asg2.type= 5
	        with(asg) instance_destroy()
	        sans2= instance_create(290, 56, 1680/* obj_wrapshock */)
	        sans2.type= 2
	        with(sans) instance_destroy()
	        pap2= instance_create(513, 0, 1680/* obj_wrapshock */)
	        pap2.type= 1
	        with(pap) instance_destroy()
	        tor2= instance_create(185, 48, 1680/* obj_wrapshock */)
	        with(tor) instance_destroy()
	        // obj_friendscene_gigavine
	        with(1668) {
	            y-= 100
	            shimmy= 1
	        }
	    }
	}
	if(gowhite == 2) {
	    wht-= 0.2
	    draw_set_alpha(wht)
	    draw_set_color(16777215)
	    draw_rectangle(-10, -10, 999, 999, 0)
	    draw_set_alpha(1)
	    if(wht < 0.04) {
	        wht= 0
	        gowhite= 0
	    }
	}
	if(border_d == 1) {
	    cx= 310
	    cx2= 330
	    cy= 290
	    cy2= 310
	    obj_heart.x= cx + 2
	    obj_heart.y= cy + 2
	    obj_heart.movement= 0
	    draw_set_color(16777215)
	    cc= 0
	    repeat(4)  {
	        draw_rectangle(cx - cc, cy - cc, cx2 + cc, cy2 + cc, 1)
	        cc++
	    }
	}
	if(trickblack == 1) {
	    flowey.z_index= z_index - 10
	    draw_set_color(0)
	    draw_set_alpha(0.5)
	    draw_rectangle(-10, -10, 999, 999, 0)
	    draw_set_alpha(1)
	}
	if(lastwhite == 1) {
	    view_xview[0]= 0 + random(2 + wht * 2) - random(2 - wht * 2)
	    view_yview[0]= 0 + random(2 + wht * 2) - random(2 - wht * 2)
	    wht+= 0.003
	    draw_set_alpha(wht)
	    draw_set_color(16777215)
	    draw_rectangle(-10, -10, 999, 999, 0)
	    draw_set_alpha(1)
	    if(wht > 1.4) {
	        caster_free(-3)
	        get_tree().change_scene_to_file("res://godot_rooms/330.tscn")
	    }
	}
	if(leg > 0) {
	    if(leg == 1) {
	        if(legx > get_viewport_rect().size.x + 50) legx-= 10
	        leg_r++
	    }
	    if(leg == 2) {
	        leg_r++
	        if(legx < get_viewport_rect().size.x + 200) legx+= 10
	        else  leg= 0
	    }
	    draw_sprite_ext(502/* spr_mettleg2_flip */, 0, legx, 180, 2, 2, sin(leg_r / 4) * 6, 16777215, 1)
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
