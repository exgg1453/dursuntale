# Auto-converted from GameMaker: obj_joypadmenu
extends Node2D

func _ready():
	fun= 0
	if(file_exists("undertale.ini")) {
	    fun= 1
	    ini_open("undertale.ini")
	    tr= ini_read_real("EndF", "EndF", -1)
	    if(tr >= 2) fun= 0
	}
	menu= 0
	menu_engage= 0
	buffer= 5
	if(obj_time.j_ch > 0 and not joystick_has_pov(obj_time.j_ch))
	    GS.joypad_dir= 1
	r_line= "RESETTED..."
	o_o= 0
	siner= 0
	r_buffer= 0
	intro= 0
	weather= 0
	if(fun == 1) {
	    extreme2= 0
	    extreme= 0
	    rectile= 0
	    intro= 1
	    menu_engage= -1
	    weather= 1
	    month= current_month
	    if(month == 12 or month == 1 or month == 2)
	        weather= 1
	    if(month == 3 or month == 4 or month == 5) weather= 2
	    if(month == 6 or month == 7 or month == 8) weather= 3
	    if(month == 9 or month == 10 or month == 11)
	        weather= 4
	    harp= caster_load("music/harpnoise.ogg")
	    if(weather == 1)
	        weathermusic= caster_load("music/options_winter.ogg")
	    if(weather == 2 or weather == 4)
	        weathermusic= caster_load("music/options_fall.ogg")
	    if(weather == 3)
	        weathermusic= caster_load("music/options_summer.ogg")
	}

func _gm_event_7_5():
	if(fun == 1) {
	    caster_free(harp)
	    caster_free(weathermusic)
	}

