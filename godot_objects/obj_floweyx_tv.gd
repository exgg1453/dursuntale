# Auto-converted from GameMaker: obj_floweyx_tv
# GM parent: obj_floweybodyparent
extends Node2D

func _ready():
	siner= 0
	instance_create(0, 0, 1660/* obj_tv_inside */)
	scr_floweybodysave()
	tvmode= 25
	size= 0.5
	anim= 0
	anim2= 0
	animchoice= round(random(100))
	animspeed= 0.25
	anim= animchoice
	image_speed= 0.5
	animtimer= 0
	remx= x
	shudder= 0
	shuddercounter= 0
	flasheron= 0
	tt= 16
	anim3= 0
	anim4= 0
	anim5= 0
	anim6= 0
	overnoiser= 0
	if(GS.fplot > 1) tvmode= 26

func _gm_event_2_3():
	if(GS.floweyhp > 4000) {
	    // obj_flowey_master
	    with(1585) caster_play(sfx_oh, 1, 0.9 - random(0.3))
	} else  {
	    // obj_flowey_master
	    with(1585) caster_play(sfx_ted, 1, 0.9 - random(0.2))
	}

func _gm_event_2_2():
	if(tvmode == 4) tvmode= 0
	if(GS.floweyhp > 0) {
	    // obj_floweybodyparent
	    with(1586) frozen= 0
	}

func _gm_event_2_1():
	// obj_flowey_master
	with(1585) caster_play(sfx_oh, 1, 0.95 + random(0.2))

func _gm_event_7_12():
	if(tvmode == 0) {
	    tt= choose(15, 16)
	    tvmode= 4
	    $Alarm1.start((15) / 30.0)
	    $Alarm2.start((40) / 30.0)
	}

func _gm_event_7_11():
	shudder= 32
	if(tvmode == 0) {
	    sh= instance_create(0, 0, 1582/* obj_vsflowey_shaker */)
	    sh.shakex= 6
	    sh.shakey= 6
	    tt= choose(4, 5, 12, 13, 14, 20, 22, 27, 28, 35)
	    tvmode= 4
	    $Alarm3.start((15) / 30.0)
	    $Alarm2.start((40) / 30.0)
	    // obj_floweybodyparent
	    with(1586) frozen= 2
	}

