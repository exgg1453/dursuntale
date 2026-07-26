# Auto-converted from GameMaker: obj_mettb_body
extends Node2D

func _ready():
	legl= 0
	legr= 0
	arml= 0
	armr= 0
	leglh= 0
	legrh= 0
	xoffr= 0
	yoffl= 0
	xoffr= 0
	yoffl= 0
	siner= 0
	lsin= 0
	rsin= 0
	faceno= 0
	side= 0
	prevside= 0
	hurt= 2
	hurtface= 0
	myalpha= 1
	myblend= 16777215
	sineron= 1
	pause= 0
	legmode= 0
	dancewait= 25
	$Alarm5.start((dancewait * 5) / 30.0)
	dsf= 0
	ds= 0
	fadewhite= 0
	whiteval= 0
	bodyopen= 0
	bodyimg= 0
	heartdead= 0
	dance= 1
	$Alarm6.start((5) / 30.0)
	noarm= 0
	noleg= 0
	endface= 0
	face_set= 0

func _gm_event_2_6():
	if(noarm == 1) {
	    xhau1= instance_create(x + 36 + sin(siner / 3.5), y - legh + 80 + cos(siner / 3.5) * 2, 328/* obj_planeexhaust */)
	    xhau2= instance_create(x + 110 + sin(siner / 3.5), y - legh + 80 + cos(siner / 3.5) * 2, 328/* obj_planeexhaust */)
	    xhau2.velocity.x= -xhau2.velocity.x
	    xhau1.z_index= z_index + 2
	    xhau2.z_index= z_index + 2
	}
	$Alarm6.start((10) / 30.0)

func _gm_event_2_5():
	$Alarm5.start((dancewait) / 30.0)
	if(GS.myfight == 0 and GS.mnfight == 0 and dance == 1)
	    event_user(0)

func _gm_event_2_2():
	side= choose(0, 1, 2)
	if(side == prevside) {
	    side++
	    if(side > 2) side= 0
	}
	prevside= side
	if(side == 0) {
	    sidex= x - random(30)
	    sidey= y - legh + random(40)
	}
	if(side == 1) {
	    sidex= x + random(140)
	    sidey= y - 35 - legh - random(10)
	}
	if(side == 2) {
	    sidex= x + 110 + random(30)
	    sidey= y - legh + random(40)
	}
	if(side == 3) {
	    sidex= x + 100 + random(40)
	    sidey= y - legh + random(40)
	}
	instance_create(sidex, sidey, 406/* obj_mettshine */)

func _gm_event_7_13():
	dance= 0
	noleg= 1
	falllegl= instance_create(x + 90 - xoffl - 32, y + 120 + yoffl - legh - sin(siner / 2) * 0.05, 407/* obj_fallofflimb */)
	falllegl.scale.x= 2
	falllegl.scale.y= 2
	falllegl.sprite_index= leglsprite
	falllegr= instance_create(x + 90 + xoffr - 200, y + 120 + yoffr - legh - sin(siner / 2) * 0.05, 407/* obj_fallofflimb */)
	falllegr.scale.x= -2
	falllegr.scale.y= 2
	falllegr.x+= 200
	falllegr.sprite_index= legrsprite

func _gm_event_7_12():
	noarm= 1
	fallarml= instance_create(x + 36 + sin(siner / 3.5), y - legh + 80 + cos(siner / 3.5) * 2, 407/* obj_fallofflimb */)
	fallarml.scale.x= 2
	fallarml.scale.y= 2
	fallarml.sprite_index= armlsprite
	fallarmr= instance_create(x + 110 + sin(siner / 3.5), y - legh + 80 + cos(siner / 3.5) * 2, 407/* obj_fallofflimb */)
	fallarmr.scale.x= -2
	fallarmr.scale.y= 2
	fallarmr.sprite_index= armrsprite

func _gm_event_7_11():
	legl= 0
	legr= 0
	arml= 0
	armr= 0
	leglh= 0
	legrh= 0
	xoffr= 0
	yoffl= 0
	xoffr= 0
	yoffl= 0
	siner= 0
	lsin= 0
	rsin= 0
	faceno= 0
	bodyopen= 1

func _gm_event_7_10():
	legr= floor(random(5))
	legl= floor(random(5))
	arml= floor(random(8))
	armr= floor(random(8))
	faceno= floor(random(9))

