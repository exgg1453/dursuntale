# Auto-converted from GameMaker: obj_wrapshock
extends Node2D

func _ready():
	type= 0
	siner= 0
	oo= 0
	mf= 1
	siner= random(360)
	shock= 0
	face= 0
	s_timer= 0
	click= 0
	$Alarm2.start((2) / 30.0)
	freeze= 0

func _gm_event_2_2():
	visible= 1

func _on_outside_room():
	if(oo == 0) oo= 1
	else  oo= 0
	if(freeze == 0) siner++
	s_timer++
	if(s_timer > 60) shock= 0
	ss= sin(siner / 6) * 90 * mf
	ii= -sin(siner / 6) * mf
	if(mf < 1 and y < 0) y++
	if(type == 0) {
	    if(mf < 1 and y < -30) y++
	    x+= cos(siner / 2) * 0.5 * mf
	    y+= sin(siner / 12) * 0.8 * mf
	    if(ss < 0)
	        image_blend= make_color_rgb(255, 255 + ss, 255 + ss)
	    if(oo == 1)
	        draw_sprite_ext(2310/* spr_toriel_wrapshock */, 0, x, y, 2, 2, 0, 16777215, ii)
	    draw_sprite_ext(2309/* spr_toriel_wrap */, 0, x, y, 2, 2, 0, image_blend, modulate.a)
	    if(shock == 1)
	        draw_sprite_ext(2312/* spr_face_torieldie */, 0, x + 58, y - 52, 2, 2, 0, image_blend, modulate.a)
	    else  {
	        if(face == 0)
	            draw_sprite_ext(2311/* spr_face_torielpain */, 0, x + 58, y - 52, 2, 2, 0, image_blend, modulate.a)
	        if(face == 1)
	            draw_sprite_ext(2313/* spr_face_torielencourage */, 0, x + 58, y - 52, 2, 2, 0, image_blend, modulate.a)
	        if(face == 2)
	            draw_sprite_ext(2313/* spr_face_torielencourage */, 1, x + 58, y - 52, 2, 2, 0, image_blend, modulate.a)
	    }
	}
	if(type == 1) {
	    x+= cos(siner / 2) * 0.5 * mf
	    y+= sin(siner / 12) * 0.8 * mf
	    if(ss < 0)
	        image_blend= make_color_rgb(255, 255 + ss, 255 + ss)
	    if(oo == 1)
	        draw_sprite_ext(2321/* spr_pap_wrapshock */, 0, x - 12, y, 2, 2, 0, 16777215, ii)
	    draw_sprite_ext(2318/* spr_papwrap */, 0, x, y, 2, 2, 0, image_blend, modulate.a)
	    if(shock == 1)
	        draw_sprite_ext(2319/* spr_papface_fatal */, 0, x + 40, y, 2, 2, 0, image_blend, modulate.a)
	    else  {
	        if(face == 0)
	            draw_sprite_ext(2320/* spr_papface_wrap */, 0, x + 40, y, 2, 2, 0, image_blend, modulate.a)
	        if(face == 1)
	            draw_sprite_ext(2303/* spr_paphead_believe */, 0, x + 40, y, 2, 2, 0, image_blend, modulate.a)
	        if(face == 2)
	            draw_sprite_ext(2315/* spr_asgore_shockface */, 0, x + 40, y, 2, 2, 0, image_blend, modulate.a)
	    }
	}
	if(type == 2) {
	    x+= cos(siner / 2) * 0.5 * mf
	    y+= sin(siner / 12) * 0.8 * mf
	    if(ss < 0)
	        image_blend= make_color_rgb(255, 255 + ss, 255 + ss)
	    if(oo == 1)
	        draw_sprite_ext(2324/* spr_sanswrapshock */, 0, x, y, 2, 2, 0, 16777215, ii)
	    draw_sprite_ext(2322/* spr_sanswrap */, 0, x, y, 2, 2, 0, image_blend, modulate.a)
	    if(shock == 1)
	        draw_sprite_ext(2323/* spr_sanswrapface */, 0, x + 60, y - 44, 2, 2, 0, image_blend, modulate.a)
	    else  {
	        if(face == 0)
	            draw_sprite_ext(2323/* spr_sanswrapface */, 0, x + 60, y - 44, 2, 2, 0, image_blend, modulate.a)
	        if(face == 1)
	            draw_sprite_ext(2323/* spr_sanswrapface */, 1, x + 60, y - 44, 2, 2, 0, image_blend, modulate.a)
	        if(face == 2)
	            draw_sprite_ext(2315/* spr_asgore_shockface */, 0, x + 40, y, 2, 2, 0, image_blend, modulate.a)
	    }
	}
	if(type == 3) {
	    x+= cos(siner / 2) * 0.5 * mf
	    y+= sin(siner / 12) * 0.8 * mf
	    goof= sin(siner / 5) * 10
	    if(ss < 0)
	        image_blend= make_color_rgb(255, 255 + ss, 255 + ss)
	    draw_sprite_ext(282/* spr_undyneb_hair */, siner / 5, x - 30, y - 40 + goof / 3, 2, 2, 0, image_blend, 1)
	    if(oo == 1)
	        draw_sprite_ext(2326/* spr_undynewrapshock */, 0, x, y, 2, 2, 0, 16777215, ii)
	    draw_sprite_ext(2325/* spr_undynewrap */, floor(siner / 5), x, y, 2, 2, 0, image_blend, modulate.a)
	    if(shock == 1)
	        draw_sprite_ext(2327/* spr_undyneface_fatal */, 0, x + 30, y - 40, 2, 2, 0, image_blend, modulate.a)
	    else  {
	        if(face == 0)
	            draw_sprite_ext(2328/* spr_undyneface_wrap */, floor(siner / 5), x + 30, y - 40, 2, 2, 0, image_blend, modulate.a)
	        if(face == 1)
	            draw_sprite_ext(2329/* spr_undyneface_encourage */, 0, x + 30, y - 40, 2, 2, 0, image_blend, modulate.a)
	        if(face == 2)
	            draw_sprite_ext(2315/* spr_asgore_shockface */, 0, x + 40, y, 2, 2, 0, image_blend, modulate.a)
	    }
	}
	if(type == 4) {
	    x+= cos(siner / 2) * 0.5 * mf
	    y+= sin(siner / 12) * 0.8 * mf
	    if(ss < 0)
	        image_blend= make_color_rgb(255, 255 + ss, 255 + ss)
	    if(oo == 1)
	        draw_sprite_ext(2331/* spr_alphyswrapshock */, 0, x, y, 2, 2, 0, 16777215, ii)
	    draw_sprite_ext(2330/* spr_alphyswrap */, 0, x, y, 2, 2, 0, image_blend, modulate.a)
	    if(shock == 1)
	        draw_sprite_ext(2332/* spr_alphysface_hit */, 0, x, y, 2, 2, 0, image_blend, modulate.a)
	    else  {
	        if(face == 0)
	            draw_sprite_ext(2333/* spr_alphysface_wrap */, 0, x, y, 2, 2, 0, image_blend, modulate.a)
	        if(face == 1)
	            draw_sprite_ext(2333/* spr_alphysface_wrap */, 1, x, y, 2, 2, 0, image_blend, modulate.a)
	        if(face == 2)
	            draw_sprite_ext(2333/* spr_alphysface_wrap */, 2, x, y, 2, 2, 0, image_blend, modulate.a)
	    }
	}
	if(type == 5) {
	    x+= cos(siner / 2) * 0.5 * mf
	    y+= sin(siner / 12) * 0.8 * mf
	    if(ss < 0)
	        image_blend= make_color_rgb(255, 255 + ss, 255 + ss)
	    if(oo == 1)
	        draw_sprite_ext(2317/* spr_asgore_wrapshock */, 0, x, y, 2, 2, 0, 16777215, ii)
	    draw_sprite_ext(2314/* spr_asgore_wrap */, 0, x, y, 2, 2, 0, image_blend, modulate.a)
	    if(shock == 1)
	        draw_sprite_ext(2315/* spr_asgore_shockface */, 0, x + 122, y - 32, 2, 2, 0, image_blend, modulate.a)
	    else  {
	        if(face == 0)
	            draw_sprite_ext(2316/* spr_asgore_wrapface */, 0, x + 124, y - 32, 2, 2, 0, image_blend, modulate.a)
	        if(face == 1)
	            draw_sprite_ext(2316/* spr_asgore_wrapface */, 1, x + 124, y - 32, 2, 2, 0, image_blend, modulate.a)
	        if(face == 2)
	            draw_sprite_ext(2316/* spr_asgore_wrapface */, 2, x + 124, y - 32, 2, 2, 0, image_blend, modulate.a)
	    }
	}
	if(click == 1) {
	    draw_set_color(255)
	    draw_text(400, 300, x)
	    draw_text(400, 320, y)
	    x= mouse_x - 50
	    y= mouse_y - 50
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
