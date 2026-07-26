# Auto-converted from GameMaker: obj_lastbeam
extends Node2D

func _ready():
	range= 1
	timer= 9
	col= 16777215
	siner= 0
	beamtime= 10
	targetx= obj_heart.x
	targety= obj_heart.y
	home= 0
	beamsfx= caster_load("music/sfx/sfx_rainbowbeam_1.ogg")
	beamsfx2= caster_load("music/sfx/sfx_rainbowbeam_hold.ogg")
	last= 300
	hits= 0

func _gm_event_1_0():
	caster_free(beamsfx)
	caster_free(beamsfx2)

func _gm_event_2_5():
	snd_play(53/* snd_hurt1 */)
	if(not instance_exists(184/* obj_shaker */)) instance_create(0, 0, 184/* obj_shaker */)
	if(hits == 0) GS.hp= 1
	if(hits == 1) GS.hp= 1
	if(hits == 2) GS.hp= 0.9
	if(hits == 3) GS.hp= 0.5
	if(hits == 4) GS.hp= 0.1
	if(hits == 5) GS.hp= 0.01
	if(hits == 6) GS.flag[509]= 1
	if(hits == 7) GS.flag[509]= 2
	if(hits == 8) GS.flag[509]= 3
	if(hits == 9) GS.flag[509]= 4
	hits++
	$Alarm5.start((40) / 30.0)

func _on_outside_room():
	timer++
	siner++
	col= make_color_hsv(siner * 11, 190, 250)
	col2= make_color_hsv((siner + 3) * 11, 190, 250)
	col3= make_color_hsv((siner + 5) * 11, 140, 250)
	if(timer == beamtime) {
	    hits= 0
	    $Alarm5.start((1) / 30.0)
	    obj_btparent.z_index= -2000
	    z_index= -1000
	    obj_heart.z_index= -2100
	    shaken= 0
	    menu[0]= 750
	    menux[0]= obj_fightbt.x
	    menuy[0]= obj_fightbt.y
	    menu[1]= 752
	    menux[1]= obj_itembt.x
	    menuy[1]= obj_itembt.y
	    menu[2]= 754
	    menux[2]= obj_sparebt.x
	    menuy[2]= obj_sparebt.y
	    svol1= 0.8
	    svol2= 0
	    s1= caster_play(beamsfx, svol1, 1)
	    s2= caster_loop(beamsfx2, 1, 1)
	    ar= 0.7
	    bw= 60
	    if(range == 1) bw= 220
	    if(range == 2) bw= 120
	    mbw= bw
	    bw= 0
	}
	if(timer > beamtime) {
	    if(timer < beamtime + 6) bw+= mbw / 5
	    if(bw > 0) {
	        if(svol2 < 0.8) svol2+= 0.05
	        caster_set_volume(s2, svol2)
	        ob= sin(siner / 2) * mbw / 5 * bw / mbw
	        draw_set_alpha(ar)
	        if(home == 0) {
	            draw_triangle_color(x, y, x + bw + ob, get_viewport_rect().size.y + 10, x - bw - ob, get_viewport_rect().size.y + 10, col, col2, col2, 0)
	            draw_triangle_color(x, y, x + bw + ob / 2, get_viewport_rect().size.y + 10, x - bw - ob / 2, get_viewport_rect().size.y + 10, col, col2, col2, 0)
	            draw_triangle_color(x, y, x + bw - ob, get_viewport_rect().size.y + 10, x - bw + ob, get_viewport_rect().size.y + 10, col, col3, col3, 0)
	            draw_sprite_ext(2393/* spr_beamcircle */, 0, x, y, (7 + sin(siner / 2) * 3.75) * bw / mbw, (7 + sin(siner / 2) * 3.75) * bw / mbw, 0, col, ar)
	            draw_sprite_ext(2393/* spr_beamcircle */, 0, x, y, (6 + sin(siner / 2) * 2.5) * bw / mbw, (6 + sin(siner / 2) * 2.5) * bw / mbw, 0, col, ar)
	            draw_sprite_ext(2393/* spr_beamcircle */, 0, x, y, (5 + sin(siner / 2)) * bw / mbw, (5 + sin(siner / 2)) * bw / mbw, 0, col2, ar)
	        }
	        if(home == 1) {
	            targetx= mouse_x
	            targety= mouse_y
	            tt= lengthdir_x(600, point_direction(x, y, targetx, targety))
	            tt2= lengthdir_y(600, point_direction(x, y, targetx, targety))
	            draw_line_width_color(x, y, x + tt, y + tt2, bw + ob * 2, col, col2)
	            draw_line_width_color(x, y, x + tt, y + tt2, bw + ob, col, col2)
	            draw_line_width_color(x, y, x + tt, y + tt2, bw, col, col3)
	            factor= mbw / 60
	            draw_sprite_ext(2393/* spr_beamcircle */, 0, x, y, (7 + sin(siner / 2) * 3) * bw / mbw * factor, (7 + sin(siner / 2) * 3) * bw / mbw * factor, 0, col, ar)
	            draw_sprite_ext(2393/* spr_beamcircle */, 0, x, y, (6 + sin(siner / 2) * 2) * bw / mbw * factor, (6 + sin(siner / 2) * 2) * bw / mbw * factor, 0, col, ar)
	            draw_sprite_ext(2393/* spr_beamcircle */, 0, x, y, (5 + sin(siner / 2)) * bw / mbw * factor, (5 + sin(siner / 2)) * bw / mbw * factor, 0, col2, ar)
	        }
	        if(last > 0 and timer == 120) {
	            shaken= 1
	            bw+= 100
	            mbw+= 80
	            caster_set_pitch(s2, 1.3)
	            blcon= instance_create(400, 50, 187/* obj_blconwdflowey */)
	            GS.msc= 0
	            GS.msg[0]= "STOP IT!!"
	            GS.typer= 88
	            blconwd= instance_create(blcon.x + 25, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	            blcon.z_index= -2000
	            blconwd.z_index= -2200
	        }
	        if((timer == 190 or timer == 340) and last > 0) {
	            with(blcon) instance_destroy()
	            with(blconwd) instance_destroy()
	        }
	        if(last > 0 and timer == 240) {
	            shaken= 2
	            bw+= 400
	            mbw+= 260
	            caster_set_pitch(s2, 1.8)
	            blcon= instance_create(400, 50, 187/* obj_blconwdflowey */)
	            GS.msc= 0
	            GS.msg[0]= "STOP IT NOW!!!"
	            GS.typer= 88
	            blconwd= instance_create(blcon.x + 25, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	            blcon.z_index= -2000
	            blconwd.z_index= -2200
	        }
	        if(shaken == 1) {
	            i= 0
	            while(i < 3) {
	                menu[i].x= menux[i] + random(4) - random(4)
	                menu[i].y= menuy[i] + random(4) - random(4)
	                i++
	            }
	        }
	        if(shaken == 2) {
	            i= 0
	            while(i < 3) {
	                menu[i].velocity.y+= 0.5
	                menu[i].rotation_degrees+= random(4) - random(4)
	                i++
	            }
	            GS.bmenucoord[0]= 1
	            GS.mercy= 3
	        }
	        draw_set_alpha(1)
	        if(timer > beamtime + 80 + last) {
	            if(svol2 > 0) svol2-= 0.1
	            caster_set_volume(s2, svol2)
	            bw-= mbw / 12
	            ar-= 0.04
	            if(bw <= 0) {
	                caster_stop(s2)
	                GS.mnfight= 3
	                GS.msg[0]= "* ..."
	                instance_destroy()
	            }
	        }
	    }
	}
	scr_binfowrite()

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
