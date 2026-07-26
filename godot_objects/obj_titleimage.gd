# Auto-converted from GameMaker: obj_titleimage
extends Node2D

func _ready():
	intronoise= caster_load("music/intronoise.ogg")
	caster_play(intronoise, 1, 1)
	$Alarm0.start((600) / 30.0)
	$Alarm1.start((100) / 30.0)
	d= 0
	ballamount= 0
	special_x= 0
	drawpw= 0
	pw1= 0
	pw2= 0
	pw3= 0
	pw4= 0
	if(file_exists("undertale.ini")) {
	    ini_open("undertale.ini")
	    if(ini_read_real("General", "Won", 0) > 0) pw1= 1
	    if(ini_read_real("General", "Truth", 0) > 0) {
	        pw1= 1
	        pw2= 1
	    }
	    if(ini_read_real("EndF", "EndF", 0) >= 2) {
	        pw1= 1
	        pw2= 1
	    }
	    if(ini_read_real("reset", "reset", 0) > 0) {
	        pw1= 1
	        pw2= 1
	    }
	    if(ini_read_real("Sans", "Intro", 0) > 0) pw3= 1
	    if(ini_read_real("Sans", "F", 0) > 0) pw3= 1
	    if(ini_read_real("Sans", "SK", 0) > 0) pw3= 1
	    if(file_exists("system_information_963")) pw3= 1
	    ini_close()
	}

func _gm_event_2_1():
	d= 1

func _on_destroy():
	caster_free(intronoise)
	room_goto_previous()

func _on_outside_room():
	draw_sprite(sprite_index, 0, x, y)
	if(d == 1) {
	    draw_set_color(8421504)
	    draw_set_font(3)
	    draw_text(120, 180, "[PRESS Z OR ENTER]")
	}
	if(keyboard_multicheck_pressed(0/* NOKEY */)) {
	    caster_free(intronoise)
	    room_goto_next()
	}
	if(ballamount == 3 and Input.is_key_pressed(76)) {
	    ballamount= 4
	    snd_play(147/* snd_ballchime */)
	}
	if(ballamount == 2 and Input.is_key_pressed(76))
	    ballamount= 3
	if(ballamount == 1 and Input.is_key_pressed(65))
	    ballamount= 2
	if(ballamount == 0 and Input.is_key_pressed(66))
	    ballamount= 1
	if(keyboard_multicheck_pressed(1/* ANYKEY */)) {
	    special_x++
	    if(special_x >= 5) {
	        $Alarm0.start((1800) / 30.0)
	        $Alarm1.start((-1) / 30.0)
	        d= 0
	        drawpw= 1
	    }
	}
	if(drawpw == 1) {
	    d= 0
	    $Alarm0.start((999) / 30.0)
	    draw_set_color(16777215)
	    draw_set_font(2)
	    if(pw1 == 0 and pw2 == 0 and pw3 == 0)
	        draw_text(20, 180, "No Information")
	    if(pw1 == 1) draw_text(20, 170, "Activity Level A")
	    if(pw2 == 1) draw_text(20, 190, "Activity Level B")
	    if(pw3 == 1) draw_text(20, 210, "Activity Level C")
	}

func _gm_event_9_27():
	game_end()

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
