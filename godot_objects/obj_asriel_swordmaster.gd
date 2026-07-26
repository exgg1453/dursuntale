# Auto-converted from GameMaker: obj_asriel_swordmaster
extends Node2D

func _ready():
	thisx= x
	thisy= y
	sword_b= instance_create(obj_asriel_body.x + 36, obj_asriel_body.y + 35, 590/* obj_asriel_swordarm */)
	sword_a= instance_create(obj_asriel_body.x - 36, obj_asriel_body.y + 35, 590/* obj_asriel_swordarm */)
	sf= 0
	siner= 0
	lastwhich= 0
	lastwhichwhich= 0
	times= 0
	king= 569
	freakcon= 0
	sfx_pb= caster_load("music/sfx/sfx_a_pullback.ogg")
	sfx_cut= caster_load("music/sfx_cinematiccut.ogg")
	sfx_bc= caster_load("music/sfx/sfx_segapower2.ogg")
	sfx_spk= caster_load("music/sfx/sfx_sparkles.ogg")
	sfx_ap= caster_load("music/sfx/sfx_a_swordappear.ogg")
	sfx_grab= caster_load("music/sfx/sfx_a_grab.ogg")
	sfx_jafe= caster_load("music/sfx_voice_jafe.ogg")
	caster_play(sfx_ap, 1, 1)
	last= 0
	never= 0
	h_mode= 0

func _gm_event_1_0():
	caster_free(sfx_pb)
	caster_free(sfx_cut)
	caster_free(sfx_bc)
	caster_free(sfx_spk)
	caster_free(sfx_ap)

func _gm_event_2_6():
	// obj_asriel_swordarm
	with(590) instance_destroy()
	king.bladecon= 10
	instance_destroy()

func _gm_event_2_5():
	maxtime= 5
	if(h_mode > 0) maxtime= 6
	if(times < maxtime) {
	    which= choose(0, 1)
	    if(which == lastwhichwhich and which == lastwhich) {
	        if(which == 0) which= 1
	        else  which= 0
	    }
	    if(h_mode == 0) {
	        if(which == 0) sword_a.timer= 106
	        if(which == 1) sword_b.timer= 106
	    }
	    if(h_mode == 1) {
	        if(which == 0) sword_a.timer= 109
	        if(which == 1) sword_b.timer= 109
	    }
	    if(h_mode == 2) {
	        if(which == 0) sword_a.timer= 112
	        if(which == 1) sword_b.timer= 112
	    }
	    sword_a.h_mode= h_mode
	    sword_b.h_mode= h_mode
	    lastwhichwhich= lastwhich
	    lastwhich= which
	    $Alarm5.start((27) / 30.0)
	    if(h_mode == 1) $Alarm5.start((24) / 30.0)
	    if(h_mode == 2) $Alarm5.start((21) / 30.0)
	} else  {
	    sword_a.timer= 89
	    sword_b.timer= 89
	    obj_asriel_swordarm.twinkle= 1
	    freakcon= 1
	}
	times++
	king.headrot= 0

func _process(delta: float):
	if(x < thisx - 35) x= thisx - 35
	if(x > thisx + 25) x= thisx + 25
	obj_asriel_body.x= x
	obj_asriel_body.y= y
	with(king) {
	    torsorot*= 0.7
	    if(abs(torsorot) <= 1) torsorot= 0
	}
	if(freakcon > 0) {
	    if(freakcon == 1) {
	        ftimer= 0
	        hy= 20
	        fhy= 90
	        freakcon= 2
	        event_user(7)
	    }
	    if(freakcon == 2) {
	        fhy*= 0.8
	        king.heady= fhy / 5 - 18
	        king.headrot-= fhy
	        ftimer++
	        if(ftimer > 34) freakcon= 3
	    }
	    if(freakcon == 3) {
	        $Alarm6.start((20) / 30.0)
	        y+= 2
	        king.heady+= 8
	        king.modulate.a-= 0.1
	        if(king.modulate.a == 0) freakcon= 4
	    }
	}

func _gm_event_7_19():
	if(abs(x - thisx) < 2) x= thisx
	if(x > thisx) x--
	if(x < thisx) x++

func _gm_event_7_18():
	if(never == 0) caster_play(sfx_grab, 1, 1)
	never= 1

func _gm_event_7_17():
	caster_play(sfx_bc, 1, 1)

func _gm_event_7_16():
	if(freakcon == 0) {
	    caster_play(sfx_jafe, 1.2, 1)
	    caster_play(sfx_cut, 0.7, 1.4)
	} else  {
	    if(last == 0) {
	        caster_play(sfx_cut, 0.9, 1)
	        caster_play(sfx_spk, 0.7, 1)
	    } else  last= 1
	}

func _gm_event_7_15():
	caster_play(sfx_pb, 0.9, 1)

func _gm_event_7_13():
	if(x < thisx + 80) {
	    x++
	    if(x < thisx + 25) king.torsorot--
	}
	if(x < thisx + 70) {
	    x+= 2
	    if(x < thisx + 25) king.torsorot-= 2
	}
	if(x < thisx + 60) {
	    x+= 2
	    if(x < thisx + 25) king.torsorot-= 3
	}
	if(x < thisx + 40) {
	    x+= 3
	    if(x < thisx + 25) king.torsorot-= 4
	}
	if(x < thisx + 20) x+= 3
	if(x < thisx) x+= 4
	if(x < thisx - 10) x+= 4

func _gm_event_7_12():
	if(x > thisx - 80) {
	    x--
	    if(x > thisx - 35) king.torsorot++
	}
	if(x > thisx - 70) {
	    x-= 2
	    if(x > thisx - 35) king.torsorot+= 2
	}
	if(x > thisx - 60) {
	    x-= 2
	    if(x > thisx - 35) king.torsorot+= 3
	}
	if(x > thisx - 40) {
	    x-= 3
	    if(x > thisx - 35) king.torsorot+= 4
	}
	if(x > thisx - 20) x-= 3
	if(x > thisx) x-= 4
	if(x > thisx + 10) x-= 4

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
