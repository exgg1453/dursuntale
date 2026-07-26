# Auto-converted from GameMaker: obj_mettatonb_body2
extends Node2D

func _ready():
	scale.x= 2
	scale.y= 2
	i= 0
	while(i < 5) {
	    pspeed[i]= 0
	    i++
	}
	siner= 0
	arms= 319
	sineron= 1
	shaker= 0
	hit= 0
	shudderon= 0
	sha= 0
	behind= 0
	trueanim= 0
	tang= 1
	hitted= 0

func _gm_event_2_5():
	obj_heart.shot= 0
	obj_mettatonb_second.con= 25

func _gm_event_2_3():
	obj_mettatonb_third.con_2= 1

func _gm_event_2_1():
	lefter= 5

func _on_destroy():
	lefter= 2

func _process(delta: float):
	rotation_degrees= pspeed[1] * 2
	pspeed[0]= velocity.x
	i= 4
	while(i > 0) {
	    pspeed[i]= pspeed[i - 1]
	    i--
	}
	if(collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, 739, 0, 1) and tang == 1) {
	    if(instance_exists(298/* obj_mettatonb_second */)) {
	        snd_play(51/* snd_damage */)
	        jimbo= collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, 739, 0, 1)
	        with(jimbo) instance_destroy()
	        hit++
	        if(hit < 8) $Alarm5.start((60) / 30.0)
	        if(shudderon == 0) shudderon= 1
	        shudder= 10
	    }
	    if(instance_exists(299/* obj_mettatonb_third */)) {
	        if(hitted == 0) {
	            hitted= 1
	            $Alarm3.start((30) / 30.0)
	            GS.turntimer= 50
	        }
	        snd_play(28/* snd_bell */)
	        jimbo= collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, 739, 0, 1)
	        gi= instance_create(jimbo.x, jimbo.y, 740/* obj_heartshot_bounceaway */)
	        gi.scale.y= jimbo.scale.y
	        with(jimbo) instance_destroy()
	    }
	}
	if(shudderon == 1) {
	    if(sha == 0) sha= x
	    x= sha + shudder
	    if(shudder < 0) shudder= -(shudder + 1)
	    else  shudder= -shudder
	    if(shudder == 0) {
	        sha= 0
	        shudderon= 0
	    }
	}

func _gm_event_7_11():
	lefter= 4
	$Alarm1.start((9) / 30.0)

func _gm_event_7_10():
	lefter= 0
	$Alarm0.start((9) / 30.0)

func _on_outside_room():
	sinvalue= 0
	if(velocity.x == 0) {
	    sinvalue+= sin(siner / 3) * 2
	    rotation_degrees+= sinvalue
	}
	if(behind == 0) {
	    draw_sprite_ext(sprite_index, frame, x + sinvalue + random(shaker * 2) - shaker, y + random(shaker * 2) - shaker, scale.x, scale.y, rotation_degrees, 16777215, 1)
	    draw_sprite_ext(arms, siner / 6, x + sinvalue, y - sin(siner / 4) * 5, scale.x, scale.y, rotation_degrees, 16777215, 1)
	}
	if(behind == 1) {
	    draw_sprite_ext(327/* spr_mettatonb_behind */, frame, x + sinvalue + random(shaker * 2) - shaker, y + random(shaker * 2) - shaker, scale.x, scale.y, rotation_degrees, 16777215, 1)
	    draw_sprite_ext(320/* spr_mettatonb_arms1_reverse */, siner / 6, x + sinvalue, y - sin(siner / 4) * 5, scale.x, scale.y, rotation_degrees, 16777215, 1)
	}
	if(behind == 2) {
	    sineron= 0
	    draw_sprite_ext(328/* spr_mettatonb_behind_on */, frame, x + sinvalue + random(shaker * 2) - shaker, y + random(shaker * 2) - shaker, scale.x, scale.y, rotation_degrees, 16777215, 1)
	    draw_sprite_ext(320/* spr_mettatonb_arms1_reverse */, siner / 6, x + sinvalue, y - sin(siner / 4) * 5, scale.x, scale.y, rotation_degrees, 16777215, 1)
	}
	if(behind == 3) {
	    sineron= 0
	    siner+= 1 + trueanim
	    shaker= trueanim
	    sinvalue*= trueanim
	    rotation_degrees+= sinvalue * 1.4
	    draw_sprite_ext(326/* spr_mettatonb_nuts */, siner / 3, x + sinvalue + random(shaker * 2) - shaker, y + random(shaker * 2) - shaker, scale.x, scale.y, rotation_degrees, 16777215, 1)
	    draw_sprite_ext(323/* spr_mettatonb_arms5 */, siner / 6, x + sinvalue, y - sin(siner / 4) * 5, scale.x, scale.y, rotation_degrees, 16777215, 1)
	}
	if(sineron == 1) siner++

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
