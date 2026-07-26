# Auto-converted from GameMaker: obj_sistertext
extends Node2D

func _ready():
	phrase= "It\'s good to be#with my sister again. "
	active= 0
	$Alarm0.start((1) / 30.0)
	done= 0
	amt= 6
	i= 0
	while(i < amt) {
	    fade[i]= 0
	    wherex[i]= random(220) + view_xview[0] - 50
	    wherey[i]= random(get_viewport_rect().size.y - 20)
	    i++
	}
	siner= 0
	type= 1
	hypefade= 1

func _gm_event_2_3():
	j= floor(random(amt))
	wherex[j]= random(220) + view_xview[0] - 50
	wherey[j]= random(get_viewport_rect().size.y - 20)
	fade[j]= -1
	$Alarm3.start((3) / 30.0)

func _gm_event_2_2():
	num++
	if(phraselength > num) {
	    this_phrase+= string_char_at(phrase, num)
	    $Alarm2.start((2) / 30.0)
	} else  done= 1

func _on_destroy():
	phraselength= string_length(phrase)
	active= 1
	num= 1
	this_phrase= ""
	this_phrase+= string_char_at(phrase, num)
	$Alarm2.start((2) / 30.0)
	$Alarm3.start((10) / 30.0)

func _on_outside_room():
	if(active == 1) {
	    draw_set_color(16777215)
	    draw_set_font(2)
	    if(done == 2) hypefade-= 0.1
	    i= 0
	    while(i < amt) {
	        draw_set_alpha(fade[i] * hypefade)
	        draw_text(wherex[i] + sin(i + siner / 5) * 5, wherey[i] + cos(i + siner / 5) * 5, this_phrase)
	        if(fade[i] < 1) fade[i]+= 0.2
	        i++
	    }
	    draw_set_alpha(1)
	}
	siner++
	if(done == 1 and keyboard_multicheck_pressed(0/* NOKEY */))
	    done= 2
	if(hypefade <= 0) instance_destroy()

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
