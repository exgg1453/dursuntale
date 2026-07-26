# Auto-converted from GameMaker: obj_itemswapper
extends Node2D

func _ready():
	GS.interact= 1
	xx= view_xview[view_current]
	yy= view_yview[view_current]
	c0y= 0
	c1y= 0
	column= 0
	boxtype= 0
	buffer= 0
	spec= 0
	boxno= 300

func _process_end(delta: float):
	GS.interact= 1

func _process_begin(delta: float):
	GS.interact= 1

func _on_outside_room():
	buffer++
	GS.interact= 1
	if(buffer > 3) {
	    boxno= 300
	    if(boxtype == 1) boxno= 312
	    xx= view_xview[view_current]
	    yy= view_yview[view_current] + 6
	    draw_set_color(16777215)
	    draw_rectangle(8 + xx, 2 + yy, 312 + xx, 226 + yy, 0)
	    draw_set_color(0)
	    draw_rectangle(11 + xx, 5 + yy, 309 + xx, 223 + yy, 0)
	    draw_set_font(2)
	    draw_set_color(16777215)
	    scr_itemname()
	    i= 0
	    while(i < 8) {
	        draw_set_color(16777215)
	        draw_text(40 + xx, 30 + yy + i * 16, GS.itemname[i])
	        if(GS.item[i] == 0) {
	            draw_set_color(255)
	            draw_line(45 + xx, 40 + yy + i * 16, xx + 140, 40 + yy + i * 16)
	        }
	        i++
	    }
	    draw_set_color(16777215)
	    draw_text(50 + xx, yy + 9, "INVENTORY")
	    draw_text(216 + xx, yy + 9, "BOX")
	    scr_storagename(boxno)
	    i= 0
	    while(i < 10) {
	        draw_set_color(16777215)
	        draw_text(186 + xx, 30 + yy + i * 16, GS.itemname[i])
	        if(GS.flag[boxno + i] == 0) {
	            draw_set_color(255)
	            draw_line(191 + xx, 40 + yy + i * 16, xx + 260, 40 + yy + i * 16)
	        }
	        i++
	    }
	    draw_set_color(16777215)
	    draw_line(xx + 156, yy + 40, xx + 156, yy + 190)
	    draw_line(xx + 157, yy + 40, xx + 157, yy + 190)
	    draw_text(xx + 100, yy + 197, "Press [X] to Finish")
	    if(Input.is_action_pressed("move_right") and column != 1) {
	        column= 1
	        c1y= c0y
	    }
	    if(Input.is_action_pressed("move_left") and column != 0) {
	        column= 0
	        c0y= c1y
	        if(c0y > 7) c0y= 7
	    }
	    if(Input.is_action_pressed("move_up")) {
	        if(column == 0 and c0y > 0) c0y--
	        if(column == 1 and c1y > 0) c1y--
	    }
	    if(Input.is_action_pressed("move_down")) {
	        if(column == 0 and c0y < 7) c0y++
	        if(column == 1 and c1y < 9) c1y++
	    }
	    if(column == 0)
	        draw_sprite(49/* spr_heartsmall */, 0, 24 + xx, 35 + yy + 16 * c0y)
	    if(column == 1)
	        draw_sprite(49/* spr_heartsmall */, 0, 172 + xx, 35 + yy + 16 * c1y)
	    if(keyboard_multicheck_pressed(0/* NOKEY */) and buffer > 6) {
	        if(column == 0) {
	            script_execute(85/* scr_storageget */, GS.item[c0y], boxno)
	            if(noroom == 0) script_execute(66/* scr_itemshift */, c0y, 0)
	        }
	        if(column == 1) {
	            script_execute(84/* scr_itemget */, GS.flag[c1y + boxno])
	            if(noroom == 0) scr_storageshift(c1y, 0, boxno)
	        }
	    }
	    if(keyboard_multicheck_pressed(16/* SHIFT */)) {
	        GS.interact= 0
	        if(spec == 1) GS.menuno= 0
	        obj_overworldcontroller.buffer= -2
	        instance_destroy()
	        exit
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
