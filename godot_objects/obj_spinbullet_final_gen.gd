# Auto-converted from GameMaker: obj_spinbullet_final_gen
extends Node2D

func _ready():
	centerx= x
	centery= y
	x= centerx
	y= centery
	side= choose(1, -1)
	num= 0
	direction= 0
	add_dir= random(360)
	maxnum= 20
	trip= 1
	radius= 50
	counter= 0
	spinbullet[0]= 999999
	i= 0
	while(i <= maxnum) {
	    spinbullet[i]= 847873482423472384
	    i++
	}
	if(centery + radius > get_viewport_rect().size.y) {
	    centery-= centery + radius - get_viewport_rect().size.y
	    y= centery
	    add_dir= 20 + random(140)
	}
	memx= 0
	memy= 0
	if(instance_exists(1581/* obj_vsflowey_heart */)) {
	    memx= obj_vsflowey_heart.x
	    memy= obj_vsflowey_heart.y
	}

func _gm_event_2_1():
	obj_spinbullet_huge.centerx= centerx
	obj_spinbullet_huge.centery= centery
	// obj_spinbullet_huge
	with(1648) {
	    sprite_index= 2252/* spr_spinbullet_cheat */
	    move_towards_point(centerx, centery, -1.2)
	    gravity_direction= point_direction(x, y, centerx, centery)
	    gravity= 0.015
	}

func _process(delta: float):
	repeat(1)  {
	    if(counter == num * trip and num < maxnum) {
	        xx= lengthdir_x(radius, add_dir + num / maxnum * 360 * side)
	        yy= lengthdir_y(radius, add_dir + num / maxnum * 360 * side)
	        spinbullet[num]= instance_create(centerx + xx, centery + yy, 1648/* obj_spinbullet_huge */)
	        spinbullet[num].trick= 2
	        num++
	    }
	    counter++
	}

func _gm_event_7_11():
	snd_play(53/* snd_hurt1 */)
	obj_vsflowey_heart.x= memx
	obj_vsflowey_heart.y= memy
	obj_flowey_master.fileset= 6
	obj_flowey_master.loadtimer= 20
	obj_flowey_master.intent_hit++

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
