# Auto-converted from GameMaker: obj_floweyx_mouth
# GM parent: obj_floweybodyparent
extends Node2D

func _ready():
	siner= 0
	anim= 0
	mode= 0
	rotbonus= 0
	xbonus= 0
	ybonus= 0
	laugh= 0
	laughtimer= 0
	event_user(4)
	onoff= 0
	con= 0
	desperate= 1
	frozen= 0

func _gm_event_2_4():
	con++

func _gm_event_7_15():
	scr_floweybodyload()
	siner= save_siner
	anim= save_anim
	mode= save_mode
	rotbonus= save_rotbonus
	xbonus= save_xbonus
	ybonus= save_ybonus
	laugh= save_laugh
	laughtimer= save_laughtimer

func _gm_event_7_14():
	scr_floweybodysave()
	save_siner= siner
	save_anim= anim
	save_mode= mode
	save_rotbonus= rotbonus
	save_xbonus= xbonus
	save_ybonus= ybonus
	save_laugh= laugh
	save_laughtimer= laughtimer

func _gm_event_7_11():
	if(con == 0) {
	    mode= 1
	    con= 2
	    $Alarm4.start((10) / 30.0)
	}

func _on_outside_room():
	onoff++
	if(onoff > 3) onoff= 0
	draw_set_color(0)
	if(not instance_exists(1639/* obj_mouthbeam */)) {
	    if(mode == 0)
	        draw_rectangle(x, y + 8, x + 60, y + 110, 0)
	    if(mode == 1)
	        draw_rectangle(x - 10, y + 8, x + 70, y + 110, 0)
	    if(mode == 2)
	        draw_rectangle(x - 18, y + 8, x + 78, y + 110, 0)
	}
	if(con == 3) {
	    con= 4
	    cntr= 0
	    $Alarm4.start((40) / 30.0)
	}
	if(con == 4) {
	    cntr++
	    draw_sprite_ext(2244/* spr_mouthflash */, 0, 274, 202 - sin(siner / 4) * 3, 1, 1, 0, 16777215, (cntr - onoff * 5) / 15)
	}
	if(con == 5) {
	    laugh= 1
	    mode= 2
	    b= instance_create(271, 214, 1639/* obj_mouthbeam */)
	    b.z_index= z_index + 1
	    con= 6
	    $Alarm4.start((25) / 30.0)
	}
	if(con == 7) {
	    laugh= 0
	    mode= 0
	    con= 0
	}
	if(frozen == 0) {
	    siner++
	    if(desperate == 1) siner+= 0.4
	    anim+= 0.25
	}
	op= 60
	draw_sprite_ext(2180/* spr_floweyx_mouthbridge */, frame, x + 10, y, 1, 1, 0, image_blend, modulate.a)
	if(mode == 0) {
	    if(rotbonus > 0) rotbonus-= 5
	    else  rotbonus= 0
	    if(xbonus > 0) xbonus-= 2
	    else  xbonus= 0
	    if(ybonus < 0) ybonus+= 2
	    else  ybonus= 0
	    ybonus= 0
	}
	if(mode == 1) {
	    if(ybonus > -4) ybonus-= 2
	    if(xbonus < 6) xbonus+= 2
	    if(rotbonus < 15) rotbonus+= 5
	}
	if(mode == 2) {
	    if(ybonus > -8) ybonus-= 4
	    if(xbonus < 6) xbonus+= 2
	    if(rotbonus < 24) rotbonus+= 8
	}
	if(desperate == 0) {
	    draw_sprite_ext(2177/* spr_floweyx_mouthedge */, frame, x + sin(siner / 2) * 3 - 20 + xbonus, y + cos(siner / 2) - 5 + ybonus, 1, 1 + sin(siner / 4) * 0.03, 0 - cos(siner / 2) - rotbonus, image_blend, 1)
	    draw_sprite_ext(2178/* spr_floweyx_mouthl */, frame, x + sin(siner / 2) * 3 + xbonus, y + cos(siner / 2) + ybonus, 1, 1 + sin(siner / 4) * 0.03, 0 - cos(siner / 2) - rotbonus, image_blend, 1)
	    draw_sprite_ext(2177/* spr_floweyx_mouthedge */, frame, x - sin(siner / 2) * 3 + op + 20 - xbonus, y + cos(siner / 2) - 5 + ybonus, -1, 1 + sin(siner / 4) * 0.03, 0 + cos(siner / 2) + rotbonus, image_blend, 1)
	    draw_sprite_ext(2178/* spr_floweyx_mouthl */, frame, x + op - sin(siner / 2) * 3 - xbonus, y + cos(siner / 2) + ybonus, -1, 1 + sin(siner / 4) * 0.03, 0 + cos(siner / 2) + rotbonus, image_blend, 1)
	}
	if(desperate == 1) {
	    draw_sprite_ext(2177/* spr_floweyx_mouthedge */, frame, x + sin(siner / 2) * 4 - 20 + xbonus, y + cos(siner / 2) - 5 + ybonus, 1, 1 + sin(siner / 4) * 0.06, 0 - cos(siner / 2) - rotbonus, image_blend, 1)
	    draw_sprite_ext(2178/* spr_floweyx_mouthl */, frame, x + sin(siner / 2) * 4 + xbonus, y + cos(siner / 2) + ybonus, 1, 1 + sin(siner / 4) * 0.05, 0 - cos(siner / 2) - rotbonus, image_blend, 1)
	    draw_sprite_ext(2177/* spr_floweyx_mouthedge */, frame, x - sin(siner / 2) * 4 + op + 20 - xbonus, y + cos(siner / 2) - 5 + ybonus, -1, 1 + sin(siner / 4) * 0.06, 0 + cos(siner / 2) + rotbonus, image_blend, 1)
	    draw_sprite_ext(2178/* spr_floweyx_mouthl */, frame, x + op - sin(siner / 2) * 4 - xbonus, y + cos(siner / 2) + ybonus, -1, 1 + sin(siner / 4) * 0.05, 0 + cos(siner / 2) + rotbonus, image_blend, 1)
	}
	draw_sprite_ext(2179/* spr_floweyx_dimple */, anim, x + sin(siner / 2) * 3 - 5 + xbonus, y - 10, 1, 1 + sin(siner / 4) * 0.03, 0 + cos(siner / 2), image_blend, 1)
	draw_sprite_ext(2179/* spr_floweyx_dimple */, anim, x + op - sin(siner / 2) * 3 + 5 - xbonus, y - 10, -1, 1 + sin(siner / 4) * 0.03, 0 + cos(siner / 2), image_blend, 1)
	if(GS.debug == 1 and Input.is_key_pressed(16)) {
	    if(mode == 0) mode= 1
	    else  mode= 0
	}
	if(GS.debug == 1 and Input.is_key_pressed(17)) {
	    if(laugh == 0) laugh= 1
	    else  laugh= 0
	}
	if(laugh == 1) {
	    siner= 0
	    laughtimer++
	    if(laughtimer == 1) {
	        rotbonus= -3
	        xbonus= -1
	        ybonus= 0
	    }
	    if(laughtimer == 2) {
	        rotbonus= 6
	        xbonus= 2
	        ybonus= -1
	    }
	    if(laughtimer == 3) {
	        rotbonus= 18
	        xbonus= 4
	        ybonus= -3
	    }
	    if(laughtimer == 4) {
	        rotbonus= 20
	        xbonus= 6
	        ybonus= -4
	    }
	    if(laughtimer == 5) {
	        rotbonus= 12
	        xbonus= 4
	        ybonus= -3
	    }
	    if(laughtimer == 6) {
	        rotbonus= 6
	        xbonus= 2
	        ybonus= -2
	    }
	    if(laughtimer == 7) {
	        rotbonus= 0
	        xbonus= 0
	        ybonus= 0
	    }
	    if(laughtimer == 6) laughtimer= 1
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
