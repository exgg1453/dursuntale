# Auto-converted from GameMaker: obj_shop5_body
extends Node2D

func _ready():
	GS.faceemotion= 0
	nowemote= 0
	facex= 0
	facey= 0
	offx[0]= 0
	offy[0]= 0
	offx[1]= 0
	offy[1]= 0
	offx[2]= 0
	offy[2]= 0
	facetimer= 0
	siner= 0
	bodyx= 0
	bodyy= 0
	boxx= 0
	sellmenu= -1
	sellpos= 0
	sellpos2= 0

func _gm_event_7_10():
	facetimer= 0
	facex= 0
	facey= 0
	bodyx= 0
	bodyy= 0

func _on_outside_room():
	if(nowemote != GS.faceemotion) event_user(0)
	nowemote= GS.faceemotion
	siner++
	draw_sprite(889/* spr_5_coffeeline */, floor(siner / 8), 178, floor(62 + sin(siner / 4) * 1.5))
	draw_sprite(888/* spr_5_tembody */, 0, 99 + bodyx, 1 + bodyy)
	if(GS.faceemotion == 0) {
	    draw_sprite(890/* spr_5_tembrows */, 0, floor(138 + offx[0]), floor(32 + offy[0] + facey / 2))
	    draw_sprite(891/* spr_5_eyes1 */, 0, floor(139 + offx[1] + facex), floor(40 + offy[1] + facey))
	    draw_sprite(897/* spr_5_mouth1 */, 0, floor(141 + offx[2] + facex), floor(48 + offy[2] + facey))
	    facetimer++
	    if(facetimer > 90 and facetimer < 110)
	        facex+= sin(facetimer / 10) * 0.8
	    if(facetimer > 130 and facetimer < 150)
	        facex+= sin(facetimer / 10) * 0.8
	    if(facetimer > 190 and facetimer < 230) {
	        facex*= 0.9
	        if(facex <= 0.5) facex= 0
	    }
	    if(facetimer > 290 and facetimer < 310)
	        facey+= sin(facetimer / 10) * 0.8
	    if(facetimer > 326 and facetimer < 345)
	        facey+= sin(facetimer / 10) * 1.5
	    if(facetimer > 390 and facetimer < 430) {
	        facey*= 0.9
	        if(facey <= 0.5) facex= 0
	    }
	    if(facetimer == 460) facetimer= 0
	}
	if(GS.faceemotion == 1) {
	    rr= random(0.8) - random(0.8)
	    rr2= random(0.8) - random(0.8)
	    draw_sprite(890/* spr_5_tembrows */, 0, floor(138 + offx[0]), floor(32 + offy[0] + facey / 2 - sin(facetimer / 2)))
	    draw_sprite(892/* spr_5_eyes2 */, 0, floor(135 + offx[1] + facex + rr), floor(38 + offy[1] + facey + rr2))
	    draw_sprite(897/* spr_5_mouth1 */, 0, floor(141 + offx[2] + facex), floor(48 + offy[2] + facey))
	    facetimer++
	}
	if(GS.faceemotion == 2) {
	    draw_sprite(890/* spr_5_tembrows */, 0, floor(138 + offx[0]), floor(32 + offy[0] + facey / 2))
	    draw_sprite(893/* spr_5_eyes3 */, 0, floor(139 + offx[1] + facex), floor(40 + offy[1] + facey))
	    draw_sprite(898/* spr_5_mouth2 */, floor(siner / 3), floor(141 + offx[2] + facex), floor(48 + offy[2] + facey))
	    draw_sprite_ext(902/* spr_5_sweat */, 0, 133, 39 + sin(siner / 4) * 1.5, 1, 1, 0, 16777215, 1 + sin(siner / 4))
	    if(facetimer > 45 and facetimer < 55)
	        facex+= sin(facetimer / 5) * 0.8
	    if(facetimer > 65 and facetimer < 75)
	        facex+= sin(facetimer / 5) * 0.8
	    if(facetimer > 95 and facetimer < 115) {
	        facex*= 0.9
	        if(facex <= 0.5) facex= 0
	    }
	    if(facetimer == 140) facetimer= 0
	    facetimer++
	}
	if(GS.faceemotion == 3) {
	    facex= 2
	    facey= -2
	    draw_sprite(894/* spr_5_eyes4 */, 0, floor(137 + offx[1] + facex), floor(32 + offy[1] + facey))
	    draw_sprite(899/* spr_5_mouth3 */, floor(siner / 3), floor(146 + offx[2] + facex), floor(42 + offy[2] + facey))
	    facetimer++
	}
	if(GS.faceemotion == 4) {
	    facey= sin(facetimer / 5) * 1.5
	    draw_sprite(895/* spr_5_eyes5 */, 0, floor(137 + offx[1] + facex), floor(32 + offy[1] + facey))
	    draw_sprite(899/* spr_5_mouth3 */, floor(siner / 3), floor(144 + offx[2] + facex + cos(siner / 1.5) * 1.5), floor(43 + offy[2] + facey))
	    draw_sprite_ext(902/* spr_5_sweat */, 0, 133, 39 + sin(siner / 4) * 1.5, 1, 1, 0, 16777215, 1 + sin(siner / 4))
	    facetimer++
	}
	if(GS.faceemotion == 5) {
	    rr= random(1) - random(1)
	    rr2= random(1) - random(1)
	    bodyx= rr
	    bodyy= rr2
	    facey= sin(facetimer / 3) * 2
	    draw_sprite(896/* spr_5_eyes6 */, 0, floor(137 + offx[1] + facex), floor(31 + offy[1] + facey))
	    draw_sprite(899/* spr_5_mouth3 */, floor(siner / 3), floor(144 + offx[2] + facex + cos(siner) * 2), floor(43 + offy[2] + facey))
	    draw_sprite_ext(902/* spr_5_sweat */, 0, 133, 39 + sin(siner / 2) * 2, 1, 1, 0, 16777215, 1 + sin(siner / 2))
	    facetimer++
	}
	if(GS.faceemotion == 6) {
	    draw_sprite(900/* spr_5_sellface */, floor(siner / 2), floor(139 + offx[1] + facex), floor(25 + offy[1] + facey))
	    facetimer++
	}
	if(GS.faceemotion == 7) {
	    draw_sprite(901/* spr_5_sellface_x */, floor(siner / 2), floor(139 + offx[1] + facex), floor(25 + offy[1] + facey))
	    facetimer++
	}
	draw_sprite(886/* spr_5_tembox */, 0, 80 + boxx, 68)
	if(sellmenu == 1) {
	    draw_set_color(16777215)
	    draw_set_font(2)
	    value[0]= 100
	    value[1]= 5
	    value[2]= 666
	    value[3]= 10
	    value[4]= 100
	    value[5]= 5
	    value[6]= 12
	    value[7]= 0
	    value[8]= 0
	    value[9]= 0
	    value[10]= 0
	    i= 0
	    while(i < 8) {
	        s_value[i]= "    " + string(value[i])
	        if(value[i] >= 10 and value[i] < 100)
	            s_value[i]= "  " + string(value[i])
	        if(value[i] >= 100 and value[i] < 1000)
	            s_value[i]= string(value[i])
	        i++
	    }
	    odd= -1
	    if(sellpos == 0 or sellpos == 2 or sellpos == 4 or sellpos == 6) {
	        odd= 0
	        draw_sprite(49/* spr_heartsmall */, 0, 15, 135 + sellpos / 2 * 20)
	    }
	    if(sellpos == 1 or sellpos == 3 or sellpos == 5 or sellpos == 7) {
	        odd= 1
	        draw_sprite(49/* spr_heartsmall */, 0, 155, 135 + (sellpos - 1) / 2 * 20)
	    }
	    if(sellpos == 8) draw_sprite(49/* spr_heartsmall */, 0, 15, 215)
	    if(Input.is_action_pressed("move_right") and odd == 0 and value[sellpos + 1] != 0)
	        sellpos++
	    if(Input.is_action_pressed("move_left") and odd == 1)
	        sellpos--
	    if(Input.is_action_pressed("move_down")) {
	        d_fail= 0
	        if(value[sellpos + 2] == 0) d_fail= 1
	        if(d_fail == 1 and value[sellpos + 1] != 0) d_fail= 2
	        if(sellpos == 6 or sellpos == 7 or sellpos == 8)
	            d_fail= 1
	        if(d_fail == 1) sellpos= 8
	        else  {
	            if(d_fail == 2) sellpos++
	            else  sellpos+= 2
	        }
	    }
	    if(Input.is_action_pressed("move_up") and sellpos != 0 and sellpos != 1) {
	        if(sellpos == 8) {
	            this_i= -1
	            i= 7
	            while(this_i == -1) {
	                if(value[i] != 0) this_i= i
	                i--
	                if(i == -1) this_i= 8
	            }
	            sellpos= this_i
	        } else  sellpos-= 2
	    }
	    draw_set_color(16777215)
	    i= 0
	    while(i < 4) {
	        if(value[i * 2] != 0)
	            draw_text(30, 130 + i * 20, s_value[i * 2] + "G - Ninechara")
	        if(value[i * 2 + 1] != 0)
	            draw_text(170, 130 + i * 20, s_value[i * 2 + 1] + "G - Ninechara")
	        i++
	    }
	    draw_text(30, 210, "Exit")
	    draw_set_color(65535)
	    draw_text(200, 210, "(9999 G)")
	    if(Input.is_action_pressed("ui_accept")) {
	        buffer= 3
	        if(sellpos == 8) sellmenu= 0
	        else  {
	            sellmenu= 2
	            sellpos2= 0
	        }
	    }
	}
	if(sellmenu == 2) {
	    buffer--
	    draw_set_color(16777215)
	    draw_set_font(2)
	    draw_text(55, 150, "Really sell Ninechara for " + string(value[sellpos]) + "G?")
	    draw_text(80, 180, "Yes")
	    draw_text(190, 180, "No")
	    draw_sprite(49/* spr_heartsmall */, 0, 65 + sellpos2 * 110, 185)
	    draw_set_color(65535)
	    draw_text(200, 210, "(9999 G)")
	    if(Input.is_action_pressed("move_left") or Input.is_action_pressed("move_right")) {
	        if(sellpos2 == 0) sellpos2= 1
	        else  sellpos2= 0
	    }
	    if(Input.is_action_pressed("ui_accept") and buffer <= 0 and sellpos2 == 1)
	        sellmenu= 1
	}
	if(GS.flag[276] == 1)
	    draw_sprite(887/* spr_temhat */, 0, 99 + bodyx + 37, 1 + bodyy)

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
