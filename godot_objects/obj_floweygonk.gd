# Auto-converted from GameMaker: obj_floweygonk
extends Node2D

func _ready():
	image_speed= 0
	s_index= 0
	scale.x= 2
	scale.y= 2
	shk_x= x
	shk_amt= 0
	s_i= 9
	$Alarm0.start((1) / 30.0)

func _gm_event_2_3():
	instance_create(0, 0, 496/* obj_truechara */)
	instance_destroy()

func _gm_event_2_2():
	x= shk_x + gl
	gl= -gl
	if(gl < 0) gl+= 3
	if(gl > 0) gl-= 3
	if(abs(gl) > 1) $Alarm2.start((2) / 30.0)

func _gm_event_2_1():
	gl= 20
	snd_play(51/* snd_damage */)
	if(frame < 7) frame++
	else  {
	    $Alarm0.start((-1) / 30.0)
	    $Alarm1.start((-1) / 30.0)
	    $Alarm2.start((-1) / 30.0)
	    visible= 0
	    $Alarm3.start((150) / 30.0)
	}

func _on_destroy():
	snd_play(44/* snd_laz */)
	s_i= 0
	$Alarm0.start((29) / 30.0)
	$Alarm1.start((18) / 30.0)
	$Alarm2.start((18) / 30.0)

func _on_outside_room():
	draw_sprite_ext(sprite_index, frame, x, y, scale.x, scale.y, 0, 16777215, 1)
	if(s_i >= 0 and s_i <= 5) {
	    s_i+= 0.334
	    draw_sprite_ext(757/* spr_strike */, s_i, x + 20, y - 40, 1.5, 1.5, 0, 16777215, 1)
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
