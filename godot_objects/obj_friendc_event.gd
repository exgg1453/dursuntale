# Auto-converted from GameMaker: obj_friendc_event
extends Node2D

func _ready():
	con= 0
	if(GS.flag[7] == 1 and GS.flag[510] == 2 and caster_is_playing(GS.currentsong) != 1 and GS.flag[7] == 1) {
	    GS.currentsong= caster_load("music/reunited.ogg")
	    caster_loop(GS.currentsong, 1, 1)
	    instance_destroy()
	    exit
	} else  {
	    if(GS.flag[510] == 0 or GS.flag[510] == 2) {
	        instance_destroy()
	        exit
	    } else  {
	        GS.hp= GS.maxhp
	        GS.currentsong= caster_load("music/reunited.ogg")
	        GS.flag[7]= 1
	        GS.flag[287]= 1
	        GS.flag[509]= 0
	        GS.plot= 999
	        // obj_toriel_friendc
	        with(1311) direction= 0
	        // obj_sans_friendc
	        with(1312) direction= 0
	        // obj_asgore_friendc
	        with(1316) direction= 180
	        // obj_alphys_friendc
	        with(1315) direction= 180
	        GS.interact= 1
	        con= 0.1
	        $Alarm4.start((140) / 30.0)
	        blk= 1
	        d_blk= 1
	        exit
	    }
	}

func _gm_event_2_4():
	con++

func _on_outside_room():
	if(con == 1.1) {
	    GS.msc= 0
	    GS.typer= 91
	    SCR_TEXTTYPE(GS.typer)
	    GS.msg[0]= "  Frisk!/"
	    GS.msg[1]= "  This is all just&  a bad dream...!/"
	    GS.msg[2]= "  Please^1, wake up...!/%%"
	    wrwr= instance_create(40, 140, 782/* OBJ_WRITER */)
	    wrwr.z_index= -12000
	    con= 1.9
	    obj_mainchara.x= 140
	    obj_mainchara.y= 125
	    GS.facing= 3
	    obj_mainchara.visible= 0
	    mc= scr_marker(obj_mainchara.x, obj_mainchara.y, 1047)
	    mc.visible= 0
	}
	if(con == 1.9 and instance_exists(782/* OBJ_WRITER */)) {
	    obj_mainchara.x= 140
	    obj_mainchara.y= 125
	    GS.facing= 0
	    obj_mainchara.visible= 0
	    GS.interact= 1
	}
	if(con == 1.9 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 1.8
	    $Alarm4.start((70) / 30.0)
	}
	if(con == 2.8) con= 2
	if(con == 2 and not instance_exists(782/* OBJ_WRITER */)) {
	    mc.visible= 1
	    caster_loop(GS.currentsong, 1, 0.95)
	    d_blk= 2
	    con= 4
	    $Alarm4.start((130) / 30.0)
	}
	if(con == 5) {
	    obj_mainchara.visible= 1
	    with(mc) instance_destroy()
	    con= 6
	    $Alarm4.start((60) / 30.0)
	}
	if(con == 7) {
	    GS.facing= 2
	    con= 8
	    $Alarm4.start((50) / 30.0)
	}
	if(con == 9) {
	    GS.typer= 4
	    GS.msc= 0
	    GS.facechoice= 1
	    GS.faceemotion= 0
	    GS.msg[0]= "* Oh^1!&* You are awake^1!&* Thank goodness!/"
	    scr_alface(1, 9)
	    GS.msg[2]= "* W-we were so&  worried...!/"
	    GS.msg[3]= "* It felt like you&  were out forever!/"
	    scr_undface(4, 9)
	    GS.msg[5]= "* Yeah^1! Any longer and&  I would have freaked&  out!/"
	    GS.msg[6]= "\\E2* Tell us next time&  you decide to take&  a nap^1, okay!?/"
	    scr_sansface(7, 1)
	    GS.msg[8]= "* yeah^1.&* you made papyrus cry&  like a baby./"
	    scr_papface(9, 1)
	    GS.msg[10]= "WHAT!^1!&I DIDN\'T CRY!!^1!&I DON\'T CRY!!/"
	    GS.msg[11]= "\\E3I JUST..^1.&CAUGHT SOMETHING&IN MY EYE./"
	    scr_sansface(12, 1)
	    GS.msg[13]= "* what did you catch?/"
	    scr_papface(14, 8)
	    GS.msg[15]= "TEARS!!!/"
	    scr_asgface(16, 0)
	    GS.msg[17]= "* Now^1, now./"
	    GS.msg[18]= "* The important part&  is that Frisk is&  all right./"
	    GS.msg[19]= "* Here^1, Frisk^1.&* Why not drink some&  tea?/"
	    GS.msg[20]= "* It\'ll make you feel&  better./"
	    scr_torface(21, 1)
	    GS.msg[22]= "* Errr..^1.&* How about we give&  them space^1, first?/"
	    GS.msg[23]= "\\E2* They must be very&  exhausted./"
	    GS.msg[24]= "\\E8* Though^1, from what^1,&  I am not certain./"
	    GS.msg[25]= "\\E1* Frisk..^1.&* We do not remember&  exactly what happened./"
	    GS.msg[26]= "\\E1* There was a flower..^1.&* And then^1, everything&  went white./"
	    GS.msg[27]= "\\E0* But now the barrier&  is gone./"
	    GS.msg[28]= "* When you are ready^1,&  we will all return&  to the surface./"
	    GS.msg[29]= "* It seems the door to&  the east will lead&  us there now./"
	    GS.msg[30]= "\\E2* But before then.../"
	    GS.msg[31]= "\\E0* Perhaps you might&  want to take a&  walk?/"
	    GS.msg[32]= "* You can say goodbye&  to all of your&  wonderful friends./"
	    GS.msg[33]= "* Do as you wish^1.&* We will all wait&  for you here./%%"
	    dd= instance_create(0, 0, 779/* obj_dialoguer */)
	    dd.side= 1
	    con= 10
	}
	if(con == 10 and not instance_exists(782/* OBJ_WRITER */)) {
	    // obj_toriel_friendc
	    with(1311) direction= 270
	    // obj_sans_friendc
	    with(1312) direction= 270
	    // obj_asgore_friendc
	    with(1316) direction= 270
	    // obj_alphys_friendc
	    with(1315) direction= 270
	    GS.interact= 0
	    GS.flag[510]= 2
	    con= 11
	    GS.filechoice= 0
	    scr_save()
	}
	if(d_blk == 1) {
	    draw_set_color(0)
	    draw_rectangle(-10, -10, 999, 999, 0)
	}
	if(d_blk == 2) {
	    blk-= 0.01
	    draw_set_color(0)
	    draw_set_alpha(blk)
	    draw_rectangle(-10, -10, 999, 999, 0)
	    if(blk <= 0) d_blk= 0
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
