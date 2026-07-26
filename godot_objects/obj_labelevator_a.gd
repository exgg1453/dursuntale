# Auto-converted from GameMaker: obj_labelevator_a
extends Node2D

func _ready():
	hshake= 0
	vshake= 0
	con= 2
	redsiner= 0
	dt= 0
	w= 0
	shakevalue= 3
	rs_speed= 0
	blacktime= 0
	sfxtimer= 0
	sfx= caster_load("music/f_destroyed3.ogg")
	expl= caster_load("music/explosion.ogg")
	caster_loop(sfx, 0.8, 1.4)
	pit= 1.4
	vol= 0.8
	hyperboys= 0
	if(room == 261) hyperboys= 1

func _gm_event_2_4():
	con++

func _process_end(delta: float):
	if(dt == 0) {
	    thispic= sprite_create_from_screen_x(0, 0, 640, 480, 0, 0, 0, 0)
	    dt= 1
	}

func _gm_event_7_5():
	sprite_delete(thispic)

func _on_outside_room():
	if(blacktime == 0) {
	    if(dt == 1) {
	        draw_set_color(0)
	        draw_rectangle(-20, -20, 1010, 1010, 0)
	        draw_sprite_ext(thispic, 0, hshake, vshake, 0.5, 0.5, 0, image_blend, 1)
	    }
	    redsiner+= 1 + rs_speed
	    if(hyperboys == 1) redsiner+= 1 + rs_speed
	    hshake= random(shakevalue) - random(shakevalue)
	    vshake= random(shakevalue) - random(shakevalue)
	    image_blend= make_color_rgb(255, 210 + sin(redsiner / 12) * 45, 210 + sin(redsiner / 12) * 45)
	    shakevalue+= 0.008
	    rs_speed+= 0.01
	    if(hyperboys == 1) {
	        shakevalue+= 0.008
	        rs_speed+= 0.01
	    }
	    if(shakevalue > 5) {
	        w+= 0.01
	        if(hyperboys == 1) w+= 0.01
	    } else  caster_set_volume(sfx, vol)
	    if(w > 0) {
	        pit+= 0.01
	        caster_set_pitch(sfx, pit)
	        vol-= 0.01
	        caster_set_volume(sfx, vol)
	        if(hyperboys == 1) {
	            pit+= 0.01
	            caster_set_pitch(sfx, pit)
	            vol-= 0.01
	            caster_set_volume(sfx, vol)
	        }
	        draw_set_alpha(w)
	        draw_set_color(16777215)
	        draw_rectangle(-10, -10, 999, 999, 0)
	        draw_set_alpha(1)
	        if(w > 1.5) {
	            if(hyperboys == 0) {
	                caster_stop(sfx)
	                caster_play(expl, 1, 1)
	                blacktime= 1
	            }
	            if(hyperboys == 1) {
	                caster_free(-3)
	                GS.entrance= 24
	                GS.interact= 0
	                GS.flag[480]= 0
	                instance_create(0, 0, 148/* obj_persistentfader */)
	                get_tree().change_scene_to_file("res://godot_rooms/216.tscn")
	            }
	        }
	    }
	}
	if(blacktime == 1) {
	    draw_set_color(0)
	    draw_rectangle(-20, -20, 1010, 1010, 0)
	    w+= 0.01
	    if(w > 2.6) {
	        caster_free(-3)
	        GS.entrance= 24
	        get_tree().change_scene_to_file("res://godot_rooms/243.tscn")
	    }
	}
	if(con == 2 and hyperboys == 0) {
	    GS.msc= 0
	    GS.typer= 5
	    GS.msg[0]= " WARNING! WARNING^6!%"
	    GS.msg[1]= " ELEVATOR LOSING POWER^6!%"
	    GS.msg[2]= " EM TETHER STABILITY LOST^6!%"
	    GS.msg[3]= " ALTITUDE DROPPING^6!%%"
	    instance_create(40, 10, 782/* OBJ_WRITER */)
	    con= 3
	}
	if(dt == 0) {
	    thispic= sprite_create_from_screen_x(0, 0, 640, 480, 0, 0, 0, 0)
	    dt= 1
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
