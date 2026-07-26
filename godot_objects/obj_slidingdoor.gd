# Auto-converted from GameMaker: obj_slidingdoor
extends Node2D

func _ready():
	slidedoorx= 0
	on= 0
	active= 0
	salad= instance_create(888, 80, 2/* obj_solidsmall */)
	if(GS.flag[493] >= 10 and GS.flag[7] == 0) {
	    active= 1
	    door= instance_create(salad.x, salad.y - 4, 789/* obj_door_s_musfade */)
	    with(salad) instance_destroy()
	    instance_create(890, 130, 1348/* obj_readable_room5 */)
	    pape= scr_marker(890, 130, 1286)
	    pape.z_index= 900000
	}
	o_noise= 0
	c_noise= 0
	s_noise= 0

func _gm_event_7_11():
	on= -1

func _gm_event_7_10():
	on= 1

func _on_outside_room():
	draw_sprite(1863/* spr_slidingdoor */, 0, x + slidedoorx, y)
	draw_sprite(sprite_index, 0, x, y)
	if(active == 1 and instance_exists(1570/* obj_mainchara */)) {
	    if(distance_to_object(1570) < 40 and on == -1 or on == 0)
	        on= 1
	    if(distance_to_object(1570) > 60 and on == 1 or on == 0)
	        on= -1
	}
	if(on == 1) {
	    c_noise= 0
	    s_noise= 0
	    if(o_noise == 0) {
	        snd_play(121/* snd_elecdoor_open */)
	        o_noise= 1
	    }
	    if(slidedoorx < 40) slidedoorx+= 5
	    else  {
	        on= 0
	        if(active == 0) snd_play(122/* snd_elecdoor_shut */)
	    }
	}
	if(on == -1) {
	    o_noise= 0
	    s_noise= 0
	    if(c_noise == 0) {
	        snd_play(120/* snd_elecdoor_close */)
	        c_noise= 1
	    }
	    if(slidedoorx > 0) slidedoorx-= 5
	    else  {
	        slidedoorx= 0
	        on= 0
	        if(active == 0) snd_play(122/* snd_elecdoor_shut */)
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
