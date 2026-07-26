# Auto-converted from GameMaker: obj_undynedate_inside
extends Node2D

func _ready():
	table= scr_marker(177, 115, 1490)
	with(table) scr_depth()
	piano= scr_marker(60, 100, 1489)
	with(piano) scr_depth()
	sword= scr_marker(obj_solidthin.x, obj_solidthin.y - 34, 1484)
	with(sword) scr_depth()
	teacup= scr_marker(104, 57, 1482)
	with(teacup) scr_depth()
	con= 1
	GS.interact= 1
	$Alarm4.start((40) / 30.0)
	caster_free(-3)
	GS.facing= 2
	papyrus= instance_create(120, 140, 1032/* obj_papyrus_actor */)
	papyrus.sprite_index= papyrus.usprite
	papyrus.fun= 1
	papyrus.image_speed= 0
	undyne= instance_create(140, 80, 1061/* obj_undyne_actor */)
	undyne.sprite_index= undyne.dtsprite
	con= 1
	if(con == 104) {
	    GS.currentsong= caster_load("music/undynetruetheme.ogg")
	    caster_loop(GS.currentsong, 0.9, 1)
	    GS.phasing= 1
	    con= 104
	    undyne.x= 208
	    undyne.y= 10
	    view_object[0]= -4
	    obj_mainchara.cutscene= 1
	    obj_mainchara.x= 200
	    obj_mainchara.y= 140
	}

func _gm_event_2_4():
	con++

