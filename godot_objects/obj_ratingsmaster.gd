# Auto-converted from GameMaker: obj_ratingsmaster
extends Node2D

func _ready():
	GS.ratings= 4000
	i= 0
	while(i < 6) {
	    rq[i]= ""
	    rq_v[i]= 0
	    rq_s[i]= 900
	    i++
	}
	curtype= 0
	thisi= floor(random(8))
	i= 0
	while(i < 10) {
	    rp[i]= 4000 - random(500)
	    if(i == thisi) rp[i]= GS.ratings
	    i++
	}
	$Alarm5.start((6) / 30.0)
	accu= 0
	i= 0
	while(i < 15) {
	    typeuse[i]= 0
	    i++
	}
	boastmode= 0
	siner= 0
	heel= 0
	checkhp= GS.hp
	thisarmor= GS.armor
	i= 0
	while(i < 9) {
	    armor_worn[i]= 0
	    i++
	}
	event_user(1)
	novel_armor= 0
	timeloss= 0
	o_o= 0
	o_ob= 0
	essay= 0
	active= 1

func _gm_event_2_5():
	thisi= floor(random(10))
	i= 9
	while(i > 0) {
	    rp[i]= rp[i - 1]
	    i--
	}
	rp[0]= GS.ratings - random(GS.ratings / 2)
	if(accu == 6) rp[0]= GS.ratings
	accu++
	if(accu == 10) accu= 0
	$Alarm5.start((6) / 30.0)

func _gm_event_7_11():
	if(GS.armor == 4 and armor_worn[0] == 0) {
	    armor_worn[0]= 1
	    novel_armor= 1
	}
	if(GS.armor == 12 and armor_worn[1] == 0) {
	    armor_worn[1]= 1
	    novel_armor= 1
	}
	if(GS.armor == 15 and armor_worn[2] == 0) {
	    armor_worn[2]= 1
	    novel_armor= 1
	}
	if(GS.armor == 24 and armor_worn[3] == 0) {
	    armor_worn[3]= 1
	    novel_armor= 1
	}
	if(GS.armor == 44 and armor_worn[4] == 0) {
	    armor_worn[4]= 1
	    novel_armor= 1
	}
	if(GS.armor == 46 and armor_worn[5] == 0) {
	    armor_worn[5]= 1
	    novel_armor= 1
	}
	if(GS.armor == 48 and armor_worn[6] == 0) {
	    armor_worn[6]= 1
	    novel_armor= 1
	}
	if(GS.armor == 50 and armor_worn[7] == 0) {
	    armor_worn[7]= 1
	    novel_armor= 1
	}
	if(GS.armor == 64 and armor_worn[8] == 0) {
	    armor_worn[8]= 1
	    novel_armor= 1
	}

func _gm_event_7_10():
	if(curtype >= 1 and curtype <= 13) {
	    i= 5
	    while(i > 0) {
	        rq_v[i]= rq_v[i - 1]
	        rq_s[i]= rq_s[i - 1]
	        rq[i]= rq[i - 1]
	        i--
	    }
	    if(curtype == 1) {
	        rq[0]= "Violence"
	        if(typeuse[1] == 0) rq_v[0]= 50
	        if(typeuse[1] == 1) rq_v[0]= 25
	        if(typeuse[1] == 2) rq_v[0]= 20
	        if(typeuse[1] == 3) rq_v[0]= 15
	        if(typeuse[1] >= 4) rq_v[0]= 10
	        typeuse[1]++
	    }
	    if(curtype == 2) {
	        rq[0]= "Disappoint"
	        rq_v[0]= -100
	        if(typeuse[2] >= 5) rq_v[0]= -50
	        if(typeuse[2] >= 20) rq_v[0]= -1
	        boastmode= 0
	        typeuse[2]++
	    }
	    if(curtype == 3) {
	        rq[0]= "Justice"
	        rq_v[0]= 100
	        typeuse[3]++
	    }
	    if(curtype == 4) {
	        rq[0]= "Action"
	        rq_v[0]= 300
	        if(typeuse[4] == 0) rq_v[0]= 300
	        if(typeuse[4] == 1) rq_v[0]= 200
	        if(typeuse[4] == 2) rq_v[0]= 150
	        if(typeuse[4] == 3) rq_v[0]= 100
	        if(typeuse[4] >= 4) rq_v[0]= 50
	        typeuse[4]++
	    }
	    if(curtype == 5) {
	        rq[0]= "HyperAction"
	        rq_v[0]= 400
	        if(typeuse[5] == 0) rq_v[0]= 400
	        if(typeuse[5] == 1) rq_v[0]= 300
	        if(typeuse[5] == 2) rq_v[0]= 200
	        if(typeuse[5] == 3) rq_v[0]= 200
	        if(typeuse[5] >= 4) rq_v[0]= 100
	        typeuse[5]++
	    }
	    if(curtype == 6) {
	        rq[0]= "Fashion"
	        rq_v[0]= 1500
	        typeuse[6]++
	    }
	    if(curtype == 7) {
	        rq[0]= "Fetching"
	        rq_v[0]= 600
	        if(typeuse[7] == 0) rq_v[0]= 700
	        if(typeuse[7] >= 1) rq_v[0]= 1
	        typeuse[7]++
	    }
	    if(curtype == 8) {
	        rq[0]= "EatingGarbage?"
	        rq_v[0]= -50
	        typeuse[8]++
	    }
	    if(curtype == 9) {
	        rq[0]= "OnBrandFood"
	        rq_v[0]= 200
	        if(typeuse[9] == 0) rq_v[0]= 300
	        if(typeuse[9] == 1) rq_v[0]= 200
	        if(typeuse[9] >= 2) rq_v[0]= 200
	        typeuse[9]++
	    }
	    if(curtype == 10) {
	        rq[0]= "OnBrandFood"
	        rq_v[0]= 400
	        if(typeuse[10] == 0) rq_v[0]= 500
	        if(typeuse[10] == 1) rq_v[0]= 300
	        if(typeuse[10] >= 2) rq_v[0]= 300
	        typeuse[10]++
	    }
	    if(curtype == 11) {
	        rq[0]= "Dramatic"
	        rq_v[0]= 100
	        if(GS.hp < GS.maxhp / 1.5) rq_v[0]= 150
	        if(GS.hp < GS.maxhp / 2) rq_v[0]= 250
	        if(GS.hp < GS.maxhp / 4) rq_v[0]= 400
	        if(GS.hp < 4) rq_v[0]= 500
	        if(GS.hp == 1) rq_v[0]= 600
	        typeuse[11]++
	    }
	    if(curtype == 12) {
	        rq[0]= "Writing"
	        rq_v[0]= 50
	        rq_v[0]= essay
	        typeuse[12]++
	    }
	    if(curtype == 13) {
	        rq[0]= "OnBrandFood"
	        rq_v[0]= 700
	        typeuse[13]++
	    }
	    if(instance_exists(403/* obj_mettatonex */) and obj_mettatonex.turns >= 20 and rq_v[0] > 0)
	        rq_v[0]*= 2
	    GS.ratings+= rq_v[0]
	    rq_s[0]= 0
	}

