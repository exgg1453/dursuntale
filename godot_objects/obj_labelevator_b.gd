# Auto-converted from GameMaker: obj_labelevator_b
extends Node2D

func _ready():
	scale.x= 4
	scale.y= 3
	rect= 0
	rectaur= 0
	active= 0
	if(GS.flag[493] < 12) {
	    instance_destroy()
	    exit
	} else  {
	    active= 1
	    con= 0
	    exit
	}

func _gm_event_2_4():
	con++

func _on_alarm_0_timeout():
	if(con == 0 and GS.interact == 0) {
	    con= 1
	    GS.interact= 1
	}

func _on_outside_room():
	if(con == 1) {
	    caster_free(-3)
	    snd_play(104/* snd_phone */)
	    GS.typer= 21
	    GS.msc= 0
	    GS.facechoice= 0
	    GS.msg[0]= "* (Ring...)/"
	    GS.msg[1]= "* (It\'s a voice you have&  never heard before.)/%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 2
	}
	if(con == 2 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.typer= 79
	    GS.msg[0]= "* " + GS.charname + "..^1.&* Are you there?/"
	    GS.msg[1]= "* It\'s been a long time^1,&  hasn\'t it...?/"
	    GS.msg[2]= "* But you\'ve done well./"
	    GS.msg[3]= "* Thanks to you^1, everything&  has fallen into place./"
	    GS.msg[4]= "* " + GS.charname + ".../"
	    GS.msg[5]= "* See you soon./%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 3
	}
	if(con == 3 and not instance_exists(782/* OBJ_WRITER */)) {
	    rect= 1
	    snd_play(13/* snd_spearappear */)
	    con= 4
	    $Alarm4.start((9) / 30.0)
	}
	if(con == 5) {
	    snd_play(21/* snd_impact */)
	    con= 6
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 7) {
	    GS.facing= 0
	    la= instance_create(0, 0, 1565/* obj_labelevator_a */)
	    with(la) blacktime= 0
	    con= 8
	}
	if(rect == 1) {
	    if(rectaur < 20) rectaur+= 2
	    draw_set_color(0)
	    draw_rectangle(140, 180, 140 + rectaur, 250, 0)
	    draw_rectangle(180, 180, 180 - rectaur, 250, 0)
	    if(room == 261) {
	        draw_rectangle(0, 120, 99, 120 + rectaur, 0)
	        draw_rectangle(0, 160, 99, 160 - rectaur, 0)
	    }
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
