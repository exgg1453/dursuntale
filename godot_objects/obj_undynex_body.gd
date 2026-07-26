# Auto-converted from GameMaker: obj_undynex_body
extends Node2D

func _ready():
	siner= 0
	eyetimer= 0
	eye_on= 0
	slashno= 0
	movetype= 0
	larm= instance_create(x + 64, y + 78, 1363/* obj_npc_marker */)
	larm.sprite_index= 312/* spr_undynex_leftarm */
	larm.scale.x= 2
	larm.scale.y= 2
	larm.z_index= 7
	arm_v= 0
	larm.visible= 0
	facetype= 0
	heady= 0
	pause= 0
	shakify= 0

func _gm_event_2_1():
	slashno++

func _gm_event_7_11():
	if(movetype == 0) movetype= 2

func _on_outside_room():
	if(movetype == 2) {
	    larm.visible= 1
	    if(slashno == 0 and larm.rotation_degrees > -104) {
	        facetype= 1
	        larm.rotation_degrees-= 35
	        larm.x-= 4
	        larm.y-= 4
	        heady-= 2
	    }
	    if(slashno == 0 and larm.rotation_degrees <= -104) {
	        larm.rotation_degrees= -104
	        $Alarm1.start((5) / 30.0)
	        slashno= 0.1
	    }
	    if(slashno == 1.1) {
	        slashno= 1
	        $Alarm1.start((2) / 30.0)
	    }
	    if(slashno == 1) {
	        facetype= 0
	        larm.z_index= 4
	        larm.rotation_degrees+= 73.3333333333333
	    }
	    if(slashno == 2) {
	        larm.x= larm.xstart
	        larm.y= larm.ystart
	        larm.rotation_degrees= 66
	        slash= instance_create(larm.x - 180, larm.y + 20, 1363/* obj_npc_marker */)
	        slash.sprite_index= 280/* spr_undyneb_smear */
	        slash.visible= 1
	        slash.modulate.a= 1
	        slash2= instance_create(larm.x - 180, larm.y + 20, 1363/* obj_npc_marker */)
	        slash2.sprite_index= 280/* spr_undyneb_smear */
	        slash2.visible= 1
	        slash2.modulate.a= 1
	        slashno= 3
	    }
	    if(slashno == 3) {
	        if(heady < 6) heady+= 3
	        slash.modulate.a-= 0.1
	        slash2.modulate.a-= 0.1
	        slash2.y+= 24
	        larm.rotation_degrees+= 0.5
	        if(larm.rotation_degrees > 70) {
	            with(slash) instance_destroy()
	            with(slash2) instance_destroy()
	            slashno= 4
	            $Alarm1.start((3) / 30.0)
	        }
	    }
	    if(slashno == 5) {
	        if(heady > 0) heady--
	        larm.rotation_degrees-= 15
	        if(larm.rotation_degrees <= 6) {
	            heady= 0
	            larm.z_index= 7
	            larm.rotation_degrees= 0
	            slashno= 0
	            movetype= 0
	            arm_v= 0
	            larm.visible= 0
	        }
	    }
	}
	siner+= 1.4
	if(pause == 1) siner= 0
	s_f= sin(siner / 6)
	s_f2= sin(siner / 3)
	s_f3= sin(siner / 14)
	draw_sprite_ext(308/* spr_undynex_hair */, 0, x + 85, y + s_f * 3 + heady + 4, 2, 2, 70 - s_f * 15, 16777215, 1)
	draw_sprite_ext(311/* spr_undynex_legs */, 0, x + 100, y + 164, 2, 2, 0, 16777215, 1)
	if(arm_v == 0)
	    draw_sprite_ext(312/* spr_undynex_leftarm */, 0, x + 64 + s_f * 5, y + 78 + s_f * 5, 2, 2, 0, 16777215, 1)
	draw_sprite_ext(313/* spr_undynex_rightarm */, 0, x + 136 + s_f2 * 3, y + 78 + s_f * 6 + s_f2 * 2, 2, 2, 0, 16777215, 1)
	draw_sprite_ext(309/* spr_undynex_torso */, 0, x + 100, y + 78 + s_f * 4, 2, 2, -(s_f * 4), 16777215, 1)
	draw_sprite_ext(310/* spr_undynex_pants */, 0, x + 100, y + 122 + s_f * 2, 2, 2, s_f * 2, 16777215, 1)
	if(facetype == 0) {
	    if(pause == 0)
	        draw_sprite_ext(303/* spr_undynex_face1 */, floor(siner / 3), x + 100, y + 28 + s_f * 2 + heady, 2, 2, 0, 16777215, 1)
	    if(pause == 1)
	        draw_sprite_ext(305/* spr_undynex_face_damage */, floor(siner / 3), x + 100, y + 28 + s_f * 2 + heady, 2, 2, 0, 16777215, 1)
	}
	if(facetype == 1)
	    draw_sprite_ext(306/* spr_undynex_face_laugh */, floor(siner / 3), x + 100, y + 28 + s_f * 2 + heady, 2, 2, 0, 16777215, 1)
	if(facetype == 2)
	    draw_sprite_ext(304/* spr_undynex_face_e */, GS.faceemotion, x + 100, y + 28 + s_f * 2 + heady, 2, 2, 0, 16777215, 1)
	if(facetype != 0) eyetimer= 0
	eyetimer++
	if(eyetimer >= 10) {
	    draw_sprite_ext(302/* spr_undynex_eyebeam */, 0, x + 110, y + 24 + s_f * 2, (eyetimer - 10) / 4, 2.5 - (eyetimer - 10) / 20, -(s_f3 * 32), 16777215, 1.5 - (eyetimer - 10) / 20)
	    if(eyetimer >= 40) eyetimer= 0
	}
	if(movetype == 2) arm_v= 1
	if(shakify > 0) {
	    x= xstart + random(shakify) - random(shakify)
	    y= ystart + random(shakify) - random(shakify)
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
