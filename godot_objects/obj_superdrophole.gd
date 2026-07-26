# Auto-converted from GameMaker: obj_superdrophole
extends Node2D

func _ready():
	myinteract= 0
	scale.x= 1
	scale.y= 1
	image_speed= 0
	touched= 0
	if(y < 60) y+= 2
	sd_noise= 0

func _gm_event_2_3():
	obj_mainchara.modulate.a= 1
	obj_mainchara.velocity.y= 0
	GS.interact= 0
	GS.phasing= 0
	// obj_solidparent
	with(820) solid= 1
	GS.entrance= 2
	instance_create(0, 0, 148/* obj_persistentfader */)
	if(x < 640) room_goto_previous()
	else  room_goto_next()

func _gm_event_2_2():
	GS.interact= 3
	instance_create(0, 0, 149/* obj_unfader */)
	$Alarm3.start((20) / 30.0)

func _gm_event_2_1():
	if(GS.phasing == 1) {
	    GS.interact= 4
	    GS.facing++
	    // obj_solidparent
	    with(820) solid= 0
	    // obj_readablesolid
	    with(1369) solid= 0
	    obj_mainchara.velocity.y= 5
	    obj_mainchara.modulate.a= 0.5
	    if(GS.facing > 3) GS.facing= 0
	    $Alarm1.start((4) / 30.0)
	}

func _on_destroy():
	GS.interact= 4
	GS.phasing= 1
	if(room == 24) GS.flag[51]++
	$Alarm1.start((1) / 30.0)
	$Alarm2.start((2) / 30.0)
	if(sd_noise == 0) {
	    snd_play(134/* snd_fall2 */)
	    // obj_superdrophole
	    with(978) sd_noise= 1
	}

func _on_alarm_0_timeout():
	if(touched == 0) {
	    GS.flag[388]= 1
	    touched= 1
	    $Alarm0.start((1) / 30.0)
	    obj_mainchara.velocity.x= 0
	    obj_mainchara.velocity.y= 0
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
