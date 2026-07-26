# Auto-converted from GameMaker: obj_floweyx_lefteye
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
	durara= 0
	oner= 0
	memorymode= 0
	desperate= 1
	frozen= 0
	wimpy= 0
	event_user(4)

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
	    if(frozen == 0) {
	        siner++
	        if(desperate == 1) siner+= 0.1
	    } else  {
	        if(frozen != 4) x= xstart + random(6) - random(6)
	    }
	}
	if(GS.debug == 1 and Input.is_key_pressed(69)) con= 1
	if(con == 1) {
	    con= 3
	    $Alarm4.start((2) / 30.0)
	}
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
	    $Alarm4.start((3) / 30.0)
	    if(wimpy == 1) $Alarm4.start((3) / 30.0)
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
	            move_towards_point(obj_vsflowey_heart.x + 8, obj_vsflowey_heart.y + 8, 12)
	            friction= -0.2
	            direction+= 18 - durara * 18
	        }
	    }
	    if(wimpy == 1) {
	        with(eba) {
	            move_towards_point(obj_vsflowey_heart.x + 8, obj_vsflowey_heart.y + 8, 5)
	            friction= -0.1
	            direction+= 30 - durara * 30
	        }
	    }
	    opx= op
	    ebb= instance_create(x + opx, y, 1636/* obj_eyeshot_a */)
	    ebb.memorymode= memorymode
	    ebb.durara= durara
	    ebb.oner= oner
	    if(wimpy == 0) {
	        with(ebb) {
	            move_towards_point(obj_vsflowey_heart.x + 8, obj_vsflowey_heart.y + 8, 12)
	            friction= -0.2
	            direction+= 18 - durara * 18
	        }
	    }
	    if(wimpy == 1) {
	        with(ebb) {
	            move_towards_point(obj_vsflowey_heart.x + 8, obj_vsflowey_heart.y + 8, 5)
	            friction= -0.1
	            direction+= 30 - durara * 30
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
	rot= sin(siner / 3) * 4
	rotx= sin(siner / 4) * 3
	roty= cos(siner / 4) * 3
	if(md == 0) {
	    draw_sprite_ext(2162/* spr_lefteye_nopupil */, frame, x + rotx * 2 - 2, y + roty, 1, 1, rot, image_blend, 1)
	    if(desperate == 0)
	        draw_sprite_ext(2164/* spr_lefteye_pupil */, frame, x + rotx * 2.5 - 2, y + roty, 1 - sin(siner / 2) * 0.2, 1 - sin(siner / 2) * 0.2, rot, image_blend, 1)
	    if(desperate == 1) {
	        if(frozen == 0 or frozen == 4)
	            draw_sprite_ext(2164/* spr_lefteye_pupil */, frame, x + rotx * 2.5 - 2, y + roty, 1 - sin(siner / 2) * 0.2, 1 - sin(siner / 2) * 0.2, rot, image_blend, 1)
	        else 
	            draw_sprite_ext(2164/* spr_lefteye_pupil */, frame, x + rotx * 2.5 - random(3), y + roty + random(2), 0.5 - sin(siner / 2) * 0.1, 0.5 - sin(siner / 2) * 0.1, rot, image_blend, 1)
	    }
	    if(desperate == 2)
	        draw_sprite_ext(2164/* spr_lefteye_pupil */, frame, x + rotx * 3 - 2, y + roty, 0.6 - sin(siner / 2) * 0.3, 0.6 - sin(siner / 2) * 0.3, rot, image_blend, 1)
	}
	if(md == 1) {
	    draw_sprite_ext(2163/* spr_lefteye_nopupil_flash */, frame, x + rotx * 2 - 2, y + roty, 1, 1, rot, grgr, 1)
	    draw_sprite_ext(2165/* spr_lefteye_pupil_flash */, frame, x + rotx * 2.5 - 2, y + roty, 1 - sin(siner / 2) * 0.2, 1 - sin(siner / 2) * 0.2, rot, gr, 1)
	}
	draw_sprite_ext(2159/* spr_lefteye_overlay */, frame, x + rotx, y + roty, 1, 1, rot, image_blend, 1)
	op= 250
	if(md == 0) {
	    draw_sprite_ext(2162/* spr_lefteye_nopupil */, frame, x + op - rotx * 2 + 2, y + roty, -1, 1, -rot, image_blend, 1)
	    if(desperate == 0)
	        draw_sprite_ext(2164/* spr_lefteye_pupil */, frame, x + op - rotx * 2.5 + 2, y + roty, -1 + cos(siner / 2) * 0.2, 1 - cos(siner / 2) * 0.2, -rot, image_blend, 1)
	    if(desperate == 1) {
	        if(frozen == 0 or frozen == 4)
	            draw_sprite_ext(2164/* spr_lefteye_pupil */, frame, x + op - rotx * 2.5 + 2, y + roty, -1 + cos(siner / 2) * 0.2, 1 - cos(siner / 2) * 0.2, -rot, image_blend, 1)
	        else 
	            draw_sprite_ext(2164/* spr_lefteye_pupil */, frame, x + op - rotx * 2.5 + 2, y + roty, -0.5 + cos(siner / 2) * 0.1, 0.5 - cos(siner / 2) * 0.1, -rot, image_blend, 1)
	    }
	    if(desperate == 2)
	        draw_sprite_ext(2164/* spr_lefteye_pupil */, frame, x + op - rotx * 3 + 2, y + roty, -0.6 + cos(siner / 2) * 0.3, 0.6 - cos(siner / 2) * 0.3, -rot, image_blend, 1)
	}
	if(md == 1) {
	    draw_sprite_ext(2163/* spr_lefteye_nopupil_flash */, frame, x + op - rotx * 2 + 2, y + roty, -1, 1, -rot, grgr, 1)
	    draw_sprite_ext(2165/* spr_lefteye_pupil_flash */, frame, x + op - rotx * 2.5 + 2, y + roty, -1 + cos(siner / 2) * 0.2, 1 - cos(siner / 2) * 0.2, -rot, gr, 1)
	}
	draw_sprite_ext(2159/* spr_lefteye_overlay */, frame, x + op - rotx, y + roty, -1, 1, -rot, image_blend, 1)

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