func _on_outside_room():
	if(tvmode == 0) {
	    draw_sprite_ext(2207/* spr_tvinside_old */, anim, x + 20 + random(4), y + 50 + random(4), size + 0.9 + random(0.1), size + random(0.1) + 0.4, 0, 16777215, 1)
	    anim+= animspeed
	    if(anim > animchoice + 1) animspeed= -animspeed
	    if(anim < animchoice - 1) animspeed= -animspeed
	    animtimer++
	    if(animtimer > 100) {
	        draw_sprite_ext(2206/* spr_noise */, random(3), x + 20 + random(4), y + 50 + random(4), size + 0.8 + random(0.1), size + random(0.1) + 0.4, 0, 16777215, 1)
	        animchoice= round(random(100))
	        anim= animchoice
	        if(animtimer > 106) animtimer= 0
	    }
	    draw_sprite(sprite_index, frame, x, y + sin(siner / 3) * 1)
	    siner++
	}
	if(tvmode == 1) {
	    $Alarm1.start((-1) / 30.0)
	    draw_set_color(0)
	    draw_rectangle(x + 20, y + 10, x + 160, y + 140, 0)
	    draw_sprite_ext(2257/* spr_tv_warning */, 0, x + 20, y + 50, 1, 1, 0, 16777215, 0.8 + sin(siner / 2))
	    draw_sprite(2258/* spr_allsoul */, GS.soul_rescue, x + 80 + random(3), y + 110 + random(3))
	    draw_sprite(sprite_index, frame, x, y + sin(siner / 3) * 1)
	    siner++
	}
	if(tvmode == 2) {
	    $Alarm1.start((-1) / 30.0)
	    draw_sprite_ext(2206/* spr_noise */, random(3), x + 26, y + 50, 1.2, 1, 0, 16777215, 1)
	    draw_sprite(sprite_index, frame, x, y + sin(siner / 3) * 1)
	}
	if(tvmode == 3) {
	    draw_set_color(0)
	    draw_rectangle(x + 20, y + 10, x + 160, y + 140, 0)
	    siner++
	    draw_sprite(2258/* spr_allsoul */, GS.soul_rescue, x + 80, y + 90 + sin(siner / 8) * 3)
	    draw_sprite(sprite_index, frame, x, y + sin(siner / 3) * 1)
	}
	if(tvmode == 4) {
	    draw_sprite_ext(2207/* spr_tvinside_old */, tt, x + 20 + random(4), y + 50 + random(4), size + 0.9 + random(0.1), size + random(0.1) + 0.4, 0, 16777215, 1)
	    draw_sprite(sprite_index, frame, x, y + sin(siner / 3) * 1)
	}
	if(tvmode == 5) {
	    draw_set_color(0)
	    draw_rectangle(x + 20, y + 50, x + 160, y + 140, 0)
	    draw_sprite(sprite_index, frame, x, y)
	}
	if(tvmode == 10) {
	    draw_sprite_ext(2205/* spr_tv_exface */, tt, x + 13, y + 50, 1, 1, 0, 16777215, 1)
	    draw_sprite(sprite_index, frame, x, y)
	}
	if(tvmode == 11) {
	    draw_set_color(0)
	    draw_rectangle(x + 20, y + 50, x + 160, y + 140, 0)
	    draw_sprite_ext(2196/* spr_tv_floweyface */, floor(GS.faceemotion), x + 21 + random(2), y + 56 + random(2), 2.9 + random(0.1), 2.9 + random(0.1), 0, 16777215, 1)
	    draw_sprite(sprite_index, frame, x, y)
	}
	if(tvmode == 12) {
	    draw_sprite_ext(2207/* spr_tvinside_old */, 35, x + 20 + random(4), y + 50 + random(4), size + 0.9 + random(0.1), size + random(0.1) + 0.4, 0, 16777215, 1)
	    anim4= 0
	    draw_sprite(sprite_index, frame, x, y + sin(siner / 3) * 1)
	}
	if(tvmode == 13) {
	    draw_set_color(0)
	    draw_rectangle(x + 20, y + 50, x + 160, y + 140, 0)
	    draw_sprite_ext(2207/* spr_tvinside_old */, 35, x + 20 + random(4), y + 50 + random(4), size + 0.9 + random(0.1), size + random(0.1) + 0.4, 0, 16777215, 1 - anim4)
	    anim4+= 0.01
	    draw_sprite(sprite_index, frame, x, y + sin(siner / 3) * 1)
	    siner++
	}
	if(tvmode == 18) {
	    draw_set_color(16777215)
	    draw_rectangle(x + 20, y + 50, x + 160, y + 140, 0)
	    siner++
	    draw_sprite(sprite_index, frame, x, y)
	    draw_sprite_ext(2201/* spr_tv_floweyx_laugh */, 0, x + 25, y + 65, 1.3, 1, 0, 16777215, 1)
	}
	if(tvmode == 19) {
	    draw_set_color(16777215)
	    draw_rectangle(x + 20, y + 50, x + 160, y + 140, 0)
	    siner++
	    draw_sprite_ext(2201/* spr_tv_floweyx_laugh */, floor(anim4), x + 25, y + 65, 1.3, 1, 0, 16777215, 1)
	    draw_sprite_ext(sprite_index, frame, x, y, 1, 1, 0, image_blend, 1)
	    anim5+= 0.5
	    if(anim4 < 6) anim4+= 0.5
	    if(anim5 > 22 and anim4 < 15) anim4+= 0.5
	}
	if(tvmode == 20) {
	    draw_set_color(16777215)
	    draw_rectangle(x + 20, y + 50, x + 160, y + 140, 0)
	    siner++
	    draw_sprite(sprite_index, frame, x, y + sin(siner * 3.14159265358979 / 2) * 2)
	    draw_sprite_ext(2202/* spr_tv_floweyx_laugh_o */, floor(anim3), x + 25, y + 65, 1.3, 1, 0, 16777215, 1)
	    anim3+= 0.5
	}
	if(tvmode == 21) {
	    draw_set_color(16777215)
	    draw_rectangle(x + 20, y + 50, x + 160, y + 140, 0)
	    siner++
	    draw_sprite(sprite_index, frame, x, y + sin(siner / 3) * 2)
	    draw_sprite_ext(2204/* spr_tv_floweyx_smile */, 0, x + 25, y + 65 + sin(siner / 3), 1.3, 1, 0, 16777215, 1)
	}
	if(tvmode == 22) {
	    draw_set_color(16777215)
	    draw_rectangle(x + 20, y + 50, x + 160, y + 140, 0)
	    siner++
	    draw_sprite(sprite_index, frame, x, y)
	    draw_sprite_ext(2203/* spr_tv_floweyx_laugh_piss */, GS.faceemotion, x + 25 + random(2), y + 65 + random(2), 1.3, 1, 0, 16777215, 1)
	}
	if(tvmode == 24) {
	    draw_set_color(0)
	    draw_rectangle(x + 20, y + 50, x + 160, y + 140, 0)
	    draw_set_color(16777215)
	    draw_set_alpha((anim6 - 30) / 30)
	    draw_rectangle(x + 20, y + 50, x + 160, y + 140, 0)
	    draw_set_alpha(1)
	    anim6++
	    draw_sprite_ext(2201/* spr_tv_floweyx_laugh */, 0, x + 25, y + 65, 1.3, 1, 0, 16777215, (anim6 - 30) / 30)
	    draw_sprite_ext(sprite_index, frame, x, y, 1, 1, 0, image_blend, 1)
	}
	if(tvmode == 25) {
	    draw_set_color(0)
	    draw_rectangle(x + 20, y + 50, x + 160, y + 140, 0)
	    draw_sprite_ext(sprite_index, frame, x, y, 1, 1, 0, image_blend, 1)
	}
	if(tvmode == 26) {
	    draw_set_color(0)
	    draw_rectangle(x + 20, y + 50, x + 160, y + 140, 0)
	    draw_set_color(16777215)
	    draw_set_alpha((anim6 - 11) / 10)
	    draw_rectangle(x + 20, y + 50, x + 160, y + 140, 0)
	    draw_set_alpha(1)
	    anim6++
	    draw_sprite_ext(2201/* spr_tv_floweyx_laugh */, 11, x + 25, y + 65, 1.3, 1, 0, 16777215, (anim6 - 11) / 10)
	    draw_sprite_ext(sprite_index, frame, x, y, 1, 1, 0, image_blend, 1)
	}
	if(tvmode == 99) {
	    draw_sprite_ext(2207/* spr_tvinside_old */, anim, x + 20 + random(4), y + 50 + random(4), size + 0.9 + random(0.1), size + random(0.1) + 0.4, 0, 16777215, 1)
	    draw_sprite(sprite_index, frame, x + random(3) - random(3), y + random(3) - random(3))
	    anim+= 0.5
	}
	if(tvmode == 100) {
	    draw_sprite_ext(2207/* spr_tvinside_old */, anim, x + 20 + random(4), y + 50 + random(4), size + 0.9 + random(0.1), size + random(0.1) + 0.4, 0, 16777215, 1)
	    draw_sprite(sprite_index, frame, x + random(5) - random(5), y + random(5) - random(5))
	    anim++
	}
	if(overnoiser > 0) {
	    draw_sprite_ext(2206/* spr_noise */, random(3), x + 26, y + 50, 1.2, 1, 0, 16777215, 1)
	    draw_sprite(sprite_index, frame, x, y)
	    overnoiser--
	}
	if(shudder > 0) {
	    shuddercounter++
	    if(shuddercounter > 0) {
	        if(flasheron == 1) {
	            draw_sprite(2273/* spr_floweyx_tv_bright */, frame, x, y + sin(siner / 3) * 1)
	            flasheron= 0
	        } else  flasheron= 1
	        x= remx + random(shudder) - random(shudder)
	        y= ystart + random(shudder) - random(shudder)
	        shudder-= 2
	        shuddercounter= 0
	    }
	    if(shudder < 1) shudder= 0
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
