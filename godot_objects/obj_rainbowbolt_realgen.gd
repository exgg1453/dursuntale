# Auto-converted from GameMaker: obj_rainbowbolt_realgen
extends Node2D

func _ready():
	con= 0
	timer= 0
	i= 0
	lithit= caster_load("music/sfx/sfx_a_lithit.ogg")
	lithit2= 168
	audio_sound_gain(lithit, 1, 0)
	audio_sound_gain(lithit2, 1, 0)
	audio_sound_pitch(lithit, 1)
	audio_sound_pitch(lithit2, 1)
	er= caster_load("music/sfx/sfx_menu_error.ogg")
	hit= 0
	rr= 0
	h_mode= 0
	l_buffer= 0
	o_o= 0
	perturn= 0
	lh= 0

func _gm_event_1_0():
	caster_free(lithit)
	caster_free(er)

func _process(delta: float):
	l_buffer--
	timer++
	if(h_mode == 0) {
	    if(timer > 1 and timer < 10) {
	        caster_stop(er)
	        instance_create(-80 + x + i / 8 * 640 + 20, 360, 584/* obj_rainbowtarget */)
	        i++
	    }
	    if(timer > 21 and timer < 30) {
	        caster_stop(er)
	        instance_create(-80 + x + i / 8 * 640 - 20, 360, 584/* obj_rainbowtarget */)
	        i--
	    }
	    if(timer > 41 and timer < 50) {
	        caster_stop(er)
	        instance_create(-80 + x + i / 8 * 640 + 20, 360, 584/* obj_rainbowtarget */)
	        i++
	    }
	    if(timer > 61 and timer < 70) {
	        caster_stop(er)
	        instance_create(-80 + x + i / 8 * 640 - 20, 360, 584/* obj_rainbowtarget */)
	        i--
	    }
	    if(timer == 90) {
	        gg= instance_create(200, 360, 584/* obj_rainbowtarget */)
	        gg.giga= 1
	        gg.scale.x= 3
	        gg.scale.y= 3
	        gg= instance_create(320, 360, 584/* obj_rainbowtarget */)
	        gg.giga= 1
	        gg.scale.x= 3
	        gg.scale.y= 3
	        gg= instance_create(440, 360, 584/* obj_rainbowtarget */)
	        gg.giga= 1
	        gg.scale.x= 3
	        gg.scale.y= 3
	    }
	    if(timer == 106) {
	        gg= instance_create(260, 360, 584/* obj_rainbowtarget */)
	        gg.giga= 1
	        gg.scale.x= 3
	        gg.scale.y= 3
	        gg= instance_create(380, 360, 584/* obj_rainbowtarget */)
	        gg.giga= 1
	        gg.scale.x= 3
	        gg.scale.y= 3
	    }
	    if(timer == 122) {
	        gg= instance_create(200, 360, 584/* obj_rainbowtarget */)
	        gg.giga= 1
	        gg.scale.x= 3
	        gg.scale.y= 3
	        gg= instance_create(320, 360, 584/* obj_rainbowtarget */)
	        gg.giga= 1
	        gg.scale.x= 3
	        gg.scale.y= 3
	        gg= instance_create(440, 360, 584/* obj_rainbowtarget */)
	        gg.giga= 1
	        gg.scale.x= 3
	        gg.scale.y= 3
	    }
	}
	if(h_mode == 1) {
	    if(timer > 1 and timer < 10) {
	        caster_stop(er)
	        instance_create(-80 + x + i / 8 * 640 + 20, 360, 584/* obj_rainbowtarget */)
	        i++
	    }
	    if(timer > 17 and timer < 27) {
	        caster_stop(er)
	        instance_create(-80 + x + i / 8 * 640 - 20, 360, 584/* obj_rainbowtarget */)
	        i--
	    }
	    if(timer > 34 and timer < 44) {
	        caster_stop(er)
	        instance_create(-80 + x + i / 8 * 640 + 20, 360, 584/* obj_rainbowtarget */)
	        i++
	    }
	    if(timer > 54 and timer < 70) {
	        caster_stop(er)
	        instance_create(obj_heart.x + 8, 360, 584/* obj_rainbowtarget */)
	        i++
	    }
	    if(timer == 76 or timer == 91 or timer == 106 or timer == 121 or timer == 136) {
	        caster_stop(er)
	        gg= instance_create(200 + rr * 60, 360, 584/* obj_rainbowtarget */)
	        gg.giga= 1
	        gg.scale.x= 3
	        gg.scale.y= 3
	        rr++
	    }
	}

func _gm_event_7_11():
	// obj_vsflowey_shaker
	with(1582) instance_destroy()
	shk= instance_create(0, 0, 1582/* obj_vsflowey_shaker */)
	shk.shakex= 8
	shk.shakey= 8
	if(h_mode == 0) {
	    if(hit == 0) caster_play_l(lithit, 0.8, 0.75)
	    if(hit == 3) caster_play_l(lithit2, 0.8, 0.65)
	    if(hit == 5) caster_play_l(lithit, 0.9, 0.9)
	}
	if(h_mode == 1) {
	    if(hit == 0) caster_play_l(lithit, 0.8, 0.6)
	    if(hit == 1) caster_play_l(lithit2, 0.8, 0.65)
	    if(hit == 2) caster_play_l(lithit, 0.8, 0.7)
	    if(hit == 3) caster_play_l(lithit2, 0.8, 0.75)
	    if(hit == 4) caster_play_l(lithit, 0.8, 0.8)
	}
	hit++

func _gm_event_7_10():
	if(l_buffer <= 0) {
	    if(o_o == 0) {
	        // obj_vsflowey_shaker
	        with(1582) instance_destroy()
	        shk= instance_create(0, 0, 1582/* obj_vsflowey_shaker */)
	        shk.shakex= 3
	        shk.shakey= 3
	    }
	    if(o_o == 0) o_o= 1
	    else  o_o= 0
	    if(o_o == 0) this_hit= lithit
	    if(o_o == 1) this_hit= lithit2
	    if(lh > 0) {
	    }
	    jr[lh]= _play_sound("this_hit")
	    audio_sound_pitch(jr[lh], 0.6)
	    audio_sound_gain(jr[lh], 0.44, 0)
	    // obj_rainbowbolt_realgen
	    with(586) l_buffer= 1
	    if(GS.osflavor != 1) {
	        // obj_rainbowbolt_realgen
	        with(586) l_buffer= 2
	    }
	    lh++
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
