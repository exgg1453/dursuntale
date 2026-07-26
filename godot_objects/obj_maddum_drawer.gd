# Auto-converted from GameMaker: obj_maddum_drawer
extends Node2D

func _ready():
	rotter= 0
	speedmod= -0.4
	rotmod= 0.1
	mode= 0
	dingus= 0
	GS.faceemotion= 0

func _on_destroy():
	mode= 2
	GS.faceemotion= 0

func _gm_event_7_12():
	$Alarm0.start((5) / 30.0)
	GS.faceemotion= 1
	event_user(0)
	i= 0
	while(i < 4) {
	    partx[i]+= -20 + random(40)
	    party[i]+= -10 + random(20)
	    partrot[i]+= -90 + random(180)
	    i++
	}
	mode= 5
	dingus= 0

func _gm_event_7_11():
	mode= 2
	dingus= 0

func _gm_event_7_10():
	mode= 1
	partx[0]= 5
	party[0]= 75
	partrot[0]= -rot
	partx[1]= 0
	party[1]= 35 + rot / 4
	partrot[1]= rot / 2
	partx[2]= 5
	party[2]= 65
	partrot[2]= rot / 3
	partx[3]= -rot / 3
	party[3]= rot / 3
	partrot[3]= rot
	i= 0
	while(i < 4) {
	    opartx[i]= partx[i]
	    oparty[i]= party[i]
	    opartrot[i]= partrot[i]
	    i++
	}
	fakegrav= 0.5

func _on_outside_room():
	if(mode == 0) {
	    rotter++
	    rotter+= speedmod / 2
	    rot= sin(rotter / 6) * 30
	    rot*= rotmod
	    draw_sprite_ext(277/* spr_maddum_base */, frame, x + 5, y + 75, 2, 2, -rot, 16777215, 1)
	    draw_sprite_ext(276/* spr_maddum_torso */, frame, x, y + 35 + rot / 4, 2, 2, rot / 2, 16777215, 1)
	    draw_sprite_ext(275/* spr_maddum_leg */, frame, x + 5, y + 65, 2, 2, rot / 3, 16777215, 1)
	    draw_sprite_ext(274/* spr_maddum_head */, GS.faceemotion, x - rot / 3, y + rot / 3, 2, 2, rot, 16777215, 1)
	} else  {
	    draw_sprite_ext(277/* spr_maddum_base */, frame, x + partx[0], y + party[0], 2, 2, partrot[0], 16777215, 1)
	    draw_sprite_ext(276/* spr_maddum_torso */, frame, x + partx[1], y + party[1], 2, 2, partrot[1], 16777215, 1)
	    draw_sprite_ext(275/* spr_maddum_leg */, frame, x + partx[2], y + party[2], 2, 2, partrot[2], 16777215, 1)
	    draw_sprite_ext(274/* spr_maddum_head */, GS.faceemotion, x + partx[3], y + party[3], 2, 2, partrot[3], 16777215, 1)
	}
	if(mode == 1) {
	    check= 1
	    fakegrav+= 0.5
	    i= 0
	    while(i < 4) {
	        go[i]= 1
	        if(party[i] + y < GS.idealborder[2] - 25)
	            party[i]+= fakegrav
	        else  {
	            party[i]= GS.idealborder[2] - 20 - y
	            check++
	            go[i]= 0
	        }
	        i++
	    }
	    if(go[0] == 1) {
	        partx[0]+= 2
	        partrot[0]+= 2
	    }
	    if(go[1] == 1) {
	        partx[1]+= 4
	        partrot[1]+= 5
	    }
	    if(go[2] == 1) {
	        partx[2]--
	        partrot[2]-= 3
	    }
	    if(go[3] == 1) {
	        partx[3]-= 3
	        partrot[3]-= 9
	    }
	    if(check == 4) mode= 3
	}
	if(mode == 2) {
	    dingus++
	    i= 0
	    while(i < 4) {
	        partx[i]-= (partx[i] - opartx[i]) / 4
	        party[i]-= (party[i] - oparty[i]) / 4
	        partrot[i]-= (partrot[i] - opartrot[i]) / 4
	        i++
	    }
	    if(dingus > 20) {
	        dingus= 0
	        mode= 0
	        check= 0
	    }
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
