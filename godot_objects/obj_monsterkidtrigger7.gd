# Auto-converted from GameMaker: obj_monsterkidtrigger7
extends Node2D

func _ready():
	con= 0
	if(GS.plot > 119) instance_destroy()
	touched= 0
	scale.y= 10
	murder= 0
	if(scr_murderlv() >= 11 and GS.flag[27] == 0) murder= 1

func _gm_event_1_0():
	if(GS.flag[17] == 1) GS.flag[17]= 0

func _gm_event_2_4():
	con++

func _process(delta: float):
	if(con == 1) {
	    mkid= instance_create(view_xview[0] - 40, obj_mainchara.y, 1115/* obj_mkid_actor */)
	    mkid.image_speed= 0
	    obj_mainchara.cutscene= 1
	    view_object[0]= -4
	    mkid.sprite_index= mkid.rsprite
	    con= 0.1
	    $Alarm4.start((2) / 30.0)
	    vol= caster_get_volume(GS.currentsong)
	    vol2= vol
	}
	if(con == 1.1) {
	    con= 0.2
	    $Alarm4.start((2) / 30.0)
	}
	if(con == 1.2) {
	    con= 1.3
	    GS.msg[0]= "* Yo!/%%"
	    scr_regulartext()
	}
	if(con == 1.3 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 2
	    $Alarm4.start((50) / 30.0)
	}
	if(con == 2 and not instance_exists(782/* OBJ_WRITER */)) {
	    if(vol > 0) vol-= 0.02
	    caster_set_volume(GS.currentsong, vol)
	    view_xview[0]-= 2
	}
	if(con == 3) {
	    GS.facing= 3
	    caster_pause(GS.currentsong)
	    mkid.image_speed= 0.2
	    mkid.velocity.x= 1
	    con= 4
	    $Alarm4.start((20) / 30.0)
	    if(GS.tempvalue[13] == 1) {
	        $Alarm4.start((50) / 30.0)
	        con= 13
	        mkid.image_speed= 0.25
	        mkid.velocity.x= 3
	        mkid.sprite_index= mkid.rsprite
	    }
	}
	if(con == 5) {
	    mkid.velocity.x= 0
	    mkid.image_speed= 0
	    mkid.frame= 0
	    con= 6
	    $Alarm4.start((50) / 30.0)
	}
	if(con == 7) {
	    mkid.velocity.x= 1
	    mkid.image_speed= 0.2
	    con= 8
	    $Alarm4.start((130) / 30.0)
	}
	if(con == 9) {
	    mkid.velocity.x= 0
	    mkid.image_speed= 0
	    mkid.frame= 0
	    con= 10
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 10) {
	    mkid.sprite_index= mkid.dtsprite
	    con= 11
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 12) {
	    mkid.sprite_index= mkid.rtsprite
	    con= 13
	    $Alarm4.start((40) / 30.0)
	}
	if(con == 14) {
	    mkid.velocity.x= 0
	    mkid.image_speed= 0
	    mkid.frame= 0
	    mkid.sprite_index= mkid.rtsprite
	    GS.msc= 623
	    GS.typer= 5
	    GS.facechoice= 0
	    con= 15
	    if(murder == 1) {
	        con= 150
	        GS.msc= 0
	        GS.msg[0]= "* Yo./"
	        GS.msg[1]= "* Undyne told me to stay&  away from you./"
	        GS.msg[2]= "* She said you..^1.&* You hurt a lot of people./"
	        GS.msg[3]= "* .../"
	        GS.msg[4]= "* But^1, yo^1, that\'s not true^1,&  right!?/"
	        GS.msg[5]= "* .../"
	        GS.msg[6]= "* ... yo..^1.&* Why won\'t you answer me?/"
	        GS.msg[7]= "* A..^1. a..^1. and what\'s with&  that weird expression...?/%%"
	        if(GS.tempvalue[13] == 1) {
	            GS.msg[0]= "* Yo^1, dude..^1.&* I..^1. I heard some things^1,&  and.../"
	            GS.msg[1]= "* What^1?&* Look over here^1?&* What for  %%"
	            con= 157
	        }
	    }
	    instance_create(0, 0, 779/* obj_dialoguer */)
	}
	if(con == 15 and not instance_exists(782/* OBJ_WRITER */)) {
	    mkid.sprite_index= mkid.rsprite
	    con= 16
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 17) {
	    mkid.velocity.x= -1
	    con= 18
	    $Alarm4.start((15) / 30.0)
	    mkid.image_speed= 0.2
	}
	if(con == 19) {
	    mkid.velocity.x= 0
	    $Alarm4.start((60) / 30.0)
	    mkid.image_speed= 0
	    mkid.frame= 0
	    con= 20
	}
	if(con == 21) {
	    mkid.sprite_index= mkid.lsprite
	    mkid.velocity.x= -3
	    $Alarm4.start((15) / 30.0)
	    mkid.image_speed= 0.5
	    con= 20.1
	}
	if(con == 21.1) {
	    mkid.velocity.x= 0
	    mkid.frame= 0
	    mkid.sprite_index= 1390/* spr_mkid_trip_l */
	    mkid.image_speed= 0
	    mkiddex= 0
	    con= 22
	    $Alarm4.start((18) / 30.0)
	}
	if(con == 22) {
	    mkiddex+= 0.25
	    if(mkiddex >= 2) mkiddex= 0
	    if(mkiddex < 1) mkid.frame= 0
	    else  mkid.frame= 1
	}
	if(con == 23) {
	    mkid.frame= 0
	    mkid.sprite_index= mkid.usprite
	    mkid.velocity.x= -1
	    mkid.velocity.y= 2
	    con= 24
	    $Alarm4.start((15) / 30.0)
	}
	if(con == 25) {
	    mkid.sprite_index= mkid.usprite
	    mkid.image_speed= 0
	    mkid.velocity.x= 0
	    mkid.velocity.y= 0
	    con= 26
	    $Alarm4.start((10) / 30.0)
	}
	if(con == 27) {
	    GS.msg[0]= "* Yo^1, w-w-wait^1!&* Help^1!&* I tripped!/%%"
	    interact= instance_create(mkid.x, mkid.y + 10, 1344/* obj_readable_room1 */)
	    interact.scale.x= 0.5
	    interact.x+= 5
	    scr_regulartext()
	    con= 28
	}
	if(con == 28 and not instance_exists(782/* OBJ_WRITER */)) {
	    undyne= instance_create(view_xview[0] - 40, 82, 1117/* obj_undynea_actor */)
	    undyne.sprite_index= undyne.rsprite
	    undyne.velocity.x= 2
	    undyne.image_speed= 0.2
	    con= 29
	    $Alarm4.start((20) / 30.0)
	}
	if(con == 30) {
	    undyne.velocity.x= 0
	    undyne.image_speed= 0
	    undyne.frame= 0
	    con= 31
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 32) {
	    undyne.sprite_index= 1441/* spr_undyne_armraise */
	    snd_play(13/* snd_spearappear */)
	    con= 33
	    $Alarm4.start((20) / 30.0)
	}
	if(con == 34) {
	    undyne.sprite_index= undyne.rsprite
	    GS.interact= 0
	    con= 35
	    GS.flag[17]= 1
	    doorb= instance_create(view_xview[0] - 20, obj_mainchara.y + 10, 806/* obj_doorB */)
	    doora= instance_create(view_xview[0] + view_wview[0] + 20, obj_mainchara.y + 10, 805/* obj_doorA */)
	    undynetimer= 0
	    finaltimer= 0
	    mkidtalk= 0
	    charge= 0
	    samex= obj_mainchara.x
	}
	if(con == 35) {
	    ll= 0
	    finaltimer++
	    undynetimer++
	    if(undynetimer > 60) {
	        undyne.velocity.x= 1
	        undyne.image_speed= 0.25
	    }
	    if(undynetimer > 75) {
	        undyne.velocity.x= 0
	        undyne.image_speed= 0
	        undynetimer= 0
	    }
	    if(finaltimer > 150 and GS.interact == 0 and mkidtalk == 0 and abs(obj_mainchara.x - samex) < 10) {
	        mkidtalk= 1
	        GS.msg[0]= "\\W* Wh-what are you \\Ystanding&  around\\W for?&* \\YGet over here^1,\\W dude!/%%"
	        scr_regulartext()
	        GS.interact= 1
	    }
	    if(mkidtalk == 1 and not instance_exists(782/* OBJ_WRITER */)) {
	        GS.interact= 0
	        mkidtalk= 2
	    }
	    if(finaltimer > 500) ll= 1
	    if(obj_mainchara.x < undyne.x + 40) {
	        ll= 1
	        charge= 1
	    }
	    able= 0
	    if(ll == 1 and GS.interact == 0) able= 1
	    if(ll == 1 and mkidtalk == 1) able= 1
	    if(able == 1) {
	        // obj_dialoguer
	        with(779) instance_destroy()
	        // OBJ_WRITER
	        with(782) instance_destroy()
	        con= 50
	        GS.interact= 1
	    }
	}
	if(con == 50) {
	    undyne.sprite_index= undyne.dsprite
	    undyne.velocity.x= 0
	    undyne.image_speed= 0
	    undyne.frame= 0
	    mkid.image_speed= 0.25
	    GS.msg[0]= "* I..^1.&* I\'m slipping!/%%"
	    scr_regulartext()
	    con= 51
	}
	if(con == 51 and not instance_exists(782/* OBJ_WRITER */)) {
	    mkid.velocity.y= 0.5
	    con= 50.1
	    $Alarm4.start((20) / 30.0)
	}
	if(con == 51.1) {
	    mkid.velocity.y= 0
	    con= 50.2
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 51.2) {
	    blcon= instance_create(undyne.x + 10, undyne.y - 15, 1337/* obj_cosmeticblcon */)
	    mkid.velocity.y= 4
	    con= 54
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 55) {
	    with(blcon) instance_destroy()
	    undyne.sprite_index= 1428/* spr_undyne_jump0 */
	    con= 56
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 57) {
	    undyne.sprite_index= 1429/* spr_undyne_jump1 */
	    snd_play(14/* snd_spearrise */)
	    undyne.velocity.y= -8
	    undyne.gravity= 0.6
	    undyne.gravity_direction= 270
	    undyne.velocity.x= 0.5
	    con= 58
	    $Alarm4.start((20) / 30.0)
	}
	if(con == 59) {
	    snd_play(12/* snd_fall */)
	    con= 60
	    $Alarm4.start((90) / 30.0)
	}
	if(con == 61) {
	    snd_play(16/* snd_undynestep */)
	    con= 62
	    $Alarm4.start((20) / 30.0)
	}
	if(con == 63) {
	    snd_play(47/* snd_grab */)
	    con= 69
	    $Alarm4.start((80) / 30.0)
	}
	if(con == 70) {
	    GS.facing= 0
	    GS.msg[0]= "* Undyne..^1. you saved me...?/"
	    GS.msg[1]= "* Yo^1, I thought I was a&  goner^1, haha.../"
	    GS.msg[2]= "* ... wait^1, are you okay^1?&* It looks like you fell&  pretty hard.../"
	    GS.msg[3]= "* Th-this is my fault^1.&* I should have stayed away from&  them^1, like you said./"
	    GS.msg[4]= "* They just stood there..^1.&* Watching..^1.&* Waiting for me to fall./"
	    if(charge == 1)
	        GS.msg[4]= "* They just went straight to&  fight you instead of&  helping me.../"
	    GS.msg[5]= "* I was so scared^1, and you.../"
	    GS.msg[6]= "* What^1?&* You\'re gonna go fight them&  now?/"
	    GS.msg[7]= "* But you look hurt..^1.&* You should rest^1, haha.../"
	    GS.msg[8]= "* .../"
	    GS.msg[9]= "* W-warriors don\'t rest^1, huh?/"
	    GS.msg[10]= "* Undyne..^1. you\'re really cool./%%"
	    scr_regulartext()
	    con= 71
	}
	if(con == 71 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.flag[98]= 2
	    con= 72
	}
	if(con == 72 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 73
	    idealxview= round(obj_mainchara.x - view_wview[0] / 2 + obj_mainchara.sprite_width / 2)
	    if(idealxview >= get_viewport_rect().size.x - view_wview[0])
	        idealxview= get_viewport_rect().size.x - view_wview[0] - 2
	    if(view_xview[0] > idealxview) xdir= 0
	    else  xdir= 1
	    $Alarm4.start((40) / 30.0)
	}
	if(con == 74) {
	    if(xdir == 1) view_xview[0]+= 4
	    else  view_xview[0]-= 4
	    if(abs(view_xview[0] - idealxview) <= 5) {
	        with(mkid) instance_destroy()
	        view_object[0]= 1570
	        obj_mainchara.cutscene= 0
	        with(doora) instance_destroy()
	        with(doorb) instance_destroy()
	        GS.plot= 120
	        caster_free(GS.currentsong)
	        GS.interact= 0
	        instance_destroy()
	    }
	}
	if(con == 80) {
	    with(interact) instance_destroy()
	    GS.interact= 1
	    con= 81
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 82) {
	    if(undyne.x > view_xview[0] + 20) {
	        undyne.velocity.x= -1
	        undyne.image_speed= 0.12
	    }
	    if(mkid.x <= obj_mainchara.x) mkid.velocity.x= -0.8
	    if(mkid.x > obj_mainchara.x) mkid.velocity.x= 0.8
	    mkid.velocity.y= -1
	    con= 83
	    $Alarm4.start((28) / 30.0)
	}
	if(con == 84) {
	    undyne.velocity.x= 0
	    undyne.frame= 0
	    undyne.velocity.x= 0
	    mkid.velocity.y= 0
	    mkid.velocity.x= 0
	    mkid.x= round(mkid.x)
	    if(obj_mainchara.x > mkid.x)
	        mkid.sprite_index= mkid.rtsprite
	    else  mkid.sprite_index= mkid.ltsprite
	    mkid.frame= 0
	    mkid.image_speed= 0
	    con= 85
	    $Alarm4.start((40) / 30.0)
	}
	if(con == 86) {
	    undyne.velocity.x= 0.5
	    undyne.image_speed= 0.25
	    blcon= instance_create(mkid.x, mkid.y - 10, 1337/* obj_cosmeticblcon */)
	    con= 87
	    $Alarm4.start((16) / 30.0)
	}
	if(con == 88) {
	    undyne.velocity.x= 0
	    undyne.image_speed= 0
	    undyne.frame= 0
	    with(blcon) instance_destroy()
	    mkid.sprite_index= mkid.lsprite
	    con= 89
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 90) {
	    if(mkid.x > obj_mainchara.x) mkid.velocity.x= -5
	    else  mkid.velocity.x= -0.5
	    mkid.image_speed= 0.25
	    con= 91
	    $Alarm4.start((10) / 30.0)
	}
	if(con == 92) {
	    mkid.velocity.x= 0
	    mkid.image_speed= 0
	    con= 93
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 94) {
	    mkid.sprite_index= mkid.ltsprite
	    mkid.image_speed= 0.25
	    GS.msg[0]= "* Y..^1. y..^1. yo..^1. dude.../"
	    GS.msg[1]= "* If..^1. If y^1-you wanna hurt&  my friend.../"
	    GS.msg[2]= "* You\'re gonna have to get&  through me^1, first./%%"
	    scr_regulartext()
	    con= 95
	}
	if(con == 95 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 96
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 97) {
	    mkid.image_speed= 0
	    mkid.frame= 0
	    undyne.velocity.x= -0.5
	    undyne.image_speed= 0.2
	    undyne.frame= 0
	    con= 98
	    $Alarm4.start((20) / 30.0)
	}
	if(con == 99) {
	    undyne.velocity.x= 0
	    undyne.image_speed= 0
	    undyne.frame= 0
	    con= 98.1
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 99.1) {
	    undyne.velocity.x= -0.5
	    undyne.image_speed= 0.2
	    undyne.frame= 0
	    con= 98.2
	    $Alarm4.start((20) / 30.0)
	}
	if(con == 99.2) {
	    undyne.velocity.x= 0
	    undyne.image_speed= 0
	    undyne.frame= 0
	    con= 100
	    $Alarm4.start((60) / 30.0)
	}
	if(con == 101) {
	    undyne.sprite_index= undyne.lsprite
	    undyne.velocity.x= -2
	    undyne.image_speed= 0.25
	    con= 102
	    $Alarm4.start((90) / 30.0)
	}
	if(con == 103) {
	    with(undyne) instance_destroy()
	    con= 104
	    mkid.sprite_index= mkid.rtsprite
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 105) {
	    GS.msg[0]= "* She\'s gone.../"
	    GS.msg[1]= "* Yo^1, you really saved my skin./"
	    GS.msg[2]= "* Guess being enemies was just&  a nice thought^1, haha./"
	    GS.msg[3]= "* We\'ll just have to be friends&  instead./"
	    GS.msg[4]= "* ... man^1, I should REALLY go&  home.../"
	    GS.msg[5]= "* I bet my parents are worried&  sick about me!/%%"
	    con= 106
	    scr_regulartext()
	}
	if(con == 106 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 107
	    $Alarm4.start((20) / 30.0)
	}
	if(con == 108) {
	    mkid.sprite_index= mkid.lsprite
	    mkid.image_speed= 0.25
	    mkid.velocity.x= -1
	    con= 109
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 110) {
	    mkid.image_speed= 0
	    mkid.velocity.x= 0
	    mkid.frame= 0
	    con= 111
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 112) {
	    mkid.sprite_index= mkid.rtsprite
	    con= 113
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 114) {
	    GS.msg[0]= "* Later^1, dude!/%%"
	    scr_regulartext()
	    con= 115
	}
	if(con == 115 and not instance_exists(782/* OBJ_WRITER */)) {
	    mkid.velocity.x= -4
	    mkid.image_speed= 0.5
	    mkid.sprite_index= mkid.lsprite
	    con= 116
	    idealxview= round(obj_mainchara.x - view_wview[0] / 2 + obj_mainchara.sprite_width / 2)
	    if(view_xview[0] > idealxview) xdir= 0
	    else  xdir= 1
	    $Alarm4.start((40) / 30.0)
	}
	if(con == 117) {
	    if(xdir == 1) view_xview[0]+= 2
	    else  view_xview[0]-= 2
	    if(abs(view_xview[0] - idealxview) <= 2) {
	        with(mkid) instance_destroy()
	        view_object[0]= 1570
	        obj_mainchara.cutscene= 0
	        with(doora) instance_destroy()
	        with(doorb) instance_destroy()
	        GS.plot= 120
	        GS.flag[98]= 1
	        caster_free(GS.currentsong)
	        GS.interact= 0
	        instance_destroy()
	    }
	}
	if(con == 150 and not instance_exists(782/* OBJ_WRITER */) and OBJ_WRITER.stringno == 6)
	    GS.facing= 2
	if(con == 150 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.facing= 3
	    obj_mainchara.velocity.x= -2
	    obj_mainchara.moving= 1
	    obj_mainchara.image_speed= 0.25
	    con= 151
	    $Alarm4.start((5) / 30.0)
	}
	if(con == 152) {
	    mkid.velocity.x= -2
	    mkid.sprite_index= 1397/* spr_mkid_r */
	    mkid.image_speed= 0.25
	    con= 153
	    $Alarm4.start((10) / 30.0)
	}
	if(con == 154) {
	    obj_mainchara.velocity.x= 0
	    mkid.velocity.x= 0
	    mkid.image_speed= 0
	    mkid.frame= 0
	    mkid.sprite_index= 1399/* spr_mkid_rt */
	    con= 155
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 156) {
	    GS.msc= 0
	    GS.typer= 5
	    GS.facechoice= 0
	    GS.msg[0]= "* Oh..^1.&* Oh man.../"
	    GS.msg[1]= "* (Man^1, my h-heart\'s pounding&  right out of my chest...)/"
	    GS.msg[2]= "* (... what would Undyne do?)/"
	    GS.msg[3]= "* (...)/"
	    GS.msg[4]= "* Yo.../"
	    GS.msg[5]= "* Y-you\'d b-better st-stop&  r-right where you are.../"
	    GS.msg[6]= "* Cause if you w-wanna hurt&  anyone else..^1. you\'re.../"
	    GS.msg[7]= "* You\'re gonna have to get&  through me^1, first./"
	    GS.msg[8]= "* A..^1. and..^1. and..^1.%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 157
	}
	if(con == 157 and instance_exists(782/* OBJ_WRITER */)) {
	    if(OBJ_WRITER.stringno == 1) mkid.sprite_index= 1396/* spr_mkid_lt */
	    if(OBJ_WRITER.stringno == 4) mkid.sprite_index= 1399/* spr_mkid_rt */
	}
	if(con == 157 and not instance_exists(782/* OBJ_WRITER */)) {
	    mkid.sprite_index= 1399/* spr_mkid_rt */
	    GS.battlegroup= 91
	    GS.seriousbattle= 1
	    GS.mercy= 1
	    instance_create(0, 0, 142/* obj_battler */)
	    con= 158
	    $Alarm4.start((32) / 30.0)
	}
	if(con == 159) {
	    GS.seriousbattle= 0
	    GS.mercy= 0
	    GS.interact= 1
	    con= 160
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 160) {
	    obj_mainchara.cutscene= 0
	    view_object[0]= 1570
	    con= 160.1
	    GS.interact= 1
	    $Alarm4.start((30) / 30.0)
	    if(GS.flag[350] == 1) {
	        with(mkid) instance_destroy()
	        con= 170
	        $Alarm4.start((-1) / 30.0)
	    }
	    GS.interact= 1
	}
	if(con == 160.1) GS.interact= 1
	if(con == 161.1) {
	    GS.interact= 1
	    GS.typer= 5
	    GS.facechoice= 0
	    GS.msc= 0
	    GS.msg[0]= "* S-see^1?&* I knew y-you weren\'t so&  bad!/"
	    GS.msg[1]= "* I\'ve gotta go tell Undyne&  she was wrong about you!/%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 162
	}
	if(con == 162) GS.interact= 1
	if(con == 162 and not instance_exists(782/* OBJ_WRITER */)) {
	    mkid.velocity.x= -4
	    mkid.image_speed= 0.5
	    mkid.sprite_index= mkid.lsprite
	    con= 163
	    $Alarm4.start((40) / 30.0)
	}
	if(con == 164) con= 170
	if(con == 170) {
	    GS.facing= 0
	    GS.interact= 0
	    if(GS.plot < 120) GS.plot= 120
	    con= 171
	    instance_destroy()
	}

func _on_alarm_0_timeout():
	if(touched == 0 and GS.interact == 0) {
	    touched= 1
	    GS.interact= 1
	    con= 1
	}

func _gm_event_7_5():
	if(GS.flag[17] == 1) GS.flag[17]= 0

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
