# Auto-converted from GameMaker: obj_ultimabullet
# GM parent: obj_asbulletparent
extends Node2D

func _ready():
	xx= x
	yy= y
	xxx= x
	yyy= y
	xxxx= x
	yyyy= y
	friction= -0.1
	$Alarm1.start((1) / 30.0)
	$Alarm5.start((140) / 30.0)
	huer= random(256)
	image_blend= make_color_hsv(huer, 60, 255)

func _gm_event_2_5():
	instance_destroy()

func _on_alarm_0_timeout():
	event_user(7)

func _gm_event_7_11():
	if(side == 0) {
	    x-= 160
	    velocity.x= -9 - random(8)
	    velocity.y= 4 + random(10)
	}
	if(side == 1) {
	    x+= 160
	    velocity.x= 9 + random(8)
	    velocity.y= 4 + random(10)
	}
	i= 0
	while(i < 18) {
	    xprev[i]= x
	    yprev[i]= y
	    i++
	}

func _on_outside_room():
	hh= (obj_ultimatarget.x - x) / 20
	if(hh > 1) hh= 1
	if(hh < -1) hh= -1
	if(side == 0 and hh < 0) hh= 0
	if(side == 1 and hh > 0) hh= 0
	vv= (obj_ultimatarget.y - y) / 20
	if(vv > 1) vv= 1
	if(vv < -1) vv= -1
	if(vv > 0) vv= 0
	velocity.x+= hh
	velocity.y+= vv
	if(speed > 22) speed= 22
	rotation_degrees= direction
	xxxx= xxx
	yyyy= yyy
	xxx= xx
	yyy= yy
	xx= xprevious
	yy= yprevious
	i= 18
	while(i > 0) {
	    xprev[i]= xprev[i - 1]
	    yprev[i]= yprev[i - 1]
	    i--
	}
	xprev[0]= x
	yprev[0]= y
	huer+= 20
	image_blend= make_color_hsv(huer, 60, 255)
	draw_set_color(image_blend)
	draw_line_width(xprev[10], yprev[10], xprev[12], yprev[12], 2)
	draw_line_width(xprev[8], yprev[8], xprev[10], yprev[10], 4)
	draw_line_width(xprev[4], yprev[4], xprev[8], yprev[8], 6)
	draw_line_width(x, y, xprev[4], yprev[4], 8)
	draw_sprite_ext(sprite_index, frame, x, y, scale.x, scale.y, direction, image_blend, modulate.a)

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
