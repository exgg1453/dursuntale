# Auto-converted from GameMaker: obj_controltest
extends Node2D

func _ready():
	GS.starton9= 1
	buffer= 3
	z_index= 0
	x_index= 0
	c_index= 0
	s_snare= caster_load("music/drum/snare.ogg")
	s_kick= caster_load("music/drum/kick.ogg")
	s_cymbal= caster_load("music/drum/cymbal.ogg")
	s_cuica= caster_load("music/drum/cuica.ogg")
	s_cuica2= caster_load("music/drum/cuica2.ogg")
	fun= 0
	if(file_exists("undertale.ini")) {
	    fun= 1
	    ini_open("undertale.ini")
	    tr= ini_read_real("EndF", "EndF", -1)
	    if(tr >= 2) fun= 0
	}
	image_speed= 0
	borderl= 60
	borderr= 260
	borderu= 140
	if(fun == 0) tile_layer_hide(1100000)

func _gm_event_7_5():
	caster_free(s_snare)
	caster_free(s_kick)
	caster_free(s_cymbal)
	caster_free(s_cuica)
	caster_free(s_cuica2)

func _on_outside_room():
	z_index= 0
	x_index= 0
	c_index= 0
	buffer--
	if(buffer < 0) {
	    if(keyboard_multicheck(0/* NOKEY */)) z_index= 2
	    else  {
	        if(z_index == 1) z_index= 3
	    }
	    if(keyboard_multicheck_pressed(0/* NOKEY */)) {
	        if(fun == 1) {
	            frame++
	            caster_play(s_snare, 1, 1)
	        }
	        z_index= 1
	    }
	    if(keyboard_multicheck(1/* ANYKEY */)) x_index= 2
	    else  {
	        if(x_index == 1) x_index= 3
	    }
	    if(keyboard_multicheck_pressed(1/* ANYKEY */)) {
	        if(fun == 1) {
	            frame++
	            caster_play(s_kick, 1, 1)
	        }
	        x_index= 1
	    }
	    if(keyboard_multicheck(2/* UNKNOWN(2) */)) c_index= 2
	    else  {
	        if(c_index == 1) c_index= 3
	    }
	    if(keyboard_multicheck_pressed(2/* UNKNOWN(2) */)) {
	        if(fun == 1) {
	            frame++
	            caster_play(s_cymbal, 1, 1)
	        }
	        c_index= 1
	    }
	    if(Input.is_key_pressed(82) and fun == 1) {
	        frame++
	        caster_play(s_cuica, 1, 1)
	    }
	    if(Input.is_key_pressed(69) and fun == 1) {
	        frame++
	        caster_play(s_cuica2, 1, 1)
	    }
	}
	draw_sprite_ext(846/* spr_test_zbutton */, z_index, 80, 30, 2, 2, 0, 16777215, 1)
	draw_sprite_ext(847/* spr_test_xbutton */, x_index, 140, 30, 2, 2, 0, 16777215, 1)
	draw_sprite_ext(848/* spr_test_cbutton */, c_index, 200, 30, 2, 2, 0, 16777215, 1)
	if(fun == 1)
	    draw_sprite(sprite_index, frame, x, y)
	else  {
	    draw_set_color(32768)
	    draw_circle(x + 16, y + 16, 16, 1)
	    draw_circle(x + 16, y + 16, 14, 1)
	    draw_circle(x + 16, y + 16, 12, 1)
	    draw_set_color(0)
	    draw_circle(x + 16, y + 16, 17, 1)
	    draw_circle(x + 16, y + 16, 15, 1)
	    draw_circle(x + 16, y + 16, 13, 1)
	}
	draw_set_color(16777215)
	i= 0
	while(i < 6) {
	    draw_rectangle(borderl - i, borderu - i, borderr + i, 300, 1)
	    i++
	}
	if(Input.is_action_pressed("move_left")) x-= 3
	if(Input.is_action_pressed("move_right")) x+= 3
	if(Input.is_action_pressed("move_down")) y+= 3
	if(Input.is_action_pressed("move_up")) y-= 3
	if(x <= borderl) x= borderl
	if(x >= borderr - 32) x= borderr - 32
	if(y <= borderu) y= borderu
	if(y >= 240) get_tree().change_scene_to_file("res://godot_rooms/288.tscn")

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