func _on_outside_room():
	buffer--
	if(menu_engage == 0) {
	    if(Input.is_action_pressed("move_down")) menu++
	    if(menu == 4) menu= 5
	    if(fun == 0 and menu == 6) menu= 7
	    if(Input.is_action_pressed("move_up")) menu--
	    if(menu == 4) menu= 3
	    if(fun == 0 and menu == 6) menu= 5
	    if(menu <= 0) menu= 0
	    if(menu >= 9) menu= 9
	    if(buffer < 0 and keyboard_multicheck_pressed(0/* NOKEY */)) {
	        menu_engage= 1
	        js_buffer= 1
	        buffer= 4
	    }
	}
	if(menu == 0 and menu_engage == 1) {
	    ini_open("config.ini")
	    ini_write_real("joypad1", "b0", GS.button0)
	    ini_write_real("joypad1", "b1", GS.button1)
	    ini_write_real("joypad1", "b2", GS.button2)
	    ini_write_real("joypad1", "as", GS.analog_sense)
	    ini_write_real("joypad1", "jd", GS.joy_dir)
	    ini_close()
	    get_tree().change_scene_to_file("res://godot_rooms/3.tscn")
	}
	draw_set_color(16777215)
	draw_set_font(2)
	if(weather != 3)
	    draw_text_transformed(100, 10, "JOYSTICK CONFIG", 2, 2, 0)
	else  draw_text_transformed(10, 10, "JOYSTICK CONFIG", 2, 2, 0)
	if(menu != 0) draw_set_color(16777215)
	else  draw_set_color(65535)
	draw_text(20, 40, "EXIT")
	i= 1
	while(i < 4) {
	    if(menu != i) draw_set_color(16777215)
	    else  draw_set_color(65535)
	    if(i == 1) itext= "CONFIRM - [Z + ENTER] ::"
	    if(i == 2) itext= "CANCEL    - [X + SHIFT] ::"
	    if(i == 3) itext= "MENU         - [C + CTRL] ::"
	    draw_text(20, 60 + i * 15, itext)
	    draw_set_color(16777215)
	    i++
	}
	if(menu == 1 and menu_engage == 1) {
	    draw_set_color(16711680)
	    draw_rectangle(160, 75, 245, 90, 0)
	    draw_set_color(16777215)
	    o_o++
	    if(o_o >= 16) o_o= 0
	    if(o_o <= 8) draw_text(160, 75, "(PUSH BUTTON)")
	    if(obj_time.j_ch > 0 and js_buffer == 0) {
	        i= 0
	        while(i < joystick_buttons(obj_time.j_ch)) {
	            if(joystick_check_button(obj_time.j_ch, i)) {
	                GS.button0= i
	                menu_engage= 0
	                buffer= 4
	                break
	            } else  i++
	        }
	    }
	    if(js_buffer == 1) {
	        bt= 0
	        i= 0
	        while(i < joystick_buttons(obj_time.j_ch)) {
	            if(not joystick_check_button(obj_time.j_ch, i)) bt++
	            i++
	        }
	        if(bt >= joystick_buttons(obj_time.j_ch)) js_buffer= 0
	    }
	    if(buffer < 0 and (keyboard_multicheck_pressed(0/* NOKEY */) or keyboard_multicheck_pressed(1/* ANYKEY */)))
	        menu_engage= 0
	} else  {
	    draw_set_color(16776960)
	    draw_text(170, 75, GS.button0)
	}
	if(menu == 2 and menu_engage == 1) {
	    draw_set_color(16711680)
	    draw_rectangle(160, 90, 245, 105, 0)
	    draw_set_color(16777215)
	    o_o++
	    if(o_o >= 16) o_o= 0
	    if(o_o <= 8) draw_text(160, 90, "(PUSH BUTTON)")
	    if(js_buffer == 0 and obj_time.j_ch > 0) {
	        i= 0
	        while(i < joystick_buttons(obj_time.j_ch)) {
	            if(joystick_check_button(obj_time.j_ch, i)) {
	                GS.button1= i
	                menu_engage= 0
	                break
	            } else  i++
	        }
	    }
	    if(js_buffer == 1) {
	        bt= 0
	        i= 0
	        while(i < joystick_buttons(obj_time.j_ch)) {
	            if(not joystick_check_button(obj_time.j_ch, i)) bt++
	            i++
	        }
	        if(bt >= joystick_buttons(obj_time.j_ch)) js_buffer= 0
	    }
	    if(buffer < 0 and (keyboard_multicheck_pressed(0/* NOKEY */) or keyboard_multicheck_pressed(1/* ANYKEY */)))
	        menu_engage= 0
	} else  {
	    draw_set_color(16776960)
	    draw_text(170, 90, GS.button1)
	}
	if(menu == 3 and menu_engage == 1) {
	    draw_set_color(16711680)
	    draw_rectangle(160, 105, 245, 120, 0)
	    draw_set_color(16777215)
	    o_o++
	    if(o_o >= 16) o_o= 0
	    if(o_o <= 8) draw_text(160, 105, "(PUSH BUTTON)")
	    if(obj_time.j_ch > 0 and js_buffer == 0) {
	        i= 0
	        while(i < joystick_buttons(obj_time.j_ch)) {
	            if(joystick_check_button(obj_time.j_ch, i)) {
	                GS.button2= i
	                menu_engage= 0
	                break
	            } else  i++
	        }
	    }
	    if(js_buffer == 1) {
	        bt= 0
	        i= 0
	        while(i < joystick_buttons(obj_time.j_ch)) {
	            if(not joystick_check_button(obj_time.j_ch, i)) bt++
	            i++
	        }
	        if(bt >= joystick_buttons(obj_time.j_ch)) js_buffer= 0
	    }
	    if(buffer < 0 and (keyboard_multicheck_pressed(0/* NOKEY */) or keyboard_multicheck_pressed(1/* ANYKEY */)))
	        menu_engage= 0
	} else  {
	    draw_set_color(16776960)
	    draw_text(170, 105, GS.button2)
	}
	if(menu == 5) draw_set_color(65535)
	else  draw_set_color(16777215)
	draw_text(20, 135, "ANALOG SENSITIVITY:")
	if(menu == 5 and menu_engage == 1) {
	    draw_sprite_ext(856/* spr_sensing_slider */, 0, 150, 135, 1, 1, 0, 255, 1)
	    draw_sprite_ext(855/* spr_sensebar */, 0, 190 - GS.analog_sense * 100, 138, 1, 1, 0, 65535, 1)
	    if(buffer < 0) {
	        if(Input.is_action_pressed("move_right"))
	            GS.analog_sense-= GS.analog_sense_sense
	        if(Input.is_action_pressed("move_left"))
	            GS.analog_sense+= GS.analog_sense_sense
	        if(GS.analog_sense >= 0.4) GS.analog_sense= 0.4
	        if(GS.analog_sense <= 0.02) GS.analog_sense= 0.02
	        if(keyboard_multicheck_pressed(0/* NOKEY */) or keyboard_multicheck_pressed(1/* ANYKEY */))
	            menu_engage= 0
	    }
	} else  {
	    draw_sprite_ext(856/* spr_sensing_slider */, 0, 150, 135, 1, 1, 0, 255, 0.6)
	    draw_sprite_ext(855/* spr_sensebar */, 0, 190 - GS.analog_sense * 100, 138, 1, 1, 0, 65535, 0.6)
	}
	if(fun == 1) {
	    if(menu == 6) draw_set_color(65535)
	    else  draw_set_color(16777215)
	    draw_text_transformed(20, 150, "ANALOG SENSITIVITY SENSITIVITY:", 0.6, 1, 0)
	    if(menu == 6 and menu_engage == 1) {
	        draw_sprite_ext(856/* spr_sensing_slider */, 0, 150, 150, 1, 1, 0, 32768, 1)
	        draw_sprite_ext(855/* spr_sensebar */, 0, 190 - GS.analog_sense_sense * 200, 153, 1, 1, 0, 65535, 1)
	        if(buffer < 0) {
	            if(Input.is_action_pressed("move_right"))
	                GS.analog_sense_sense-= 0.01
	            if(Input.is_action_pressed("move_left"))
	                GS.analog_sense_sense+= 0.01
	            if(GS.analog_sense_sense >= 0.2) GS.analog_sense_sense= 0.2
	            if(GS.analog_sense_sense <= 0.01) GS.analog_sense_sense= 0.01
	            if(keyboard_multicheck_pressed(0/* NOKEY */) or keyboard_multicheck_pressed(1/* ANYKEY */))
	                menu_engage= 0
	        }
	    } else  {
	        draw_sprite_ext(856/* spr_sensing_slider */, 0, 150, 150, 1, 1, 0, 32768, 0.6)
	        draw_sprite_ext(855/* spr_sensebar */, 0, 190 - GS.analog_sense_sense * 200, 153, 1, 1, 0, 65535, 0.6)
	    }
	}
	if(menu == 7) draw_set_color(65535)
	else  draw_set_color(16777215)
	draw_text(20, 170, "DIR CHOICE:")
	if(GS.joy_dir == 0) draw_text(100, 170, "NORMAL")
	if(GS.joy_dir == 1) draw_text(100, 170, "ANALOG ONLY")
	if(GS.joy_dir == 2) draw_text(100, 170, "POV ONLY")
	if(menu == 7 and menu_engage == 1) {
	    GS.joy_dir++
	    if(GS.joy_dir >= 3) GS.joy_dir= 0
	    menu_engage= 0
	}
	if(r_buffer > 0) {
	    r_buffer--
	    draw_set_color(255)
	    draw_text_transformed_color(20, 185, r_line, 1, 1, 0, 255, 255, 255, 255, 1 - (10 - r_buffer) / 10)
	} else  {
	    if(menu == 8) draw_set_color(65535)
	    else  draw_set_color(16777215)
	    draw_text(20, 185, "RESET TO DEFAULT")
	}
	if(menu == 8 and menu_engage == 1) {
	    r_buffer= 15
	    rrr= floor(random(50))
	    if(fun == 1) {
	        if(rrr == 1) r_line= "SPAGHETTI..."
	        else  r_line= "RESETTED..."
	    }
	    GS.button0= 2
	    GS.button1= 1
	    GS.button2= 4
	    GS.analog_sense= 0.2
	    GS.analog_sense_sense= 0.01
	    GS.joy_dir= 0
	    if(obj_time.j_ch > 0 and not joystick_has_pov(obj_time.j_ch))
	        GS.joypad_dir= 1
	    menu_engage= 0
	}
	if(menu == 9) draw_set_color(65535)
	else  draw_set_color(16777215)
	draw_text(20, 200, "CONTROL TEST")
	if(menu == 9 and menu_engage == 1) {
	    caster_free(-3)
	    get_tree().change_scene_to_file("res://godot_rooms/289.tscn")
	}
	if(weather == 1) {
	    c= instance_create(0, 0, 101/* obj_ct_fallobj */)
	    c.sprite_index= 849/* spr_christmasflake */
	    siner++
	    draw_sprite_ext(851/* spr_tobdog_winter */, 0, 250, 218, 1, 1, 0, 16777215, 1)
	    draw_set_color(8421504)
	    draw_text_transformed(220 + sin(siner / 12), 120 + cos(siner / 12), "cold outside#but stay warm#inside of you", 1, 1, -20)
	}
	if(weather == 2) {
	    c= instance_create(0, 0, 101/* obj_ct_fallobj */)
	    c.sprite_index= 850/* spr_fallleaf */
	    c.image_blend= choose(merge_color(255, 16777215, 0.5))
	    siner++
	    draw_sprite_ext(853/* spr_tobdog_spring */, floor(siner / 15), 250, 218, 1, 1, 0, 16777215, 1)
	    draw_set_color(8421504)
	    draw_text_transformed(220 + sin(siner / 12), 120 + cos(siner / 12), "spring time#back to school", 1, 1, -20)
	}
	if(weather == 3) {
	    extreme2++
	    if(extreme2 >= 240) {
	        extreme++
	        if(extreme >= 1100 and abs(sin(siner / 15)) < 0.1) {
	            extreme= 0
	            extreme2= 0
	        }
	    }
	    siner++
	    draw_sprite_ext(854/* spr_tobdog_summer */, floor(siner / 15), 250, 225, 2 + sin(siner / 15) * (0.2 + extreme / 900), 2 - sin(siner / 15) * (0.2 + extreme / 900), 0, 16777215, 1)
	    draw_set_color(65535)
	    draw_circle(258 + cos(siner / 18) * 6, 40 + sin(siner / 18) * 6, 28 + sin(siner / 6) * 4, 0)
	    draw_set_color(8421504)
	    draw_text_transformed(220 + sin(siner / 12), 120 + cos(siner / 12), "try to withstand#the sun\'s life-#giving rays", 1, 1, -20)
	}
	if(weather == 4) {
	    c= instance_create(0, 0, 101/* obj_ct_fallobj */)
	    c.sprite_index= 850/* spr_fallleaf */
	    c.image_blend= choose(65535, 4235519, 255)
	    siner++
	    draw_sprite_ext(852/* spr_tobdog_autumn */, 0, 250, 218, 1, 1, 0, 16777215, 1)
	    draw_set_color(8421504)
	    draw_text_transformed(220 + sin(siner / 12), 120 + cos(siner / 12), "sweep a leaf#sweep away a#troubles", 1, 1, -20)
	}
	if(intro == 1) {
	    if(rectile == 16) caster_play(harp, 1, 1)
	    rectile+= 4
	    draw_set_color(0)
	    draw_rectangle(168 - rectile, -10, -1, 250, 0)
	    draw_set_color(0)
	    draw_rectangle(152 + rectile, -10, 330, 250, 0)
	    if(rectile >= 170) {
	        caster_loop(weathermusic, 0.8, 1)
	        menu_engage= 0
	        buffer= 5
	        intro= -1
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
