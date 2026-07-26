# Auto-converted from GameMaker: obj_asrielpanels
extends Node2D

func _ready():
	active= 0
	$Alarm5.start((90) / 30.0)
	modulate.a= 0
	image_speed= 0
	thisvol= 1

func _gm_event_2_5():
	GS.batmusic= caster_load("music/xpart_a.ogg")
	GS.batmusic2= caster_load("music/xpart_b.ogg")
	caster_play(GS.batmusic, 1, 0.85)
	memtimer= 0
	modulate.a= 0
	on= 1
	image_speed= 0
	rev_alpha= 0
	xtimer= 0
	GS.inbattle= 1
	active= 1

func _gm_event_7_10():
	thisvol-= 0.2
	caster_set_volume(GS.batmusic, thisvol)
	caster_set_volume(GS.batmusic2, thisvol)

func _on_outside_room():
	if(active == 1) {
	    if(on < 3)
	        draw_sprite_ext(sprite_index, frame, 120, 56, 2, 2, 0, 16777215, modulate.a)
	    if(on == 1 and modulate.a < 1)
	        modulate.a+= 0.06
	    if(on == 0 and modulate.a > 0) {
	        if(frame < 4) modulate.a-= 0.06
	        else  {
	            on= 2
	            memtimer= 250
	            wht= 0
	        }
	    }
	    memtimer++
	    if(memtimer == 120) on= 0
	    if(memtimer == 138) frame++
	    if(memtimer == 141) {
	        on= 1
	        memtimer= 0
	    }
	    if(on == 2) {
	        wht+= 0.02
	        draw_set_alpha(wht)
	        draw_set_color(16777215)
	        draw_rectangle(-10, -10, 999, 999, 0)
	        draw_set_alpha(1)
	        if(wht > 1.18) {
	            on= 3
	            GS.battlegroup= 256
	            GS.flag[501]= 3
	            get_tree().change_scene_to_file("res://godot_rooms/306.tscn")
	        }
	    }
	    if(on == 3) {
	        wht-= 0.05
	        draw_set_alpha(wht)
	        draw_set_color(16777215)
	        draw_rectangle(-10, -10, 999, 999, 0)
	        draw_set_alpha(1)
	        if(wht < 0) on= 4
	    }
	    xtimer++
	    qual= 0
	    if(xtimer == 2263) qual= 1
	    if(caster_is_playing(GS.batmusic) == 0 and caster_is_playing(GS.batmusic2) == 0)
	        qual= 1
	    if(qual == 1) {
	        xtimer= 2266
	        caster_loop(GS.batmusic2, thisvol, 0.85)
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
