# Auto-converted from GameMaker: obj_6pan
# GM parent: obj_6bparent
extends Node2D

func _ready():
	siner= 0
	counter= 30
	scale.x= 2
	scale.y= 2
	frame= 0
	rot= 0
	image_speed= 0
	ss= 1
	con= 0
	spec= 0
	num= 0
	type= 0

func _on_alarm_0_timeout():
	if(type == 0) event_inherited()

func _gm_event_7_15():
	type= 1

func _gm_event_7_14():
	type= 2

func _on_outside_room():
	siner++
	draw_set_color(0)
	xox= lengthdir_x(220, rot + 180)
	yoy= lengthdir_y(220, rot + 180)
	draw_triangle(x, y, x + xox, y + yoy, -20 + x + xox / 2, y + 80, 0)
	if(ss == 1) {
	    x+= sin(siner / 3) * 5
	    y+= cos(siner / 2) * 2
	}
	if(frame == 0)
	    draw_sprite_ext(sprite_index, 0, x, y, scale.x, scale.y, rot, 16777215, modulate.a)
	if(frame == 1)
	    draw_sprite_ext(sprite_index, 1, x, y, scale.x, scale.y, rot + 40, 16777215, modulate.a)
	counter++
	if(counter > 57 and counter < 60) rot+= 2
	if(counter > 60 and counter < 62) {
	    rot-= 8
	    if(spec == 1) num++
	    if(num != 12) {
	        xox= lengthdir_x(150, rot + 180)
	        yoy= lengthdir_x(70, rot + 180)
	        fr= instance_create(x + xox, y + yoy, 1618/* obj_6pan_fire */)
	        fr.gravity+= 0.1 + random(0.08)
	        fr= instance_create(x + xox, y + yoy, 1618/* obj_6pan_fire */)
	        fr= instance_create(x + xox, y + yoy, 1618/* obj_6pan_fire */)
	        fr.gravity+= 0.07 + random(0.06)
	        fr= instance_create(x + xox, y + yoy, 1618/* obj_6pan_fire */)
	        fr.gravity+= 0.05 + random(0.04)
	        fr.panparent= id
	    } else  act= instance_create(x - 140, y - 10, 1620/* obj_6pan_act */)
	}
	if(counter >= 63 and counter < 67) rot-= 3
	if(counter >= 63 and counter < 72) ss= 0
	if(counter > 70 and counter < 72) rot+= 6
	if(counter >= 72) {
	    frame= 0
	    rot+= 5
	    if(rot > 3) {
	        ss= 1
	        rot= 0
	        counter= 50
	        if(num == 12) counter= -20
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
