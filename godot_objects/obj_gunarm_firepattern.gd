# Auto-converted from GameMaker: obj_gunarm_firepattern
# GM parent: obj_asbulletparent
extends Node2D

func _ready():
	bb= 0
	thisy= y
	thisx= x
	image_speed= 0
	scale.x= 2
	scale.y= 2
	type= 0
	lock= 0
	home= 0
	txspeed= 0
	tyspeed= 0
	l_timer= 0
	flash= 0
	meter= 0
	metercounter= 0
	unhinge= 0
	blast= 0
	con= 0
	ctimer= 0
	modulate.a= 0
	$Alarm6.start((30) / 30.0)
	relx= x - obj_asriel_body.x
	rely= y - obj_asriel_body.y
	king= 569
	ks= 0
	rotation_degrees= point_direction(x, y, obj_heart.x + 8, obj_heart.y + 8) + 90
	col_o= 0
	sfx_b= caster_load("music/sfx/sfx_a_bullet.ogg")
	sfx_t= caster_load("music/sfx/sfx_a_target.ogg")
	sfx_l= caster_load("music/sfx/sfx_rainbowbeam_1.ogg")
	sfx_p= caster_load("music/sfx/sfx_segapower.ogg")
	h_mode= 0
	jr= random(360)

func _gm_event_1_0():
	caster_free(sfx_b)
	caster_free(sfx_t)
	caster_free(sfx_l)
	caster_free(sfx_p)

func _gm_event_2_5():
	if(fire < maxfire) {
	    event_user(0)
	    $Alarm5.start((2) / 30.0)
	}
	fire++

