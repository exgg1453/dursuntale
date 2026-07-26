# Auto-converted from GameMaker: obj_flymett
extends Node2D

func _ready():
	siner= 0
	siner2= 0
	image_speed= 0.5
	mode= 0
	ang= 30
	overmode= 0
	con= 0
	movemode= 0

func _gm_event_2_2():
	con= 0

func _gm_event_2_1():
	mode= 2
	if(overmode == 2) mode= 3
	sh= instance_create(x + 11 + lengthdir_x(26, ang), y + 15 + lengthdir_y(26, ang), 1189/* obj_flylight_a */)
	sh.direction= ang
	sh.speed= 4
	shotno++
	if(shotno < 6) $Alarm1.start((2) / 30.0)
	else  {
	    mode= 0
	    shotno= 0
	}

func _process(delta: float):
	siner++
	y+= sin(siner / 3)
	if(movemode == 1) {
	    siner2++
	    x+= sin(siner / 12) * 6
	}
	if(overmode == 1) {
	    if(con == 0) {
	        event_user(1)
	        con= 1
	    }
	    if(con == 1) {
	        $Alarm2.start((20) / 30.0)
	        if(movemode == 1) $Alarm2.start((30) / 30.0)
	        con= 2
	    }
	}
	if(overmode == 2) {
	    if(con == 0) {
	        event_user(1)
	        con= 1
	    }
	    if(con == 1) {
	        $Alarm2.start((40) / 30.0)
	        if(movemode == 1) $Alarm2.start((40) / 30.0)
	        con= 2
	    }
	}

func _gm_event_7_11():
	$Alarm1.start((10) / 30.0)
	mode= 1
	shotno= 0

func _on_outside_room():
	draw_sprite(sprite_index, frame, x, y)
	if(mode == 1 or mode == 3)
	    ang= point_direction(x + 11, y + 15, obj_jetpackchara.x + 10, obj_jetpackchara.y + 10)
	if(mode == 3) ang+= random(60) - 30
	draw_sprite_ext(1707/* spr_flymettarm */, 0, x + 11, y + 15, 1, 1, ang, 16777215, 1)

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
