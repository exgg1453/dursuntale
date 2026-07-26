# Auto-converted from GameMaker: obj_monster_extrabody
extends Node2D

func _ready():
	active= 0
	$Alarm0.start((1) / 30.0)
	drawme= 0
	siner= 0
	siner2= 0

func _on_destroy():
	active= 1
	if(type == 1) {
	    mypart1= instance_create(x, y - 4, 215/* obj_froghead */)
	    mypart2= instance_create(x, y - 4, 214/* obj_froglegs */)
	}
	if(type == 8) {
	    sprite_index= 198/* spr_lesserdoge */
	    mercymod= 0
	    z_index= 10
	    tail= instance_create(x, y, 221/* obj_lesserdogetail */)
	    tail.tailobj= id
	    head= instance_create(x, y, 222/* obj_lesserdogehead */)
	    head.tailobj= id
	}
	if(type == 9) {
	}
	if(type == 11) {
	    part1= 254
	    part2= 255
	    mypart1= _spawn("part1", x + 18, y)
	    mypart2= _spawn("part2", x + 18, y)
	}
	if(type == 12) {
	    part1= 236
	    part2= 237
	    part3= 233
	    mypart1= _spawn("part1", x, y - 6)
	    mypart2= _spawn("part2", x, y - 6)
	    gift[0]= floor(random(7))
	    gift[1]= floor(random(7))
	    gift[2]= floor(random(7))
	    if(gift[1] == gift[0]) gift[1]++
	    if(gift[2] == gift[0]) gift[2]++
	    if(gift[2] == gift[1]) gift[2]= 0
	    if(gift[2] == gift[0]) gift[2]++
	    mypart3= _spawn("part3", x, y - 6)
	    mypart3.gift= gift[0]
	    mypart4= _spawn("part3", x, y - 6)
	    mypart4.gift= gift[1]
	    mypart8= _spawn("part3", x, y - 6)
	    mypart8.gift= gift[2]
	    if(GS.flag[138] == 1) {
	        with(mypart3) visible= 0
	        with(mypart4) visible= 0
	        with(mypart8) visible= 0
	    }
	}
	if(type == 13) {
	    part2= 251
	    part3= 250
	    part4= 249
	    part1= scr_marker(x - 6, y - 12, 219)
	    part1.scale.x= 2
	    part1.scale.y= 2
	    part1.image_speed= 0.25
	    mypart2= _spawn("part2", x - 6, y - 12)
	    mypart3= _spawn("part3", x - 6, y - 12)
	    mypart4= _spawn("part4", x - 6, y - 12)
	}
	if(type == 14) {
	    part1= 241
	    part2= 243
	    mypart1= _spawn("part1", x, y)
	    mypart2= _spawn("part2", x, y)
	    part1= 242
	    part2= 244
	    mypart1= _spawn("part1", x, y)
	    mypart2= _spawn("part2", x, y)
	}
	if(type == 15) instance_create(x, y, 258/* obj_woshbody */)
	if(type == 16) {
	    ab= instance_create(x, y, 290/* obj_aaronbody */)
	    if(GS.flag[95] == 1) ab.sprite_index= 249/* spr_aaronbody_bull */
	}
	if(type == 17) {
	    emotion= 0
	    if(GS.flag[81] == 2) emotion= 1
	    part1= 260
	    mypart1= _spawn("part1", x, y)
	    part1.creator= id
	    agent= instance_create(x, y + 3, 261/* obj_agentbody */)
	}
	if(type == 18) instance_create(x, y, 294/* obj_tembody */)
	if(type == 19) {
	    msx= instance_create(x, y + 120, 295/* obj_moldsmalx_body */)
	    GS.idealborder[2]= 99999
	}
	if(type == 20)
	    dummy= instance_create(x + 60, y + 50, 288/* obj_maddum_drawer */)
	if(type == 21) {
	    bara1= instance_create(x, y + 22, 318/* obj_barabody */)
	    bara1.headpic= 364
	    bara2= instance_create(x + 210, y + 22, 318/* obj_barabody */)
	    bara2.headpic= 365
	    bd= 0
	}
	if(type == 22)
	    vulkin= instance_create(x, y - 10, 336/* obj_vulkinbody */)
	if(type == 23) {
	    graze= 0
	    plane= instance_create(x, y + 10, 329/* obj_tsunderplane_body */)
	    plane.parent= id
	}
	if(type == 24) {
	    pyrope= instance_create(x, y + 70, 342/* obj_pyropebody */)
	    pyrope.parent= id
	}
	if(type == 25) {
	    spider= instance_create(x + 55, y, 362/* obj_spiderb_body */)
	    spider.parent= id
	}
	if(type == 26) {
	    stare1= 0
	    stare2= 0
	    madjick= instance_create(x + 30, y + 80, 368/* obj_wizardbody */)
	    madjick.parent= id
	}
	if(type == 27) {
	    knight= instance_create(x + 50, y, 379/* obj_finalknight_body */)
	    knight.parent= id
	}
	if(type == 28) {
	    frog= instance_create(x - 10, y, 386/* obj_finalfroggit_body */)
	    frog.parent= id
	}
	if(type == 29) {
	    knight= instance_create(x, y, 396/* obj_whimsalot_body */)
	    knight.parent= id
	}
	if(type == 30) {
	    eye= instance_create(x, y, 388/* obj_astigmatism_body */)
	    eye.parent= id
	}
	if(type == 31) aa= instance_create(x, y, 553/* obj_memoryhead_body */)
	if(type == 32)
	    aa= instance_create(x - 10, y - 10, 549/* obj_reaperbird_body */)
	if(type == 33) {
	    aa= instance_create(x - 20, y + 40, 556/* obj_endogeny_body */)
	    aa.spared= 1
	}
	if(type == 34) aa= instance_create(x, y - 10, 529/* obj_lemonbread_body */)

