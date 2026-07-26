# Auto-converted from GameMaker: obj_grillbynpc_sansdate
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
	myinteract= 0
	facing= 0
	direction= 90
	talkedto= 0
	image_speed= 0
	con= 0
	if(GS.flag[89] != 1) instance_destroy()
	else  {
	    con= 1
	    visible= 1
	    rimshot= caster_load("music/rimshot.ogg")
	    whoopee= caster_load("music/whoopee.ogg")
	    mystery= caster_load("music/mysteriousroom2.ogg")
	}
	scr_depth()
	burg= 0
	curvol= 1
	counter= scr_marker(92, 65, 1199)
	counter.z_index= 199990

func _gm_event_2_2():
	con++

func _process(delta: float):
	scr_depth()
	if(con == 1) {
	    $Alarm2.start((30) / 30.0)
	    con= 2
	}
	if(con == 2) {
	    obj_mainchara.y= obj_markerw.y
	    GS.facing= 2
	    obj_mainchara.facing= 2
	    GS.interact= 1
	}
	if(con == 3) {
	    GS.msc= 0
	    GS.typer= 17
	    GS.facechoice= 3
	    GS.faceemotion= 0
	    sprite_index= dtsprite
	    obj_mainchara.cutscene= 1
	    obj_mainchara.phasing= 1
	    GS.msg[0]= "* fast shortcut^1, huh?/%%"
	    mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 3.5
	}
	if(con == 3.5 and not instance_exists(782/* OBJ_WRITER */)) {
	    sprite_index= usprite
	    GS.msg[0]= "* hey^1, everyone./%%"
	    con= 4
	    instance_create(0, 0, 779/* obj_dialoguer */)
	}
	if(con == 4 and not instance_exists(782/* OBJ_WRITER */)) {
	    sprite_index= usprite
	    image_speed= 0.2
	    velocity.y= -2
	    $Alarm2.start((12) / 30.0)
	    con= 5
	    obj_mainchara.velocity.y= -2
	    obj_mainchara.image_speed= 0.2
	}
	if(con == 6) {
	    GS.msc= 0
	    GS.typer= 5
	    GS.facechoice= 0
	    GS.faceemotion= 0
	    obj_mainchara.velocity.y= 0
	    obj_mainchara.facing= 3
	    obj_mainchara.image_speed= 0
	    velocity.y= 0
	    image_speed= 0
	    sprite_index= ltsprite
	    con= 7.1
	    if(GS.flag[53] != 1) {
	        obj_grillbynpc_womandog.image_speed= 0.25
	        obj_grillbynpc_mandog.image_speed= 0.25
	        GS.msg[0]= "* Hey^1, Sans.&* (Hi^1, Sans.)/%%"
	        mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	        talkedto++
	        con= 7.2
	    }
	}
	if(con == 7.1) {
	    con= 6.2
	    $Alarm2.start((20) / 30.0)
	}
	if(con == 7.2 and not instance_exists(782/* OBJ_WRITER */)) {
	    if(GS.flag[53] != 1) {
	        // obj_grillbynpc_womandog
	        with(1470) image_speed= 0
	        // obj_grillbynpc_mandog
	        with(1471) image_speed= 0
	    }
	    sprite_index= rsprite
	    image_speed= 0.2
	    velocity.x= 3
	    $Alarm2.start((11) / 30.0)
	    con= 8
	    obj_mainchara.velocity.x= 1
	    obj_mainchara.image_speed= 0.2
	}
	if(con == 9) {
	    GS.msc= 0
	    GS.typer= 5
	    GS.facechoice= 0
	    GS.faceemotion= 0
	    velocity.x= 0
	    obj_mainchara.velocity.x= 0
	    obj_mainchara.facing= 1
	    obj_mainchara.image_speed= 0
	    image_speed= 0
	    sprite_index= rtsprite
	    obj_grillbynpc_foodmonster.image_speed= 0.25
	    obj_grillbynpc_hotandbothered.image_speed= 0.25
	    GS.msg[0]= "* Greetings^1, Sans.&* Hiya^1, Sansy~/%%"
	    mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	    talkedto++
	    con= 10
	}
	if(con == 10 and not instance_exists(782/* OBJ_WRITER */)) {
	    obj_grillbynpc_foodmonster.image_speed= 0
	    obj_grillbynpc_hotandbothered.image_speed= 0
	    sprite_index= usprite
	    obj_mainchara.facing= 2
	    GS.facing= 2
	    image_speed= 0.2
	    velocity.y= -2
	    $Alarm2.start((26) / 30.0)
	    con= 11
	    obj_mainchara.velocity.y= -3
	    obj_mainchara.image_speed= 0.2
	}
	if(con == 12) {
	    GS.msc= 0
	    GS.typer= 5
	    GS.facechoice= 0
	    GS.faceemotion= 0
	    velocity.y= 0
	    obj_mainchara.velocity.y= 0
	    obj_mainchara.facing= 3
	    GS.facing= 3
	    frame= 0
	    obj_mainchara.image_speed= 0
	    image_speed= 0
	    sprite_index= ltsprite
	    obj_townnpc_weirdfish.image_speed= 0.2
	    GS.msg[0]= "* Hey Sans^1, weren\'t you just&  here for breakfast a&  few minutes ago?/"
	    scr_sansface(1, 0)
	    GS.msg[2]= "* nah^1, i haven\'t had&  breakfast in at least&  half an hour./"
	    GS.msg[3]= "\\E2* you must be thinking&  of brunch./%%"
	    mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	    talkedto++
	    con= 13
	}
	if(con == 13 and not instance_exists(782/* OBJ_WRITER */)) {
	    obj_townnpc_weirdfish.image_speed= 0.5
	    obj_grillbynpc_hot2.image_speed= 0.5
	    obj_grillbynpc_foodmonster.image_speed= 0.5
	    // obj_grillbynpc_womandog
	    with(1470) image_speed= 0.5
	    // obj_grillbynpc_mandog
	    with(1471) image_speed= 0.5
	    // obj_grillbynpc_doggo
	    with(1472) image_speed= 0.5
	    obj_grillbynpc_hotandbothered.image_speed= 0.5
	    caster_play(rimshot, 1, 1)
	    sprite_index= 1358/* spr_sans_shrug2 */
	    $Alarm2.start((44) / 30.0)
	    con= 14
	}
	if(con == 15) {
	    con= 16
	    obj_townnpc_weirdfish.image_speed= 0
	    obj_grillbynpc_hot2.image_speed= 0
	    obj_grillbynpc_foodmonster.image_speed= 0
	    // obj_grillbynpc_womandog
	    with(1470) image_speed= 0
	    // obj_grillbynpc_mandog
	    with(1471) image_speed= 0
	    // obj_grillbynpc_doggo
	    with(1472) image_speed= 0
	    obj_grillbynpc_hotandbothered.image_speed= 0
	    // obj_readablesolid
	    with(1369) frame= 0
	    sprite_index= ltsprite
	    frame= 0
	    obj_mainchara.facing= 1
	    GS.facing= 1
	    GS.facechoice= 3
	    GS.faceemotion= 0
	    GS.msg[0]= "* here^1, get comfy./%%"
	    mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 17
	}
	if(con == 17 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 17.1
	    GS.phasing= 1
	    GS.facing= 2
	    obj_mainchara.image_speed= 0.25
	    image_speed= 0.25
	    sprite_index= usprite
	    velocity.y= -1
	    x+= 2
	    obj_mainchara.velocity.y= -1
	    if(obj_mainchara.x != 177) obj_mainchara.x= 177
	}
	if(con == 17.1) {
	    if(y <= 75) {
	        velocity.y= 0
	        image_speed= 0
	        sprite_index= 1349/* spr_sans_stool_u */
	        y= 74
	    }
	    if(obj_mainchara.y <= 73) {
	        obj_mainchara.y= 73
	        obj_mainchara.velocity.y= 0
	        con= 20
	    }
	}
	if(con == 20 and not instance_exists(782/* OBJ_WRITER */)) {
	    caster_pause(GS.currentsong)
	    caster_play(whoopee, 1, 1)
	    $Alarm2.start((60) / 30.0)
	    con= 21
	}
	if(con == 22) {
	    caster_stop(whoopee)
	    caster_resume(GS.currentsong)
	    GS.faceemotion= 1
	    GS.msc= 570
	    mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 23
	}
	if(con == 23 and not instance_exists(782/* OBJ_WRITER */)) {
	    sprite_index= 1348/* spr_sans_stoolcomb */
	    image_speed= 0.1
	    grillby= 1464
	    grillby.sprite_index= 1223/* spr_grillby_l */
	    grillby.image_speed= 0.25
	    grillby.z_index= 200000
	    grillby.velocity.x= -3
	    con= 24
	    $Alarm2.start((37) / 30.0)
	}
	if(con == 25) {
	    grillby.velocity.x= 0
	    grillby.sprite_index= 1224/* spr_grillby_u */
	    grillby.velocity.y= -2
	    con= 26
	    $Alarm2.start((15) / 30.0)
	}
	if(con == 27) {
	    grillby.velocity.y= 0
	    grillby.visible= 0
	    snd_play(92/* snd_chug */)
	    con= 28
	    $Alarm2.start((90) / 30.0)
	}
	if(con == 29) {
	    frame= 0
	    image_speed= 0
	    sprite_index= 1350/* spr_sans_stool_l */
	    GS.msc= 572
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 30
	}
	if(con == 30 and not instance_exists(782/* OBJ_WRITER */)) {
	    grillby.visible= 1
	    grillby.velocity.y= 2
	    grillby.sprite_index= 1225/* spr_grillby_d */
	    con= 32
	    $Alarm2.start((15) / 30.0)
	}
	if(con == 33) {
	    grillby.sprite_index= 1222/* spr_grillby_r */
	    con= 34
	    $Alarm2.start((47) / 30.0)
	    grillby.velocity.y= 0
	    grillby.velocity.x= 3
	}
	if(con == 35) {
	    grillby.image_speed= 0
	    grillby.sprite_index= 1225/* spr_grillby_d */
	    sprite_index= 1349/* spr_sans_stool_u */
	    if(GS.flag[391] == 1) foodimg= 1345
	    if(GS.flag[391] == 2) foodimg= 1346
	    food1= scr_marker(192, 72, foodimg)
	    food2= scr_marker(208, 72, foodimg)
	    food1.z_index= 190000
	    food2.z_index= 190000
	    con= 36
	    $Alarm2.start((45) / 30.0)
	    grillby.velocity.x= 0
	}
	if(con == 37) {
	    grillby.image_speed= 0.25
	    grillby.sprite_index= 1223/* spr_grillby_l */
	    grillby.velocity.x= -3
	    $Alarm2.start((12) / 30.0)
	    con= 38
	}
	if(con == 39) {
	    grillby.sprite_index= 1216/* spr_npc_grillby */
	    with(grillby) z_index= scr_depth()
	    grillby.velocity.x= 0
	    grillby.image_speed= 0.25
	    GS.msc= 574
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 40
	}
	if(con == 40 and instance_exists(782/* OBJ_WRITER */) and OBJ_WRITER.stringno > 0) {
	    sprite_index= 1351/* spr_sans_stool_chup */
	    image_speed= 0
	    frame= 0
	}
	if(con == 40 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 41.5
	    if(burg == 2) {
	        drink= 0
	        con= 40.1
	    }
	}
	if(con == 40.1) {
	    if(frame < 8) {
	        frame++
	        drink++
	        if(drink == 1 or drink == 3 or drink == 5 or drink == 7)
	            snd_play(110/* snd_swallow */)
	        con= 39.2
	        $Alarm2.start((5) / 30.0)
	    } else  {
	        frame= 9
	        con= 40.3
	        $Alarm2.start((40) / 30.0)
	    }
	}
	if(con == 40.2) con= 40.1
	if(con == 41.3) {
	    con= 43
	    sprite_index= usprite
	}
	if(con == 41.5) {
	    sprite_index= 1350/* spr_sans_stool_l */
	    GS.typer= 5
	    GS.msc= 0
	    GS.facechoice= 0
	    GS.msg[0]= "* (You tip the ketchup...)/"
	    GS.msg[1]= "* (The cap falls off and all&  the ketchup in the bottle&  pours onto your food.)/%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 41.6
	}
	if(con == 41.6 and instance_exists(782/* OBJ_WRITER */) and OBJ_WRITER.stringno == 1) {
	    food1.frame= 1
	    con= 42
	}
	if(con == 42 and not instance_exists(782/* OBJ_WRITER */)) {
	    if(burg < 2) {
	        GS.facechoice= 3
	        GS.typer= 17
	        GS.msc= 0
	        GS.faceemotion= 1
	        GS.msg[0]= "* whoops./"
	        GS.msg[1]= "\\E0* eh, forgeddaboudit^1.&* you can have mine./"
	        GS.msg[2]= "\\E1* i\'m not hungry anyway./%%"
	        instance_create(0, 0, 779/* obj_dialoguer */)
	    }
	    con= 43
	}
	if(con == 43 and not instance_exists(782/* OBJ_WRITER */) and OBJ_WRITER.stringno == 2) {
	    if(food1.x > food1.xstart - 16) food1.x-= 2
	    if(food2.x > food2.xstart - 16) food2.x-= 2
	}
	if(con == 43 and not instance_exists(782/* OBJ_WRITER */)) {
	    sprite_index= 1347/* spr_sans_stool_buttscratch */
	    image_speed= 0.2
	    $Alarm2.start((90) / 30.0)
	    con= 44
	}
	if(con == 45) {
	    image_speed= 0
	    frame= 0
	    sprite_index= 1350/* spr_sans_stool_l */
	    GS.msc= 0
	    GS.msg[0]= "* anyway^1, cool or not^1,&  you have to agree&  papyrus tries real hard./"
	    GS.msg[1]= "\\E0* like how he keeps&  trying to be part of&  the royal guard./"
	    GS.msg[2]= "\\E1* one day^1, he went to&  the house of the head&  of the royal guard.../"
	    GS.msg[3]= "\\E0* and begged her to&  let him be in it./"
	    GS.msg[4]= "\\E1* of course^1, she shut&  the door on him because&  it was midnight./"
	    GS.msg[5]= "\\E0* but the next day^1, she&  woke up and saw him&  still waiting there./"
	    GS.msg[6]= "* seeing his dedication^1,&  she decided to give&  him warrior training./"
	    GS.msg[7]= "\\E1* it\'s^1, uh^1, still a&  work in progress./%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 46
	}
	if(con == 46 and not instance_exists(782/* OBJ_WRITER */)) {
	    sprite_index= 1349/* spr_sans_stool_u */
	    $Alarm2.start((108) / 30.0)
	    con= 47
	    curvol= caster_get_volume(GS.currentsong)
	    origvol= curvol
	}
	if(con == 47) {
	    curvol-= 0.01
	    caster_set_volume(GS.currentsong, curvol)
	    if(curvol < 0.02) {
	        curvol= 0
	        caster_pause(GS.currentsong)
	    }
	}
	if(con == 48) {
	    GS.msg[0]= "\\E1* oh yeah^1, I wanted&  to ask you something./%%"
	    con= 49
	    instance_create(0, 0, 779/* obj_dialoguer */)
	}
	if(con == 49 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 50
	    $Alarm2.start((30) / 30.0)
	}
	if(con == 51) {
	    grillby.z_index= 200000
	    grillby.image_speed= 0
	    snd_play(106/* snd_noise */)
	    dark= instance_create(0, 0, 1363/* obj_npc_marker */)
	    dark.visible= 1
	    dark.z_index= 20
	    dark.sprite_index= 1226/* spr_grillbyshadow */
	    dark.modulate.a= 0.8
	    con= 52
	    $Alarm2.start((60) / 30.0)
	}
	if(con == 53) {
	    mystvol= 0.4
	    caster_loop(mystery, 1, 0.4)
	    GS.msc= 576
	    GS.faceemotion= 0
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 54
	}
	if(con == 54 and not instance_exists(782/* OBJ_WRITER */)) {
	    caster_resume(GS.currentsong)
	    grillby.image_speed= 0.25
	    con= 55
	}
	if(con == 55) {
	    dark.modulate.a-= 0.02
	    if(dark.modulate.a < 0.03) dark.modulate.a= 0
	    curvol+= 0.01
	    mystvol-= 0.02
	    if(mystvol < 0.02) mystvol= 0
	    caster_set_volume(mystery, mystvol)
	    if(curvol > origvol) {
	        curvol= origvol
	        con= 56
	        caster_stop(mystery)
	        with(dark) instance_destroy()
	    }
	    caster_set_volume(GS.currentsong, curvol)
	}
	if(con == 56) {
	    y+= 10
	    sprite_index= dsprite
	    con= 57
	    $Alarm2.start((30) / 30.0)
	}
	if(con == 58) {
	    GS.facing= 0
	    obj_mainchara.facing= 0
	    con= 59
	}
	if(con == 59 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.msc= 0
	    GS.msg[0]= "* welp^1, that was a&  long break./"
	    GS.msg[1]= "\\E1* i can\'t believe i let&  ya pull me away from&  work for that long./%%"
	    con= 60
	    instance_create(0, 0, 779/* obj_dialoguer */)
	}
	if(con == 60 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 61
	    $Alarm2.start((30) / 30.0)
	}
	if(con == 62) {
	    sprite_index= utsprite
	    GS.msc= 578
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 63
	}
	if(con == 63 and not instance_exists(782/* OBJ_WRITER */)) {
	    sprite_index= dsprite
	    frame= 0
	    GS.msc= 0
	    GS.msg[0]= "* just kidding./"
	    GS.msg[1]= "* grillby^1, put it on&  my tab./%%"
	    con= 64
	    instance_create(0, 0, 779/* obj_dialoguer */)
	}
	if(con == 64 and not instance_exists(782/* OBJ_WRITER */)) {
	    caster_free(whoopee)
	    caster_free(mystery)
	    caster_free(rimshot)
	    velocity.y= 2
	    image_speed= 0.25
	    con= 66
	    $Alarm2.start((50) / 30.0)
	}
	if(con == 67) {
	    velocity.y= 0
	    sprite_index= lsprite
	    velocity.x= -2
	    con= 68
	    $Alarm2.start((20) / 30.0)
	}
	if(con == 69) {
	    image_speed= 0
	    velocity.y= 0
	    sprite_index= dsprite
	    velocity.x= 0
	    con= 69.1
	    $Alarm2.start((20) / 30.0)
	}
	if(con == 70.1) {
	    sprite_index= usprite
	    GS.msg[0]= "* by the way.../"
	    GS.msg[1]= "* ... i was going to say&  something^1, but i forgot./%%"
	    gege= instance_create(0, 0, 779/* obj_dialoguer */)
	    gege.side= 0
	    con= 70.2
	}
	if(con == 70.2 and not instance_exists(782/* OBJ_WRITER */)) {
	    image_speed= 0.25
	    velocity.y= 2
	    sprite_index= dsprite
	    con= 70
	    $Alarm2.start((20) / 30.0)
	}
	if(con == 71) {
	    GS.phasing= 1
	    GS.flag[89]= 2
	    obj_mainchara.velocity.y= 1
	    obj_mainchara.image_speed= 0.25
	    con= 72
	    $Alarm2.start((30) / 30.0)
	}
	if(con == 73) {
	    // obj_readablesolid
	    with(1369) sansmode= 1
	    obj_mainchara.image_speed= 0
	    obj_mainchara.velocity.y= 0
	    GS.phasing= 0
	    GS.interact= 0
	    instance_destroy()
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
