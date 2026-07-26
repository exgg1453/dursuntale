# Auto-converted from GameMaker: obj_asgore_spearswipe
# GM parent: obj_asgorebulparent
extends Node2D

func _ready():
	x+= 180
	i= 0
	while(i < 10) {
	    type[i]= 1
	    i++
	}
	type[0]= 1
	type[1]= choose(1, 2)
	type[2]= 2
	type[3]= choose(1, 2)
	type[4]= 1
	type[5]= choose(1, 2)
	amt= 2
	curamt= 0
	initswipewait= 8
	swipewait= 0
	swipetimer= 0
	image_speed= 0
	scale.x= 2
	scale.y= 2
	con= 0
	quick= 0
	cutspeed= 0.5
	hitted= 0
	cutsfx= caster_load("music/sfx_cinematiccut.ogg")
	cutsfxN= 0
	cutsfxI[0]= cutsfx
	obj_asgorespear.visible= 0
	cutsdone= 0

func _gm_event_1_0():
	caster_free(cutsfx)
	obj_asgoreb_body.visible= 1
	obj_asgorespear.visible= 1
	obj_asgorespear.color= 255
	obj_asgorespear.armtest= 1
	GS.turntimer= -1
	GS.mnfight= 3
	GS.myfight= -1

func _gm_event_2_2():
	instance_destroy()

func _gm_event_2_1():
	curamt++
	if(curamt < amt) {
	    frame= 0
	    image_speed= 1
	    $Alarm1.start((swipewait) / 30.0)
	    if(curamt > 1 and curamt < amt) {
	        if(scale.x == 2) scale.x= -2
	        else  scale.x= 2
	    }
	} else  {
	    image_speed= 0
	    $Alarm2.start((15) / 30.0)
	}

func _on_destroy():
	$Alarm1.start((initswipewait) / 30.0)

func _process_end(delta: float):
	if(frame >= 5 and frame < 6) {
	    if(cutsdone == 0) {
	        cutsfxN++
	        cutsfxA[cutsfxN]= cutsfx
	        cutsfxA[cutsfxN - 1]= cutsfx
	        if(cutsfxN > 1) caster_stop(cutsfxA[cutsfxN - 1])
	        caster_play(cutsfxA[cutsfxN], 0.8, 1)
	        cutsdone= 1
	    }
	    if(type[curamt] == 1 and hitted == 0) {
	        hit= 1
	        if(abs(obj_heart.x - obj_heart.xprevious) < 0.1) hit= 0
	        if(not Input.is_action_pressed("move_left") and not Input.is_action_pressed("move_right") and not Input.is_action_pressed("move_up") and not Input.is_action_pressed("move_down"))
	            hit= 0
	        if(hit == 1) {
	            event_user(0)
	            hitted= 1
	        }
	    }
	    if(type[curamt] == 2 and hitted == 0) {
	        hit= 1
	        if(abs(obj_heart.x - obj_heart.xprevious) > 0.1) hit= 0
	        if(Input.is_action_pressed("move_left") or Input.is_action_pressed("move_right") or Input.is_action_pressed("move_up") or Input.is_action_pressed("move_down"))
	            hit= 0
	        if(hit == 1) {
	            event_user(0)
	            hitted= 1
	        }
	    }
	    hitted= 2
	} else  cutsdone= 0

func _process(delta: float):
	if(con == 0) {
	    swipetimer++
	    if(swipetimer > initswipewait) con= 1
	    if(quick > 0) {
	        frame= 2
	        con= 1
	    }
	}
	if(con == 2) {
	    if(scale.x == 2) scale.x= -2
	    else  scale.x= 2
	    con= 3
	    hitted= 0
	    image_speed= 0
	    frame= 0
	    swipetimer= 0
	    curamt++
	}
	if(con == 3) {
	    if(curamt > amt) {
	        con= 99
	        $Alarm2.start((45) / 30.0)
	    } else  {
	        swipetimer++
	        image_speed= 0
	        frame= 0
	        if(swipetimer > swipewait) {
	            con= 1
	            if(quick > 1) frame= 2
	        }
	    }
	}
	if(con == 1) {
	    frame+= cutspeed
	    if(frame >= 6) {
	        con= 2
	        swipetimer= 0
	    }
	}

func _on_outside_room():
	if(frame >= 5 and frame < 6) {
	    if(type[curamt] == 1) {
	        draw_set_color(16754964)
	        draw_rectangle(GS.idealborder[0], GS.idealborder[2], GS.idealborder[1], GS.idealborder[3], 0)
	    }
	    if(type[curamt] == 2) {
	        draw_set_color(4235519)
	        draw_rectangle(GS.idealborder[0], GS.idealborder[2], GS.idealborder[1], GS.idealborder[3], 0)
	    }
	}
	draw_sprite_ext(635/* spr_asgore_swipe_nospear */, frame, x, y, scale.x, scale.y, 0, 16777215, 1)
	if(type[curamt] == 0) image_blend= 255
	if(type[curamt] == 1) image_blend= 16754964
	if(type[curamt] == 2) image_blend= 4235519
	draw_sprite_ext(634/* spr_asgore_swipe_spear */, frame, x, y, scale.x, scale.y, 0, image_blend, 1)

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
