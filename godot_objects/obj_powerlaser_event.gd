# Auto-converted from GameMaker: obj_powerlaser_event
extends Node2D

func _ready():
	con= 0
	powered= 0
	drawblack= 0
	i= 0
	repeat(25)  {
	    ge[i]= instance_create(500 + i * 20, 40, 1281/* obj_bluelaser_o */)
	    ge[i].velocity.x= 0
	    ge[i].remembervelocity.x= 0
	    ge[i].active= 1
	    i++
	}
	if(GS.plot > 182) {
	    obj_bluelaser_o.active= 2
	    obj_bluelaser_o.velocity.x= 0
	    obj_bluelaser_o.$Alarm3.start((2) / 30.0)
	    instance_destroy()
	}
	flasher= 0
	remhp= GS.hp
	hptalk= 0

func _gm_event_2_4():
	con++

func _gm_event_2_3():
	ga= 0
	if(powered == 2 and ga == 0) {
	    event_user(0)
	    ga= 1
	}
	if(powered == 1 and ga == 0) {
	    event_user(2)
	    ga= 1
	}
	if(powered == 0 and ga == 0) {
	    event_user(1)
	    ga= 1
	}
	$Alarm3.start((37) / 30.0)

func _gm_event_2_2():
	flasher++
	if(drawblack == 1) drawblack= 0
	else  drawblack= 1
	$Alarm2.start((2) / 30.0)
	snd_play(106/* snd_noise */)
	if(flasher > 5 and drawblack == 0) {
	    $Alarm2.start((-1) / 30.0)
	    event_user(0)
	}

