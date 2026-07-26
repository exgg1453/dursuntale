# Auto-converted from GameMaker: obj_undyne1
extends Node2D

func _ready():
	if(GS.plot > 105) instance_destroy()
	else  {
	    con= 0
	    scale.y= 999
	    mkid= instance_create(260, 275, 1115/* obj_mkid_actor */)
	    undyne= instance_create(260, 100, 1117/* obj_undynea_actor */)
	    undyne.sprite_index= 1467/* spr_undynea_starku */
	    mkid.sprite_index= 1397/* spr_mkid_r */
	    papyrus= instance_create(60, 110, 1162/* obj_papyrus_undyne1_actor */)
	    if(GS.flag[67] == 1) {
	        with(papyrus) visible= 0
	    }
	    stk= instance_create(0, 0, 1093/* obj_starker */)
	    stk.subject= undyne
	    stk.sprite_index= 1443/* spr_undyne_shad */
	}
	look= 0
	spinagain= 0
	helltrigger= 0

func _gm_event_2_4():
	con++

func _process(delta: float):
	if(con == 1) {
	    obj_mainchara.x-= 3
	    GS.interact= 1
	    fade= instance_create(0, 0, 92/* obj_musfadeout */)
	    fade.fadespeed= 0.02
	    GS.currentsong= caster_load("music/undynescary.ogg")
	    song2= caster_load("music/undynetheme.ogg")
	    obj_mainchara.cutscene= 1
	    con= 1.5
	    $Alarm4.start((10) / 30.0)
	    originy= view_yview[0]
	}
	if(con == 2.5) {
	    if(view_yview[0] > 80) view_yview[0]-= 2
	    else  {
	        if(GS.flag[67] != 1) {
	            papyrus.velocity.x= 2
	            papyrus.image_speed= 0.25
	            con= 2.6
	            $Alarm4.start((50) / 30.0)
	        } else  {
	            con= 90
	            caster_loop(GS.currentsong, 0, 1)
	            t= instance_create(0, 0, 152/* obj_musfadein */)
	            t.fadespeed= 0.02
	            $Alarm4.start((240) / 30.0)
	        }
	    }
	}
	if(con == 3.6) {
	    papyrus.velocity.x= 0
	    papyrus.frame= 0
	    papyrus.image_speed= 0
	    con= 3
	    $Alarm4.start((40) / 30.0)
	}
	if(con == 4) {
	    GS.msc= 0
	    caster_loop(GS.currentsong, 0, 1)
	    t= instance_create(0, 0, 152/* obj_musfadein */)
	    t.fadespeed= 0.02
	    GS.typer= 5
	    GS.facechoice= 0
	    GS.faceemotion= 0
	    GS.msg[0]= "\\TP %"
	    GS.msg[1]= "\\M5H..^1. HI^1, UNDYNE!&I\'M HERE WITH MY&DAILY REPORT.../"
	    GS.msg[2]= "UHHH... REGARDING THAT&HUMAN I CALLED YOU&ABOUT EARLIER.../"
	    GS.msg[3]= "\\M0I THINK^1, UH...&HOW DO I.../"
	    GS.msg[3]= "\\M1.\\M6.. HUH^1?&DID I FIGHT THEM?/"
	    GS.msg[4]= "\\M4Y-YES^1!&OF COURSE I DID!/"
	    GS.msg[5]= "\\M4I FOUGHT THEM&VALIANTLY!/"
	    GS.msg[6]= "\\M5...WHAT^1?&\\M1DID I CAPTURE THEM...?/"
	    GS.msg[7]= "\\M0W-W-WELL.../"
	    GS.msg[8]= "\\M1NO./"
	    GS.msg[9]= "\\M1I TRIED VERY HARD^1,&UNDYNE^1, BUT IN THE&END.../"
	    GS.msg[10]= "\\M0I FAILED./"
	    GS.msg[11]= "\\M6... W-WHAT?/"
	    GS.msg[12]= "\\M1YOU\'RE GOING TO TAKE&THE HUMAN\'S SOUL&YOURSELF.../"
	    GS.msg[13]= "\\M5BUT UNDYNE^1, YOU DON\'T&H-HAVE TO DESTROY&THEM^1! \\M0YOU SEE.../"
	    GS.msg[14]= "\\M1YOU SEE.../%%"
	    GS.msg[15]= "\\M6..^1.&.../"
	    GS.msg[16]= "... I UNDERSTAND./"
	    GS.msg[17]= "I\'LL HELP YOU IN&ANY WAY I CAN./"
	    GS.msg[18]= "\\TS %"
	    GS.msg[19]= "* Click.../%%"
	    g= instance_create(0, 0, 779/* obj_dialoguer */)
	    g.side= 1
	    OBJ_WRITER.y+= 155
	    con= 80
	    minicon= 0
	    papx= papyrus.x
	}
	if(con == 80 and not instance_exists(782/* OBJ_WRITER */) and minicon == 0 and (OBJ_WRITER.stringno == 13 or OBJ_WRITER.stringno == 14)) {
	    if(papyrus.sprite_index == 1329 and papyrus.x < papx + 60) {
	        papyrus.image_speed= 0.25
	        papyrus.x++
	    } else  {
	        papyrus.frame= 0
	        papyrus.image_speed= 0
	    }
	}
	if(con == 80 and not instance_exists(782/* OBJ_WRITER */)) {
	    undyne.sprite_index= 1463/* spr_undynea_starkl */
	    papyrus.velocity.x= -0.5
	    papyrus.image_speed= 0.25
	    con= 80.5
	    $Alarm4.start((40) / 30.0)
	}
	if(con == 81.5) {
	    papyrus.frame= 0
	    papyrus.velocity.x= 0
	    papyrus.image_speed= 0
	    con= 81
	    $Alarm4.start((90) / 30.0)
	}
	if(con == 82 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.msg[0]= "\\M0.../"
	    GS.msg[1]= "\\M1... I UNDERSTAND./"
	    GS.msg[2]= "I\'LL HELP YOU IN&ANY WAY I CAN./%%"
	    g= instance_create(0, 0, 779/* obj_dialoguer */)
	    g.side= 1
	    OBJ_WRITER.y+= 155
	    con= 5
	}
	if(con == 5 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.flag[20]= 3
	    papyrus.velocity.x= -3
	    papyrus.image_speed= 0.25
	    con= 5.1
	    gg= instance_create(0, 0, 92/* obj_musfadeout */)
	    gg.fadespeed= 0.02
	    GS.currentsong= song2
	}
	if(con == 5.1) {
	    if(view_yview[0] < originy)
	        view_yview[0]+= 2
	    else  con= 5.2
	}
	if(con == 5.2) {
	    obj_mainchara.cutscene= 0
	    GS.interact= 0
	    con= 6
	    helltrigger= 0
	}
	if(con == 6 and helltrigger > 5) {
	    $Alarm4.start((4) / 30.0)
	    con= 6.1
	}
	if(con == 7.1) {
	    obj_mainchara.cutscene= 1
	    GS.interact= 1
	    con= 7.2
	    obj_mainchara.x= obj_mainchara.xprevious
	    obj_mainchara.y= obj_mainchara.yprevious
	}
	if(con == 7.2) {
	    if(view_yview[0] > 80) view_yview[0]-= 10
	    else  con= 8
	}
	if(con == 8) {
	    GS.interact= 1
	    instance_create(undyne.x + 10, undyne.y - 10, 1337/* obj_cosmeticblcon */)
	    undyne.sprite_index= 1436/* spr_undyne_starkd */
	    snd_play(29/* snd_b */)
	    con= 9
	    $Alarm4.start((20) / 30.0)
	}
	if(con == 10) {
	    snd_stop(29)
	    caster_loop(GS.currentsong, 1, 1)
	    con= 11
	    $Alarm4.start((20) / 30.0)
	}
	if(con == 12) {
	    undyne.velocity.y= 0.5
	    undyne.image_speed= 0.2
	    $Alarm4.start((30) / 30.0)
	    con= 14.6
	}
	if(con == 14) {
	    undyne.velocity.y= 0
	    undyne.sprite_index= 1439/* spr_undyne_throw */
	    undyne.fun= 1
	    undyne.frame= 0
	    undyne.image_speed= 0.3334
	    con= 14.1
	}
	if(con == 14.1 and undyne.frame >= 9) {
	    undyne.image_speed= 0
	    undyne.frame= 9
	    $Alarm4.start((100) / 30.0)
	    con= 13.2
	}
	if(con == 14.2) {
	    undyne.frame= 10
	    undyne.image_speed= 0.035
	    con= 14.3
	}
	if(con == 14.3 and undyne.frame >= 13) {
	    undyne.image_speed= 0
	    undyne.frame= 13
	    $Alarm4.start((30) / 30.0)
	    con= 13.4
	}
	if(con == 14.4) {
	    undyne.frame= 9
	    undyne.image_speed= -0.5
	    con= 14.5
	}
	if(con == 14.5 and undyne.frame <= 1) {
	    undyne.sprite_index= 1436/* spr_undyne_starkd */
	    undyne.fun= 0
	    undyne.image_speed= 0
	    undyne.frame= 0
	    con= 18
	}
	if(con == 15.6) {
	    undyne.velocity.y= 0
	    undyne.image_speed= 0
	    con= 15.1
	    $Alarm4.start((50) / 30.0)
	}
	if(con == 16.1) {
	    undyne.velocity.y= 0.5
	    undyne.image_speed= 0.2
	    $Alarm4.start((20) / 30.0)
	    con= 15.2
	}
	if(con == 16.2) {
	    undyne.velocity.y= 0
	    undyne.image_speed= 0
	    con= 13
	    $Alarm4.start((60) / 30.0)
	}
	if(con == 18) {
	    undyne.velocity.y= 0
	    undyne.image_speed= 0
	    $Alarm4.start((60) / 30.0)
	    con= 19
	}
	if(con == 20) {
	    undyne.velocity.y= -2
	    undyne.image_speed= 0.2
	    $Alarm4.start((20) / 30.0)
	    con= 21
	}
	if(con == 22) {
	    undyne.velocity.y= 0
	    undyne.image_speed= 0
	    $Alarm4.start((60) / 30.0)
	    con= 23
	}
	if(con == 24) {
	    d= instance_create(undyne.x, undyne.y, 1363/* obj_npc_marker */)
	    d.sprite_index= 1445/* spr_undyne_starkeye */
	    d.visible= 1
	    b= instance_create(0, 0, 92/* obj_musfadeout */)
	    b.fadespeed= 0.01
	    con= 25
	    snd_play(15/* snd_undynedis */)
	}
	if(con == 25) {
	    if(undyne.modulate.a > 0)
	        undyne.modulate.a-= 0.02
	    else  con= 26
	}
	if(con == 26) {
	    if(d.modulate.a > 0) d.modulate.a-= 0.02
	    else  con= 27
	}
	if(con == 27) {
	    if(view_yview[0] < originy)
	        view_yview[0]+= 2
	    else  con= 28
	}
	if(con == 28) {
	    obj_mainchara.cutscene= 0
	    GS.interact= 0
	    // obj_starker
	    with(1093) instance_destroy()
	    obj_mainchara.usprite= 1044
	    obj_mainchara.rsprite= 1045
	    obj_mainchara.lsprite= 1046
	    obj_mainchara.dsprite= 1043
	    con= 39
	}
	if(con == 39 and (collision_rectangle(60, 100, 80, 900, 1570, 0, 1) or collision_rectangle(430, 100, 440, 900, 1570, 0, 1))) {
	    caster_free(-3)
	    GS.currentsong= caster_load("music/waterfall.ogg")
	    GS.interact= 1
	    con= 40
	}
	if(con == 40) {
	    if(obj_mainchara.y > 276) {
	        mkid.y= 260
	        up= 0
	    } else  {
	        mkid.y= 286
	        up= 1
	    }
	    with(mkid) z_index= 900000
	    if(obj_mainchara.x < 200) {
	        left= 1
	        mkid.velocity.x= -4
	        mkid.sprite_index= mkid.lsprite
	    } else  {
	        left= 0
	        mkid.velocity.x= 4
	    }
	    con= 40.5
	    $Alarm4.start((28) / 30.0)
	    if(left == 1) $Alarm4.start((36) / 30.0)
	}
	if(con == 41.3) con= 41.5
	if(con == 41.5) {
	    mkid.velocity.x= 0
	    con= 42
	    mkid.frame= 0
	    $Alarm4.start((20) / 30.0)
	}
	if(con == 43) {
	    con= 44
	    if(left == 1) mkid.sprite_index= mkid.rsprite
	    else  mkid.sprite_index= mkid.lsprite
	    $Alarm4.start((20) / 30.0)
	}
	if(con == 45) {
	    if(up == 1) mkid.sprite_index= mkid.usprite
	    if(up == 0) mkid.sprite_index= mkid.dsprite
	    con= 46
	    $Alarm4.start((20) / 30.0)
	}
	if(con == 47) {
	    if(left == 1) mkid.sprite_index= mkid.ltsprite
	    else  mkid.sprite_index= mkid.rtsprite
	    mkid.myinteract= 3
	    GS.typer= 5
	    GS.msc= 0
	    GS.facechoice= 0
	    if(GS.flag[67] != 1) {
	        GS.msg[0]= "* Yo..^1. did you see the&  way she was staring at&  you...?/"
	        GS.msg[1]= "* That.../"
	        GS.msg[2]= "* ... was AWESOME!/"
	        GS.msg[3]= "* I\'m SOOOO jealous!/"
	        GS.msg[4]= "* What\'d you do to get her&  attention...^1?&* Ha ha./"
	        GS.msg[5]= "* C\'mon^1!&* Let\'s go watch her beat&  up some bad guys!/%%"
	    } else  {
	        GS.msg[0]= "* Yo..^1. did you see the&  way she was staring at&  you...?/"
	        GS.msg[1]= "* That.../"
	        GS.msg[2]= "* ... was AWESOME!/"
	        GS.msg[3]= "* I\'m SOOOO jealous!/"
	        GS.msg[4]= "* She was just standing there&  waiting FOREVER^1, and&  then you just...!!!/"
	        GS.msg[5]= "* C\'mon^1!&* Let\'s go watch her beat&  up some bad guys!/%%"
	    }
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 48
	}
	if(con == 48 and not instance_exists(782/* OBJ_WRITER */)) {
	    mkid.velocity.x= 6
	    mkid.myinteract= 0
	    mkid.image_speed= 0.3
	    mkid.sprite_index= mkid.rsprite
	    con= 48.1
	    if(left == 1) $Alarm4.start((6) / 30.0)
	    else  $Alarm4.start((16) / 30.0)
	}
	if(con == 49.1) {
	    mkid.velocity.x= 0
	    mkid.fun= 1
	    mkid.frame= 0
	    mkid.image_speed= 0.334
	    mkid.sprite_index= 1389/* spr_mkid_trip_r */
	    con= 49.2
	}
	if(con == 49.2 and mkid.frame >= 19) {
	    mkid.frame= 0
	    mkid.x+= 13
	    mkid.sprite_index= mkid.rsprite
	    con= 49.3
	    $Alarm4.start((15) / 30.0)
	}
	if(con == 50.3) {
	    mkid.velocity.x= 4
	    $Alarm4.start((30) / 30.0)
	    con= 49
	}
	if(con == 50) {
	    GS.interact= 0
	    caster_loop(GS.currentsong, 0.8, 1)
	    if(scr_murderlv() >= 8 and GS.flag[27] == 0)
	        caster_set_pitch(GS.currentsong, 0.15)
	    con= 51
	    GS.plot= 106
	    instance_destroy()
	}
	if(con == 90) {
	}
	if(con == 91) {
	    gg= instance_create(0, 0, 92/* obj_musfadeout */)
	    gg.fadespeed= 0.02
	    GS.currentsong= song2
	    con= 5.1
	}

func _on_alarm_0_timeout():
	if(con == 0) con= 1

func _gm_event_7_0():
	if(obj_mainchara.x != obj_mainchara.xprevious or obj_mainchara.y != obj_mainchara.yprevious)
	    helltrigger++

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