func _on_outside_room():
	if(active == 1) {
	    if(type == 2) {
	        siner++
	        y+= sin(siner / 6)
	        draw_sprite(180/* spr_whimsun */, floor(siner / 6), x, y)
	    }
	    if(type == 3) {
	        siner++
	        draw_sprite_ext(182/* spr_moldsmal */, floor(siner / 6), x, y + sin(siner / 4) * 10 + 20, 1, 1 - sin(siner / 4) * 0.05, 0, 16777215, 1)
	    }
	    if(type == 4) {
	        siner++
	        draw_sprite_ext(185/* spr_napstabattle_leg */, floor(siner / 4), x - 2, y - 6, 2, 2, 0, 16777215, 1)
	        if(y < view_yview[0] + 240 and GS.flag[36] > 0) {
	            siner2++
	            draw_sprite_ext(183/* spr_blookhat */, 5, x + 34, y - 32, 2, 2, 0, 16777215, siner2 / 100)
	        }
	    }
	    if(type == 5) {
	        siner++
	        gosp= 186
	        if(y < view_yview[0] + 240) gosp= 188
	        if(siner < 15) draw_sprite(gosp, 0, x, y)
	        if(siner >= 15 and siner <= 18)
	            draw_sprite(gosp, 1, x, y)
	        if(siner >= 19 and siner <= 21)
	            draw_sprite(gosp, 0, x, y)
	        if(siner >= 22 and siner <= 25)
	            draw_sprite(gosp, 1, x, y)
	        if(siner >= 25) siner= 0
	    }
	    if(type == 6) {
	        siner++
	        if(siner > 30) {
	            siner2++
	            if(siner2 > 9) {
	                siner2= 0
	                siner= 0
	            }
	        }
	        draw_sprite(189/* spr_loox */, floor(siner2 / 2), x, y - 10)
	    }
	    if(type == 7) {
	        siner++
	        draw_sprite(191/* spr_vegetoid */, floor(siner / 6), x, y)
	    }
	    if(type == 8) {
	        siner++
	        draw_sprite(198/* spr_lesserdoge */, floor(siner / 10), x, y)
	        if(y < view_yview[0] + 240 and GS.flag[55] == 2)
	            mercymod+= 2
	    }
	    if(type == 9) {
	        siner++
	        draw_sprite_ext(224/* spr_greatdog_n */, floor(siner / 10), x, y, 2, 2, 0, 16777215, 1)
	    }
	    if(type == 10) {
	        siner++
	        draw_sprite(202/* spr_icecap */, floor(siner / 10), x, y + 16)
	    }
	    if(type == 13 and y < view_yview[0] + 240) {
	        part1.sprite_index= 220/* spr_movedogeheadb */
	        part1.image_speed= 0.1
	    }
	    if(type == 17 and y < view_yview[0] + 240 and emotion == 1)
	        emotion= 2
	    if(type == 19 and y < view_yview[0] + 260 and msx.stage == 0)
	        msx.stage= 1
	    if(type == 20 and y < view_yview[0] + 240) {
	        GS.faceemotion= 3
	        dummy.rotmod+= 0.04
	        dummy.speedmod+= 0.03
	    }
	    if(type == 21 and y < view_yview[0] + 240 and bd == 0) {
	        bd= 1
	        with(bara1) event_user(2)
	    }
	    if(type == 22 and y < view_yview[0] + 240)
	        obj_vulkinbody.face= 390
	    if(type == 27 and y < view_yview[0] + 300) {
	        siner2++
	        if(siner2 > 25) knight.asleep= 1
	        if(siner2 > 50) knight.asleep= 2
	    }
	    if(type == 30) {
	        if(y < view_yview[0] + 260) {
	            if(eye.anim < 230) eye.anim= 235
	        } else  eye.anim= 20
	    }
	    if(type == 31 and y < view_yview[0] + 200 and aa.mega == 0) {
	        aa.mega= 1
	        aa.$Alarm0.start((-1) / 30.0)
	        aa.$Alarm1.start((-1) / 30.0)
	        aa.$Alarm2.start((-1) / 30.0)
	        aa.on= 1
	    }
	    if(type == 32 and y < view_yview[0] + 200)
	        aa.stretchup= 2
	    if(type == 33 and y < view_yview[0] + 200) {
	        graze= 3
	        aa.fader= 1
	    }
	    if(type == 34 and y < view_yview[0] + 200 and aa.melting == 0)
	        aa.melting= 1
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