func _on_outside_room():
	if(noleg == 0) {
	    if(legr == 0) {
	        legrsprite= 498
	        xoffr= -14
	        yoffr= 10
	        legrh= 36
	    }
	    if(legr == 1) {
	        legrsprite= 499
	        xoffr= -16
	        yoffr= 6
	        legrh= 8
	    }
	    if(legr == 2) {
	        legrsprite= 506
	        xoffr= -10
	        yoffr= 14
	        legrh= 60
	    }
	    if(legr == 3) {
	        legrsprite= 504
	        xoffr= -10
	        yoffr= 14
	        legrh= 30
	    }
	    if(legr == 4) {
	        legrsprite= 505
	        xoffr= -18
	        yoffr= 2
	        legrh= 42
	    }
	    if(legr == 9) {
	        legrsprite= 502
	        xoffr= 20
	        yoffr= 6
	        legrh= 8
	    }
	    if(legr == 10) {
	        legrsprite= 503
	        xoffr= 15
	        yoffr= 2
	        legrh= 0
	    }
	    if(legl == 0) {
	        leglsprite= 498
	        xoffl= -14
	        yoffl= 10
	        leglh= 36
	    }
	    if(legl == 1) {
	        leglsprite= 499
	        xoffl= -16
	        yoffl= 6
	        leglh= 8
	    }
	    if(legl == 2) {
	        leglsprite= 506
	        xoffl= -10
	        yoffl= 14
	        leglh= 60
	    }
	    if(legl == 3) {
	        leglsprite= 504
	        xoffl= -10
	        yoffl= 14
	        leglh= 30
	    }
	    if(legl == 4) {
	        leglsprite= 505
	        xoffl= -18
	        yoffl= 2
	        leglh= 42
	    }
	    if(legl == 9) {
	        leglsprite= 500
	        xoffl= -5
	        yoffl= 2
	        leglh= 6
	    }
	    if(legl == 10) {
	        leglsprite= 501
	        xoffl= 0
	        yoffl= 5
	        leglh= 2
	    }
	}
	if(arml == 0) armlsprite= 507
	if(arml == 1) armlsprite= 508
	if(arml == 2) armlsprite= 509
	if(arml == 3) armlsprite= 510
	if(arml == 4) armlsprite= 511
	if(arml == 5) armlsprite= 512
	if(arml == 6) armlsprite= 513
	if(arml == 7) armlsprite= 514
	if(armr == 0) armrsprite= 507
	if(armr == 1) armrsprite= 508
	if(armr == 2) armrsprite= 509
	if(armr == 3) armrsprite= 510
	if(armr == 4) armrsprite= 511
	if(armr == 5) armrsprite= 512
	if(armr == 6) armrsprite= 513
	if(armr == 7) armrsprite= 514
	if(legl != 9 and legr != 9 and legl != 10 and legr != 10) {
	    offangle= 0
	    if(leglh > 10 or legrh > 10 and sineron == 1)
	        siner++
	    if(sineron == 1) {
	        rsin++
	        lsin++
	    }
	    if(leglh > legrh) {
	        legh= leglh * 2
	        lsin= 0
	    } else  {
	        legh= legrh * 2
	        rsin= 0
	    }
	    if(abs(leglh - legrh) < 5) {
	        lsin= 0
	        rsin= 0
	    }
	} else  {
	    if(leglh > legrh) legh= leglh * 2
	    else  legh= legrh * 2
	    if(legl == 10) lsin= 0
	    if(sineron == 1) {
	        siner++
	        rsin++
	        lsin++
	    }
	    offangle= 10
	}
	ds1= random(dsf * 2) - dsf
	ds2= random(dsf * 2) - dsf
	if(noleg == 0) {
	    draw_sprite_ext(legrsprite, 0, x + 90 + xoffr, y + 120 + yoffr - legh - sin(siner / 2) * 0.05, 2, 2 - sin(siner / 3.5) * 0.05, sin(rsin / 7) * 10 - offangle, myblend, myalpha)
	    draw_sprite_ext(leglsprite, 0, x + 90 - xoffl - 32, y + 120 + yoffl - legh - sin(siner / 2) * 0.05, -2, 2 - sin(siner / 3.5) * 0.05, sin(lsin / 7) * 10, myblend, myalpha)
	}
	if(noarm == 0) {
	    if(arml != 5)
	        draw_sprite_ext(armlsprite, 0, x + 36 + sin(siner / 3.5), y - legh + 80 + cos(siner / 3.5) * 2, 2, 2, 0, myblend, myalpha)
	    if(armr != 5)
	        draw_sprite_ext(armrsprite, 0, x + 110 + sin(siner / 3.5), y - legh + 80 + cos(siner / 3.5) * 2, -2, 2, 0, myblend, myalpha)
	}
	if(bodyopen == 1) {
	    if(bodyimg < 5) bodyimg+= 0.25
	} else  {
	    if(bodyimg > 0) bodyimg-= 0.25
	}
	draw_sprite_ext(557/* spr_mettb_upperbody */, bodyimg, x + 72 + sin(siner / 3.5) + ds1, y - legh + 134 + cos(siner / 3.5) * 2 + ds2, 2, 2, 0, myblend, myalpha)
	if(not instance_exists(420/* obj_mettheart_parent */) and not instance_exists(449/* obj_mettheart_burst */) and heartdead == 0)
	    draw_sprite_ext(558/* spr_mettb_upperbodyheart */, 0, x + 72 + sin(siner / 3.5) + 66 + ds1, y - legh + 134 + cos(siner / 3.5) * 2 + 108 + ds2, 2, 2, 0, myblend, myalpha)
	if(endface == 0) {
	    if(hurt == 0 and face_set == 0)
	        draw_sprite_ext(494/* spr_mettface1 */, faceno, x + 68, y + 40 - legh + cos(siner / 3.5) * 3, 2, 2, 0, myblend, myalpha)
	    if(hurt == 0 and face_set == 1)
	        draw_sprite_ext(497/* spr_mettface_defeated */, GS.faceemotion, x + 68 - ds1, y + 40 - legh + cos(siner / 3.5) * 3 - ds2, 2, 2, 0, myblend, myalpha)
	    if(hurt == 1)
	        draw_sprite_ext(496/* spr_mettface_hurt */, hurtface, x + 68, y + 40 - legh + cos(siner / 3.5) * 3, 2, 2, 0, myblend, myalpha)
	    if(hurt == 2)
	        draw_sprite_ext(497/* spr_mettface_defeated */, GS.faceemotion, x + 68 - ds1, y + 40 - legh + cos(siner / 3.5) * 3 - ds2, 2, 2, 0, myblend, myalpha)
	} else 
	    draw_sprite_ext(495/* spr_mettface_general */, GS.faceemotion, x + 68, y + 40 - legh + cos(siner / 3.5) * 3, 2, 2, 0, myblend, myalpha)
	if(noarm == 0) {
	    if(arml == 5)
	        draw_sprite_ext(armlsprite, 0, x + 42 + sin(siner / 3.5), y - legh + 80 + cos(siner / 3.5) * 2, 2, 2, 0, myblend, myalpha)
	    if(armr == 5)
	        draw_sprite_ext(armrsprite, 0, x + 110 + sin(siner / 3.5), y - legh + 80 + cos(siner / 3.5) * 2, -2, 2, 0, myblend, myalpha)
	}
	if(pause == 1 and hurt == 0) {
	    hurt= 1
	    hurtface= choose(0, 1)
	}
	if(pause == 2 and hurt == 0) {
	    hurt= 1
	    hurtface= 2
	}
	if(pause == 0) hurt= 0
	if(sineron == 1) {
	    y= obj_uborder.y - 136
	    if(GS.idealborder[2] < 250) {
	        if(legmode == 0) {
	            z_index= 0
	            legmode= 1
	            legl= choose(9, 10)
	            legr= legl
	        }
	    } else  {
	        if(legmode == 1) {
	            z_index= 10
	            legmode= 0
	            event_user(0)
	        }
	    }
	}
	if(fadewhite == 1) {
	    z_index= -999999
	    whiteval+= 0.2
	    draw_set_alpha(whiteval)
	    draw_set_color(16777215)
	    draw_rectangle(-10, -10, 999, 999, 0)
	    if(whiteval > 10) {
	        draw_set_alpha(-1 + whiteval / 10)
	        draw_set_color(0)
	        draw_rectangle(-10, -10, 999, 999, 0)
	    }
	    if(whiteval == 10 and GS.flag[425] == 1) snd_play(91/* snd_vaporized */)
	    draw_set_alpha(1)
	    if(whiteval >= 44) {
	        instance_create(0, 0, 148/* obj_persistentfader */)
	        room_goto(GS.currentroom)
	    }
	}
	if(noleg == 1) {
	    if(legrh > 6) legrh-= 4
	    else  legrh= 6
	    if(leglh > 6) leglh-= 4
	    else  leglh= 6
	    if(legh > 6) legh-= 4
	    else  legh= 6
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