func _process(delta: float):
	if(GS.interact == 0 and obj_mainchara.x > 200 and con == 0) {
	    GS.interact= 1
	    con= 10
	}
	if(con == 10) {
	    snd_play(104/* snd_phone */)
	    GS.msc= 0
	    GS.msg[0]= "* Ring.../"
	    GS.msg[1]= "\\TS \\E3 \\F6 \\TA %"
	    GS.msg[2]= "* M..^1. more lasers.../"
	    GS.msg[3]= "\\E8* Okay^1, I..^1.&* I won\'t mess around&  this time./"
	    GS.msg[4]= "\\E6* I\'ll just deactivate&  the lasers and let&  you through./"
	    GS.msg[5]= "\\E3* .../"
	    GS.msg[6]= "\\E3* They\'re..^1.&* They\'re not turning&  off.../"
	    GS.msg[7]= "\\E8* I can\'t turn them&  off^1, I.../"
	    GS.msg[8]= "\\E6* I-i-it\'s okay^1!&* I have this under&  control!/"
	    GS.msg[9]= "* I\'m going to turn&  off the p-power for&  that whole node./"
	    GS.msg[10]= "* Then you can walk&  across./"
	    GS.msg[11]= "\\E3* .../"
	    GS.msg[12]= "\\E6* Okay^1, go!/"
	    GS.msg[13]= "\\TS \\F0 \\T0 %"
	    GS.msg[14]= "* Click.../%%"
	    if(GS.flag[417] == 0) {
	        GS.msg[0]= "* Ring.../"
	        GS.msg[1]= "\\TS \\E3 \\F6 \\TA %"
	        GS.msg[2]= "* H..^1. huh?&* I..^1. I guess this&  was the right way./"
	        GS.msg[3]= "* M..^1. more lasers.../"
	        GS.msg[4]= "\\E8* Okay^1, I..^1.&* I won\'t mess around&  this time./"
	        GS.msg[5]= "\\E6* I\'ll just deactivate&  the lasers and let&  you through./"
	        GS.msg[6]= "\\E3* .../"
	        GS.msg[7]= "\\E3* They\'re..^1.&* They\'re not turning&  off.../"
	        GS.msg[8]= "\\E8* I can\'t turn them&  off^1, I.../"
	        GS.msg[9]= "\\E6* I-i-it\'s okay^1!&* I have this under&  control!/"
	        GS.msg[10]= "* I\'m going to turn&  off the p-power for&  that whole node./"
	        GS.msg[11]= "* Then you can walk&  across./"
	        GS.msg[12]= "\\E3* .../"
	        GS.msg[13]= "\\E6* Okay^1, go!/"
	        GS.msg[14]= "\\TS \\F0 \\T0 %"
	        GS.msg[15]= "* Click.../%%"
	    }
	    scr_regulartext()
	    con= 11
	}
	if(con == 11 and not instance_exists(782/* OBJ_WRITER */) and OBJ_WRITER.stringno == 12 and powered == 0)
	    event_user(1)
	if(con == 11 and not instance_exists(782/* OBJ_WRITER */)) {
	    ff= instance_create(20, 80, 1183/* obj_kitchenforcefield */)
	    ff.scale.y= 5
	    con= 12
	    GS.interact= 0
	}
	if(con == 12 and obj_mainchara.x > 580 and GS.interact == 0) {
	    GS.interact= 1
	    con= 13
	}
	if(con == 13) {
	    snd_play(104/* snd_phone */)
	    GS.msc= 0
	    GS.msg[0]= "* Ring.../"
	    GS.msg[1]= "\\TS \\E3 \\F6 \\TA %"
	    GS.msg[2]= "* W-WAIT^1!&* STOP!/%%"
	    scr_regulartext()
	    con= 14
	}
	if(con == 14 and not instance_exists(782/* OBJ_WRITER */)) {
	    event_user(2)
	    con= 15
	    $Alarm4.start((45) / 30.0)
	}
	if(con == 16) {
	    GS.msc= 0
	    GS.msg[0]= "\\E8* Th-the power..^1.&* It\'s turning itself&  back on./"
	    GS.msg[1]= "\\E9* D-damn it..^1.&* Th-this isn\'t supposed&  to.../"
	    GS.msg[2]= "* I.../"
	    GS.msg[3]= "\\E3* I\'m gonna turn&  it off again./"
	    GS.msg[4]= "* When it turns off^1,&  move a little^1, and&  then STOP./"
	    GS.msg[5]= "\\E8* OK^1?&* Y-you won\'t get&  h-h-hurt./"
	    GS.msg[6]= "\\TS \\F0 \\T0 %"
	    GS.msg[7]= "* Click.../%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 17
	}
	if(con == 17 and not instance_exists(782/* OBJ_WRITER */)) {
	    remhp= GS.hp
	    GS.interact= 0
	    flasher= 0
	    event_user(1)
	    con= 18
	    $Alarm3.start((37) / 30.0)
	    backuptimer= 10
	}
	if(con == 18) {
	    if($Alarm3.start((= -1) backuptimer--) / 30.0)
	    else  backuptimer= 8
	    if(backuptimer < 0) $Alarm3.start((37) / 30.0)
	}
	if(con == 18 and GS.hp < remhp and hptalk == 0) {
	    snd_play(104/* snd_phone */)
	    GS.msc= 0
	    GS.msg[0]= "* Ring.../"
	    GS.msg[1]= "\\TS \\E3 \\F6 \\TA %"
	    GS.msg[2]= "* Oh my god^1, are&  you okay!?/"
	    GS.msg[3]= "\\E8* I-I c-couldn\'t keep&  the power off&  long enough.../"
	    GS.msg[4]= "\\E6* No^1, no^1, we\'ve&  got this^1, it\'s just&  a little further!/"
	    GS.msg[5]= "\\TS \\F0 \\T0 %"
	    GS.msg[6]= "* Click.../%%"
	    con= 19
	    hptalk= 1
	    scr_regulartext()
	    GS.interact= 1
	}
	if(con == 19 and hptalk == 1) GS.interact= 1
	if(con == 19 and not instance_exists(782/* OBJ_WRITER */) and hptalk == 1) {
	    hptalk= 2
	    GS.interact= 0
	    con= 18
	}
	if(con == 18 and obj_mainchara.x > 1040) {
	    GS.interact= 1
	    con= 22
	}
	if(con == 22) {
	    snd_play(104/* snd_phone */)
	    GS.msc= 0
	    GS.msg[0]= "* Ring.../"
	    GS.msg[1]= "\\TS \\E6 \\F6 \\TA %"
	    GS.msg[2]= "* S-see^1?&* I\'ve got everything&  under control./"
	    GS.msg[3]= "* Everything\'s under&  control!/"
	    GS.msg[4]= "\\TS \\F0 \\T0 %"
	    GS.msg[5]= "* Click.../%%"
	    con= 23
	    hptalk= 1
	    scr_regulartext()
	    $Alarm3.start((-1) / 30.0)
	    powered= 0
	    drawblack= 0
	    obj_bluelaser_o.active= 2
	    // obj_kitchenforcefield
	    with(1183) instance_destroy()
	    instance_create(60, 120, 1339/* obj_stalkerflowey */)
	    GS.plot= 184
	}
	if(con == 23 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.interact= 0
	    con= 24
	    instance_destroy()
	}

func _gm_event_7_12():
	powered= 2
	$Alarm2.start((1) / 30.0)
	flasher= 0

func _gm_event_7_11():
	drawblack= 1
	powered= 1
	// obj_coreobj_parent
	with(26) {
	    image_speed= 0
	    frame= 0
	    powered= 0
	}
	obj_bluelaser_o.active= 2
	obj_bluelaser_o.velocity.x= 0
	obj_bluelaser_o.remembervelocity.x= 0
	snd_play(106/* snd_noise */)

func _gm_event_7_10():
	drawblack= 0
	powered= 0
	obj_bluelaser_o.active= 1
	obj_bluelaser_o.velocity.x= 0
	obj_bluelaser_o.remembervelocity.x= 0
	snd_play(106/* snd_noise */)
	// obj_coreobj_parent
	with(26) {
	    image_speed= 0.125
	    frame= 0
	    powered= 1
	}

func _on_outside_room():
	if(drawblack == 1) {
	    draw_set_alpha(0.5)
	    draw_set_color(0)
	    draw_rectangle(-10, -10, get_viewport_rect().size.x + 10, get_viewport_rect().size.y + 10, 0)
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