func _process(delta: float):
	if(con == 1) GS.interact= 1
	if(con == 2) {
	    GS.typer= 19
	    GS.facechoice= 4
	    GS.faceemotion= 0
	    GS.msc= 0
	    GS.msg[0]= "HERE^1, UNDYNE./"
	    GS.msg[1]= "MY FRIEND BROUGHT&A GIFT FOR YOU^1,&ON THEIR OWN!/%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 3
	}
	if(con == 3 and not instance_exists(782/* OBJ_WRITER */)) {
	    papyrus.sprite_index= 1338/* spr_papyrus_boneget */
	    papyrus.image_speed= 0.25
	    if(papyrus.frame >= 4) {
	        papyrus.image_speed= 0
	        papyrus.frame= 4
	        con= 4
	    }
	}
	if(con == 4) {
	    GS.typer= 37
	    GS.facechoice= 5
	    undyne.fun= 0
	    GS.msg[0]= "* Uhhh..^1. thanks./%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 5
	}
	if(con == 5 and not instance_exists(782/* OBJ_WRITER */)) {
	    undyne.velocity.y= 3
	    undyne.fun= 1
	    undyne.sprite_index= undyne.dsprite
	    undyne.image_speed= 0.25
	    con= 6
	    $Alarm4.start((15) / 30.0)
	}
	if(con == 7) {
	    papyrus.frame= 5
	    con= 6.1
	    undyne.sprite_index= undyne.usprite
	    undyne.velocity.y= -3
	    $Alarm4.start((15) / 30.0)
	}
	if(con == 7.1) {
	    papyrus.sprite_index= papyrus.usprite
	    papyrus.frame= 0
	    undyne.sprite_index= undyne.dtsprite
	    undyne.frame= 0
	    undyne.image_speed= 0
	    undyne.velocity.y= 0
	    undyne.fun= 0
	    GS.msg[0]= "* I\'ll^1, uh^1, put it&  with the others./%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 10
	}
	if(con == 10 and not instance_exists(782/* OBJ_WRITER */)) {
	    undyne.image_speed= 0.25
	    undyne.sprite_index= undyne.usprite
	    undyne.velocity.y= -3
	    $Alarm4.start((15) / 30.0)
	    con= 9.1
	    $Alarm4.start((15) / 30.0)
	}
	if(con == 10.1) {
	    undyne.sprite_index= undyne.lsprite
	    undyne.velocity.y= 0
	    undyne.frame= 0
	    snd_play(106/* snd_noise */)
	    obj_bonedrawer.drawerdown= 1
	    con= 9.2
	    $Alarm4.start((18) / 30.0)
	}
	if(con == 10.2) {
	    obj_bonedrawer.frame= 1
	    con= 9.3
	    $Alarm4.start((40) / 30.0)
	}
	if(con == 10.3) {
	    con= 9.4
	    snd_play(106/* snd_noise */)
	    obj_bonedrawer.drawerdown= 3
	    $Alarm4.start((25) / 30.0)
	}
	if(con == 10.4) {
	    undyne.sprite_index= undyne.dsprite
	    undyne.velocity.y= 3
	    undyne.image_speed= 0.25
	    $Alarm4.start((15) / 30.0)
	    con= 9.5
	}
	if(con == 10.5) {
	    undyne.sprite_index= undyne.dtsprite
	    undyne.fun= 0
	    undyne.image_speed= 0
	    undyne.velocity.y= 0
	    GS.typer= 37
	    GS.msg[0]= "* So are we ready&  to start?/%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 12
	}
	if(con == 12 and not instance_exists(782/* OBJ_WRITER */)) {
	    papyrus.sprite_index= papyrus.rtsprite
	    GS.typer= 19
	    GS.facechoice= 4
	    GS.faceemotion= 3
	    GS.msg[0]= "WHOOPSY DOOPSY^1!&I JUST REMEMBERED!/"
	    GS.msg[1]= "I HAVE TO GO&TO THE BATHROOM!!/"
	    GS.msg[2]= "\\E0YOU TWO HAVE&FUN!!!/%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 13
	    with(papyrus)
	        scr_getideal(obj_undynewindow.x + 63, obj_undynewindow.y + 10)
	}
	if(con == 13 and not instance_exists(782/* OBJ_WRITER */)) {
	    $Alarm4.start((10) / 30.0)
	    con= 14
	}
	if(con == 14) {
	    papyrus.sprite_index= papyrus.lsprite
	    papyrus.image_speed= 0.5
	    with(papyrus) scr_moveideal(14)
	}
	if(con == 15) {
	    GS.facing= 3
	    undyne.sprite_index= undyne.ltsprite
	    papyrus2= instance_create(papyrus.x + 10, papyrus.y + 42, 1071/* obj_papyrus_window */)
	    with(papyrus) instance_destroy()
	    papyrus= papyrus2
	    con= 16
	    $Alarm4.start((90) / 30.0)
	}
	if(con == 17) {
	    GS.facing= 2
	    undyne.sprite_index= undyne.dtsprite
	    con= 18
	    $Alarm4.start((60) / 30.0)
	}
	if(con == 19) {
	    GS.msc= 703
	    GS.typer= 37
	    GS.facechoice= 5
	    con= 20
	    instance_create(0, 0, 779/* obj_dialoguer */)
	}
	if(con == 40 and not instance_exists(782/* OBJ_WRITER */)) {
	    with(papyrus) instance_destroy()
	    papyrus= instance_create(-30, 150, 1032/* obj_papyrus_actor */)
	    papyrus.z_index= 900000
	    papyrus.d= 1
	    papyrus.sprite_index= papyrus.rsprite
	    papyrus.velocity.x= 4
	    con= 41
	    papyrus.image_speed= 0.25
	}
	if(con == 41 and papyrus.x > 10) {
	    papyrus.velocity.x= 0
	    papyrus.image_speed= 0
	    con= 42
	    $Alarm4.start((20) / 30.0)
	}
	if(con == 43) {
	    GS.facing= 3
	    undyne.sprite_index= undyne.ltsprite
	    GS.facechoice= 4
	    GS.faceemotion= 1
	    GS.msc= 0
	    GS.typer= 19
	    GS.msg[0]= "DANG^1!&WHAT A SHAME.../"
	    GS.msg[1]= "\\E2I THOUGHT UNDYNE&COULD BE FRIENDS&WITH YOU./"
	    GS.msg[2]= "\\E3BUT I GUESS.../"
	    GS.msg[3]= "\\E3I OVERESTIMATED&HER./"
	    GS.msg[4]= "\\E3SHE\'S JUST NOT&UP TO THE&CHALLENGE./%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 44
	}
	if(con == 44 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 45
	    papyrus.velocity.x= -2
	    GS.typer= 37
	    GS.facechoice= 5
	    GS.faceemotion= 1
	    GS.msg[0]= "* CHALLENGE!^1?&* What!?/"
	    GS.msg[1]= "\\E0* Papyrus^1!&* Wait a second...!/%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	}
	if(con == 45) papyrus.rotation_degrees-= 6
	if(con == 45 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.faceemotion= 1
	    GS.facing= 2
	    undyne.sprite_index= undyne.dtsprite
	    GS.msg[0]= "* Darnit!/"
	    GS.msg[1]= "* He thinks I can\'t&  be friends with&  YOU!?/"
	    GS.msg[2]= "\\E6* Fuhuhu^1!&* What a joke!/"
	    GS.msg[3]= "* I could make friends&  with a wimpy loser&  like you any day!/"
	    GS.msg[4]= "\\E2* I\'ll show him!/"
	    GS.msg[5]= "\\E3* Listen up^1, human./"
	    GS.msg[6]= "\\E2* We\'re not just&  going to be&  friends./"
	    GS.msg[7]= "\\E3* We\'re going to&  be.../"
	    GS.msg[8]= "\\M1* BESTIES./"
	    GS.msg[9]= "* I\'ll make you&  like me so much.../"
	    GS.msg[10]= "\\E1* You won\'t be able&  to think of anyone&  else!!!/"
	    GS.msg[11]= "\\E3* Fuhuhuhu^1!&* It\'s the PERFECT&  REVENGE!!/"
	    GS.msg[12]= "* .../"
	    GS.msg[13]= "\\E9* Why don\'t you&  have a seat?/%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 50
	}
	if(con == 50 and not instance_exists(782/* OBJ_WRITER */)) {
	    undyne2= instance_create(undyne.x, undyne.y, 1358/* obj_npc_room */)
	    undyne2.sprite_index= 1408/* spr_undyne_polite */
	    with(undyne) instance_destroy()
	    undyne= undyne2
	    GS.flag[20]= 0
	    GS.interact= 0
	    with(papyrus) instance_destroy()
	    con= 51
	    GS.currentsong= caster_load("music/date.ogg")
	    caster_loop(GS.currentsong, 1, 1)
	}
	if(con == 51 and obj_mainchara.y > 200 and GS.interact == 0) {
	    GS.facing= 2
	    GS.msc= 0
	    obj_mainchara.y= 196
	    GS.interact= 1
	    GS.typer= 37
	    GS.facechoice= 5
	    GS.faceemotion= 9
	    GS.msg[0]= "* Oh^1, leaving so soon?/"
	    GS.msg[1]= "\\E3* No^1.&* No you\'re not./%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 52
	}
	if(con == 52) {
	    GS.facing= 2
	    obj_mainchara.y= 196
	}
	if(con == 52 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 51
	    GS.interact= 0
	}
	if(con == 60 and not instance_exists(782/* OBJ_WRITER */) and GS.interact == 0) {
	    GS.interact= 1
	    chair= scr_marker(obj_sign_room.x, obj_sign_room.y, obj_sign_room.sprite_index)
	    chair.z_index= 500000
	    // obj_sign_room
	    with(1352) instance_destroy()
	    con= 61
	    $Alarm4.start((12) / 30.0)
	    GS.facing= 2
	    obj_mainchara.chair= chair
	    GS.phasing= 1
	    // obj_mainchara
	    with(1570) scr_getideal(chair.x, chair.y - 20)
	    obj_mainchara.image_speed= 0.25
	}
	if(con == 61) {
	    // obj_mainchara
	    with(1570) scr_moveideal(12)
	}
	if(con == 62) {
	    obj_mainchara.image_speed= 0
	    con= 63
	    $Alarm4.start((20) / 30.0)
	}
	if(con == 64) {
	    GS.msc= 0
	    GS.interact= 1
	    GS.typer= 37
	    GS.facechoice= 5
	    GS.faceemotion= 9
	    GS.msg[0]= "* Comfortable?/"
	    GS.msg[1]= "* I\'ll get you&  something to drink./%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 65
	}
	if(con == 65 and not instance_exists(782/* OBJ_WRITER */)) {
	    undyne2= instance_create(undyne.x, undyne.y, 1061/* obj_undyne_actor */)
	    with(undyne) instance_destroy()
	    undyne= undyne2
	    undyne.velocity.y= -3
	    undyne.npcdir= 1
	    con= 66
	    $Alarm4.start((13) / 30.0)
	}
	if(con == 67) {
	    undyne.velocity.y= 0
	    undyne.velocity.x= 3
	    con= 68
	    $Alarm4.start((37) / 30.0)
	}
	if(con == 69) {
	    undyne.velocity.x= 0
	    undyne.npcdir= 0
	    undyne.image_speed= 0
	    undyne.frame= 0
	    undyne.sprite_index= undyne.usprite
	    con= 70
	    $Alarm4.start((30) / 30.0)
	    again= 0
	}
	if(con == 71) {
	    undyne.npcdir= 1
	    undyne.velocity.x= -3
	    $Alarm4.start((11) / 30.0)
	    con= 72
	}
	if(con == 73) {
	    with(undyne) scr_npc_halt("u")
	    g= scr_marker(undyne.x, undyne.y, 1286)
	    g.z_index= 500000
	    if(again == 0) {
	        g.sprite_index= 1514/* spr_teaboxes */
	        teabox= g
	    }
	    if(again == 1) {
	        g.sprite_index= 1503/* spr_hotchocolate */
	        hotchocolate= g
	    }
	    if(again == 2) {
	        g.sprite_index= 1504/* spr_soda */
	        soda= g
	    }
	    if(again == 3) {
	        g.sprite_index= 1515/* spr_sugarholder */
	        sugar= g
	    }
	    con= 74
	    $Alarm4.start((20) / 30.0)
	}
	if(con == 75) {
	    if(again < 3) con= 71
	    else  con= 76
	    again++
	}
	if(con == 76) {
	    undyne.npcdir= 1
	    undyne.velocity.x= -3
	    con= 77
	    $Alarm4.start((5) / 30.0)
	}
	if(con == 78) {
	    undyne.velocity.x= 0
	    undyne.velocity.y= 3
	    con= 79
	    $Alarm4.start((14) / 30.0)
	}
	if(con == 80) {
	    GS.flag[20]= 5
	    undyne.velocity.y= 0
	    with(undyne) scr_npc_halt("d")
	    GS.msg[0]= "* All set^1!&* What would you like?/%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 81
	}
	if(con == 81 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 82
	    mcxp= obj_mainchara.x
	    mcyp= obj_mainchara.y
	    GS.interact= 0
	    GS.flag[17]= 1
	}
	if(con == 82 and (obj_mainchara.x != mcxp or obj_mainchara.y != mcyp)) {
	    caster_pause(GS.currentsong)
	    GS.flag[17]= 0
	    GS.interact= 1
	    obj_mainchara.cutscene= 1
	    view_object[0]= -4
	    obj_mainchara.x= mcxp
	    obj_mainchara.y= mcyp
	    undyne.visible= 0
	    with(table) z_index= 300000
	    tspear= instance_create(undyne.x, undyne.y, 1069/* obj_undyne_throwspear */)
	    con= 83
	    $Alarm4.start((60) / 30.0)
	}
	if(con == 84) {
	    GS.interact= 1
	    GS.facing= 2
	    with(tspear) instance_destroy()
	    undyne.visible= 1
	    undyne.npcdir= 0
	    undyne.sprite_index= 1502/* spr_undyne_throwtalk */
	    GS.faceemotion= 1
	    GS.facechoice= 5
	    GS.flag[390]= 1
	    GS.msg[0]= "* HEY!!^1!&* DON\'T GET UP!!!/"
	    GS.msg[1]= "* YOU\'RE THE GUEST!^1!&* SIT DOWN AND ENJOY&  YOURSELF!!!/"
	    GS.msg[2]= "* .../%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 84.1
	}
	if(con == 84.1 and not instance_exists(782/* OBJ_WRITER */)) {
	    caster_resume(GS.currentsong)
	    GS.msg[0]= "\\E9* Um^1, why not just&  point to what you&  want?/"
	    GS.msg[1]= "* You can use the&  spear!/%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 85
	}
	if(con == 85 and not instance_exists(782/* OBJ_WRITER */)) {
	    obj_undynespear_anim1.part= 1
	    con= 86
	}
	if(con == 88 and not instance_exists(782/* OBJ_WRITER */)) {
	    instance_create(0, 0, 92/* obj_musfadeout */)
	    con= 88.1
	    $Alarm4.start((15) / 30.0)
	}
	if(con == 89.1) {
	    GS.flag[20]= 0
	    undyne.sprite_index= undyne.dtsprite
	    GS.msg[0]= "\\E4* Y\'know^1, I was a&  pretty hotheaded&  kid./"
	    GS.msg[1]= "* Once^1, to prove I was&  the strongest^1, I tried&  to fight ASGORE./"
	    GS.msg[2]= "\\E1* Emphasis on TRIED./"
	    GS.msg[3]= "\\E0* I couldn\'t land&  a single blow&  on him!/"
	    GS.msg[4]= "\\E4* And worse^1, the whole&  time^1, he refused&  to fight back!/"
	    GS.msg[5]= "\\E7* I was so&  humiliated.../"
	    GS.msg[6]= "\\E0* Afterwards^1, he&  apologized and said&  something goofy.../"
	    GS.msg[7]= "* " + chr(ord('"')) + "Excuse me^1, do you&  want to know how&  to beat me?" + chr(ord('"')) + "/"
	    GS.msg[8]= "\\E0* I said yes^1, and&  from then on^1, he&  trained me./"
	    GS.msg[9]= "\\E4* One day^1, during&  practice^1, I finally&  knocked him down./"
	    GS.msg[10]= "\\E7* I felt..^1. bad./"
	    GS.msg[11]= "\\E9* But he was&  beaming.../"
	    GS.msg[12]= "\\E6* I had never seen&  someone more proud to&  get their butt kicked./"
	    GS.msg[13]= "\\E1* ... oh!/"
	    GS.msg[14]= "\\E9* I almost forgot&  about your tea!/"
	    GS.msg[15]= "* Just a moment!/%%"
	    GS.currentsong= caster_load("music/musicbox.ogg")
	    caster_loop(GS.currentsong, 0.8, 0.8)
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 90
	}
	if(con == 90 and not instance_exists(782/* OBJ_WRITER */)) {
	    undyne.d= 1
	    undyne.z_index= table.z_index + 1
	    GS.faceemotion= 0
	    undyne.sprite_index= undyne.rsprite
	    undyne.frame= 0.25
	    undyne.velocity.x= 3
	    undyne.npcdir= 1
	    con= 91
	    $Alarm4.start((20) / 30.0)
	}
	if(con == 92) {
	    instance_create(0, 0, 92/* obj_musfadeout */)
	    with(undyne) scr_npc_halt("r")
	    con= 93
	    $Alarm4.start((60) / 30.0)
	}
	if(con == 94) {
	    undyne.d= 0
	    with(undyne) scr_npc_halt("d")
	    with(undyne) npcdir= 1
	    GS.faceemotion= 1
	    GS.msc= 0
	    GS.facechoice= 5
	    GS.typer= 37
	    GS.msg[0]= "* Wait a second./"
	    GS.msg[1]= "* Papyrus..^1.&* His cooking lesson.../"
	    GS.msg[2]= "\\M2* HE WAS SUPPOSED&  TO HAVE THAT RIGHT&  NOW!!!/"
	    GS.msg[3]= "\\E3* And if HE\'s not&  here to have it.../"
	    GS.msg[4]= "\\E2* YOU\'LL HAVE TO&  HAVE IT FOR HIM!!!/%%"
	    ggg= instance_create(0, 0, 779/* obj_dialoguer */)
	    ggg.side= 1
	    con= 95
	}
	if(con == 95 and not instance_exists(782/* OBJ_WRITER */)) {
	    // obj_musfadeout
	    with(92) instance_destroy()
	    caster_free(-3)
	    GS.flag[20]= 0
	    GS.currentsong= caster_load("music/undynetruetheme.ogg")
	    caster_loop(GS.currentsong, 0.9, 1)
	    undyne.npcdir= 0
	    undyne.fun= 1
	    undyne.frame= 0
	    undyne.image_speed= 0.5
	    undyne.sprite_index= 1403/* spr_undyne_leap */
	    con= 96
	}
	if(con == 96) {
	    if(undyne.frame >= 3) undyne.velocity.y= -10
	    if(undyne.frame >= 4) {
	        undyne.image_speed= 0
	        con= 97
	        $Alarm4.start((30) / 30.0)
	    }
	}
	if(con == 98) {
	    undyne.x= 80
	    undyne.velocity.y= 10
	    con= 99
	}
	if(con == 99) {
	    if(undyne.y >= 5) {
	        undyne.frame= 0
	        undyne.y= 10
	        undyne.velocity.y= 0
	        snd_play(21/* snd_impact */)
	        scr_shake(4, 4, 1)
	        undyne.velocity.y= 0
	        teabox2= instance_create(teabox.x, teabox.y, 1072/* obj_foodbreak */)
	        teabox2.sprite_index= 1514/* spr_teaboxes */
	        teabox2.breaksprite= 1477
	        teabox2.myh= 1
	        teabox2.mya= 4
	        with(teabox) instance_destroy()
	        sugar2= instance_create(sugar.x, sugar.y, 1072/* obj_foodbreak */)
	        sugar2.sprite_index= 1515/* spr_sugarholder */
	        sugar2.breaksprite= 1478
	        sugar2.myh= 3
	        with(sugar) instance_destroy()
	        soda2= instance_create(soda.x, soda.y, 1072/* obj_foodbreak */)
	        soda2.sprite_index= 1504/* spr_soda */
	        soda2.breaksprite= 1479
	        soda2.mya= -4
	        soda2.myh= -1
	        soda2.myv= -2
	        with(soda) instance_destroy()
	        hotchocolate2= instance_create(hotchocolate.x, hotchocolate.y, 1072/* obj_foodbreak */)
	        hotchocolate2.sprite_index= 1503/* spr_hotchocolate */
	        hotchocolate2.breaksprite= 1503
	        hotchocolate2.myh= -1
	        hotchocolate2.mya= 3
	        with(hotchocolate) instance_destroy()
	    }
	    if(undyne.frame == 0) {
	        undyne.image_speed= 0
	        con= 100
	        $Alarm4.start((40) / 30.0)
	    }
	}
	if(con == 101) {
	    undyne.sprite_index= 1402/* spr_undyne_kick */
	    undyne.image_speed= 0.25
	    undyne.velocity.x= 5
	    con= 102
	}
	if(con == 102) {
	    if(undyne.x > 180) undyne.velocity.x-= 0.5
	    if(undyne.velocity.x == 0) con= 103
	}
	if(con == 103) {
	    with(undyne) scr_npc_halt("d")
	    GS.faceemotion= 0
	    GS.msg[0]= "* That\'s right!!!/"
	    GS.msg[1]= "\\E1* NOTHING has brought&  Papyrus and I&  closer than cooking!/"
	    GS.msg[2]= "\\E3* Which means that if&  I give you his&  lesson.../"
	    GS.msg[3]= "\\E2* WE\'LL BECOME CLOSER&  THAN YOU CAN&  EVER IMAGINE!!!/"
	    GS.msg[4]= "\\E6* Fuhuhu!!^1! Afraid!^1?&* We\'re gonna be best&  friends!!!/%%"
	    de= instance_create(0, 0, 779/* obj_dialoguer */)
	    de.side= 1
	    con= 104
	}
	if(con == 104 and not instance_exists(782/* OBJ_WRITER */)) {
	    undyne.npcdir= 0
	    undyne.fun= 1
	    undyne.frame= 0
	    undyne.image_speed= 0.5
	    undyne.sprite_index= 1403/* spr_undyne_leap */
	    con= 106
	}
	if(con == 106) {
	    if(undyne.frame >= 3) undyne.velocity.y= -15
	    if(undyne.frame >= 4) {
	        undyne.image_speed= 0
	        con= 107
	        $Alarm4.start((7) / 30.0)
	    }
	}
	if(con == 108) {
	    undyne.x= obj_mainchara.x - 18
	    undyne.velocity.y= 15
	    con= 109
	}
	if(con == 109) {
	    if(undyne.y >= obj_mainchara.y - 40) {
	        undyne.frame= 0
	        undyne.y= obj_mainchara.y - 25
	        undyne.velocity.y= 0
	        snd_play(21/* snd_impact */)
	        scr_shake(4, 4, 1)
	        undyne.velocity.y= 0
	    }
	    if(undyne.frame == 0) {
	        GS.facing= 3
	        undyne.image_speed= 0
	        con= 110
	        $Alarm4.start((15) / 30.0)
	    }
	}
	if(con == 111) {
	    undyne.frame= 0
	    undyne.sprite_index= undyne.rsprite
	    con= 112
	    $Alarm4.start((2) / 30.0)
	}
	if(con == 113) {
	    obj_mainchara.visible= 0
	    undyne.sprite_index= 1500/* spr_undyne_grableap */
	    con= 114
	    $Alarm4.start((5) / 30.0)
	}
	if(con == 115) {
	    undyne.image_speed= 0.5
	    if(undyne.frame == 2) snd_play(47/* snd_grab */)
	    if(undyne.frame >= 5) {
	        undyne.image_speed= 0
	        con= 116
	        $Alarm4.start((6) / 30.0)
	    }
	}
	if(con == 117) {
	    undyne.frame= 6
	    con= 118
	    $Alarm4.start((10) / 30.0)
	}
	if(con == 119) {
	    undyne.frame= 7
	    undyne.velocity.y= -17
	    undyne.gravity= 1.2
	    con= 120
	    undyne.velocity.x= 1
	}
	if(con == 120 and undyne.velocity.y > 1 and undyne.y > 30) {
	    undyne.y= 35
	    undyne.gravity= 0
	    undyne.velocity.y= 0
	    undyne.velocity.x= 0
	    undyne.frame= 6
	    snd_play(21/* snd_impact */)
	    scr_shake(4, 4, 1)
	    con= 121
	    $Alarm4.start((15) / 30.0)
	}
	if(con == 122) {
	    undyne.image_speed= -0.5
	    if(undyne.frame == 2) {
	        GS.facing= 2
	        snd_play(106/* snd_noise */)
	        undyne.image_speed= -0.05
	    }
	    if(undyne.frame < 1) {
	        undyne.x-= 2
	        obj_mainchara.x= undyne.x + 20
	        obj_mainchara.y= undyne.y + 24
	        GS.facing= 2
	        obj_mainchara.visible= 1
	        undyne.sprite_index= undyne.usprite
	        undyne.frame= 0
	        undyne.image_speed= 0
	        con= 123
	        $Alarm4.start((10) / 30.0)
	    }
	}
	if(con == 124) {
	    undyne.sprite_index= undyne.rtsprite
	    undyne.direction= 0
	    undyne.fun= 0
	    undyne.npcdir= 1
	    GS.facing= 3
	    GS.faceemotion= 0
	    GS.facechoice= 5
	    GS.msg[0]= "* Ready!^1?&* It\'s spaghetti time!/"
	    GS.msg[0]= "* Let\'s start with the&  sauce!!/%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 125
	}
	if(con == 125 and not instance_exists(782/* OBJ_WRITER */)) {
	    undyne.velocity.x= -2
	    con= 126
	    $Alarm4.start((5) / 30.0)
	}
	if(con == 127) {
	    with(undyne) scr_npc_halt("d")
	    with(undyne) fun= 1
	    undyne.sprite_index= 1496/* spr_undyne_stomp */
	    undyne.image_speed= 0.5
	    con= 128
	}
	if(con == 128) {
	    if(undyne.frame == 11) {
	        snd_play(21/* snd_impact */)
	        scr_shake(3, 3, 1)
	    }
	    if(undyne.frame >= 12) {
	        undyne.image_speed= 0
	        veg= scr_marker(195, -20, 1499)
	        veg.z_index= 500000
	        veg.velocity.y= 6
	        con= 129
	    }
	}
	if(con == 129 and veg.y >= 41) {
	    snd_play(106/* snd_noise */)
	    veg.y= 47
	    veg.velocity.y= 0
	    with(undyne) scr_npc_halt("r")
	    undyne.sprite_index= undyne.rtsprite
	    undyne.npcdir= 1
	    undyne.fun= 0
	    con= 130
	    $Alarm4.start((15) / 30.0)
	}
	if(con == 131) {
	    undyne.npcdir= 0
	    GS.facing= 2
	    undyne.sprite_index= undyne.rtsprite
	    GS.faceemotion= 0
	    GS.msc= 710
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 132
	}
	if(con == 140) {
	    veg.frame= 1
	    con= 141
	}
	if(con == 141 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.facing= 2
	    undyne.sprite_index= undyne.utsprite
	    GS.flag[20]= 0
	    con= 142
	    $Alarm4.start((6) / 30.0)
	}
	if(con == 143) {
	    undyne.npcdir= 0
	    undyne.fun= 1
	    undyne.sprite_index= 1498/* spr_undyne_uppercut */
	    undyne.image_speed= 0.334
	    con= 144
	}
	if(con == 144 and undyne.frame >= 7) con= 147
	if(con == 148) {
	    veg.frame= 2
	    con= 149
	    $Alarm4.start((70) / 30.0)
	}
	if(con == 147) {
	    scr_shake(2, 2, 1)
	    instance_create(0, 0, 118/* obj_flasher */)
	    snd_play(14/* snd_spearrise */)
	    con= 148
	}
	if(con == 149 and undyne.frame >= 8)
	    undyne.image_speed= 0
	if(con == 150) {
	    undyne.sprite_index= 1418/* spr_undyne_rt_tomato */
	    obj_mainchara.lsprite= 1032
	    GS.faceemotion= 9
	    GS.facing= 3
	    GS.msc= 0
	    GS.flag[390]= 2
	    GS.msg[0]= "* Uhh^1, we\'ll just scrape&  this into a bowl&  later./"
	    GS.msg[1]= "\\E1* But for NOW!/%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 151
	}
	if(con == 151 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.flag[390]= 0
	    with(undyne) scr_npc_halt("d")
	    with(undyne) fun= 1
	    undyne.frame= 0
	    undyne.sprite_index= 1497/* spr_undyne_stomp_tomato */
	    undyne.image_speed= 0.5
	    con= 152
	}
	if(con == 152) {
	    if(undyne.frame == 11) {
	        snd_play(21/* snd_impact */)
	        scr_shake(3, 3, 1)
	    }
	    if(undyne.frame >= 12) {
	        undyne.image_speed= 0
	        pot= scr_marker(140, -20, 1492)
	        pot.velocity.y= 6
	        pot.z_index= 500000
	        box= scr_marker(160, -20, 1491)
	        box.velocity.y= 6
	        box.z_index= 500000
	        con= 154
	    }
	}
	if(con == 154 and pot.y >= 38) {
	    snd_play(106/* snd_noise */)
	    pot.y= 44
	    box.y= 40
	    pot.velocity.y= 0
	    box.velocity.y= 0
	    with(undyne) scr_npc_halt("d")
	    undyne.npcdir= 1
	    undyne.fun= 0
	    con= 155
	    $Alarm4.start((10) / 30.0)
	}
	if(con == 156 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.facing= 3
	    undyne.npcdir= 1
	    undyne.velocity.x= -7
	    obj_mainchara.velocity.x= -6
	    obj_mainchara.image_speed= 0.334
	    $Alarm4.start((10) / 30.0)
	    con= 158
	}
	if(con == 159) {
	    undyne.velocity.x= 0
	    obj_mainchara.velocity.x= 0
	    obj_mainchara.image_speed= 0
	    with(undyne) scr_npc_halt("u")
	    con= 160
	    $Alarm4.start((3) / 30.0)
	}
	if(con == 161) {
	    undyne.sprite_index= undyne.utsprite
	    GS.facing= 2
	    con= 162
	    $Alarm4.start((15) / 30.0)
	}
	if(con == 163) {
	    con= 164
	    GS.msc= 712
	    instance_create(0, 0, 779/* obj_dialoguer */)
	}
	if(con == 199) {
	    with(box) visible= 0
	    con= 200
	}
	if(con == 200 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.flag[20]= 0
	    GS.msc= 0
	    GS.faceemotion= 0
	    GS.msg[0]= "* Alright^1!&* Now it\'s time&  to stir the pasta!/"
	    GS.msg[1]= "* As a general rule&  of thumb^1, the more&  you stir.../"
	    GS.msg[2]= "\\E1* THE BETTER IT IS!/"
	    GS.msg[3]= "\\E0* Ready^1?&* Let\'s do it!/%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 201
	    undyne.sprite_index= undyne.utsprite
	    GS.facing= 2
	}
	if(con == 201 and not instance_exists(782/* OBJ_WRITER */)) {
	    pp= instance_create(0, 0, 1057/* obj_potstir */)
	    pp.pot= pot
	    con= 202
	}
	if(con == 210 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 211
	    $Alarm4.start((10) / 30.0)
	}
	if(con == 212) {
	    snd_play(20/* snd_arrow */)
	    spear2= scr_marker(pot.x + 10, -35, 1449)
	    spear2.rotation_degrees= 270
	    spear2.velocity.y= 12
	    spear2.z_index= 900000
	    ssine= 0
	    con= 213
	    stab= 0
	}
	if(con == 213) {
	    ssine++
	    spear2.x= spear2.xstart + sin(ssine / 3) * 4
	    if(spear2.velocity.y > 0 and spear2.y > pot.y - 17) {
	        spear2.velocity.y= -12
	        snd_play(14/* snd_spearrise */)
	        if(not instance_exists(184/* obj_shaker */)) scr_shake(2, 2, 2)
	        stab++
	        if(stab >= 2) {
	            pot.sprite_index= 1493/* spr_spaghettipot_wrecked */
	            if(stab < 5) pot.frame= 0
	            if(stab == 5) pot.frame= 1
	            if(stab == 7) pot.frame= 2
	            if(stab == 10) pot.frame= 3
	        }
	    }
	    if(spear2.velocity.y < 0 and spear2.y < pot.y - 50) {
	        spear2.velocity.y= 15
	        snd_play(20/* snd_arrow */)
	    }
	    if(stab > 10) con= 214
	}
	if(con == 214) {
	    spear2.velocity.y= 0
	    spear2.modulate.a-= 0.05
	    if(spear2.modulate.a < 0.08) {
	        with(spear2) instance_destroy()
	        con= 215
	        $Alarm4.start((20) / 30.0)
	    }
	}
	if(con == 216) {
	    GS.facechoice= 5
	    GS.msc= 0
	    GS.faceemotion= 6
	    GS.msg[0]= "\\M0* Fuhuhuhu^1!&* That\'s the stuff!/"
	    GS.msg[1]= "\\E0* Alright^1, now for&  the final step:/"
	    GS.msg[2]= "\\E1* TURN UP THE HEAT!/"
	    GS.msg[3]= "\\E0* Let the stovetop&  symbolize your&  passion!/"
	    GS.msg[4]= "\\E1* Let your hopes and&  dreams turn into&  burning fire!/"
	    GS.msg[5]= "\\E2* READY^1?&* Don\'t hold anything&  back!!!/%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 217
	}
	if(con == 217 and not instance_exists(782/* OBJ_WRITER */)) {
	    ph= instance_create(0, 0, 1060/* obj_potheat */)
	    pot2= instance_create(pot.x, pot.y + 3, 1059/* obj_spaghot */)
	    with(pot) instance_destroy()
	    pot= pot2
	    ph.pot= pot
	    con= 218
	}
	if(con == 250 and not instance_exists(782/* OBJ_WRITER */)) {
	    caster_free(-3)
	    snd_play(44/* snd_laz */)
	    wht= instance_create(0, 0, 113/* obj_whitesploder */)
	    con= 251
	    $Alarm4.start((40) / 30.0)
	}
	if(con == 252) {
	    blk= instance_create(view_xview[0] - 2, -2, 1363/* obj_npc_marker */)
	    blk.z_index= wht.z_index - 2
	    blk.modulate.a= 0
	    blk.visible= 1
	    blk.image_speed= 0
	    blk.sprite_index= 996/* spr_pixblk */
	    blk.scale.x= 200
	    blk.scale.y= 200
	    con= 253
	}
	if(con == 253) {
	    blk.modulate.a+= 0.02
	    if(blk.modulate.a >= 1) {
	        con= 254
	        $Alarm4.start((60) / 30.0)
	    }
	}
	if(con == 255) {
	    GS.currentsong= caster_load("music/deeploop2.ogg")
	    caster_loop(GS.currentsong, 0, 1)
	    vol= 0
	    potb= scr_marker(pot.x, pot.y + 2, 1494)
	    potb.image_speed= 0.5
	    potb.z_index= 300000
	    with(pot) instance_destroy()
	    background_blend[0]= 128
	    f= scr_marker(60, 140, 1138)
	    f.image_speed= 0.6
	    f.z_index= 400000
	    f= scr_marker(80, 40, 1138)
	    f.image_speed= 0.5
	    f.z_index= 400000
	    f= scr_marker(200, 40, 1138)
	    f.image_speed= 0.4
	    f.z_index= 400000
	    f= scr_marker(220, 100, 1138)
	    f.image_speed= 0.6
	    f.z_index= 400000
	    f= scr_marker(180, 160, 1138)
	    f.image_speed= 0.7
	    f.z_index= 400000
	    table.image_blend= 128
	    piano.image_blend= 128
	    sword.image_blend= 128
	    obj_foodbreak.image_blend= 128
	    if(instance_exists(1062/* obj_controlspear */))
	        obj_controlspear.image_blend= 128
	    obj_undynewindow.image_blend= 128
	    obj_undynewindow_foreground.image_blend= 128
	    obj_glassshard.image_blend= 128
	    obj_bonedrawer.image_blend= 128
	    with(wht) instance_destroy()
	    con= 256
	}
	if(con == 256) {
	    vol+= 0.02
	    caster_set_volume(GS.currentsong, vol)
	    blk.modulate.a-= 0.02
	    if(blk.modulate.a < 0.03) {
	        with(blk) instance_destroy()
	        con= 257
	    }
	}
	if(con == 257) {
	    con= 258
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 259) {
	    obj_mainchara.lsprite= 1033
	    undyne.sprite_index= 1419/* spr_undyne_rt_burnt */
	    GS.facing= 3
	    GS.facechoice= 5
	    GS.msc= 0
	    GS.faceemotion= 9
	    GS.msg[0]= "* Ah./"
	    GS.msg[1]= "* Man^1, no wonder&  Papyrus sucks at&  cooking./%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 260
	}
	if(con == 260 and not instance_exists(782/* OBJ_WRITER */)) {
	    undyne.sprite_index= undyne.utsprite
	    GS.facing= 2
	    con= 261
	    $Alarm4.start((120) / 30.0)
	}
	if(con == 262) {
	    undyne.sprite_index= 1419/* spr_undyne_rt_burnt */
	    GS.facing= 3
	    GS.facechoice= 5
	    GS.msc= 0
	    GS.faceemotion= 9
	    GS.msg[0]= "* So what\'s next^1?&* Scrapbooking^1?&* Friendship bracelets?/"
	    GS.msg[1]= "* .../%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 263
	}
	if(con == 263 and not instance_exists(782/* OBJ_WRITER */)) {
	    undyne.sprite_index= 1413/* spr_undyne_ut */
	    GS.faceemotion= 7
	    GS.msg[0]= "* ... oh^1, who am I&  kidding./"
	    GS.msg[1]= "* I really screwed this&  up^1, didn\'t I?/"
	    GS.msg[2]= "\\E4* I can\'t force you to&  like me^1, human./"
	    GS.msg[3]= "\\E4* Some people just&  don\'t get along&  with each other./"
	    GS.msg[4]= "\\E7* I understand if&  you feel that&  way about me./"
	    GS.msg[5]= "\\E4* And if we can\'t&  be friends.../"
	    GS.msg[6]= "\\E7* That\'s okay./"
	    GS.msg[7]= "\\E7* Because..^1.&* If we\'re not&  friends.../%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 264
	}
	if(con == 264 and not instance_exists(782/* OBJ_WRITER */)) {
	    caster_free(-3)
	    GS.msg[0]= "\\E2*\\M2 IT MEANS I CAN&  DESTROY YOU WITHOUT&  REGRET!/%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 265
	}
	if(con == 265 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.mercy= 1
	    GS.battlegroup= 58
	    instance_create(0, 0, 142/* obj_battler */)
	    con= 266
	}
	if(con == 266 and not instance_exists(142/* obj_battler */)) {
	    con= 267
	    room_persistent= 0
	    $Alarm4.start((2) / 30.0)
	}
	if(con == 268) {
	    room_persistent= 0
	    GS.phasing= 0
	    GS.flag[17]= 0
	    GS.mercy= 0
	    snd_play(28/* snd_bell */)
	    get_tree().change_scene_to_file("res://godot_rooms/117.tscn")
	}
	if(con == 300 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.faceemotion= 0
	    instance_create(0, 0, 92/* obj_musfadeout */)
	    con= 301
	    $Alarm4.start((15) / 30.0)
	}
	if(con == 302) {
	    undyne.npcdir= 1
	    undyne.velocity.x= 0
	    undyne.fun= 0
	    undyne.velocity.y= -3
	    $Alarm4.start((17) / 30.0)
	    con= 303
	}
	if(con == 304) {
	    undyne.velocity.x= 3
	    undyne.velocity.y= 0
	    con= 305
	    $Alarm4.start((32) / 30.0)
	}
	if(con == 306) {
	    with(undyne) scr_npc_halt("u")
	    con= 307
	    $Alarm4.start((20) / 30.0)
	}
	if(con == 308) {
	    undyne.npcdir= 1
	    undyne.velocity.x= -3
	    undyne.fun= 0
	    undyne.velocity.y= 0
	    $Alarm4.start((32) / 30.0)
	    con= 309
	}
	if(con == 310) {
	    with(undyne) scr_npc_halt("u")
	    con= 311
	    $Alarm4.start((20) / 30.0)
	}
	if(con == 312) {
	    snd_play(22/* snd_splash */)
	    con= 313
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 314) {
	    snd_play(106/* snd_noise */)
	    con= 315
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 316) {
	    undyne.npcdir= 1
	    undyne.fun= 0
	    undyne.velocity.x= 3
	    undyne.velocity.y= 0
	    con= 317
	    $Alarm4.start((14) / 30.0)
	}
	if(con == 318) {
	    with(undyne) scr_npc_halt("u")
	    con= 319
	    $Alarm4.start((15) / 30.0)
	}
	if(con == 320) {
	    con= 321
	    snd_play(106/* snd_noise */)
	    teapot= scr_marker(167, 49, 1483)
	    teapot.image_speed= 0
	    with(teapot) z_index= obj_undyne_actor.z_index + 1
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 322) {
	    snd_play(106/* snd_noise */)
	    con= 323
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 324) {
	    con= 325
	    with(undyne) scr_npc_halt("d")
	    GS.faceemotion= 9
	    $Alarm4.start((20) / 30.0)
	}
	if(con == 326) {
	    GS.typer= 37
	    GS.facechoice= 5
	    GS.faceemotion= 9
	    GS.msc= 0
	    GS.msg[0]= "* It\'ll take a moment&  for the water to&  boil./%%"
	    con= 327
	    dg= instance_create(0, 0, 779/* obj_dialoguer */)
	    dg.side= 1
	}
	if(con == 327 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.faceemotion= 0
	    with(undyne) scr_npc_halt("u")
	    con= 328
	    $Alarm4.start((180) / 30.0)
	}
	if(con == 329) {
	    teapot.image_speed= 1
	    snd_play(48/* snd_slidewhist */)
	    con= 330
	    $Alarm4.start((60) / 30.0)
	}
	if(con == 331) {
	    with(undyne) scr_npc_halt("d")
	    GS.typer= 37
	    GS.facechoice= 5
	    GS.faceemotion= 9
	    GS.msc= 0
	    GS.msg[0]= "* Okay^1, it\'s all&  done!/%%"
	    con= 332
	    dg= instance_create(0, 0, 779/* obj_dialoguer */)
	    dg.side= 1
	}
	if(con == 332 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.faceemotion= 0
	    undyne.npcdir= 1
	    undyne.fun= 0
	    undyne.velocity.x= -3
	    undyne.velocity.y= 0
	    con= 334
	    $Alarm4.start((14) / 30.0)
	}
	if(con == 335) {
	    with(undyne) scr_npc_halt("u")
	    con= 337
	    $Alarm4.start((20) / 30.0)
	}
	if(con == 338) {
	    teacup.visible= 0
	    undyne.npcdir= 1
	    undyne.fun= 0
	    undyne.velocity.x= 3
	    undyne.velocity.y= 0
	    con= 339
	    $Alarm4.start((17) / 30.0)
	}
	if(con == 340) {
	    with(undyne) scr_npc_halt("u")
	    con= 341
	    $Alarm4.start((20) / 30.0)
	}
	if(con == 342) {
	    teapot.frame= 0
	    teapot.image_speed= 0
	    snd_play(22/* snd_splash */)
	    con= 343
	    $Alarm4.start((50) / 30.0)
	}
	if(con == 344) {
	    undyne.npcdir= 1
	    undyne.fun= 0
	    undyne.velocity.x= 0
	    undyne.velocity.y= 3
	    con= 345
	    $Alarm4.start((28) / 30.0)
	}
	if(con == 346) {
	    undyne.npcdir= 1
	    undyne.fun= 0
	    undyne.velocity.x= 3
	    undyne.velocity.y= 0
	    con= 347
	    $Alarm4.start((10) / 30.0)
	}
	if(con == 348) {
	    with(undyne) scr_npc_halt("u")
	    con= 349
	    $Alarm4.start((20) / 30.0)
	}
	if(con == 350) {
	    teacup.x= obj_mainchara.x - 6
	    teacup.y= obj_mainchara.y + 5
	    teacup.visible= 1
	    teacup.z_index= undyne.z_index + 10
	    snd_play(106/* snd_noise */)
	    con= 351
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 352) {
	    with(undyne) scr_npc_halt("r")
	    undyne.sprite_index= 1417/* spr_undyne_rt */
	    GS.typer= 37
	    GS.facechoice= 5
	    GS.faceemotion= 0
	    GS.msc= 0
	    GS.msg[0]= "* Here we are./%%"
	    con= 352.5
	    instance_create(0, 0, 779/* obj_dialoguer */)
	}
	if(con == 352.5 and not instance_exists(782/* OBJ_WRITER */)) {
	    undyne.npcdir= 1
	    undyne.fun= 0
	    undyne.velocity.x= -3
	    undyne.velocity.y= 0
	    con= 353
	    $Alarm4.start((10) / 30.0)
	}
	if(con == 354) {
	    undyne.npcdir= 1
	    undyne.fun= 0
	    undyne.velocity.x= 0
	    undyne.velocity.y= -3
	    con= 355
	    $Alarm4.start((16) / 30.0)
	}
	if(con == 356) {
	    undyne.npcdir= 1
	    undyne.fun= 0
	    undyne.velocity.x= 3
	    undyne.velocity.y= 0
	    con= 357
	    $Alarm4.start((12) / 30.0)
	    undyne.d= 1
	    undyne.z_index= table.z_index + 1
	}
	if(con == 358) {
	    with(undyne) scr_npc_halt("d")
	    con= 359
	    $Alarm4.start((20) / 30.0)
	}
	if(con == 360) {
	    undyne.sprite_index= 1406/* spr_undyne_d_sit */
	    undyne.y+= 15
	    con= 361
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 362) {
	    GS.flag[20]= 0
	    GS.typer= 37
	    GS.facechoice= 5
	    GS.faceemotion= 9
	    GS.msc= 0
	    GS.msg[0]= "* Careful^1, it\'s hot./%%"
	    con= 363
	    instance_create(0, 0, 779/* obj_dialoguer */)
	}
	if(con == 363 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 364
	    $Alarm4.start((90) / 30.0)
	}
	if(con == 365) {
	    GS.typer= 37
	    GS.facechoice= 5
	    GS.faceemotion= 1
	    GS.msc= 0
	    GS.msg[0]= "* It\'s not THAT hot!^1!&* Just drink it already!/"
	    GS.msg[1]= "\\TS \\F0 \\T0 %"
	    GS.msg[2]= "* (You take a sip of the&  tea.^1)&* (It\'s burning...)/"
	    GS.msg[3]= "* (But other than that^1,&  it\'s pretty good.)/"
	    scr_undface(4, 9)
	    GS.msg[5]= "* It\'s pretty good^1,&  right?/"
	    GS.msg[6]= "\\E6* Nothing but the best&  for my ABSOLUTELY&  PRECIOUS FRIEND!!/%%"
	    con= 366
	    instance_create(0, 0, 779/* obj_dialoguer */)
	}
	if(con == 366 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 366.1
	    $Alarm4.start((80) / 30.0)
	}
	if(con == 367.1) {
	    GS.typer= 37
	    GS.facechoice= 5
	    GS.faceemotion= 1
	    GS.msc= 0
	    GS.msg[0]= "\\E9* Hey.../"
	    GS.msg[1]= "\\E9* You know...&* It\'s kind of strange&  you chose THAT tea./"
	    GS.msg[2]= "\\E4* Golden flower tea.../"
	    GS.msg[3]= "\\E0* That\'s ASGORE\'s&  favorite kind./"
	    GS.msg[4]= "\\E4* Actually^1, now that&  I think about it.../"
	    GS.msg[5]= "\\E9* You kind of remind&  me of him./"
	    GS.msg[6]= "\\E6* You\'re both TOTAL&  weenies!!!/"
	    GS.msg[7]= "\\E7* ... sort of./%%"
	    con= 367
	    instance_create(0, 0, 779/* obj_dialoguer */)
	}
	if(con == 367 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 368
	    $Alarm4.start((60) / 30.0)
	}
	if(con == 369 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.flag[20]= 0
	    GS.msg[0]= "\\E4* Y\'know^1, I was a&  pretty hotheaded&  kid./"
	    GS.msg[1]= "* Once^1, to prove I was&  the strongest^1, I tried&  to fight ASGORE./"
	    GS.msg[2]= "\\E1* Emphasis on TRIED./"
	    GS.msg[3]= "\\E0* I couldn\'t land&  a single blow&  on him!/"
	    GS.msg[4]= "\\E4* And worse^1, the whole&  time^1, he refused&  to fight back!/"
	    GS.msg[5]= "\\E7* I was so&  humiliated.../"
	    GS.msg[6]= "\\E0* Afterwards^1, he&  apologized and said&  something goofy.../"
	    GS.msg[7]= "* " + chr(ord('"')) + "Excuse me^1, do you&  want to know how&  to beat me?" + chr(ord('"')) + "/"
	    GS.msg[8]= "\\E0* I said yes^1, and&  from then on^1, he&  trained me./"
	    GS.msg[9]= "\\E4* One day^1, during&  practice^1, I finally&  knocked him down./"
	    GS.msg[10]= "\\E7* I felt..^1. bad./"
	    GS.msg[11]= "\\E9* But he was&  beaming.../"
	    GS.msg[12]= "\\E6* I had never seen&  someone more proud to&  get their butt kicked./"
	    GS.msg[13]= "\\E4* Anyway^1, long story&  short^1, he kept training&  me.../"
	    GS.msg[14]= "\\E0* And now I\'m the&  head of the Royal&  Guard!/"
	    GS.msg[15]= "\\E6* So I\'m the one&  who gets to train&  dorks to fight!/"
	    GS.msg[16]= "\\E9* ... like^1, uh^1, Papyrus./%%"
	    GS.currentsong= caster_load("music/musicbox.ogg")
	    caster_loop(GS.currentsong, 0.8, 0.8)
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 370
	}
	if(con == 370 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 371
	    $Alarm4.start((70) / 30.0)
	}
	if(con == 372) {
	    GS.typer= 37
	    GS.facechoice= 5
	    GS.faceemotion= 1
	    GS.msc= 0
	    GS.msg[0]= "\\E4* But^1, um^1, to be&  honest.../"
	    GS.msg[1]= "\\E9*... I don\'t know if.../"
	    GS.msg[2]= "\\E7* I can ever let&  Papyrus into the&  Royal Guard./"
	    GS.msg[3]= "\\E1* Don\'t tell him I&  said that!/"
	    GS.msg[4]= "\\E4* He\'s just..^1.&* Well.../"
	    GS.msg[5]= "\\E9* I mean^1, it\'s not&  that he\'s weak./"
	    GS.msg[6]= "\\E1* He\'s actually&  pretty freaking&  tough!/"
	    GS.msg[7]= "\\E7* It\'s just that..^1.&* He\'s.../"
	    GS.msg[8]= "\\E1* He\'s too innocent&  and nice!!!/"
	    GS.msg[9]= "\\E7* I mean^1, look^1, he&  was SUPPOSED to&  capture you.../"
	    GS.msg[10]= "\\E5* And he ended up&  being FRIENDS with&  you instead!/"
	    GS.msg[11]= "\\E1* I could NEVER send&  him into battle!/"
	    GS.msg[12]= "\\E7* He\'d get ripped&  into little smiling&  shreds./"
	    GS.msg[13]= "\\E7* That\'s part of why.../"
	    GS.msg[14]= "\\E9* I started teaching&  him how to cook^1,&  you know?/"
	    GS.msg[15]= "\\E7* So^1, um^1, maybe he&  can do something&  else with his life./%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 373
	}
	if(con == 373 and not instance_exists(782/* OBJ_WRITER */)) {
	    instance_create(0, 0, 92/* obj_musfadeout */)
	    con= 375
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 376) {
	    bcbc= instance_create(undyne.x, undyne.y, 1337/* obj_cosmeticblcon */)
	    con= 377
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 378) {
	    with(bcbc) instance_destroy()
	    con= 379
	    $Alarm4.start((20) / 30.0)
	}
	if(con == 380) {
	    GS.msg[0]= "\\E1* Oh^1, sorry^1, I was&  talking for so&  long.../"
	    GS.msg[1]= "\\E9* You\'re out of tea^1,&  aren\'t you?/"
	    GS.msg[2]= "\\E0* I\'ll get you some&  more./%%"
	    con= 381
	    instance_create(0, 0, 779/* obj_dialoguer */)
	}
	if(con == 381 and not instance_exists(782/* OBJ_WRITER */)) {
	    undyne.y-= 15
	    undyne.npcdir= 1
	    undyne.fun= 0
	    undyne.velocity.x= -3
	    undyne.velocity.y= 0
	    con= 383
	    $Alarm4.start((17) / 30.0)
	}
	if(con == 384) {
	    with(undyne) scr_npc_halt("l")
	    con= 385
	    $Alarm4.start((90) / 30.0)
	}
	if(con == 386) con= 94

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
