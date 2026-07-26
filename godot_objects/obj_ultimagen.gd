# Auto-converted from GameMaker: obj_ultimagen
extends Node2D

func _ready():
	timer= 0
	type= 3
	shotbuffer= 0

func _process(delta: float):
	shotbuffer++
	timer++
	if(type == 0) {
	    if(timer == 8) event_user(8)
	    if(timer > 10 and timer < 19) {
	        ub= instance_create(x, y, 576/* obj_ultimabullet */)
	        ub.side= 0
	        with(ub) event_user(1)
	    }
	    if(timer == 28) event_user(9)
	    if(timer > 30 and timer < 39) {
	        ub= instance_create(x, y, 576/* obj_ultimabullet */)
	        ub.side= 1
	        with(ub) event_user(1)
	    }
	    if(timer == 48) event_user(8)
	    if(timer > 50 and timer < 58) {
	        ub= instance_create(x, y, 576/* obj_ultimabullet */)
	        ub.side= 0
	        with(ub) event_user(1)
	    }
	    if(timer == 68) event_user(9)
	    if(timer > 70 and timer < 78) {
	        ub= instance_create(x, y, 576/* obj_ultimabullet */)
	        ub.side= 1
	        with(ub) event_user(1)
	    }
	    if(timer == 103) {
	        event_user(8)
	        event_user(9)
	    }
	    if(timer > 105 and timer < 117) {
	        ub= instance_create(x, y, 576/* obj_ultimabullet */)
	        ub.side= choose(0, 1)
	        with(ub) event_user(1)
	    }
	}
	if(type == 1) {
	    if(timer == 1) t_c= 0
	    t_c++
	    if(t_c == 2) {
	        ub= instance_create(x, y, 576/* obj_ultimabullet */)
	        sidez= choose(0, 1)
	        ub.side= sidez
	        with(ub) event_user(1)
	        if(sidez == 0) event_user(8)
	        if(sidez == 1) event_user(9)
	        t_c= -1
	    }
	}
	if(type == 2) {
	    if(timer == 1) t_c= 0
	    t_c++
	    if(t_c == 2) {
	        ub= instance_create(x, y, 576/* obj_ultimabullet */)
	        sidez= choose(0, 1)
	        ub.side= sidez
	        with(ub) event_user(1)
	        if(sidez == 0) event_user(8)
	        if(sidez == 1) event_user(9)
	        t_c= 1
	    }
	}
	if(type == 3) {
	    if(timer == 1) t_c= 0
	    t_c++
	    if(t_c == 2) {
	        ub= instance_create(x, y, 576/* obj_ultimabullet */)
	        sidez= choose(0, 1)
	        ub.side= sidez
	        with(ub) event_user(1)
	        if(sidez == 0) event_user(8)
	        if(sidez == 1) event_user(9)
	        t_c= -5
	    }
	}

func _gm_event_5_32():
	if(GS.debug == 1) {
	    ub= instance_create(x, y, 576/* obj_ultimabullet */)
	    ub.side= choose(0, 1)
	    with(ub) event_user(1)
	}

func _gm_event_7_19():
	if(shotbuffer > 3) {
	    borb= instance_create(x, y, 574/* obj_blastorb */)
	    borb.side= 1
	    with(borb) event_user(1)
	    if(instance_exists(568/* obj_afinal_body */)) {
	        // obj_afinal_body
	        with(568) {
	            caster_stop(seg)
	            caster_play(seg, 0.9, 0.8)
	        }
	    }
	    shotbuffer= -1
	}

func _gm_event_7_18():
	if(shotbuffer > 3) {
	    borb= instance_create(x, y, 574/* obj_blastorb */)
	    borb.side= 0
	    with(borb) event_user(1)
	    if(instance_exists(568/* obj_afinal_body */)) {
	        // obj_afinal_body
	        with(568) {
	            caster_stop(seg)
	            caster_play(seg, 0.9, 0.8)
	        }
	    }
	    shotbuffer= -1
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
