# Auto-converted from GameMaker: obj_time
extends Node2D

func _ready():
	up= 0
	down= 0
	left= 0
	right= 0
	quit= 0
	try_up= 0
	try_down= 0
	try_left= 0
	try_right= 0
	canquit= 1
	h_skip= 0
	j_xpos= 0
	j_ypos= 0
	j_dir= 0
	j_fr= 0
	j_fl= 0
	j_fu= 0
	j_fd= 0
	j_fr_p= 0
	j_fl_p= 0
	j_fu_p= 0
	j_fd_p= 0
	i= 0
	while(i < 12) {
	    j_prev[i]= 0
	    j_on[i]= 0
	    i++
	}
	GS.button0= 2
	GS.button1= 1
	GS.button2= 4
	GS.analog_sense= 0.15
	GS.analog_sense_sense= 0.01
	GS.joy_dir= 0
	ini_open("config.ini")
	b0_i= ini_read_real("joypad1", "b0", -1)
	b1_i= ini_read_real("joypad1", "b1", -1)
	b2_i= ini_read_real("joypad1", "b2", -1)
	as_i= ini_read_real("joypad1", "as", -1)
	jd_i= ini_read_real("joypad1", "jd", -1)
	if(b0_i >= 0) GS.button0= b0_i
	if(b1_i >= 0) GS.button1= b1_i
	if(b2_i >= 0) GS.button2= b2_i
	if(as_i >= 0) GS.analog_sense= as_i
	if(jd_i >= 0) GS.joy_dir= jd_i
	ini_close()
	debug_r= 0
	debug_f= 0
	j1= 0
	j2= 0
	ja= 0
	j_ch= 0
	jt= 0
	spec_rtimer= 0

func _process_end(delta: float):
	if(canquit == 1 and quit > 20) game_end()

func _process_begin(delta: float):
	time++
	if(jt == 0 and j_ch != 2) {
	    if(joystick_exists(1)) j_ch= 1
	    else  {
	        if(j_ch == 1) j_ch= 0
	    }
	}
	if(jt == 4 and j_ch != 1) {
	    if(joystick_exists(2)) j_ch= 2
	    else  {
	        if(j_ch == 2) j_ch= 0
	    }
	}
	jt++
	if(jt >= 8) jt= 0
	if(j_ch > 0) {
	    j_prev[0]= j_on[0]
	    j_on[0]= joystick_check_button(j_ch, GS.button0)
	    if(j_on[0] == 1 and j_prev[0] != j_on[0])
	        keyboard_key_press(90/* Z */)
	    if(j_on[0] == 0 and j_prev[0] != j_on[0])
	        keyboard_key_release(90)
	    j_prev[1]= j_on[1]
	    j_on[1]= joystick_check_button(j_ch, GS.button1)
	    if(j_on[1] == 1 and j_prev[1] != j_on[1])
	        keyboard_key_press(88/* X */)
	    if(j_on[1] == 0 and j_prev[1] != j_on[1])
	        keyboard_key_release(88)
	    j_prev[2]= j_on[2]
	    j_on[2]= joystick_check_button(j_ch, GS.button2)
	    if(j_on[2] == 1 and j_prev[2] != j_on[2])
	        keyboard_key_press(67/* C */)
	    if(j_on[2] == 0 and j_prev[2] != j_on[2])
	        keyboard_key_release(67)
	    j_fr_p= j_fr
	    j_fl_p= j_fl
	    j_fu_p= j_fu
	    j_fd_p= j_fd
	    j_fr= 0
	    j_fl= 0
	    j_fu= 0
	    j_fd= 0
	    if(GS.joy_dir == 0 or GS.joy_dir == 1) {
	        j_xpos= joystick_xpos(j_ch)
	        j_ypos= joystick_ypos(j_ch)
	    }
	    j_dir= joystick_direction(j_ch)
	    if((GS.joy_dir == 0 or GS.joy_dir == 1) and j_dir == 101) {
	        if(j_xpos >= GS.analog_sense) j_fr= 1
	        if(j_xpos <= -GS.analog_sense) j_fl= 1
	        if(j_ypos >= GS.analog_sense) j_fd= 1
	        if(j_ypos <= -GS.analog_sense) j_fu= 1
	    }
	    if(j_dir != 101) {
	        if(j_dir == 100) j_fl= 1
	        if(j_dir == 98) j_fd= 1
	        if(j_dir == 102) j_fr= 1
	        if(j_dir == 104) j_fu= 1
	        if(j_dir == 99) {
	            j_fr= 1
	            j_fd= 1
	        }
	        if(j_dir == 97) {
	            j_fd= 1
	            j_fl= 1
	        }
	        if(j_dir == 103) {
	            j_fu= 1
	            j_fl= 1
	        }
	        if(j_dir == 105) {
	            j_fu= 1
	            j_fr= 1
	        }
	    }
	    if(GS.joy_dir == 0 or GS.joy_dir == 2) {
	        j_pov= joystick_pov(j_ch)
	        if(j_pov == 0) j_fu= 1
	        if(j_pov == 270) j_fl= 1
	        if(j_pov == 90) j_fr= 1
	        if(j_pov == 180) j_fd= 1
	        if(j_pov == 315) {
	            j_fu= 1
	            j_fl= 1
	        }
	        if(j_pov == 45) {
	            j_fu= 1
	            j_fr= 1
	        }
	        if(j_pov == 225) {
	            j_fd= 1
	            j_fl= 1
	        }
	        if(j_pov == 135) {
	            j_fd= 1
	            j_fr= 1
	        }
	    }
	    if(j_fr != j_fr_p and j_fr == 1) keyboard_key_press(39/* RIGHT */)
	    if(j_fl != j_fl_p and j_fl == 1) keyboard_key_press(37/* LEFT */)
	    if(j_fd != j_fd_p and j_fd == 1) keyboard_key_press(40/* DOWN */)
	    if(j_fu != j_fu_p and j_fu == 1) keyboard_key_press(38/* UP */)
	    if(j_fr != j_fr_p and j_fr == 0) keyboard_key_release(39)
	    if(j_fl != j_fl_p and j_fl == 0) keyboard_key_release(37)
	    if(j_fd != j_fd_p and j_fd == 0) keyboard_key_release(40)
	    if(j_fu != j_fu_p and j_fu == 0) keyboard_key_release(38)
	}
	up= 0
	down= 0
	left= 0
	right= 0
	if(Input.is_action_pressed("move_up")) try_up= 1
	if(keyboard_check_released(38/* UP */)) try_up= 0
	if(Input.is_action_pressed("move_down")) try_down= 1
	if(keyboard_check_released(40/* DOWN */)) try_down= 0
	if(Input.is_action_pressed("move_right")) try_right= 1
	if(keyboard_check_released(39/* RIGHT */)) try_right= 0
	if(Input.is_action_pressed("move_left")) try_left= 1
	if(keyboard_check_released(37/* LEFT */)) try_left= 0
	if(GS.osflavor == 1) {
	    if(try_up) up= keyboard_check_direct(38)
	    if(try_down) down= keyboard_check_direct(40)
	    if(try_left) left= keyboard_check_direct(37)
	    if(try_right) right= keyboard_check_direct(39)
	} else  {
	    if(try_up) up= Input.is_action_pressed("move_up")
	    if(try_down) down= Input.is_action_pressed("move_down")
	    if(try_left) left= Input.is_action_pressed("move_left")
	    if(try_right) right= Input.is_action_pressed("move_right")
	}
	if(keyboard_check_released(38/* UP */)) up= 0
	if(keyboard_check_released(40/* DOWN */)) down= 0
	if(keyboard_check_released(37/* LEFT */)) left= 0
	if(keyboard_check_released(39/* RIGHT */)) right= 0
	if(keyboard_multicheck(2/* UNKNOWN(2) */) and GS.flag[28] == 1 and instance_exists(782/* OBJ_WRITER */) and not instance_exists(783/* obj_choicer */)) {
	    if(h_skip == 0) {
	        keyboard_key_press(88/* X */)
	        keyboard_key_press(90/* Z */)
	    }
	    if(h_skip == 1) {
	        keyboard_key_release(90)
	        keyboard_key_release(88)
	    }
	    if(h_skip == 0) h_skip= 1
	    else  h_skip= 0
	}
	if(GS.debug == 1 and Input.is_key_pressed(70))
	    room_speed= 200
	if(GS.debug == 1 and Input.is_key_pressed(87))
	    room_speed= 10
	if(Input.is_key_pressed(115)) {
	    if(window_get_fullscreen()) window_set_fullscreen(0)
	    else  window_set_fullscreen(1)
	}
	if(canquit == 1) {
	    if(GS.debug == 1 and Input.is_key_pressed(82) and not instance_exists(409/* obj_essaystuff */)) {
	        debug_r++
	        if(debug_r > 5) game_restart()
	        spec_rtimer= 1
	    }
	    spec_rtimer++
	    if(spec_rtimer >= 6) debug_r= 0
	    if(Input.is_action_pressed("ui_cancel")) {
	        quit++
	        if(not instance_exists(139/* obj_quittingmessage */))
	            instance_create(0, 0, 139/* obj_quittingmessage */)
	    } else  quit= 0
	}

