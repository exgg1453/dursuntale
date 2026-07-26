# Auto-converted from GameMaker: obj_precore_event
extends Node2D

func _ready():
	con= 0
	if(GS.plot > 175) instance_destroy()
	else  {
	    dm1= instance_create(140, 150, 1260/* obj_darkman_actor */)
	    dm2= instance_create(160, 150, 1260/* obj_darkman_actor */)
	}
	scale.y= 1
	scale.x= 4

func _gm_event_2_4():
	con++

func _process(delta: float):
	if(con == 1) {
	    obj_mainchara.cutscene= 1
	    view_object[0]= -4
	    con= 2
	    remy= view_yview[0]
	}
	if(con == 2) {
	    view_yview[0]-= 3
	    if(view_yview[0] <= 122) {
	        view_yview[0]= 120
	        con= 3
	    }
	}
	if(con == 3) {
	    con= 4
	    $Alarm4.start((20) / 30.0)
	}
	if(con == 5) {
	    // obj_darkman_actor
	    with(1260) mov= 1
	    snd_play(104/* snd_phone */)
	    GS.plot= 176
	    GS.msc= 0
	    GS.facechoice= 0
	    GS.typer= 5
	    GS.msg[0]= "* Ring.../"
	    GS.msg[1]= "\\TS \\E3 \\F6 \\TA %"
	    GS.msg[2]= "* Huh^1?&* Who are they?/"
	    GS.msg[3]= "* N-nobody else is&  s-supposed to be&  here.../"
	    GS.msg[4]= "\\E6* Oh well^1!&* We can\'t worry&  about that now!/"
	    GS.msg[5]= "\\TS \\F0 \\T0 %"
	    GS.msg[6]= "* Click.../%%"
	    ge= instance_create(0, 0, 779/* obj_dialoguer */)
	    ge.side= 1
	    con= 6
	}
	if(con == 6 and not instance_exists(782/* OBJ_WRITER */)) con= 7
	if(con == 7) {
	    view_yview[0]+= 5
	    if(view_yview[0] >= remy - 2) {
	        view_yview[0]= remy
	        con= 8
	    }
	}
	if(con == 8) {
	    obj_mainchara.cutscene= 0
	    view_object[0]= 1570
	    GS.interact= 0
	    con= 9
	    instance_destroy()
	}

func _on_alarm_0_timeout():
	if(con == 0 and GS.interact == 0) {
	    con= 1
	    GS.interact= 1
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
