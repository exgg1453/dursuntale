# Auto-converted from GameMaker: obj_undynespear
extends Node2D

func _ready():
	modulate.a= 0.2
	active= 4
	friction= 0.1
	$Alarm3.start((30 + random(4)) / 30.0)
	ramt= 36 + floor(random(9))
	r= sprite_width / 2
	rot= random(360)
	goalx= obj_mainchara.x + 7
	goaly= obj_mainchara.y + 15
	if(room == 93) goalx= obj_mainchara.x + 300
	gax= -2 + random(4)
	move_towards_point(goalx + gax, goaly, 0.2)
	idealrot= direction
	speed= 0
	direction= random(360)
	speed= 3.2
	move= 0
	stop= 0
	i= 0
	while(i * 2 < ramt) {
	    stop+= ramt - i * 2
	    i++
	}
	rot= idealrot - stop - 12
	col= 0

func _gm_event_2_3():
	if(active == 2) instance_destroy()
	goalx= obj_mainchara.x + 7
	goaly= obj_mainchara.y + 15
	if(room == 93) goalx= obj_mainchara.x + 400
	move_towards_point(goalx + gax, goaly, 5)
	active= 1
	rot= direction
	friction= -0.3
	snd_play(20/* snd_arrow */)
	r= sprite_width / 2

func _gm_event_7_13():
	if(active == 1) {
	    speed= 0
	    active= 0
	    solid= 1
	    snd_play(21/* snd_impact */)
	}

func _gm_event_7_12():
	if(active == 1 and GS.interact == 0 and y > goaly - 60)
	    event_user(1)

func _gm_event_7_11():
	if(active == 1) {
	    GS.border= 3
	    GS.flag[15]= 1
	    GS.flag[16]= 1
	    GS.flag[370]= 1
	    SCR_BORDERSETUP()
	    instance_create(0, 0, 144/* obj_battlerquick */)
	    obj_undynespear.active= 2
	    if(instance_exists(1036/* obj_undyneencounter1 */))
	        obj_undyneencounter1.stopper= 1
	    if(instance_exists(1045/* obj_uspeargen */))
	        obj_uspeargen.alarm[0]+= 20
	}

func _on_outside_room():
	deg= degtorad(rot)
	x1= x + r * cos(deg)
	y1= y - r * sin(deg)
	x2= x
	y2= y
	if(modulate.a < 1) modulate.a+= 0.1
	draw_sprite_ext(sprite_index, frame, x, y, 1, 1, rot, 16777215, modulate.a)
	if(instance_exists(1117/* obj_undynea_actor */))
	    move= obj_undynea_actor.velocity.x
	x+= move / 3
	if(active == 1) {
	    if(collision_rectangle(x1, y1, x2, y2, 1570, 0, 1))
	        col++
	    else  col= 0
	    if(col == 2) event_user(2)
	    rot= direction
	}
	if(active == 4) {
	    rspeed= speed
	    rdir= direction
	    rot+= ramt
	    if(ramt > 0) ramt-= 2
	    else  {
	        ramt= 0
	        move_towards_point(obj_mainchara.x + 7 + gax, obj_mainchara.y + 15, 0.1)
	        idealrot= direction
	        rot%= 360
	        if(rot - idealrot > 12) rot-= 4
	        if(rot - idealrot > 6) rot-= 2
	        if(rot - idealrot > 3) rot--
	        if(rot - idealrot < -3) rot++
	        if(rot - idealrot < -6) rot+= 2
	        if(rot - idealrot < -12) rot+= 4
	    }
	    speed= rspeed
	    direction= rdir
	}
	if(active == 0) {
	    modulate.a-= 0.05
	    if(modulate.a < 0.1) active= 2
	}
	if(y > get_viewport_rect().size.y) active= 0
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
