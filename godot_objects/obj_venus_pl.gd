# Auto-converted from GameMaker: obj_venus_pl
# GM parent: obj_floweybullet_parent
extends Node2D

func _ready():
	modulate.a= 1
	con= 1
	image_speed= 0.25
	amt= 0
	snd_play(339/* mus_sfx_yowl */)

func _gm_event_1_0():
	caster_stop(137)
	with(boss) {
	    acon= 1
	    reach2= 31
	    acon2= 3
	}

func _gm_event_2_4():
	con++

func _gm_event_2_2():
	side= choose(0, 1, 2)
	if(sider == 0) {
	    if(side == 0) {
	        ff= instance_create(100 + random(400), 200, 1650/* obj_floweyfly */)
	        ff.parent= id
	        with(ff)
	            move_towards_point(parent.x + 65, parent.y + 115, 11)
	    }
	    if(side == 1) {
	        ff= instance_create(680, 200 + random(300), 1650/* obj_floweyfly */)
	        ff.parent= id
	        with(ff)
	            move_towards_point(parent.x + 65, parent.y + 115, 11)
	    }
	    if(side == 2) {
	        ff= instance_create(100 + random(700), 500, 1650/* obj_floweyfly */)
	        ff.parent= id
	        with(ff)
	            move_towards_point(parent.x + 65, parent.y + 115, 11)
	    }
	}
	if(sider == 1) {
	    if(side == 0) {
	        ff= instance_create(100 + random(400), 200, 1650/* obj_floweyfly */)
	        ff.parent= id
	        with(ff)
	            move_towards_point(parent.x - 65, parent.y + 115, 11)
	    }
	    if(side == 1) {
	        ff= instance_create(-30, 200 + random(300), 1650/* obj_floweyfly */)
	        ff.parent= id
	        with(ff)
	            move_towards_point(parent.x - 65, parent.y + 115, 11)
	    }
	    if(side == 2) {
	        ff= instance_create(-100 + random(660), 500, 1650/* obj_floweyfly */)
	        ff.parent= id
	        with(ff)
	            move_towards_point(parent.x - 65, parent.y + 115, 11)
	    }
	}
	amt++
	$Alarm2.start((2) / 30.0)
	if(amt > 35) {
	    $Alarm2.start((-1) / 30.0)
	    wait= 0
	    con= 5
	}

func _process(delta: float):
	if(con == 1) con= 2
	if(con == 2) {
	    image_speed= 0.25
	    con= 1.5
	    $Alarm4.start((8) / 30.0)
	    if(frame >= 2) con= 3
	}
	if(con == 2.5) {
	    caster_loop(137, 0.8, 0.8)
	    $Alarm2.start((1) / 30.0)
	    con= 4
	}
	if(con == 5 and not instance_exists(1650/* obj_floweyfly */)) {
	    caster_stop(137)
	    $Alarm4.start((8) / 30.0)
	    con= 6
	}
	if(con == 7) {
	    frame= 0
	    image_speed= 0
	    instance_destroy()
	}

func _gm_event_7_13():
	with(boss) {
	    if(reach2 < 29) reach2+= 0.5
	}

func _on_outside_room():
	draw_sprite_ext(sprite_index, frame, x, y, scale.x, scale.y, 0, 16777215, modulate.a)

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
