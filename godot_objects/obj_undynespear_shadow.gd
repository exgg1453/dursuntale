# Auto-converted from GameMaker: obj_undynespear_shadow
extends Node2D

func _ready():
	goalx= obj_mainchara.x + 7
	goaly= obj_mainchara.y + 15
	move_towards_point(goalx, goaly, 6)
	active= 1
	rot= direction
	snd_play(20/* snd_arrow */)
	r= sprite_width / 2
	shadowy= y + 80
	shadowspeed= velocity.y / 1.5

func _gm_event_7_13():
	if(active == 1) {
	    speed= 0
	    active= 0
	    solid= 1
	    snd_play(21/* snd_impact */)
	}

func _gm_event_7_12():
	if(active == 1 and GS.interact == 0 and y > goaly - 60) {
	    event_user(1)
	    active= 0
	}

func _gm_event_7_11():
	GS.border= 3
	GS.flag[15]= 1
	GS.flag[16]= 1
	GS.flag[370]= 1
	SCR_BORDERSETUP()
	instance_create(0, 0, 144/* obj_battlerquick */)
	obj_undynespear.active= 2
	if(instance_exists(1045/* obj_uspeargen */))
	    obj_uspeargen.alarm[0]+= 30

func _on_outside_room():
	rot= direction
	deg= degtorad(rot)
	x1= x + r * cos(deg)
	y1= y - r * sin(deg)
	x2= x
	y2= y
	scr_depth()
	draw_set_color(0)
	if(shadowy < goaly)
	    shadowy+= shadowspeed
	draw_rectangle(x1, shadowy + 8, x2, shadowy + 14, 0)
	draw_sprite_ext(sprite_index, frame, x, y, 1, 1, direction, 16777215, modulate.a)
	draw_set_color(255)
	draw_line(x1, y1, x2, y2)
	if(y1 > goaly - 2 and collision_rectangle(x1, shadowy + 8, x2, shadowy + 14, 1570, 0, 1))
	    event_user(2)
	if(y1 >= goaly + 9) event_user(3)
	if(active == 0) {
	    modulate.a-= 0.05
	    if(modulate.a < 0.1) active= 2
	}
	if(active == 2) instance_destroy()

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
