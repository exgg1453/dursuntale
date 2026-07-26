# Auto-converted from GameMaker: obj_asrielbed
# GM parent: obj_readable
extends Node2D

func _ready():
	myinteract= 0
	read= 0
	scale.x= 1
	jump= 0
	scale.y= 1.5
	volume= 1
	if(GS.plot == 0) instance_destroy()

func _gm_event_2_3():
	// obj_mainchara
	with(1570) path_start(1/* path_unbed */, 2, 0, 0/* path_action_stop */)
	jump= 3

func _gm_event_2_2():
	if(GS.plot >= 24 and jump < 5) {
	    GS.typer= 31
	    GS.faceemotion= 0
	    GS.facechoice= 0
	    GS.msc= 0
	    GS.msg[0]= "* " + GS.charname + "^1, please.../"
	    GS.msg[1]= "* Wake up!/"
	    GS.msg[2]= "* You are the future&  of humans and&  monsters.../%%"
	    if(GS.flag[7] == 1) {
	        GS.typer= 5
	        GS.msg[0]= "* (It felt strange to lie&  in the bed.)/"
	        GS.msg[1]= "* (It feels entirely too&  small for you now.)/%%"
	    }
	    obj_asriellamp.idealvolume[0]= 0
	    obj_asriellamp.idealvolume[1]= 0
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    // obj_dialoguer
	    with(779) z_index= -999999
	    if(instance_exists(782/* OBJ_WRITER */)) {
	        // OBJ_WRITER
	        with(782) z_index= -9999999
	    }
	    jump= 5
	}
	if(jump == 5) $Alarm2.start((2) / 30.0)
	if(not instance_exists(779/* obj_dialoguer */)) {
	    jump= 6
	    background_visible[1]= 0
	    background_visible[0]= 1
	    if(GS.plot < 20) background_visible[2]= 1
	    GS.facing= 3
	    obj_mainchara.x= 200
	    obj_mainchara.y= 104
	    GS.hp= GS.maxhp
	    if(instance_exists(149/* obj_unfader */)) {
	        // obj_unfader
	        with(149) instance_destroy()
	    }
	    instance_create(0, 0, 147/* obj_fader */)
	    obj_asriellamp.idealvolume[0]= 0
	    obj_asriellamp.idealvolume[1]= 1
	    if(GS.flag[103] == 0 and GS.plot < 20) {
	        GS.flag[103]= 1
	        instance_create(142, 132, 848/* obj_pie_pickup */)
	    }
	    $Alarm3.start((60) / 30.0)
	}

func _on_destroy():
	snd_play(106/* snd_noise */)
	GS.phasing= 1
	obj_solidsmall.solid= 0
	// obj_mainchara
	with(1570) path_start(0/* path_bedjump */, 3, 0, 0/* path_action_stop */)
	jump= 1
	GS.facing= 2
	GS.interact= 1

func _process_begin(delta: float):
	if(jump == 1 and obj_mainchara.path_position == 1) {
	    instance_create(0, 0, 149/* obj_unfader */)
	    $Alarm2.start((60) / 30.0)
	    jump= 2
	}
	if(jump == 3 and obj_mainchara.path_position == 1) {
	    GS.interact= 0
	    myinteract= 0
	    jump= 0
	    background_visible[2]= 0
	    obj_solidsmall.solid= 1
	    GS.phasing= 0
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
