# Auto-converted from GameMaker: obj_floweyx_flipeye
# GM parent: obj_floweybodyparent
extends Node2D

func _ready():
	siner= 0
	image_blend= 16777215
	md= 0
	con= 0
	siner2= random(300)
	gr= 16777215
	grgr= 16777215
	grgrgr= 16777215
	grgrgrgr= 16777215
	oner= 0
	durara= 0
	frozen= 0
	desperate= 1
	wimpy= 0
	event_user(4)
	saved= 0
	memorymode= 0

func _gm_event_2_4():
	con++

func _gm_event_7_15():
	if(saved == 1) {
	    durara= save_durara
	    oner= save_oner
	    $Alarm4.start((save_alarm) / 30.0)
	    siner2= save_siner2
	    md= save_md
	    con= save_con
	    gr= save_gr
	    grgr= save_grgr
	    grgrgr= save_grgrgr
	    scr_floweybodyload()
	}

func _gm_event_7_14():
	save_durara= durara
	save_oner= oner
	save_alarm= alarm[4]
	save_siner2= siner2
	save_md= md
	save_con= con
	save_gr= gr
	save_grgr= grgr
	save_grgrgr= grgrgr
	scr_floweybodysave()
	saved= 1
	memorymode= 1

func _gm_event_7_11():
	if(con == 0) con= 1

