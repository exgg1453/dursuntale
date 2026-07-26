# Auto-converted from GameMaker: obj_shootguy
# GM parent: obj_readable
extends Node2D

func _ready():
	buffer= 0
	ammo= 0
	moved= 0
	gridl= 120
	gridr= 180
	gridu= 60
	gridd= 120
	active= 0
	myinteract= 0
	snd= 0
	win= 0
	wincon= 0
	wintimer= 0
	idealammo= 0
	restart= 0
	rstype= 0
	if(room == 152 and GS.flag[375] == 1) win= 1
	if(room == 150 and GS.flag[374] == 1) win= 1
	if(room == 173 and GS.flag[399] == 1) win= 1
	if(room == 175 and GS.flag[400] == 1) win= 1
	if(room == 205 and GS.flag[418] == 1) win= 1
	if(room == 173) {
	    gridu= 40
	    gridl= 120
	    gridr= 220
	    gridd= 120
	}
	if(room == 175) {
	    gridu= 20
	    gridl= 120
	    gridr= 220
	    gridd= 120
	}
	$Alarm1.start((1) / 30.0)

func _gm_event_2_5():
	if(ammo < idealammo) {
	    if(ammo < idealammo - 1) buffer+= 6
	    ammo++
	    snd_play(106/* snd_noise */)
	    $Alarm5.start((6) / 30.0)
	}

func _gm_event_2_3():
	GS.interact= 0
	myinteract= 0
	GS.facing= 2

func _gm_event_2_2():
	// obj_blackbox_o
	with(1242) {
	    instance_create(x + 10, y + 10, 1241/* obj_blackbox_o_shatter */)
	    instance_destroy()
	}

func _gm_event_2_1():
	if(room == 152) {
	    idealammo= 2
	    if(active == 1) $Alarm5.start((1) / 30.0)
	    gridl= 120
	    gridr= 180
	    gridu= 60
	    gridd= 120
	    instance_create(140, 60, 1242/* obj_blackbox_o */)
	    instance_create(140, 100, 1242/* obj_blackbox_o */)
	}
	if(room == 150) {
	    idealammo= 2
	    if(active == 1) $Alarm5.start((1) / 30.0)
	    gridl= 120
	    gridr= 200
	    gridu= 40
	    gridd= 120
	    instance_create(120, 60, 1242/* obj_blackbox_o */)
	    instance_create(140, 60, 1242/* obj_blackbox_o */)
	    instance_create(140, 100, 1242/* obj_blackbox_o */)
	    instance_create(160, 60, 1242/* obj_blackbox_o */)
	    instance_create(160, 80, 1242/* obj_blackbox_o */)
	    instance_create(160, 100, 1242/* obj_blackbox_o */)
	}
	if(room == 173) {
	    idealammo= 1
	    if(active == 1) $Alarm5.start((1) / 30.0)
	    gridl= 120
	    gridr= 220
	    gridu= 40
	    gridd= 120
	    instance_create(180, 40, 1242/* obj_blackbox_o */)
	    instance_create(180, 60, 1242/* obj_blackbox_o */)
	    instance_create(180, 80, 1242/* obj_blackbox_o */)
	    instance_create(180, 100, 1242/* obj_blackbox_o */)
	}
	if(room == 175) {
	    idealammo= 1
	    if(active == 1) $Alarm5.start((1) / 30.0)
	    gridl= 120
	    gridr= 220
	    gridu= 20
	    gridd= 120
	    instance_create(180, 20, 1242/* obj_blackbox_o */)
	    instance_create(140, 40, 1242/* obj_blackbox_o */)
	    instance_create(160, 60, 1242/* obj_blackbox_o */)
	    instance_create(200, 60, 1242/* obj_blackbox_o */)
	    instance_create(140, 80, 1242/* obj_blackbox_o */)
	    instance_create(180, 80, 1242/* obj_blackbox_o */)
	}
	if(room == 205) {
	    idealammo= 2
	    if(active == 1) $Alarm5.start((1) / 30.0)
	    gridl= 120
	    gridr= 220
	    gridu= 20
	    gridd= 120
	    instance_create(160, 40, 1242/* obj_blackbox_o */)
	    instance_create(160, 80, 1242/* obj_blackbox_o */)
	    instance_create(140, 60, 1242/* obj_blackbox_o */)
	    instance_create(160, 60, 1242/* obj_blackbox_o */)
	    instance_create(180, 60, 1242/* obj_blackbox_o */)
	    instance_create(200, 60, 1242/* obj_blackbox_o */)
	}
	if(win > 0) {
	    // obj_blackbox_o
	    with(1242) instance_destroy()
	    // obj_targetguy
	    with(1239) instance_destroy()
	}

