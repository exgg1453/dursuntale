# Auto-converted from GameMaker: obj_stormstar_gen
extends Node2D

func _ready():
	$Alarm0.start((1) / 30.0)
	$Alarm1.start((170) / 30.0)
	active= 1
	oo= 0
	a_x= GS.idealborder[0]
	a_y= GS.idealborder[3]
	a_y2= GS.idealborder[2]
	a_x2= GS.idealborder[1]
	sfx= caster_load("music/sfx/sfx_star.ogg")
	expl= caster_load("music/explosion.ogg")
	$Alarm2.start((12) / 30.0)
	off= 0
	h_mode= 0

func _gm_event_1_0():
	caster_free(sfx)
	caster_free(expl)

func _gm_event_2_3():
	caster_play(sfx, 1, 0.4)

func _gm_event_2_2():
	$Alarm2.start((16) / 30.0)
	caster_stop(sfx)
	caster_play(sfx, 0.7, 1 + random(0.2) - random(0.3))

func _gm_event_2_1():
	active= 0
	bg= instance_create(830, -170, 581/* obj_stormstar */)
	bg.h_mode= h_mode
	bg.big= 1
	$Alarm2.start((-1) / 30.0)
	$Alarm3.start((20) / 30.0)

func _on_destroy():
	if(active == 1) {
	    st= instance_create(580 + random(700), -150 - random(100), 581/* obj_stormstar */)
	    st.h_mode= h_mode
	    $Alarm0.start((8) / 30.0)
	}

func _gm_event_7_12():
	caster_play(expl, 0.8, 1.1)
	off= 1
	vol= 0.8
	// obj_vsflowey_shaker
	with(1582) instance_destroy()
	if(not instance_exists(184/* obj_shaker */)) scr_shake(7, 7, 2)

func _gm_event_7_11():
	caster_stop(expl)
	caster_play(expl, 0.4, 2)
	// obj_vsflowey_shaker
	with(1582) instance_destroy()
	shk= instance_create(0, 0, 1582/* obj_vsflowey_shaker */)
	shk.shakex= 5
	shk.shakey= 5

func _on_outside_room():
	draw_set_color(255)
	draw_rectangle(a_x, a_y, a_x2, a_y2, 1)
	gh= collision_rectangle(a_x, a_y, a_x2, a_y2, 581, 0, 1)
	if(gh != -4) {
	    if(gh.con == 1) draw_circle(10, 10, 4, 0)
	    if(gh.con == 2) draw_circle(30, 10, 4, 0)
	}
	with(gh) {
	    if(con != 3 and con != 4 and big == 0) {
	        event_user(3)
	        speed= 0
	    }
	}
	if(off == 1) {
	    vol-= 0.0125
	    caster_set_volume(expl, vol)
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
