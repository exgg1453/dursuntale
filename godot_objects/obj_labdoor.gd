# Auto-converted from GameMaker: obj_labdoor
extends Node2D

func _ready():
	type= 2
	s_buffer= 10
	o_sound= 0
	c_sound= 0
	s_sound= 0
	open= -1
	ox= 0
	anim= 0
	red= 0
	yel= 0
	gre= 0
	blu= 0
	if(GS.flag[481] == 3) red= 1
	if(GS.flag[482] == 3) blu= 1
	if(GS.flag[483] == 3) gre= 1
	if(GS.flag[484] == 3) yel= 1
	if(room == 244) {
	    if(GS.entrance == 1) $Alarm0.start((1) / 30.0)
	    shouldopen= 0
	    type= 0
	    GS.flag[480]= 1
	    // obj_mainchara
	    with(1570) image_blend= merge_color(8421504, 16777215, 0.3)
	}
	if(room == 246 and x < get_viewport_rect().size.x * 2 / 3) {
	    shouldopen= 0
	    type= 1
	    if(red == 1 and blu == 1 and gre == 1 and yel == 1)
	        shouldopen= 1
	    GS.flag[480]= 1
	    // obj_mainchara
	    with(1570) image_blend= merge_color(8421504, 16777215, 0.3)
	}
	if(room == 246 and x > get_viewport_rect().size.x * 2 / 3) {
	    shouldopen= 0
	    type= 2
	    if(red == 1) shouldopen= 1
	    if(GS.entrance == 20) open= 1
	}
	s1= instance_create(x, y + 40, 2/* obj_solidsmall */)
	s2= instance_create(x + 20, y + 40, 2/* obj_solidsmall */)
	myinteract= 0
	if(GS.entrance == 19) $Alarm0.start((1) / 30.0)

func _on_destroy():
	open= 1
	ox= 20
	with(s1) instance_destroy()
	with(s2) instance_destroy()

func _on_outside_room():
	s_buffer++
	draw_set_color(0)
	draw_rectangle(x, y, x + 40, y + 60, 0)
	if(open == 1) {
	    if(is_instance_valid(s1)) {
	        with(s1) instance_destroy()
	        with(s2) instance_destroy()
	    }
	    if(ox < 20) {
	        ox+= 2
	        c_sound= 0
	        s_sound= 0
	    }
	    if(ox >= 20) ox= 30
	}
	if(open == 0) {
	    if(not is_instance_valid(s1)) {
	        s1= instance_create(x, y + 40, 2/* obj_solidsmall */)
	        s2= instance_create(x + 20, y + 40, 2/* obj_solidsmall */)
	    }
	    if(ox > 0) {
	        ox-= 2
	        o_sound= 0
	    }
	    if(ox < 0) {
	        ox= 0
	        if(s_sound == 0) {
	            snd_play(123/* snd_elecdoor_shutheavy */)
	            s_sound= 1
	        }
	    }
	}
	anim++
	if(ox < 20) {
	    draw_sprite_part(2098, 0, ox, 0, 20 - ox, 60, x, y)
	    draw_sprite_part(2099, 0, 0, 0, 20 - ox, 60, x + 20 + ox, y)
	    if(type == 1) {
	        draw_sprite_part(2104, 0, ox, 0, 20 - ox, 60, x, y)
	        if(red == 1)
	            draw_sprite_part(2105, floor(anim / 5), ox, 0, 19 - ox, 12, x, y + 12)
	        if(yel == 1)
	            draw_sprite_part(2106, floor(anim / 5), ox, 0, 19 - ox, 12, x, y + 25)
	        draw_sprite_part(2109, 0, 0, 0, 20 - ox, 60, x + 20 + ox, y)
	        if(blu == 1)
	            draw_sprite_part(2107, floor(anim / 5), 0, 0, 17 - ox, 10, x + 23 + ox, y + 13)
	        if(gre == 1)
	            draw_sprite_part(2108, floor(anim / 5), 0, 0, 17 - ox, 10, x + 23 + ox, y + 26)
	    }
	    if(type == 2) {
	        draw_sprite_part(2100, 0, ox, 0, 20 - ox, 37, x, y)
	        draw_sprite_part(2101, 0, 0, 0, 20 - ox, 37, x + 20 + ox, y)
	        if(red == 1) {
	            w= 13 - ox
	            if(w < 0) w= 0
	            draw_sprite_part(2103, floor(anim / 5), ox, 0, w, 15, x + 7, y + 18)
	            w= 15 - ox
	            if(w < 0) w= 0
	            draw_sprite_part(2102, floor(anim / 5), 0, 0, w, 15, x + 20 + ox, y + 18)
	        }
	    }
	}
	draw_sprite(2097/* spr_door_edge */, 0, x - 4, y - 3)
	if(instance_exists(1570/* obj_mainchara */)) {
	    if(point_distance(x + 20, y + 60, obj_mainchara.x + 10, obj_mainchara.bbox_top) > 50) {
	        if(open == 1) caster_play(120, 1, 1)
	        open= 0
	    }
	    if(point_distance(x + 20, y + 60, obj_mainchara.x + 10, obj_mainchara.bbox_top) < 40 and shouldopen == 1) {
	        if(open == 0) caster_play(121, 1, 1)
	        open= 1
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
