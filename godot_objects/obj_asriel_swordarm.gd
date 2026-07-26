# Auto-converted from GameMaker: obj_asriel_swordarm
# GM parent: obj_asbulletparent
extends Node2D

func _ready():
	con= 0
	timer= 0
	s_offset= 40
	o_o= 0
	smear= 0
	dontdraw= 0
	flip= 1
	$Alarm0.start((1) / 30.0)
	visible= 0
	if(instance_find(object_index, 0) == id) flip= 0
	relx= x - obj_asriel_swordmaster.x
	sm= 589
	skip= 0
	twinkle= 0
	shake= 0
	blazing= 0
	bl_o= 0
	king= 569
	z_index= king.z_index + 1
	start= 1
	modulate.a= 0
	scale.x= 2
	scale.y= 2
	$Alarm1.start((2) / 30.0)
	col= 0
	h_mode= 0

func _on_destroy():
	visible= 1
	if(flip == 1) scale.x= -2
	else  scale.x= 2

func _process_end(delta: float):
	x= obj_asriel_swordmaster.x + relx

func _on_outside_room():
	if(start == 1) {
	    if(modulate.a < 1) modulate.a+= 0.2
	    else  start= 0
	}
	if(dontdraw == 0)
	    draw_sprite_ext(sprite_index, frame, x + random(shake) - random(shake), y + random(shake) - random(shake), scale.x, 2, rotation_degrees, image_blend, modulate.a)
	timer++
	if(timer == 5) con= 1
	if(con == 1) {
	    s_offset--
	    if(flip == 0) {
	        if(o_o == 1)
	            draw_sprite_ext(2386/* spr_asriel_sword */, frame, x - s_offset - 22, y - 148, scale.x, 2, rotation_degrees, image_blend, modulate.a)
	        if(o_o == 0)
	            draw_sprite_ext(2386/* spr_asriel_sword */, frame, x + s_offset - 22, y - 148, scale.x, 2, rotation_degrees, image_blend, modulate.a)
	    }
	    if(flip == 1) {
	        if(o_o == 1)
	            draw_sprite_ext(2386/* spr_asriel_sword */, frame, x - s_offset + 22, y - 148, scale.x, 2, rotation_degrees, image_blend, modulate.a)
	        if(o_o == 0)
	            draw_sprite_ext(2386/* spr_asriel_sword */, frame, x + s_offset + 22, y - 148, scale.x, 2, rotation_degrees, image_blend, modulate.a)
	    }
	    if(o_o == 0) o_o= 1
	    else  o_o= 0
	    if(s_offset <= 1) {
	        with(sm) event_user(8)
	        sprite_index= 2388/* spr_asriel_swordarm */
	        con= 2
	        timer= 999
	        timer= 999
	        if(flip == 0) sm.$Alarm5.start((14) / 30.0)
	    }
	}
	if(twinkle == 0) {
	    if(h_mode == 0) {
	        if(timer == 107) {
	            with(sm) event_user(5)
	        }
	        if(timer > 105 and timer < 116) {
	            y-= 0.5
	            if(flip == 0) {
	                king.headrot+= 4
	                with(sm) event_user(2)
	                rotation_degrees++
	            }
	            if(flip == 1) {
	                king.headrot-= 4
	                with(sm) event_user(3)
	                rotation_degrees--
	            }
	        }
	    }
	    if(h_mode == 1) {
	        if(timer == 110) {
	            with(sm) event_user(5)
	        }
	        if(timer > 108 and timer < 116) {
	            y-= 0.75
	            if(flip == 0) {
	                king.headrot+= 6
	                with(sm) event_user(2)
	                rotation_degrees+= 1.5
	            }
	            if(flip == 1) {
	                king.headrot-= 6
	                with(sm) event_user(3)
	                rotation_degrees-= 1.5
	            }
	        }
	    }
	    if(h_mode == 2) {
	        if(timer == 113) {
	            with(sm) event_user(5)
	        }
	        if(timer > 111 and timer < 116) {
	            y-= 1.5
	            if(flip == 0) {
	                king.headrot+= 12
	                with(sm) event_user(2)
	                rotation_degrees+= 3
	            }
	            if(flip == 1) {
	                king.headrot-= 12
	                with(sm) event_user(3)
	                rotation_degrees-= 3
	            }
	        }
	    }
	}
	if(twinkle == 1) {
	    if(timer > 90 and timer < 105) {
	        blazing= 1
	        y-= 0.5
	        if(flip == 0) {
	            with(sm) event_user(9)
	            rotation_degrees+= 1.5
	        }
	        if(flip == 1) {
	            with(sm) event_user(9)
	            rotation_degrees-= 1.5
	        }
	    }
	    if(timer > 90 and timer < 115) shake= 5
	    if(timer == 115) shake= 0
	    if(timer == 120) blazing= 0
	}
	if(timer == 124) {
	    with(sm) event_user(6)
	    z_index= king.z_index - 10
	    dontdraw= 1
	    smear= 5
	}
	if(timer >= 124 and timer < 127) {
	    if(flip == 0) king.headrot-= 12
	    if(flip == 1) king.headrot+= 12
	    dontdraw= 0
	    rotation_degrees= 0
	    if(timer >= 125) col= 1
	    sprite_index= 2380/* spr_asriel_swordextend */
	    y+= 3
	}
	if(timer == 125 and twinkle == 1) {
	    GS.border= 6
	    SCR_BORDERSETUP()
	    timer= 200
	    velocity.y= 5
	    friction= 0.5
	    sprite_index= 2382/* spr_asriel_swordextend_shatter */
	    i= 0
	    while(i < 4) {
	        instance_create(x, y + 120 + i * 35, 588/* obj_swordtwinkle */)
	        i++
	    }
	}
	if(timer >= 127 and timer < 130) {
	    col= 0
	    y+= 5
	    if(flip == 0) rotation_degrees+= 30
	    if(flip == 1) rotation_degrees-= 30
	}
	if(timer == 130) {
	    king.headrot/= 2
	    z_index= king.z_index + 1
	    y= ystart
	    rotation_degrees= 0
	    sprite_index= 2391/* spr_asriel_swordarm_half */
	}
	if(timer == 131) {
	    king.headrot/= 2
	    y= ystart
	    rotation_degrees= 0
	    sprite_index= 2388/* spr_asriel_swordarm */
	}
	if(timer > 200 and twinkle == 1) {
	    if(timer > 201) col= 0
	    modulate.a-= 0.1
	    if(modulate.a <= 0) instance_destroy()
	}
	if(smear > 0) {
	    if(flip == 0)
	        draw_sprite_ext(2383/* spr_asriel_swordsmear */, frame, x - 40, y - 168, scale.x, 2.5, 0, image_blend, smear / 5)
	    if(flip == 1)
	        draw_sprite_ext(2383/* spr_asriel_swordsmear */, frame, x + 40, y - 168, scale.x, 2.5, 0, image_blend, smear / 5)
	    smear--
	}
	if(blazing == 1) {
	    if(bl_o == 0) bl_o= 1
	    else  bl_o= 0
	    if(bl_o == 1)
	        draw_sprite_ext(2389/* spr_asriel_swordarm_power */, 0, x, y, scale.x, 2, rotation_degrees, image_blend, modulate.a)
	}
	if(col == 1) {
	    if(flip == 0 and collision_rectangle(x - 3, y, x + 80, y + 260, 743, 0, 1))
	        event_user(7)
	    if(flip == 1 and collision_rectangle(x + 3, y, x - 80, y + 260, 743, 0, 1))
	        event_user(7)
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
