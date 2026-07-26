# Auto-converted from GameMaker: obj_hg_body
# GM parent: obj_asbulletparent
extends Node2D

func _ready():
	facescale= 0
	facey= 0
	con= -1
	modulate.a= 0
	aa= 1
	bb= 12
	cc= 1
	dd= 8
	a= 1
	b= 12
	c= 1
	d= 8
	c_counter= 0
	gl= caster_load("music/sfx/sfx_hypergoner_laugh.ogg")
	gc= caster_load("music/sfx/sfx_hypergoner_charge.ogg")

func _gm_event_2_6():
	instance_create(0, 0, 593/* obj_hg_debris */)
	$Alarm6.start((2) / 30.0)

func _gm_event_2_4():
	con++

func _on_outside_room():
	if(con == -1) {
	    modulate.a+= 0.05
	    if(modulate.a >= 1) {
	        con= 0.1
	        $Alarm4.start((20) / 30.0)
	    }
	}
	if(con < 3) {
	    draw_sprite_ext(2401/* spr_hg_leftovers */, 0, x, y + facey / 6, 2, 2, 0, 16777215, modulate.a)
	    draw_sprite_ext(2399/* spr_hg_horns */, 0, x, y - facey / 2, 2, 2, 0, 16777215, modulate.a)
	    draw_sprite_ext(2402/* spr_hg_mainface */, 0, x + 88, y + 72 + facey, 2, 2 + facescale, 0, 16777215, modulate.a)
	    draw_sprite_ext(2400/* spr_hg_jaws */, 0, x + 104, y + 248 - facey / 2, 2, 2, 0, 16777215, modulate.a)
	}
	if(con == 1.1) {
	    caster_play(gl, 0.8, 1)
	    con= 1
	}
	if(con == 1) {
	    facey-= 3.5
	    facescale-= 0.2
	    siner= 0
	    if(facescale < -1) {
	        con= 1.9
	        $Alarm4.start((75) / 30.0)
	        $Alarm6.start((100) / 30.0)
	    }
	}
	if(con == 1.9) {
	    siner++
	    facey+= sin(siner / 1.5) * 8
	    facescale+= sin(siner / 1.5) * 0.2
	}
	if(con == 2.9) {
	    caster_play(gc, 1, 1)
	    con= 3
	}
	if(con == 3) {
	    if(cc < 80) cc+= 0.5
	    sprite_index= 2403/* spr_hg_laughing */
	    if(modulate.a > 0.14) modulate.a-= 0.02
	    scr_fx_waver_scanline(bb, cc, dd)
	    draw_set_color(16777215)
	    draw_set_alpha(1 - modulate.a)
	    i= 0
	    while(i < 5) {
	        draw_line_width_color(get_viewport_rect().size.x / 2 + random(10) - random(10), get_viewport_rect().size.y / 2 + random(10) - random(10), random(get_viewport_rect().size.x), get_viewport_rect().size.y, 2, 16777215, 8421504)
	        i++
	    }
	    i= 0
	    while(i < 5) {
	        draw_line_width_color(get_viewport_rect().size.x / 2 + random(10) - random(10), get_viewport_rect().size.y / 2 + random(10) - random(10), random(get_viewport_rect().size.x), 0, 2, 16777215, 8421504)
	        i++
	    }
	    i= 0
	    while(i < 5) {
	        draw_line_width_color(get_viewport_rect().size.x / 2 + random(10) - random(10), get_viewport_rect().size.y / 2 + random(10) - random(10), 0, random(get_viewport_rect().size.y), 2, 16777215, 8421504)
	        i++
	    }
	    i= 0
	    while(i < 5) {
	        draw_line_width_color(get_viewport_rect().size.x / 2 + random(10) - random(10), get_viewport_rect().size.y / 2 + random(10) - random(10), get_viewport_rect().size.x, random(get_viewport_rect().size.y), 2, 16777215, 8421504)
	        i++
	    }
	    draw_set_alpha(1)
	    draw_set_circle_precision(16)
	    rad= (c_counter - 180) / 1.5
	    if(rad < 20) rad= 20
	    draw_set_color(32768)
	    draw_circle(320, 240, rad, 1)
	    if(c_counter < 295 and collision_circle(320, 240, rad - 5, 743, 0, 1))
	        event_user(7)
	    if(c_counter < 180) {
	        // obj_heart
	        with(743) {
	            pd= point_direction(x, y, 312, 232)
	            ldrx= lengthdir_x(1, pd)
	            ldry= lengthdir_y(1, pd)
	            x+= ldrx
	            y+= ldry
	        }
	    }
	    if(c_counter > 180) {
	        // obj_heart
	        with(743) {
	            pd= point_direction(x, y, 312, 232)
	            ldrx= lengthdir_x(2, pd)
	            ldry= lengthdir_y(2, pd)
	            x+= ldrx
	            y+= ldry
	        }
	    }
	    c_counter++
	    if(c_counter > 180) {
	        draw_set_color(16777215)
	        draw_set_alpha((c_counter - 180) / 60)
	        draw_circle(get_viewport_rect().size.x / 2, get_viewport_rect().size.y / 2, (c_counter - 180) / 1.5, 0)
	        draw_set_alpha((c_counter - 210) / 80)
	        draw_rectangle(-10, -10, 999, 999, 0)
	        draw_set_alpha(1)
	        if(c_counter > 275)
	            obj_heart.modulate.a-= 0.05
	        if(c_counter > 320) {
	            caster_free(gl)
	            caster_free(gc)
	            if(instance_exists(569/* obj_asriel_body */)) {
	                obj_asriel_body.gonercon= 10
	                instance_destroy()
	            }
	        }
	    }
	}
	if(obj_heart.x < 0) obj_heart.x= 0
	if(obj_heart.x > get_viewport_rect().size.x - 16) obj_heart.x= get_viewport_rect().size.x - 16
	if(obj_heart.y < 0) obj_heart.y= 0
	if(obj_heart.y > get_viewport_rect().size.y - 16)
	    obj_heart.y= get_viewport_rect().size.y - 16

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
