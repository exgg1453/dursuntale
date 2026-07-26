# Auto-converted from GameMaker: obj_core_enemyevent
extends Node2D

func _ready():
	scale.x= 6
	con= 0
	GS.flag[200]= 205
	if(GS.plot > 178) instance_destroy()
	if(GS.flag[7] == 1 or GS.flag[8] == 1) {
	    instance_destroy()
	    exit
	} else  exit

func _gm_event_2_4():
	con++

func _process(delta: float):
	if(con == 1) {
	    dm1= instance_create(120, 100, 1260/* obj_darkman_actor */)
	    dm2= instance_create(180, 100, 1260/* obj_darkman_actor */)
	    con= 2
	}
	if(con == 2) {
	    GS.msc= 0
	    GS.facechoice= 0
	    GS.typer= 5
	    if(GS.flag[414] == 0) {
	        snd_play(104/* snd_phone */)
	        GS.msg[0]= "* Ring.../"
	        GS.msg[1]= "\\TS \\E6 \\F6 \\TA %"
	        GS.msg[2]= "* H-hey^1, why don\'t&  you try to use&  the elevator first?/"
	        GS.msg[3]= "* .../%%"
	    }
	    if(GS.flag[414] == 1 and GS.flag[415] == 0) {
	        snd_play(104/* snd_phone */)
	        GS.msg[0]= "* Ring.../"
	        GS.msg[1]= "\\TS \\E6 \\F6 \\TA %"
	        GS.msg[2]= "* H-hey^1, why don\'t&  you try to go&  to the right first?/"
	        GS.msg[3]= "* .../%%"
	    }
	    if(GS.flag[415] == 1 and GS.flag[414] == 1) {
	        snd_play(104/* snd_phone */)
	        GS.msg[0]= "* Ring.../"
	        GS.msg[1]= "\\TS \\E6 \\F6 \\TA %"
	        GS.msg[2]= "* Okay^1, you should&  be able to make&  it through here.../"
	        GS.msg[3]= "* .../%%"
	    }
	    if(GS.flag[367] == 1) donotcall= 1
	    con= 3
	    scr_regulartext()
	}
	if(con == 3 and not instance_exists(782/* OBJ_WRITER */)) {
	    obj_darkman_actor.velocity.y= 3
	    con= 4
	    $Alarm4.start((40) / 30.0)
	}
	if(con == 5) {
	    GS.faceemotion= 3
	    GS.msg[0]= "* W-watch out!/%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 6
	}
	if(con == 6 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 7
	    snd_play(30/* snd_break2 */)
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 8) {
	    GS.mercy= 1
	    GS.flag[15]= 1
	    GS.battlegroup= 59
	    instance_create(0, 0, 142/* obj_battler */)
	    con= 9
	    $Alarm4.start((32) / 30.0)
	}
	if(con == 10) {
	    // obj_darkman_actor
	    with(1260) instance_destroy()
	    GS.interact= 1
	    GS.mercy= 0
	    con= 11
	    $Alarm4.start((20) / 30.0)
	}
	if(con == 11) GS.interact= 1
	if(con == 12) {
	    GS.typer= 47
	    GS.facechoice= 6
	    GS.msc= 0
	    GS.faceemotion= 8
	    GS.msg[0]= "* Th-that was close.../"
	    GS.msg[1]= "* Wh..^1. why are there&  so many monsters&  here?/"
	    GS.msg[2]= "\\E6* I mean..^1.&* It\'s no problem^1,&  r-r-right?/"
	    GS.msg[3]= "* W-w-we\'ve just got&  to keep heading&  forward!/"
	    GS.msg[4]= "\\E9* .../"
	    GS.msg[5]= "\\TS \\F0 \\T0 %"
	    GS.msg[6]= "* (Click...)/%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 13
	}
	if(con == 13 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 14
	    GS.plot= 179
	    GS.interact= 0
	    instance_destroy()
	}
	if(con > 3 and instance_exists(1260/* obj_darkman_actor */) and obj_darkman_actor.y > obj_mainchara.y - 60)
	    obj_darkman_actor.velocity.y= 0

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