func _on_outside_room():
	draw_set_font(2)
	draw_set_color(16777215)
	siner++
	if(active == 1) {
	    draw_text_transformed(x + 20 + sin(siner / 4), y + cos(siner / 4), "RATINGS " + string(GS.ratings), 2 - sin(siner / 4) * 0.05, 2 - cos(siner / 4) * 0.05, 0)
	    i= 0
	    while(i < 6) {
	        if(rq_v[i] >= 0) {
	            thisv= "+" + string(rq_v[i])
	            draw_set_color(65280)
	        } else  {
	            thisv= string(rq_v[i])
	            draw_set_color(255)
	        }
	        rq_s[i]+= 1 * (i + 2) / 2
	        if(rq_s[i] > 120) draw_set_alpha((170 - rq_s[i]) / 50)
	        ww= 70 / (string_width(rq[i]) + 1)
	        xx= 0
	        if(rq_s[i] < 10)
	            xx= cos(rq_s[i]) * 21 / (rq_s[i] * 2 + 1)
	        draw_text_transformed(x + 60 + xx, y + 140 + i * 12, rq[i], 1 * ww, 1, 0)
	        draw_text(x + 130 + xx, y + 140 + i * 12, thisv)
	        draw_set_alpha(1)
	        i++
	    }
	    draw_set_color(16777215)
	    draw_line_width(x + 10, y + 40, x + 10, y + 130, 3)
	    draw_set_color(16777215)
	    draw_line_width(x + 10, y + 130, x + 180, y + 130, 3)
	    draw_set_color(65535)
	    draw_line(x + 10, y + 55, x + 180, y + 55)
	    ratingsy= GS.ratings * 0.0075
	    draw_set_color(16776960)
	    draw_line(x + 10, y + 130 - ratingsy, x + 180, y + 130 - ratingsy)
	    i= 0
	    while(i < 9) {
	        draw_set_color(16711935)
	        rpy[i]= rp[i] * 0.0075
	        rpy[i + 1]= rp[i + 1] * 0.0075
	        draw_line_width(x + 10 + i * 20, y + 130 - rpy[i], x + 30 + i * 20, y + 130 - rpy[i + 1], 2)
	        i++
	    }
	}
	if(checkhp > GS.hp) {
	    curtype= 1
	    if(boastmode == 1) {
	        curtype= 2
	        boastmode= 0
	    }
	    if(heel == 1) curtype= 3
	    event_user(0)
	}
	checkhp= GS.hp
	if(boastmode == 1) {
	    if(GS.turntimer > 0 and GS.mnfight == 2) {
	        if(o_ob == 0) o_ob= 1
	        else  o_ob= 0
	        if(o_ob == 0) GS.ratings++
	        if(o_ob == 1) GS.ratings+= 2
	        if(instance_exists(403/* obj_mettatonex */) and obj_mettatonex.turns >= 20)
	            GS.ratings+= 2
	    }
	    if(GS.myfight == 0 and GS.mnfight == 0) boastmode= 0
	    if(instance_exists(409/* obj_essaystuff */)) boastmode= 0
	}
	if(heel == 1 and GS.myfight == 0 and GS.mnfight == 0)
	    heel= 0
	event_user(1)
	if(novel_armor == 1) {
	    curtype= 6
	    event_user(0)
	    novel_armor= 0
	}
	if(GS.mnfight == 0 and GS.myfight == 0) {
	    timeloss++
	    o_o++
	    if(o_o > 3) o_o= 0
	    if(timeloss < 4000 and o_o == 0)
	        GS.ratings--
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