func _gm_event_7_2():
	SCR_GAMESTART(0, 0, 0, 0, 0)
	time= 0
	image_speed= 0
	jjjjjj= 0
	repeat(20)  {
	    GS.tempvalue[jjjjjj]= 0
	    jjjjjj++
	}
	ini_open("undertale.ini")
	fskip= ini_read_real("FFFFF", "E", -1)
	ftime= ini_read_real("FFFFF", "F", -1)
	true_end= ini_read_real("EndF", "EndF", -1)
	ini_close()
	sksk= 0
	if(ftime == 1) {
	    sksk= 1
	    get_tree().change_scene_to_file("res://godot_rooms/room_f_start.tscn")
	}
	if(true_end == 1 and sksk == 0) {
	    sksk= 1
	    get_tree().change_scene_to_file("res://godot_rooms/room_flowey_regret.tscn")
	}
	if(fskip >= 1 and sksk == 0) {
	    GS.filechoice= 8
	    scr_load()
	    if(fskip == 1) get_tree().change_scene_to_file("res://godot_rooms/room_flowey_endchoice.tscn")
	    if(fskip == 2) get_tree().change_scene_to_file("res://godot_rooms/room_castle_exit.tscn")
	} else  {
	    if(sksk == 0) room_goto_next()
	}
	if(file_exists("system_information_962") and not file_exists("system_information_963"))
	    get_tree().change_scene_to_file("res://godot_rooms/room_nothingness.tscn")
	GS.osflavor= 1
	if(os_type != 0) GS.osflavor= 2

func _gm_event_7_0():
	if(GS.debug == 1) {
	    draw_set_color(16777215)
	    draw_text(0, 0, round(time / 30))
	}

func _gm_event_9_114():
	if(GS.debug == 1) {
	    gx= file_text_open_write("system_information_962")
	    file_text_write_string(gx, "a")
	    file_text_close(gx)
	    if(GS.steam_int == 1 and not steam_file_exists("system_information_962"))
	        steam_file_write_file("system_information_962", "system_information_962")
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