func _process(delta: float):
	ks++
	king.y+= sin(ks / 8) * 0.5
	y+= tyspeed
	x+= txspeed
	if(abs(txspeed) > 0) txspeed*= 0.5
	if(abs(txspeed) <= 1) txspeed= 0
	if(abs(tyspeed) > 0) tyspeed*= 0.5
	if(abs(tyspeed) <= 1) tyspeed= 0
	if(x < thisx) x+= (thisx - x) / 3
	if(y < thisy) y+= (thisy - y) / 3
	if(x > thisx) x+= (thisx - x) / 3
	if(y > thisy) y+= (thisy - y) / 3
	if(abs(x - thisx) < 2) x= thisx
	if(abs(x - thisy) < 2) y= thisy
	if(bb == 99 and velocity.y > 0 and y >= thisy) {
	    y= thisy
	    x= thisx
	    bb= 0
	    gravity= 0
	    velocity.y= 0
	    velocity.x= 0
	}
	if(unhinge == 0 and frame > 0 and velocity.y > -2)
	    frame--
	if(home == 1)
	    rotation_degrees= point_direction(x, y, obj_heart.x + 8, obj_heart.y + 8) + 90
	if(con == 0) {
	    if(modulate.a < 1) modulate.a+= 0.1
	    else  con= 1
	}
	if(h_mode == 0 and con == 1) {
	    ctimer+= 0.5
	    if(ctimer >= 27.5) ctimer+= 0.5
	    if(ctimer == 1) {
	        l_timer= 20
	        home= 1
	        type= 1
	        fire= 0
	        maxfire= 6
	        $Alarm5.start((20) / 30.0)
	    }
	    if(ctimer == 28) {
	        l_timer= 10
	        home= 1
	        type= 2
	        fire= 0
	        maxfire= 6
	        $Alarm5.start((10) / 30.0)
	    }
	    if(ctimer == 54) {
	        l_timer= 8
	        home= 1
	        type= 1
	        fire= 0
	        maxfire= 5
	        $Alarm5.start((8) / 30.0)
	    }
	    if(ctimer == 78) {
	        l_timer= 8
	        home= 1
	        type= 2
	        fire= 0
	        maxfire= 5
	        $Alarm5.start((8) / 30.0)
	    }
	    if(ctimer == 100) {
	        l_timer= 8
	        home= 1
	        type= 1
	        fire= 0
	        maxfire= 4
	        $Alarm5.start((8) / 30.0)
	    }
	    if(ctimer == 122) {
	        l_timer= 8
	        home= 1
	        type= 2
	        fire= 0
	        maxfire= 4
	        $Alarm5.start((8) / 30.0)
	    }
	    if(ctimer == 140) {
	        l_timer= 6
	        home= 1
	        type= 1
	        fire= 0
	        maxfire= 4
	        $Alarm5.start((6) / 30.0)
	    }
	    if(ctimer == 156) {
	        l_timer= 6
	        home= 1
	        type= 2
	        fire= 0
	        maxfire= 4
	        $Alarm5.start((6) / 30.0)
	    }
	    if(ctimer == 170) {
	        l_timer= 6
	        home= 1
	        type= 1
	        fire= 0
	        maxfire= 8
	        $Alarm5.start((6) / 30.0)
	    }
	    if(ctimer == 190) {
	        caster_play(sfx_p, 1, 0.55)
	        meter= 1
	    }
	    if(ctimer == 205) {
	        home= 0
	        aaspeed= 45
	    }
	    if(ctimer >= 205 and ctimer < 255) {
	        rotation_degrees+= aaspeed
	        if(aaspeed > 0) aaspeed-= 3
	        else  {
	            aaspeed= 0
	            ctimer= 255
	        }
	    }
	    if(ctimer == 255) home= 1
	    if(ctimer == 257) {
	        sprite_index= 2372/* spr_asriel_gunarm_unhinge */
	        image_speed= 1
	        unhinge= 1
	        home= 0
	    }
	    if(ctimer == 275) {
	        metercounter= 7
	        caster_play(sfx_l, 1, 1.1)
	        blast= 1
	        bt= 70
	        btimer= 0
	    }
	    if(ctimer >= 315) {
	        with(king) {
	            if(guncon == 5) guncon= 7
	        }
	        modulate.a-= 0.1
	        if(modulate.a < 0.1) instance_destroy()
	    }
	}
	if(h_mode == 1 and con == 1) {
	    ctimer+= 0.5
	    if(ctimer >= 19.5) ctimer+= 0.5
	    if(ctimer == 1) {
	        l_timer= 20
	        home= 1
	        type= 1
	        fire= 0
	        maxfire= 6
	        $Alarm5.start((20) / 30.0)
	    }
	    if(ctimer == 25) {
	        l_timer= 10
	        home= 1
	        type= choose(1, 2)
	        fire= 0
	        maxfire= 6
	        $Alarm5.start((10) / 30.0)
	    }
	    if(ctimer == 50) {
	        l_timer= 8
	        home= 1
	        type= choose(1, 2)
	        fire= 0
	        maxfire= 5
	        $Alarm5.start((8) / 30.0)
	    }
	    if(ctimer == 75) {
	        l_timer= 7
	        home= 1
	        type= 2
	        fire= 0
	        maxfire= 4
	        $Alarm5.start((7) / 30.0)
	    }
	    if(ctimer == 95) {
	        l_timer= 7
	        home= 1
	        type= 1
	        fire= 0
	        maxfire= 4
	        $Alarm5.start((7) / 30.0)
	    }
	    if(ctimer == 115) {
	        l_timer= 7
	        home= 1
	        type= choose(1, 2)
	        fire= 0
	        maxfire= 4
	        $Alarm5.start((7) / 30.0)
	    }
	    if(ctimer == 132) {
	        l_timer= 6
	        home= 1
	        type= 2
	        fire= 0
	        maxfire= 4
	        $Alarm5.start((6) / 30.0)
	    }
	    if(ctimer == 156) {
	        l_timer= 6
	        home= 1
	        type= 2
	        fire= 0
	        maxfire= 4
	        $Alarm5.start((6) / 30.0)
	    }
	    if(ctimer == 170) {
	        l_timer= 6
	        home= 1
	        type= 1
	        fire= 0
	        maxfire= 10
	        $Alarm5.start((6) / 30.0)
	    }
	    if(ctimer == 200) {
	        caster_play(sfx_p, 1, 0.55)
	        meter= 1
	    }
	    if(ctimer == 215) {
	        home= 0
	        aaspeed= 90
	    }
	    if(ctimer >= 215 and ctimer < 240) {
	        rotation_degrees+= aaspeed
	        if(aaspeed > 0) aaspeed-= 6
	        else  {
	            aaspeed= 0
	            ctimer= 255
	        }
	    }
	    if(ctimer == 255) home= 1
	    if(ctimer == 257) {
	        sprite_index= 2372/* spr_asriel_gunarm_unhinge */
	        image_speed= 1
	        unhinge= 1
	        home= 0
	    }
	    if(ctimer == 270) {
	        metercounter= 7
	        caster_play(sfx_l, 1, 1.1)
	        blast= 1
	        bt= 70
	        btimer= 0
	    }
	    if(ctimer == 272 or ctimer == 274 or ctimer == 276 or ctimer == 278 or ctimer == 280 or ctimer == 282 or ctimer == 284) {
	        jr+= 8
	        i= 0
	        while(i < 24) {
	            star= instance_create(x, y, 579/* obj_regstar_blt */)
	            star.h_mode= 0
	            star.friction= -0.1
	            star.speed= 8
	            star.direction= jr + 15 * i
	            star.z_index= -9000
	            i++
	        }
	    }
	    if(ctimer >= 310) {
	        with(king) {
	            if(guncon == 5) guncon= 7
	        }
	        modulate.a-= 0.1
	        if(modulate.a < 0.1) instance_destroy()
	    }
	}

