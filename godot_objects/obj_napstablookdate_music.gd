# Auto-converted from GameMaker: obj_napstablookdate_music
extends Node2D

func _ready():
	if(GS.flag[7] == 1) {
	    instance_destroy()
	    exit
	} else  {
	    if(instance_number(object_index) < 2) {
	        spoopy= caster_load("music/spoopy.ogg")
	        spoopywave= caster_load("music/spoopy_wave.ogg")
	        spoopyholiday= caster_load("music/spoopy_holiday.ogg")
	        napstachords= caster_load("music/napstachords.ogg")
	    } else  instance_destroy()
	    songplaying= 0
	    fadeout= 0
	    curvol= 0
	    con= 0
	    exit
	}

func _on_destroy():
	caster_loop(GS.currentsong, 1, 1)
	curvol= 1
	songplaying= 1

func _process(delta: float):
	if(fadeout == 1) {
	    curvol-= 0.02
	    if(songplaying == 2) curvol+= 0.015
	    if(curvol <= 0) curvol= 0
	    if(songplaying == 1)
	        caster_set_volume(GS.currentsong, curvol)
	    if(songplaying == 2)
	        caster_set_volume(napstachords, curvol)
	    if(songplaying == 3) caster_set_volume(spoopy, curvol)
	    if(songplaying == 4) caster_set_volume(spoopywave, curvol)
	    if(songplaying == 5)
	        caster_set_volume(spoopyholiday, curvol)
	    if(curvol == 0) {
	        if(songplaying == 1) caster_stop(GS.currentsong)
	        if(songplaying == 2) caster_stop(napstachords)
	        if(songplaying == 3) caster_stop(spoopy)
	        if(songplaying == 4) caster_stop(spoopywave)
	        if(songplaying == 5) caster_stop(spoopyholiday)
	        songplaying= 0
	        fadeout= 0
	    }
	}
	if(fadeout == 2) {
	    curvol+= 0.02
	    if(songplaying == 2) curvol-= 0.015
	    if(curvol >= 1) curvol= 1
	    if(songplaying == 1)
	        caster_set_volume(GS.currentsong, curvol)
	    if(songplaying == 2)
	        caster_set_volume(napstachords, curvol)
	    if(songplaying == 3) caster_set_volume(spoopy, curvol)
	    if(songplaying == 4) caster_set_volume(spoopywave, curvol)
	    if(songplaying == 5)
	        caster_set_volume(spoopyholiday, curvol)
	    if(curvol == 1) fadeout= 0
	}
	if(con == 1) {
	    GS.flag[94]= 1
	    if(songplaying == 1) caster_stop(GS.currentsong)
	    if(songplaying == 2) caster_stop(napstachords)
	    if(songplaying == 3) caster_stop(spoopy)
	    if(songplaying == 4) caster_stop(spoopywave)
	    if(songplaying == 5) caster_stop(spoopyholiday)
	    caster_loop(spoopy, 1, 1)
	    songplaying= 3
	    curvol= 1
	    con= 0
	}
	if(con == 2) {
	    GS.flag[94]= 0
	    if(songplaying == 1) caster_stop(GS.currentsong)
	    if(songplaying == 2) caster_stop(napstachords)
	    if(songplaying == 3) caster_stop(spoopy)
	    if(songplaying == 4) caster_stop(spoopywave)
	    if(songplaying == 5) caster_stop(spoopyholiday)
	    caster_loop(GS.currentsong, 1, 1)
	    songplaying= 1
	    curvol= 1
	    con= 0
	}
	if(con == 3) {
	    GS.flag[94]= 2
	    if(songplaying == 1) caster_stop(GS.currentsong)
	    if(songplaying == 2) caster_stop(napstachords)
	    if(songplaying == 3) caster_stop(spoopy)
	    if(songplaying == 4) caster_stop(spoopywave)
	    if(songplaying == 5) caster_stop(spoopyholiday)
	    caster_loop(spoopywave, 1, 1)
	    songplaying= 4
	    curvol= 1
	    con= 0
	}
	if(con == 4) {
	    GS.flag[94]= 3
	    if(songplaying == 1) caster_stop(GS.currentsong)
	    if(songplaying == 2) caster_stop(napstachords)
	    if(songplaying == 3) caster_stop(spoopy)
	    if(songplaying == 4) caster_stop(spoopywave)
	    if(songplaying == 5) caster_stop(spoopyholiday)
	    caster_loop(spoopyholiday, 1, 1)
	    songplaying= 5
	    curvol= 1
	    con= 0
	}

func _gm_event_7_17():
	if(songplaying == 1) {
	    fadeout= 1
	    curvol= 1
	}
	if(songplaying != 1) {
	    songplaying= 1
	    curvol= 0.5
	    fadeout= 2
	    caster_loop(GS.currentsong, 0.5, 1)
	}

func _gm_event_7_13():
	if(songplaying == 2) {
	    fadeout= 1
	    curvol= 1
	}
	if(songplaying != 2 and fadeout == 0) {
	    songplaying= 2
	    curvol= 0
	    fadeout= 2
	    if(caster_is_playing(napstachords) == 0)
	        caster_loop(napstachords, 0, 0.4)
	}

func _gm_event_7_12():
	GS.currentsong= caster_load("music/napstahouse.ogg")

func _gm_event_7_11():
	caster_free(spoopy)
	caster_free(spoopywave)
	caster_free(spoopyholiday)
	caster_free(napstachords)
	GS.flag[94]= 0
	instance_destroy()

func _gm_event_7_4():
	check= 0
	if(room == 120) {
	    event_user(2)
	    if(GS.flag[94] == 0) $Alarm0.start((15) / 30.0)
	    check= 1
	}
	if(room == 119 or room == 272 or room == 116 or room == 306)
	    check= 1
	if(check == 0) event_user(1)

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
