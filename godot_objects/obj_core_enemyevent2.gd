# Auto-converted from GameMaker: obj_core_enemyevent2
extends Node2D

func _ready():
	GS.flag[200]= 205
	scale.x= 6
	con= 0
	if(GS.flag[7] == 1 or GS.flag[8] == 1 or GS.plot > 198) {
	    instance_destroy()
	    exit
	} else  {
	    if(GS.flag[417] == 1) instance_destroy()
	    else  con= 1
	    exit
	}

func _gm_event_2_4():
	con++

func _process(delta: float):
	if(con == 1) {
	    GS.interact= 1
	    dm1= instance_create(120, 100, 1260/* obj_darkman_actor */)
	    dm2= instance_create(180, 100, 1260/* obj_darkman_actor */)
	    con= 6
	}
	if(con == 6 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 7
	    snd_play(30/* snd_break2 */)
	    $Alarm4.start((60) / 30.0)
	}
	if(con == 7) GS.interact= 1
	if(con == 8) {
	    GS.mercy= 1
	    GS.flag[15]= 1
	    GS.battlegroup= 60
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
	    snd_play(104/* snd_phone */)
	    GS.typer= 5
	    GS.facechoice= 0
	    GS.msc= 0
	    GS.faceemotion= 8
	    GS.msg[0]= "* Ring.../"
	    GS.msg[1]= "\\TS \\E3 \\F6 \\TA %"
	    GS.msg[2]= "* Sorry^1, I..^1. I.../"
	    GS.msg[3]= "* I thought that.../"
	    GS.msg[4]= "\\E8* Let\'s try the&  right path instead./"
	    GS.msg[5]= "\\TS \\F0 \\T0 %"
	    GS.msg[6]= "* (Click...)/%%"
	    if(GS.flag[416] == 0) {
	        GS.msg[0]= "* Ring.../"
	        GS.msg[1]= "\\TS \\E3 \\F6 \\TA %"
	        GS.msg[2]= "* A-are you okay?/"
	        GS.msg[3]= "* Why didn\'t you&  head to the&  right...?/"
	        GS.msg[4]= "\\E4* C-C\'mon..^1.&* Y-you trust me^1,&  d-don\'t you?/"
	        GS.msg[5]= "\\TS \\F0 \\T0 %"
	        GS.msg[6]= "* (Click...)/%%"
	    }
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 13
	}
	if(con == 13 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 14
	    GS.flag[417]= 1
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