func _gm_event_7_11():
	xx= lengthdir_x(95, rotation_degrees - 90)
	yy= lengthdir_y(95, rotation_degrees - 90)
	if(type == 0) {
	    bolt= instance_create(x + xx, y + yy, 582/* obj_gunarm_bolt */)
	    bolt.direction= rotation_degrees - 90
	    bolt.thisd= rotation_degrees - 90
	    bolt.rotation_degrees= bolt.direction
	    bolt.speed= 20
	    bolt.scale.x= 2
	    bolt.scale.y= 2
	}
	if(type == 1) {
	    i= 0
	    repeat(3)  {
	        bolt= instance_create(x + xx, y + yy, 582/* obj_gunarm_bolt */)
	        bolt.direction= rotation_degrees - 90
	        bolt.rotation_degrees= bolt.direction
	        bolt.thisd= rotation_degrees - 110 + 20 * i
	        bolt.rotation_degrees= bolt.direction
	        bolt.speed= 20
	        bolt.scale.x= 2
	        bolt.scale.y= 2
	        i++
	    }
	}
	if(type == 2) {
	    i= 0
	    repeat(4)  {
	        bolt= instance_create(x + xx, y + yy, 582/* obj_gunarm_bolt */)
	        bolt.direction= rotation_degrees - 90
	        bolt.rotation_degrees= bolt.direction
	        bolt.thisd= rotation_degrees - 120 + 20 * i
	        bolt.rotation_degrees= bolt.direction
	        bolt.speed= 20
	        bolt.scale.x= 2
	        bolt.scale.y= 2
	        i++
	    }
	}

func _gm_event_7_10():
	if(lock == 0) {
	    gravity_direction= rotation_degrees - 90
	    direction= rotation_degrees + 90
	    txspeed= lengthdir_x(7, rotation_degrees + 90)
	    tyspeed= lengthdir_y(7, rotation_degrees + 90)
	    caster_stop(sfx_b)
	    caster_play(sfx_b, 0.8, 1)
	    bb= 1
	}
	frame= 2
	event_user(1)

