# Auto-converted from GameMaker: obj_cookshowevent
extends Node2D

func _ready():
	con= 0
	scale.y= 5
	if(GS.plot > 134) instance_destroy()
	else  {
	    obj_mainchara.cutscene= 1
	    view_yview[0]= 240
	    instance_create(0, 0, 92/* obj_musfadeout */)
	    view_object[0]= -4
	}
	yoffset1= 240

func _gm_event_2_4():
	con++

func _process(delta: float):
	if(con == 1) {
	    GS.flag[17]= 1
	    GS.msc= 0
	    GS.msg[0]= "* Ring.../"
	    GS.msg[1]= "\\TS \\E3 \\F6 \\TA %"
	    GS.msg[2]= "* H-hey^1, it\'s kind of&  dark \\M9in there^1, isn\'t&  it?/"
	    GS.msg[3]= "\\E6* Don\'t worry!/"
	    GS.msg[4]= "\\E0* I\'ll hack into the&  light system and&  brighten it up!/%%"
	    scr_regulartext()
	    con= 2
	    snd_play(104/* snd_phone */)
	}
	if(con == 2 and not instance_exists(782/* OBJ_WRITER */)) {
	    bossa= caster_load("music/hotel.ogg")
	    con= 3
	    ff1= instance_create(20, 320, 1183/* obj_kitchenforcefield */)
	    ff1.scale.y= 5
	    ff1.z_index= 500000
	    ff2= instance_create(300, 320, 1183/* obj_kitchenforcefield */)
	    ff2.scale.y= 6
	    ff2.z_index= 500000
	    eggs= instance_create(104, 60 + yoffset1, 1187/* obj_metteggs */)
	    eggs.sprite_index= 1704/* spr_eggcarton */
	    milk= instance_create(136, 74 + yoffset1, 1191/* obj_mettmilk */)
	    milk.sprite_index= 1703/* spr_milkcarton */
	    sugar= instance_create(172, 60 + yoffset1, 1186/* obj_mettsugar */)
	    mett= instance_create(192, 158 + yoffset1, 1172/* obj_mettaton_actor */)
	    mett.d= 1
	    mett.z_index= 999900
	    mett.image_speed= 0
	    mett.sprite_index= 1663/* spr_mettaton_armsdown */
	    chefhat= instance_create(0, 0, 1194/* obj_chefhat */)
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 4) {
	    GS.facing= 0
	    snd_play(106/* snd_noise */)
	    con= 5
	    $Alarm4.start((60) / 30.0)
	}
	if(con == 6) {
	    GS.faceemotion= 3
	    GS.msg[0]= "* Oh no./%%"
	    g= instance_create(0, 0, 779/* obj_dialoguer */)
	    g.side= 0
	    con= 7
	}
	if(con == 7 and not instance_exists(782/* OBJ_WRITER */)) {
	    caster_loop(bossa, 1, 1)
	    con= 8
	    mett.velocity.y= -1
	    $Alarm4.start((45) / 30.0)
	}
	if(con == 9) {
	    mett.velocity.y= 0
	    GS.typer= 27
	    mett.sprite_index= 1655/* spr_mettaton_talk */
	    mett.image_speed= 0.2
	    GS.facechoice= 0
	    GS.msg[0]= "* OHHHH YES!!!/"
	    GS.msg[1]= "* WELCOME^1, BEAUTIES, TO THE&  UNDERGROUND\'S PREMIER COOKING&  SHOW!!!/%%"
	    g= instance_create(0, 0, 779/* obj_dialoguer */)
	    g.side= 1
	    con= 10
	}
	if(con == 10 and not instance_exists(782/* OBJ_WRITER */)) {
	    g= instance_create(40, 180 + yoffset1, 1198/* obj_killervisage */)
	    with(g) event_user(0)
	    con= 11
	    $Alarm4.start((160) / 30.0)
	}
	if(con == 12) {
	    con= 13
	    GS.msg[0]= "* PRE-HEAT YOUR OVENS^1, BECAUSE&  WE\'VE GOT A VERY SPECIAL&  RECIPE FOR YOU TODAY!/"
	    GS.msg[1]= "* WE\'RE GOING TO BE MAKING.../"
	    GS.msg[2]= "* A CAKE!/"
	    GS.msg[3]= "* MY LOVELY ASSISTANT HERE&  WILL GATHER THE INGREDIENTS./"
	    GS.msg[4]= "* EVERYONE GIVE THEM A BIG&  HAND!!!/%%"
	    g= instance_create(0, 0, 779/* obj_dialoguer */)
	    applause= caster_load("music/mett_applause.ogg")
	}
	if(con == 13 and not instance_exists(782/* OBJ_WRITER */)) {
	    mett.sprite_index= 1664/* spr_mettaton_clap */
	    mett.image_speed= 0.5
	    caster_play(applause, 1, 1)
	    con= 14
	    $Alarm4.start((90) / 30.0)
	}
	if(con == 14) {
	    conf= instance_create(obj_mainchara.x - 5 + random(20), view_yview[0] - 2, 109/* obj_confetti */)
	    conf.velocity.x= -1 + random(2)
	}
	if(con == 15) {
	    mett.image_speed= 0.25
	    mett.sprite_index= 1655/* spr_mettaton_talk */
	    GS.msg[0]= "\\W* WE\'LL NEED \\YSUGAR^1,&  MILK^1, \\WAND\\Y EGGS.\\W /"
	    GS.msg[1]= "* GO FOR IT^1, SWEETHEART!/%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 16
	}
	if(con == 16 and not instance_exists(779/* obj_dialoguer */)) {
	    mett2= instance_create(mett.x, mett.y, 1173/* obj_mettaton_npc */)
	    with(mett) instance_destroy()
	    mett= mett2
	    mett.image_speed= 0
	    mett.z_index= 900000
	    con= 17
	    y= 300
	    GS.interact= 0
	}
	if(con == 20) {
	    mett.image_speed= 0
	    mett.sprite_index= 1663/* spr_mettaton_armsdown */
	    con= 21
	    $Alarm4.start((20) / 30.0)
	}
	if(con == 22) {
	    GS.facing= 1
	    con= 23
	    chainsaw= instance_create(mett.x - 8, 140 + yoffset1, 1363/* obj_npc_marker */)
	    chainsaw.visible= 1
	    chainsaw.z_index= mett.z_index - 1
	    chainsaw.sprite_index= 1715/* spr_mettchainsaw */
	    $Alarm4.start((40) / 30.0)
	}
	if(con == 23) chainsaw.y-= 0.5
	if(con == 24) {
	    con= 25
	    bad= caster_load("music/bad.ogg")
	    $Alarm4.start((20) / 30.0)
	}
	if(con == 26) {
	    GS.msg[0]= "\\W* A \\YHUMAN SOUL\\W!!!!/%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 27
	}
	if(con == 27 and not instance_exists(782/* OBJ_WRITER */)) {
	    snd_play(24/* snd_shock */)
	    caster_loop(bad, 1, 1)
	    mett.image_speed= 0.5
	    mett.velocity.x= -0.2
	    chainsaw.velocity.x= -0.2
	    con= 28
	    siner= 0
	    $Alarm4.start((100) / 30.0)
	}
	if(con == 28) {
	    siner++
	    chainsaw.x+= sin(siner * 1.5)
	    chainsaw.y+= cos(siner * 1.5)
	}
	if(con == 29) {
	    mett.velocity.x= 0
	    chainsaw.velocity.x= 0
	    mett.image_speed= 0
	    caster_free(bad)
	    caster_free(-3)
	    mettsong= caster_load("music/mtgameshow.ogg")
	    snd_play(104/* snd_phone */)
	    con= 30
	    $Alarm4.start((60) / 30.0)
	}
	if(con == 31) {
	    snd_play(104/* snd_phone */)
	    GS.typer= 5
	    GS.msg[0]= "* Ring.../"
	    GS.msg[1]= "\\TS \\E3 \\F0 \\TM %"
	    GS.msg[2]= "* HELLO...?&* I\'M KIND OF IN THE&  MIDDLE OF SOMETHING HERE./"
	    GS.msg[3]= "\\TS \\E3 \\F6 \\TA %"
	    GS.msg[4]= "* W-wait a second!!!/"
	    GS.msg[5]= "* Couldn\'t you make&  a.../"
	    GS.msg[6]= "\\E6* Couldn\'t you use&  a.../"
	    GS.msg[7]= "\\E4* Couldn\'t you make&  a substitution in&  the recipe?!/"
	    GS.msg[8]= "\\TS \\E3 \\F0 \\TM %"
	    GS.msg[9]= "* ... A SUBSTITUTION?&* YOU MEAN, USE A DIFFERENT,&  NON-HUMAN INGREDIENT?/"
	    GS.msg[10]= "* ... WHY?/"
	    GS.msg[11]= "\\TS \\E6 \\F6 \\TA %"
	    GS.msg[12]= "* Uhh^1, what if&  someone\'s.../"
	    GS.msg[13]= "\\E2* .../"
	    GS.msg[14]= "\\E4* Vegan?/"
	    GS.msg[15]= "\\TS \\E3 \\F0 \\TM %"
	    GS.msg[16]= "* ... VEGAN./"
	    GS.msg[17]= "\\TS \\E5 \\F6 \\TA %"
	    GS.msg[18]= "* Uh well I mean%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 32
	}
	if(con == 32 and not instance_exists(782/* OBJ_WRITER */)) {
	    mett.sprite_index= 1655/* spr_mettaton_talk */
	    mett.image_speed= 0.25
	    caster_loop(mettsong, 1, 1)
	    view_object[0]= -4
	    GS.typer= 27
	    GS.facechoice= 0
	    GS.msg[0]= "* THAT\'S A BRILLIANT IDEA,&  ALPHYS!!/"
	    GS.msg[1]= "* ACTUALLY, I HAPPEN TO&  HAVE AN OPTION RIGHT HERE!!!/"
	    GS.msg[2]= "* MTT-BRAND ALWAYS-CONVENIENT&  HUMAN-SOUL-FLAVOR-SUBSTITUTE!/"
	    GS.msg[3]= "* A CAN OF WHICH...&* IS JUST OVER ON THAT&  COUNTER!!!/%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 33
	}
	if(con == 33 and is_instance_valid(chainsaw)) {
	    chainsaw.velocity.y= 4
	    if(chainsaw.y >= chainsaw.ystart) {
	        with(chainsaw) instance_destroy()
	    }
	}
	if(con == 33 and not instance_exists(782/* OBJ_WRITER */)) {
	    view_xview[0]+= 4
	    if(view_xview[0] > 318) con= 34
	}
	if(con == 34) {
	    view_xview[0]= 320
	    with(ff2) instance_destroy()
	    con= 37
	    $Alarm4.start((60) / 30.0)
	}
	if(con == 38) {
	    con= 39
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 39 and view_xview[0] > 0)
	    view_xview[0]-= 16
	if(con == 40) {
	    GS.msg[0]= "* WELL, DARLING?&* WHY DON\'T YOU GO GET IT?/%%"
	    mett.image_speed= 0.25
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    view_object[0]= 1570
	    obj_mainchara.cutscene= 0
	    con= 41
	}
	if(con == 41 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.plot= 134
	    mett.image_speed= 0
	    con= 42
	    GS.interact= 0
	}
	if(con == 50) {
	    GS.interact= 1
	    obj_mainchara.cutscene= 1
	    view_object[0]= -4
	    con= 51
	}
	if(con == 51) {
	    view_xview[0]+= 3
	    if(view_xview[0] >= 320) {
	        view_xview[0]= 320
	        con= 52
	    }
	}
	if(con == 52) {
	    // obj_counterscroller
	    with(1196) event_user(0)
	    con= 53
	    $Alarm4.start((150) / 30.0)
	}
	if(con == 54) {
	    // obj_mettaton_npc
	    with(1173) instance_destroy()
	    // obj_mettaton_actor
	    with(1172) instance_destroy()
	    mett= instance_create(280, 340, 1173/* obj_mettaton_npc */)
	    mett.x= 280
	    mett.velocity.x= 1
	    con= 55
	    $Alarm4.start((50) / 30.0)
	}
	if(con == 56) {
	    GS.msc= 0
	    GS.facechoice= 0
	    GS.typer= 27
	    mett.velocity.x= 0
	    mett.image_speed= 0.25
	    GS.msg[0]= "* BY THE WAY^1, OUR SHOW RUNS ON&  A STRICT SCHEDULE./"
	    GS.msg[1]= "\\W* IF YOU CAN\'T GET THE&  CAN IN THE NEXT&  \\YONE MINUTE...\\W /"
	    GS.msg[2]= "\\W* WE\'LL JUST HAVE TO GO&  BACK TO THE \\RORIGINAL PLAN\\W!!!/"
	    GS.msg[3]= "* SO...&* BETTER START CLIMBING,&  BEAUTIFUL!!!/%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 57
	}
	if(con == 57 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.plot= 134
	    mett2= instance_create(mett.x, mett.y, 1172/* obj_mettaton_actor */)
	    mett2.z_index= mett.z_index
	    mett2.sprite_index= mett.sprite_index
	    mett2.image_speed= 0.25
	    mett2.visible= 1
	    // obj_mettaton_npc
	    with(1173) instance_destroy()
	    mett= mett2
	    con= 58
	    $Alarm4.start((20) / 30.0)
	}
	if(con == 59) {
	    mett.velocity.y= -6
	    con= 60
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 61) {
	    caster_free(-3)
	    GS.msc= 0
	    GS.typer= 5
	    GS.msg[0]= "* Ring.../"
	    GS.msg[1]= "\\TS \\E3 \\F6 \\TA %"
	    GS.msg[2]= "* Oh no!!^1!&* There\'s not enough&  time to climb up!/"
	    GS.msg[3]= "\\E2* .../"
	    GS.msg[4]= "\\E6* F-f-fortunately, I&  might have a plan!/"
	    GS.msg[5]= "\\E0* When I was upgrading&  your phone, I added&  a few... features./"
	    GS.msg[6]= "\\E6* You see that huge&  button that says..^1.&* " + chr(ord('"')) + "JETPACK" + chr(ord('"')) + "?/"
	    GS.msg[7]= "\\E3* Watch this!/%%"
	    scr_regulartext()
	    con= 61.1
	    snd_play(104/* snd_phone */)
	}
	if(con == 61.1 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.facing= 0
	    jetpack= instance_create(obj_mainchara.x, obj_mainchara.y + 10, 1199/* obj_phonetojetpack */)
	    jetpack.clip= 1570
	    con= 60.2
	    $Alarm4.start((150) / 30.0)
	}
	if(con == 61.2) con= 62
	if(con == 62 and not instance_exists(782/* OBJ_WRITER */)) {
	    view_object[0]= -4
	    obj_mainchara.cutscene= 1
	    obj_mainchara.visible= 0
	    chara= instance_create(obj_mainchara.x, obj_mainchara.y, 1363/* obj_npc_marker */)
	    chara.z_index= 9000
	    jetpack.clip= chara
	    chara.sprite_index= 1044/* spr_maincharau */
	    chara.visible= 1
	    chara.image_speed= 0
	    con= 63
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 64) {
	    GS.faceemotion= 6
	    GS.msg[0]= "* There!/"
	    GS.msg[1]= "* You should have&  just enough fuel to&  reach the top!/"
	    GS.msg[2]= "\\E3* Now^1, get up&  there!!!/%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 65
	}
	if(con == 65 and not instance_exists(782/* OBJ_WRITER */)) {
	    race= caster_load("music/hotel_battle.ogg")
	    GS.currentsong= caster_loop(race, 1, 1)
	    con= 66
	}
	if(con == 66) {
	    view_yview[0]-= 5
	    if(chara.y >= view_yview[0] + 205)
	        chara.y= view_yview[0] + 205
	    if(view_yview[0] <= 90) {
	        view_yview[0]= 90
	        chara.y= view_yview[0] + 205
	        con= 67
	        obj_counterscroller.fakev= 3
	        obj_counterscroller.mode= 1
	        chara2= instance_create(chara.x, chara.y, 1185/* obj_jetpackchara */)
	        jetpack.clip= chara2
	        with(chara) instance_destroy()
	        chara= chara2
	    }
	}
	if(con == 70) {
	    obj_mainchara.x= chara.x
	    obj_mainchara.y= chara.y
	    with(jetpack) instance_destroy()
	    with(chara) instance_destroy()
	    obj_mainchara.visible= 1
	    GS.facing= 0
	    con= 71
	    $Alarm4.start((20) / 30.0)
	}
	if(con == 72) {
	    GS.msg[0]= "* Ring.../"
	    GS.msg[1]= "\\TS \\E3 \\F6 \\TA %"
	    GS.msg[2]= "* Wow^1!&* We..^1. we did it!!/"
	    GS.msg[3]= "\\E0* We..^1. we really did&  it!!!/"
	    GS.msg[4]= "\\E0* Great job out&  there^1, team!/"
	    GS.msg[5]= "\\E3* W-well^1, uh^1, anyway^1,&  let\'s keep heading&  forward!!!/"
	    GS.msg[6]= "\\TS \\F0 \\T0 %"
	    GS.msg[7]= "* Click.../%%"
	    if(GS.flag[377] == 1) {
	        GS.msg[0]= "* Ring.../"
	        GS.msg[1]= "\\TS \\E1 \\F6 \\TA %"
	        GS.msg[2]= "* .../"
	        GS.msg[3]= "\\E4* U-um..^1.&* I guess we..^1.&* ... did it?/"
	        GS.msg[4]= "\\E3* W-well^1, uh^1, anyway^1,&  let\'s keep heading&  forward!!!/"
	        GS.msg[5]= "\\TS \\F0 \\T0 %"
	        GS.msg[6]= "* Click.../%%"
	    }
	    GS.typer= 5
	    GS.facechoice= 0
	    GS.msc= 0
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    snd_play(104/* snd_phone */)
	    con= 73
	}
	if(con == 73 and not instance_exists(782/* OBJ_WRITER */)) {
	    dn= 1
	    con= 74
	    view_object[0]= 1570
	    view_hborder[0]= 140
	}
	if(con == 74) {
	    flowey= instance_create(40, 360, 1339/* obj_stalkerflowey */)
	    caster_free(-3)
	    GS.flag[17]= 0
	    GS.interact= 0
	    GS.plot= 135
	    // obj_kitchenforcefield
	    with(1183) instance_destroy()
	    con= 75
	    scr_tempsave()
	    instance_destroy()
	}

func _on_alarm_0_timeout():
	if(GS.interact == 0 and con == 0) {
	    GS.interact= 1
	    con= 1
	}

func _on_outside_room():
	if(con < 4) {
	    z_index= obj_mainchara.z_index + 1000
	    draw_set_color(0)
	    draw_rectangle(-1, -1, 400, 500, 0)
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
