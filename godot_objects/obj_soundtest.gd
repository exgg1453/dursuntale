# Auto-converted from GameMaker: obj_soundtest
extends Node2D

func _ready():
	draw_set_color(16777215)
	audio_stop_all()
	con= 0
	test_number= 0
	played= 0
	active_l= 0
	active_r= 0
	buffer= 0
	songno= 0
	gaster= 0
	g_timer= 0
	seeya_timer= 0

func _on_outside_room():
	if(con == 0) {
	    draw_set_color(16777215)
	    draw_set_font(1)
	    draw_text(120, 50, "Welcome to the Sound Test!#Listen to all your favorites.#Press Left or Right to select.#Press Z to play a song.#")
	    buffer++
	    if(buffer >= 20 and keyboard_multicheck_pressed(0/* NOKEY */)) {
	        buffer= -10
	        con= 1
	        songno= 0
	        _play_sound("143")
	    }
	}
	if(con == 1) {
	    draw_set_color(16777215)
	    draw_text_transformed(200, 50, "SOUND TEST", 2, 2, 0)
	    if(songno == 0) {
	        if(audio_is_playing(143)) draw_set_color(65535)
	        else  {
	            if(keyboard_multicheck_pressed(0/* NOKEY */) and gaster == 0) {
	                audio_stop_all()
	                _play_sound("143")
	            }
	        }
	        draw_text(220, 200, "Happy Town")
	    }
	    if(songno == 1) {
	        if(audio_is_playing(145)) draw_set_color(65535)
	        else  {
	            if(keyboard_multicheck_pressed(0/* NOKEY */) and gaster == 0) {
	                audio_stop_all()
	                _play_sound("145")
	            }
	        }
	        draw_text(220, 200, "Meat Factory")
	    }
	    if(songno == 2) {
	        if(audio_is_playing(146)) draw_set_color(65535)
	        else  {
	            if(keyboard_multicheck_pressed(0/* NOKEY */) and gaster == 0) {
	                audio_stop_all()
	                _play_sound("146")
	            }
	        }
	        draw_text(220, 200, "Trouble Dingle")
	    }
	    if(songno == 3) {
	        if(audio_is_playing(144)) draw_set_color(65535)
	        else  {
	            if(keyboard_multicheck_pressed(0/* NOKEY */) and gaster == 0) {
	                gaster= 1
	                audio_stop_all()
	                _play_sound("144")
	            }
	        }
	        draw_text(220, 200, "Gaster\'s Theme")
	    }
	    buffer++
	    if(Input.is_action_pressed("move_left") and buffer > 0 and active_l < 0) {
	        if(gaster == 0) {
	            songno++
	            if(songno > 3) songno= 0
	            active_l= 10
	        } else  {
	            active_l= 2
	            songno--
	            if(songno < 0) songno= 3
	        }
	    }
	    if(Input.is_action_pressed("move_right") and buffer > 0 and active_r < 0) {
	        active_r= 10
	        songno++
	        if(songno > 3) songno= 0
	        if(gaster == 1) active_r= 2
	    }
	    active_l--
	    active_r--
	    draw_set_color(16777215)
	    if(active_l > 0) draw_set_color(65535)
	    draw_text(50, 200, "<<")
	    draw_set_color(16777215)
	    if(active_r > 0) draw_set_color(65535)
	    draw_text(580, 200, ">>")
	    if(gaster == 1) g_timer++
	    if(g_timer >= 600) {
	        audio_stop_all()
	        con= 3
	    }
	}
	if(con == 3) {
	    draw_text(150, 50, "Thanks for your feedback!#Be seeing you soon!")
	    seeya_timer++
	    if(seeya_timer >= 180) get_tree().change_scene_to_file("res://godot_rooms/47.tscn")
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