func _on_outside_room():
	flash++
	if(flash > 2) flash= 0
	xx= lengthdir_x(120, rotation_degrees - 90)
	yy= lengthdir_y(120, rotation_degrees - 90)
	l_timer--
	if(l_timer > 0) {
	    if(caster_is_playing(sfx_t) == 0) caster_loop(sfx_t, 1, 1)
	    draw_set_color(255)
	    if(flash == 1) draw_set_color(4235519)
	    if(flash == 2) draw_set_color(65535)
	    if(type == 0) {
	        xxx= lengthdir_x(600, rotation_degrees - 90)
	        yyy= lengthdir_y(600, rotation_degrees - 90)
	        draw_line(x + xx, y + yy, x + xxx, y + yyy)
	    }
	    if(type == 1) {
	        xxx= lengthdir_x(600, rotation_degrees - 104)
	        yyy= lengthdir_y(600, rotation_degrees - 104)
	        draw_line(x + xx, y + yy, x + xxx, y + yyy)
	        xxx= lengthdir_x(600, rotation_degrees - 90)
	        yyy= lengthdir_y(600, rotation_degrees - 90)
	        draw_line(x + xx, y + yy, x + xxx, y + yyy)
	        xxx= lengthdir_x(600, rotation_degrees - 77)
	        yyy= lengthdir_y(600, rotation_degrees - 77)
	        draw_line(x + xx, y + yy, x + xxx, y + yyy)
	    }
	    if(type == 2) {
	        xxx= lengthdir_x(600, rotation_degrees - 110)
	        yyy= lengthdir_y(600, rotation_degrees - 110)
	        draw_line(x + xx, y + yy, x + xxx, y + yyy)
	        xxx= lengthdir_x(600, rotation_degrees - 96)
	        yyy= lengthdir_y(600, rotation_degrees - 96)
	        draw_line(x + xx, y + yy, x + xxx, y + yyy)
	        xxx= lengthdir_x(600, rotation_degrees - 84)
	        yyy= lengthdir_y(600, rotation_degrees - 84)
	        draw_line(x + xx, y + yy, x + xxx, y + yyy)
	        xxx= lengthdir_x(600, rotation_degrees - 70)
	        yyy= lengthdir_y(600, rotation_degrees - 70)
	        draw_line(x + xx, y + yy, x + xxx, y + yyy)
	    }
	} else  {
	    if(caster_is_playing(sfx_t)) caster_stop(sfx_t)
	}
	if(meter == 1) {
	    metercounter++
	    i= 0
	    while(i < 7) {
	        if(metercounter > i) {
	            mcolor= make_color_hsv(metercounter * 12 - i * 24, 180, 255)
	            draw_sprite_ext(2374/* spr_asriel_gunarm_meter */, i, x, y, scale.x, scale.y, rotation_degrees, mcolor, 1)
	        }
	        i++
	    }
	}
	if(blast == 1) {
	    if(bt > 4) {
	        view_xview[0]= choose(1, -1) * random(3)
	        view_yview[0]= choose(1, -1) * random(3)
	    } else  {
	        view_xview[0]= 0
	        view_yview[0]= 0
	    }
	    if(frame == 5) frame= 4
	    else  frame= 5
	    metercounter-= 1.25
	    x= thisx + random(6) - random(6)
	    y= thisy - random(15) - 16
	    king.x= x - relx + random(3) - random(3)
	    king.y= y - rely + random(8) + 12
	    xx= lengthdir_x(115, rotation_degrees - 90)
	    yy= lengthdir_y(115, rotation_degrees - 90)
	    xxx= lengthdir_x(600, rotation_degrees - 90)
	    yyy= lengthdir_y(600, rotation_degrees - 90)
	    mcolor1= make_color_hsv(btimer * 18, 180, 255)
	    mcolor2= make_color_hsv(btimer * 18 + 60, 180, 255)
	    draw_line_width_color(x + xx, y + yy, x + xxx, y + yyy, bt, mcolor1, mcolor2)
	    xxa= lengthdir_x(90, rotation_degrees - 90)
	    yya= lengthdir_y(90, rotation_degrees - 90)
	    xxb= lengthdir_x(100, rotation_degrees - 90)
	    yyb= lengthdir_y(100, rotation_degrees - 90)
	    draw_line_width_color(x + xx, y + yy, x + xxa, y + yya, bt / 2, mcolor1, mcolor2)
	    draw_line_width_color(x + xx, y + yy, x + xxb, y + yyb, bt / 1.5, mcolor1, mcolor2)
	    nx_factor= lengthdir_x(1, rotation_degrees)
	    ny_factor= lengthdir_y(1, rotation_degrees)
	    if(col_o == 1) {
	        cl= 0
	        while(cl < 4) {
	            if(collision_line(x + xx - nx_factor * bt / 2 * cl / 4, y + yy - ny_factor * bt / 2 * cl / 4, x + xxx - nx_factor * bt / 2 * cl / 4, y + yyy - ny_factor * bt / 2 * cl / 4, 743, 0, 1))
	                event_user(7)
	            cl++
	        }
	        cl= 0
	        while(cl < 4) {
	            if(collision_line(x + xx + nx_factor * bt / 2 * cl / 4, y + yy + ny_factor * bt / 2 * cl / 4, x + xxx + nx_factor * bt / 2 * cl / 4, y + yyy + ny_factor * bt / 2 * cl / 4, 743, 0, 1))
	                event_user(7)
	            cl++
	        }
	    }
	    if(col_o == 0) col_o= 1
	    else  col_o= 0
	    btimer++
	    if(btimer > 15) {
	        bt-= 3
	        if(bt < 3) {
	            bt= 0
	            blast= 0
	            unhinge= 0
	            meter= 0
	        }
	    }
	}
	if(unhinge == 1 and frame >= 5) {
	    frame= 5
	    image_speed= 0
	}
	draw_sprite_ext(sprite_index, frame, x, y, scale.x, scale.y, rotation_degrees, image_blend, modulate.a)

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
