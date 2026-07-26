# Auto-converted from GameMaker: obj_tsunderplane_body
extends Node2D

func _ready():
	siner= 0
	alpha= 1.2
	rot= 0
	fall= 0
	$Alarm0.start((10) / 30.0)
	hurt= 0
	parent= 327
	grchange= 0
	prevgr= 0
	curgr= 0

func _on_destroy():
	if(fall == 0) {
	    instance_create(x + 46, y + 56, 328/* obj_planeexhaust */)
	    $Alarm0.start((10) / 30.0)
	}

func _gm_event_7_10():
	fall= 1

func _on_outside_room():
	if(hurt == 0) siner++
	else  {
	    if(is_instance_valid(parent)) x= parent.x
	    else  {
	        hurt= 0
	        fall= 1
	    }
	}
	if(fall < 3) {
	    grchange--
	    if(is_instance_valid(parent)) {
	        curgr= parent.graze
	        if(prevgr != curgr) grchange= 7
	        prevgr= curgr
	    }
	    x_color= 16777215
	    if(grchange > 0)
	        x_color= merge_color(16777215, 255, grchange / 10)
	    draw_sprite_ext(sprite_index, frame, x + 94, 76 + y + sin(siner / 7) * 3, 2, 2, rot, x_color, alpha)
	    draw_sprite_ext(376/* spr_tsunderplanehat */, frame, 154 + x, 90 + y + sin(siner / 7) * 3, 2, 2, rot, 16777215, alpha)
	}
	if(fall == 1) {
	    pl= instance_create(x + 60 + random(60), y + 60 + random(60), 328/* obj_planeexhaust */)
	    pl.z_index= choose(-1, 1)
	    gravity= 0.08
	    gravity_direction= 270
	    x+= sin(siner) * 2
	    rot-= 0.75
	    draw_set_font(4)
	    draw_set_color(0)
	    draw_sprite(18/* spr_blconsm */, 0, xstart + 160 + random(5), ystart + 20 + random(5))
	    draw_text(xstart + 190 + random(2), ystart + 30 + random(2), "B-but I#never#got to#...!")
	    if(y > 160 - sprite_height) fall= 2
	}
	if(fall == 2) {
	    instance_create(0, 0, 118/* obj_flasher */)
	    caster_play(326, 1.2, 0.7)
	    scr_shake(5, 5, 2)
	    fall= 3
	}
	if(fall == 3) {
	    rot--
	    g= random(0.3)
	    draw_sprite_ext(377/* spr_planeexplosion */, 0, x + 90, 240, 3.5 - alpha * 1.8 + g, 3.8 - alpha * 2 + g, 0, 16777215, alpha)
	    draw_sprite_ext(376/* spr_tsunderplanehat */, frame, 160 + x, 90 + y + sin(siner / 7) * 3, 2, 2, rot, 16777215, alpha)
	    alpha-= 0.03
	    if(alpha < 0.05) instance_destroy()
	}
	if(fall == 0 and is_instance_valid(parent) and parent.graze > 0) {
	    grgr= parent.graze - 1
	    if(grgr > 3) grgr= 3
	    draw_sprite_ext(378/* spr_tsunderplane_blush */, grgr, x + 94 + sin(siner / 7) * 2, 76 + y + sin(siner / 7) * 4, 2, 2, rot, 16777215, 0.7 + sin(siner / 4) * 0.1)
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