func _on_outside_room():
	if(con == 0) {
	    if(frozen == 0) siner++
	    else  {
	        if(frozen != 4) y= ystart + random(4) - random(4)
	    }
	}
	if(con == 1) {
	    con= 3
	    $Alarm4.start((4) / 30.0)
	}
	if(GS.debug == 1 and Input.is_key_pressed(82)) con= 1
	if(con == 3) {
	    siner2+= 1.2
	    md= 1
	    gr= make_color_rgb(170 + sin(siner2 / 2) * 70, 170 + sin((siner2 + 3) / 2) * 70, 170 + sin((siner2 + 6) / 2) * 70)
	    grgr= make_color_rgb(170 + sin((siner2 + 1) / 2) * 70, 170 + sin((siner2 + 4) / 2) * 70, 170 + sin((siner2 + 7) / 2) * 70)
	    grgrgr= make_color_rgb(170 + sin((siner2 + 2) / 2) * 70, 170 + sin((siner2 + 4) / 2) * 70, 170 + sin((siner2 + 8) / 2) * 70)
	}
	if(con == 4) {
	    con= 5
	    durara= 0
	    oner= choose(0, 1)
	    $Alarm4.start((7) / 30.0)
	    image_blend= 16777215
	}
	if(con == 5) {
	    opx= 0
	    eba= instance_create(x, y, 1636/* obj_eyeshot_a */)
	    eba.memorymode= memorymode
	    eba.durara= durara
	    eba.oner= oner
	    if(wimpy == 0) {
	        with(eba) {
	            move_towards_point(obj_vsflowey_heart.x + 8, obj_vsflowey_heart.y + 8, 7 - durara * 0.1)
	            friction= -0.2 + durara * 0.012
	            direction-= 18 * durara
	            if(oner == 1) direction+= 9
	        }
	    }
	    if(wimpy == 1) {
	        with(eba) {
	            move_towards_point(obj_vsflowey_heart.x + 8, obj_vsflowey_heart.y + 8, 3 - durara * 0.1)
	            friction= -0.1 - durara * 0.02
	            direction-= 18 * durara
	            if(oner == 1) direction+= 14
	        }
	    }
	    opx= op
	    ebb= instance_create(x + opx, y, 1636/* obj_eyeshot_a */)
	    ebb.memorymode= memorymode
	    ebb.durara= durara
	    ebb.oner= oner
	    if(wimpy == 0) {
	        with(ebb) {
	            move_towards_point(obj_vsflowey_heart.x + 8, obj_vsflowey_heart.y + 8, 7 - durara * 0.1)
	            friction= -0.2 + durara * 0.012
	            direction+= 18 * durara
	            if(oner == 1) direction+= 9
	        }
	    }
	    if(wimpy == 1) {
	        with(ebb) {
	            move_towards_point(obj_vsflowey_heart.x + 8, obj_vsflowey_heart.y + 8, 3 - durara * 0.1)
	            friction= -0.1 - durara * 0.02
	            direction+= 18 * durara
	            if(oner == 1) direction+= 14
	        }
	    }
	    durara++
	    md= 1
	    if(gr == 16777215) {
	        gr= 255
	        grgr= 0
	        grgrgr= 0
	    } else  {
	        gr= 16777215
	        grgr= 16777215
	        grgrgr= 16777215
	    }
	}
	if(con == 6) {
	    gr= 16777215
	    grgr= 16777215
	    grgrgr= 16777215
	    md= 0
	    image_blend= 16777215
	    con= 0
	}
	if(con == 10) {
	    siner2+= 1.2
	    md= 1
	    gr= make_color_rgb(170 + sin(siner2 / 2) * 70, 170 + sin((siner2 + 3) / 2) * 70, 170 + sin((siner2 + 6) / 2) * 70)
	    grgr= make_color_rgb(170 + sin((siner2 + 1) / 2) * 70, 170 + sin((siner2 + 4) / 2) * 70, 170 + sin((siner2 + 7) / 2) * 70)
	    grgrgr= make_color_rgb(170 + sin((siner2 + 2) / 2) * 70, 170 + sin((siner2 + 4) / 2) * 70, 170 + sin((siner2 + 8) / 2) * 70)
	}
	if(desperate == 1 and frozen == 0) siner+= 0.5
	draw_sprite_ext(2169/* spr_flipeye_holder_bg */, frame, x, y + cos(siner / 3) * 2, 0.8, 0.8, sin(siner / 4) * 2, grgrgrgr, 1)
	draw_sprite_ext(2166/* spr_flipeye_bg */, frame, x - 5, y + cos(siner / 3) * 3, 1, 1, sin(siner / 4) * 2, grgrgrgr, 1)
	if(md == 0) {
	    draw_sprite_ext(2171/* spr_flipeye_noiris */, frame, x, -4 + y + sin(siner / 3) * 2, 0.8, 0.8, sin(siner / 2) * 4, image_blend, 1)
	    draw_sprite_ext(2175/* spr_flipeye_iris */, frame, x, -6 + y + sin(siner / 3) * 4, 0.8, 0.8, sin(siner / 2) * 4, image_blend, 1)
	    if(desperate == 0)
	        draw_sprite_ext(2173/* spr_flipeye_pupil */, frame, x, -5 + y + sin(siner / 3) * 2, 0.8 - sin(siner / 3) * 0.4, 1 - sin(siner / 3) * 0.4, 0, image_blend, 1)
	    if(desperate == 1) {
	        if(frozen == 0 or frozen == 4)
	            draw_sprite_ext(2173/* spr_flipeye_pupil */, frame, x, -5 + y + sin(siner / 3) * 2.5, 0.8 - sin(siner / 3) * 0.3, 0.8 - sin(siner / 3) * 0.3, 0, image_blend, 1)
	        else 
	            draw_sprite_ext(2173/* spr_flipeye_pupil */, frame, x, -5 + y + sin(siner / 3) * 2.5, 0.7 - sin(siner / 3) * 0.1, 0.7 - sin(siner / 3) * 0.1, 0, image_blend, 1)
	    }
	}
	if(md == 1) {
	    draw_sprite_ext(2172/* spr_flipeye_noiris_flash */, frame, x, -4 + y + sin(siner / 3) * 2, 0.8, 0.8, sin(siner / 2) * 4, grgrgr, 1)
	    draw_sprite_ext(2176/* spr_flipeye_iris_flash */, frame, x, -6 + y + sin(siner / 3) * 4, 0.8, 0.8, sin(siner / 2) * 4, grgr, 1)
	    draw_sprite_ext(2174/* spr_flipeye_pupil_flash */, frame, x, -5 + y + sin(siner / 3) * 2, 0.8 - sin(siner / 3) * 0.4, 1 - sin(siner / 3) * 0.4, 0, gr, 1)
	}
	draw_sprite_ext(2168/* spr_flipeye_holder */, frame, x, y + cos(siner / 3) * 2, 0.8, 0.8, sin(siner / 4) * 2, image_blend, 1)
	op= 126
	draw_sprite_ext(2169/* spr_flipeye_holder_bg */, frame, x + op, y + cos(siner / 3) * 2, -0.8, 0.8, -sin(siner / 4) * 2, grgrgrgr, 1)
	draw_sprite_ext(2166/* spr_flipeye_bg */, frame, x + 5 + op, y + cos(siner / 3) * 3, -1, 1, sin(siner / 4) * 2, grgrgrgr, 1)
	if(md == 0) {
	    draw_sprite_ext(2171/* spr_flipeye_noiris */, frame, x + op, -4 + y + sin(siner / 3) * 2, -0.8, 0.8, -sin(siner / 2) * 4, image_blend, 1)
	    draw_sprite_ext(2175/* spr_flipeye_iris */, frame, x + op, -6 + y + sin(siner / 3) * 4, -0.8, 0.8, -sin(siner / 2) * 4, image_blend, 1)
	    if(desperate == 0)
	        draw_sprite_ext(2173/* spr_flipeye_pupil */, frame, x + op, -5 + y + sin(siner / 3) * 2, -1 + cos(siner / 3) * 0.4, 1 - cos(siner / 3) * 0.4, 0, image_blend, 1)
	    if(desperate == 1) {
	        if(frozen == 0 or frozen == 4)
	            draw_sprite_ext(2173/* spr_flipeye_pupil */, frame, x + op, -5 + y + sin(siner / 3) * 2.5, -0.9 + cos(siner / 3) * 0.3, 0.9 - cos(siner / 3) * 0.3, 0, image_blend, 1)
	        else 
	            draw_sprite_ext(2173/* spr_flipeye_pupil */, frame, x + op, -5 + y + sin(siner / 3) * 2.5, -0.7 + cos(siner / 3) * 0.1, 0.7 - cos(siner / 3) * 0.1, 0, image_blend, 1)
	    }
	}
	if(md == 1) {
	    draw_sprite_ext(2172/* spr_flipeye_noiris_flash */, frame, x + op, -4 + y + sin(siner / 3) * 2, -0.8, 0.8, -sin(siner / 2) * 4, grgrgr, 1)
	    draw_sprite_ext(2176/* spr_flipeye_iris_flash */, frame, x + op, -6 + y + sin(siner / 3) * 4, -0.8, 0.8, -sin(siner / 2) * 4, grgr, 1)
	    draw_sprite_ext(2174/* spr_flipeye_pupil_flash */, frame, x + op, -5 + y + sin(siner / 3) * 2, -1 + cos(siner / 3) * 0.4, 1 - cos(siner / 3) * 0.4, 0, gr, 1)
	}
	draw_sprite_ext(2168/* spr_flipeye_holder */, frame, x + op, y + cos(siner / 3) * 2, -0.8, 0.8, -sin(siner / 4) * 2, image_blend, 1)

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
