# Auto-converted from GameMaker: obj_paino
extends Node2D

func _ready():
	p[0]= caster_load("music/paino/piano1.ogg")
	p[1]= caster_load("music/paino/piano2.ogg")
	p[2]= caster_load("music/paino/piano3.ogg")
	p[3]= caster_load("music/paino/piano4.ogg")
	p[4]= caster_load("music/paino/piano5.ogg")
	p[5]= caster_load("music/paino/piano6.ogg")
	p[6]= caster_load("music/paino/piano7.ogg")
	p[7]= caster_load("music/paino/piano8.ogg")
	p[8]= caster_load("music/paino/piano9.ogg")
	p[9]= caster_load("music/paino/pianoA.ogg")
	i= 0
	while(i < 30) {
	    pp[i]= -1
	    i++
	}
	i= 0
	while(i < 10) {
	    justplayed[i]= 0
	    played[i]= 0
	    i++
	}
	num= 0
	GS.interact= 1
	buffer= 5
	coff= 0
	won= 0
	wonned= 0
	oldmode= 0

func _gm_event_1_0():
	i= 0
	while(i < 10) {
	    caster_free(p[i])
	    i++
	}
	if(won != 2) GS.interact= 0

func _gm_event_2_1():
	if(instance_exists(1109/* obj_fakedoor */)) obj_fakedoor.con= 1
	instance_destroy()

func _process(delta: float):
	num= 0
	if(Input.is_action_pressed("move_left") and num == 0) num++
	if(Input.is_action_pressed("move_down") and num == 0) num+= 2
	if(Input.is_action_pressed("move_right") and num == 0) num+= 3
	if(Input.is_action_pressed("move_up") and num == 0) num+= 4
	if(buffer < 1 and keyboard_multicheck_pressed(0/* NOKEY */)) {
	    justplayed[num]= 6
	    played[num]= 20
	    caster_play(p[num], 0.5, 1.13)
	    i= 29
	    while(i > 0) {
	        pp[i]= pp[i - 1]
	        i--
	    }
	    pp[0]= num
	}
	i= 0
	while(i < 10) {
	    justplayed[i]--
	    played[i]--
	    i++
	}
	GS.interact= 1
	buffer--
	if(keyboard_multicheck(1/* ANYKEY */) == 0) coff= 0
	if(buffer < 0 and keyboard_multicheck(1/* ANYKEY */))
	    coff++
	if(coff > 1) {
	    GS.interact= 0
	    instance_destroy()
	}

func _gm_event_7_5():
	i= 0
	while(i < 10) {
	    caster_free(p[i])
	    i++
	}

func _on_outside_room():
	if(pp[6] == 0 and pp[5] == 4 and pp[4] == 3 and pp[3] == 0 and pp[2] == 2 and pp[1] == 2 and pp[0] == 3)
	    won= 1
	if(pp[7] == 0 and pp[6] == 4 and pp[5] == 3 and pp[4] == 0 and pp[3] == 2 and pp[2] == 0 and pp[1] == 2 and pp[0] == 3)
	    won= 1
	if(pp[7] == 0 and pp[6] == 4 and pp[5] == 3 and pp[4] == 0 and pp[3] == 2 and pp[2] == 1 and pp[1] == 2 and pp[0] == 3)
	    won= 1
	if(pp[12] == 4 and pp[11] == 8 and pp[10] == 7 and pp[9] == 4 and pp[8] == 6 and pp[7] == 6 and pp[6] == 7 and pp[5] == 4 and pp[4] == 7 and pp[3] == 4 and pp[2] == 6 and pp[1] == 6 and pp[0] == 7)
	    won= 1
	if(oldmode == 1) {
	    draw_set_color(16777215)
	    draw_rectangle(78, 48, 220, 200, 0)
	    draw_set_color(0)
	    draw_rectangle(80, 50, 218, 198, 0)
	    i= 0
	    while(i < 5) {
	        draw_set_color(16777215)
	        if(played[i] > 0) draw_set_color(65535)
	        if(justplayed[i] > 0) draw_set_color(255)
	        draw_rectangle(100 + i * 10 + 1, 100, 100 + i * 10 + 8, 150, 0)
	        if(i > 0 and i < 5)
	            draw_sprite(845/* spr_pianoarrow */, i - 1, 100 + i * 10 + 2, 158)
	        if(num == i or i == num - 5) {
	            draw_set_color(65280)
	            draw_rectangle(100 + i * 10, 99, 100 + i * 10 + 9, 151, 1)
	            draw_circle(100 + i * 10 + 4, 160, 4, 0)
	        }
	        if(i == num + 5) {
	            draw_set_color(8421376)
	            draw_rectangle(100 + i * 10, 99, 100 + i * 10 + 9, 151, 1)
	            draw_circle(100 + i * 10 + 4, 160, 4, 0)
	        }
	        i++
	    }
	    draw_set_color(65280)
	    draw_set_font(2)
	    draw_text(120, 60, "X - Quit")
	}
	if(oldmode != 1) {
	    draw_sprite(952/* spr_pxquit */, 1, 44, 27)
	    if(num == 0) {
	        bonus= 0
	        if(justplayed[num] > 0) bonus= 1
	        draw_sprite(949/* spr_neutralpbutton */, 1 + bonus, 43, 58)
	    }
	    if(num == 1) {
	        bonus= 0
	        if(justplayed[num] > 0) bonus= 1
	        draw_sprite(948/* spr_leftpbutton */, 1 + bonus, 54, 58)
	    }
	    if(num == 2) {
	        bonus= 0
	        if(justplayed[num] > 0) bonus= 1
	        draw_sprite(947/* spr_downpbutton */, 1 + bonus, 70, 55)
	    }
	    if(num == 3) {
	        bonus= 0
	        if(justplayed[num] > 0) bonus= 1
	        draw_sprite(950/* spr_rightpbutton */, 1 + bonus, 81, 58)
	    }
	    if(num == 4) {
	        bonus= 0
	        if(justplayed[num] > 0) bonus= 1
	        draw_sprite(951/* spr_uppbutton */, 1 + bonus, 97, 55)
	    }
	}
	if(won == 1 and wonned == 0 and GS.flag[356] == 0) {
	    buffer= 25
	    wonned= 1
	    $Alarm1.start((20) / 30.0)
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
