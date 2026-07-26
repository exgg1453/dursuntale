# Auto-converted from GameMaker: obj_spinbulletgen_friendscene
extends Node2D

func _ready():
	$Alarm1.start((1) / 30.0)
	targety= y
	targetx= x
	radius= 80
	ang= 0
	i= 0
	spec= 0
	created= 0
	if(spec == 2) radius= 130
	amt= 0

func _gm_event_2_10():
	if(spec == 3 or spec == 5) event_user(1)
	if(spec == 4 or spec == 6) event_user(2)

func _gm_event_2_9():
	if(spec == 3 or spec == 5) {
	    bone= instance_create(x + 50, y - 50, 1664/* obj_friendprotector */)
	    bone.sprite_index= 2276/* spr_bonesaver */
	    if(spec == 5) bone.sprite_index= 2278/* spr_firesaver */
	    instance_destroy()
	}
	if(spec == 4 or spec == 6) {
	    spear= instance_create(x - 70, y - 50, 1664/* obj_friendprotector */)
	    spear.sprite_index= 2277/* spr_spearsaver */
	    if(spec == 6) spear.sprite_index= 2279/* spr_litsaver */
	    instance_destroy()
	}

func _gm_event_2_3():
	sidebl[i]= instance_create(x - 250, y - 40 + i * 10, 1665/* obj_spinbullet_friendscene */)
	if(i < 8) $Alarm3.start((1) / 30.0)
	amt++
	i++
	$Alarm10.start((10) / 30.0)
	snd_play(92/* snd_chug */)

func _gm_event_2_2():
	sidebl[i]= instance_create(x + 250, y - 40 + i * 10, 1665/* obj_spinbullet_friendscene */)
	if(i < 8) $Alarm2.start((1) / 30.0)
	amt++
	i++
	$Alarm10.start((10) / 30.0)
	snd_play(92/* snd_chug */)

func _gm_event_2_1():
	ang= i * 18
	xx= lengthdir_x(radius, ang)
	yy= lengthdir_y(radius, ang)
	instance_create(xx + x, yy + y, 1665/* obj_spinbullet_friendscene */)
	snd_play(92/* snd_chug */)
	i++
	if(i < 20) {
	    $Alarm1.start((1) / 30.0)
	    if(spec == 2) $Alarm1.start((2) / 30.0)
	}

func _on_destroy():
	radius= 30
	ang= 0
	i= 0
	while(i < 20) {
	    ang= i * 18
	    xx= lengthdir_x(radius, ang)
	    yy= lengthdir_y(radius, ang)
	    fp= instance_create(xx + x, yy + y, 1664/* obj_friendprotector */)
	    fp.direction= ang
	    fp.speed= 0.01
	    fp.go= 1
	    i++
	}
	spec= 2

func _gm_event_7_12():
	i= 0
	while(i < amt) {
	    sidebl[i].velocity.x= 12
	    i++
	}
	$Alarm9.start((6) / 30.0)

func _gm_event_7_11():
	i= 0
	while(i < amt) {
	    sidebl[i].velocity.x= -12
	    i++
	}
	$Alarm9.start((6) / 30.0)

func _gm_event_7_10():
	obj_spinbullet_friendscene.targetx= targetx
	obj_spinbullet_friendscene.targety= targety
	if(spec == 0) {
	    // obj_spinbullet_friendscene
	    with(1665) move_towards_point(targetx, targety, 15)
	    instance_destroy()
	}
	if(spec == 2) {
	    // obj_spinbullet_friendscene
	    with(1665) move_towards_point(targetx, targety, 0.8)
	    $Alarm0.start((90) / 30.0)
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
