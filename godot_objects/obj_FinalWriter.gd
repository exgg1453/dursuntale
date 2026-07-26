# Auto-converted from GameMaker: obj_FinalWriter
extends Node2D

func _ready():
	wx= 90
	wy= 280
	draw_set_font(-1)
	draw_set_color(16777215)
	a= 2
	b= 3
	string0= " ASRIEL   DREEMURR "
	$Alarm0.start((2) / 30.0)
	active= 0
	at= 1
	typespeed= 6
	w_sfx= caster_load("music/sfx/sfx_a_gigatalk.ogg")

func _gm_event_2_1():
	if(stringln > at - 1) {
	    tchar= string_char_at(string0, at)
	    string1+= tchar
	    at++
	    $Alarm1.start((typespeed) / 30.0)
	    if(tchar != " ") {
	        caster_stop(w_sfx)
	        caster_play(w_sfx, 0.9, 1.15)
	    }
	}

func _on_destroy():
	stringln= string_length(string0)
	string1= ""
	tchar= string_char_at(string0, at)
	string1+= tchar
	at++
	$Alarm1.start((typespeed) / 30.0)
	active= 1
	if(tchar != " ") {
	    snd_stop(85)
	    snd_play(85/* snd_txtasr2 */)
	}

func _on_outside_room():
	draw_set_font(1)
	if(active == 1) {
	    draw_set_alpha(0.9)
	    draw_text_transformed(wx - 2 + random(4), wy - 2 + random(4), string1, 2, 2, 0)
	    draw_set_alpha(0.7)
	    draw_text_transformed(wx - 2 + random(4), wy - 3 + random(4), string1, 2, 2, 0)
	    i= 2
	    repeat(5)  {
	        draw_set_alpha(0.7 - i * 0.1)
	        draw_text_transformed(wx - i * 4 + random(i * 8), wy - i * 4 + random(i * 8), string1, 2, 2, 0)
	        i++
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