func _process(delta: float):
	buffer--
	restart--
	if(active == 1 and win == 0 and buffer <= 0) {
	    blt= 0
	    if(instance_exists(1243/* obj_shotguy */)) blt= 1
	    if(keyboard_multicheck_pressed(0/* NOKEY */) and ammo > 0 and buffer <= 0) {
	        ammo--
	        buffer= 4
	        instance_create(x, y, 1243/* obj_shotguy */)
	    }
	    if(Input.is_action_pressed("move_right") and blt == 0 and buffer <= 0) {
	        buffer= 4
	        event_user(0)
	    }
	    if(Input.is_action_pressed("move_left") and blt == 0 and buffer <= 0) {
	        buffer= 4
	        event_user(1)
	    }
	    if(Input.is_action_pressed("move_up") and blt == 0 and buffer <= 0) {
	        buffer= 4
	        event_user(2)
	    }
	    if(Input.is_action_pressed("move_down") and blt == 0 and buffer <= 0) {
	        buffer= 4
	        event_user(3)
	    }
	    if(keyboard_multicheck_pressed(1/* ANYKEY */) and buffer <= 0 and not instance_exists(1243/* obj_shotguy */)) {
	        active= 0
	        $Alarm2.start((2) / 30.0)
	        $Alarm1.start((12) / 30.0)
	        buffer= 15
	        $Alarm3.start((1) / 30.0)
	    }
	    if(ammo == 0 and not instance_exists(1243/* obj_shotguy */) and buffer <= 0 and active == 1 and instance_exists(1239/* obj_targetguy */) and obj_targetguy.defeat == 0) {
	        restart= 20
	        rstype= random(100)
	        buffer= 20
	        $Alarm2.start((2) / 30.0)
	        $Alarm1.start((12) / 30.0)
	    }
	}
	if(myinteract == 1 and win == 0) {
	    ammo= 0
	    buffer= 10
	    $Alarm5.start((1) / 30.0)
	    GS.interact= 1
	    myinteract= 2
	    GS.facing= 2
	    active= 1
	}
	snd= 0
	if(win == 1 and active == 1) {
	    wintimer++
	    if(wintimer == 50) snd_play(26/* snd_dumbvictory */)
	    if(wintimer > 100) {
	        if(room == 152) GS.flag[375]= 1
	        if(room == 150) GS.flag[374]= 1
	        if(room == 173) GS.flag[399]= 1
	        if(room == 175) GS.flag[400]= 1
	        if(room == 205) GS.flag[418]= 1
	        GS.interact= 0
	        wintimer= 0
	        win= 2
	        myinteract= 0
	        GS.facing= 0
	        active= 0
	        scr_tempsave()
	    }
	}

func _gm_event_7_14():
	if(snd == 0) snd_play(152/* snd_breakc */)

func _gm_event_7_13():
	j= gridd - 30
	while(j > gridu) {
	    i= gridl + 10
	    while(i < gridr) {
	        if(collision_point(i, j, 1242, 0, 1)) {
	            with(collision_point(i, j, 1242, 0, 1)) event_user(3)
	        }
	        i+= 20
	    }
	    j-= 20
	}

func _gm_event_7_12():
	j= gridu + 30
	while(j < gridd) {
	    i= gridl + 10
	    while(i < gridr) {
	        if(collision_point(i, j, 1242, 0, 1)) {
	            with(collision_point(i, j, 1242, 0, 1)) event_user(2)
	        }
	        i+= 20
	    }
	    j+= 20
	}

func _gm_event_7_11():
	i= gridl + 30
	while(i < gridr) {
	    j= gridu + 10
	    while(j < gridd) {
	        if(collision_point(i, j, 1242, 0, 1)) {
	            with(collision_point(i, j, 1242, 0, 1)) event_user(1)
	        }
	        j+= 20
	    }
	    i+= 20
	}

func _gm_event_7_10():
	i= gridr - 30
	while(i > gridl) {
	    j= gridu + 10
	    while(j < gridd) {
	        if(collision_point(i, j, 1242, 0, 1)) {
	            with(collision_point(i, j, 1242, 0, 1)) event_user(0)
	        }
	        j+= 20
	    }
	    i-= 20
	}

func _on_outside_room():
	draw_sprite(sprite_index, frame, x, y)
	if(active == 1) {
	    i= 0
	    while(i < ammo) {
	        draw_sprite(1815/* spr_shotguy_indicator */, 0, x + 20 + i * 10, y - 2)
	        i++
	    }
	}
	draw_set_color(16777215)
	if(win > 0) draw_set_color(65280)
	draw_rectangle(gridl - 2, gridu - 2, gridr + 1, gridd + 1, 1)
	if(wintimer >= 50)
	    draw_sprite(1808/* spr_text_congratulations */, 0, gridr / 2 + gridl / 2, gridu - 15)
	if(restart > 0) {
	    if(rstype < 99)
	        draw_sprite(1806/* spr_text_restart */, 0, gridr / 2 + gridl / 2, gridu - 15)
	    else  draw_sprite(1807/* spr_text_restaurant */, 0, gridr / 2 + gridl / 2, gridu - 15)
	}
	if(active == 0) {
	    draw_set_color(0)
	    draw_set_alpha(0.4)
	    draw_rectangle(-10, -10, 400, 160, 0)
	    draw_set_alpha(1)
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
