# Auto-converted from GameMaker: obj_spinbullet_huge_gen
extends Node2D

func _ready():
	centerx= x
	centery= y
	x= centerx
	y= centery
	side= choose(1, -1)
	strike= 0
	if(strike == 0) {
	    num= 0
	    direction= 0
	    add_dir= random(360)
	    maxnum= 10
	    trip= 1
	    radius= 60
	    counter= 0
	    spinbullet[0]= 999999
	}
	if(strike == 1) {
	    num= 0
	    direction= 0
	    add_dir= random(360)
	    maxnum= 46
	    trip= 1
	    radius= 62
	    counter= 0
	}
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

func _process(delta: float):
	if(counter == num * trip) {
	    xx= lengthdir_x(radius, add_dir + num / maxnum * 360 * side)
	    yy= lengthdir_y(radius, add_dir + num / maxnum * 360 * side)
	    spinbullet[num]= instance_create(centerx + xx, centery + yy, 1648/* obj_spinbullet_huge */)
	    num++
	}
	counter++
	if(counter > (maxnum - 1) * trip) {
	    snd_stop(141)
	    snd_play(141/* snd_instanoise */)
	    deactivate= 1
	    num= -99
	    counter= -50
	    i= 0
	    while(i < maxnum) {
	        if(instance_exists(spinbullet[i])) {
	            if(i == 0) spinbullet[i].king= 1
	            spinbullet[i].centerx= centerx
	            spinbullet[i].centery= centery
	        }
	        if(strike == 0) {
	            with(spinbullet[i]) $Alarm3.start((12) / 30.0)
	        }
	        if(strike == 1) {
	            with(spinbullet[i]) {
	                move_towards_point(centerx, centery, 12)
	                friction= 1
	            }
	        }
	        i++
	    }
	    if(strike == 0) instance_destroy()
	}
	if(counter == -44 and strike == 1) {
	    i= 0
	    while(i < maxnum) {
	        if(instance_exists(spinbullet[i])) {
	            with(spinbullet[i]) instance_destroy()
	        }
	        i++
	    }
	    instance_create(centerx, centery, 1644/* obj_chaosbomb */)
	    instance_destroy()
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
