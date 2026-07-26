# Auto-converted from GameMaker: obj_doodleball
extends Node2D

func _ready():
	num= 8
	$Alarm0.start((1) / 30.0)
	active= 0
	r= 10
	maxr= 110
	siner= random(360)
	$Alarm2.start((12) / 30.0)

func _gm_event_1_0():
	if(active == 1) {
	    i= 0
	    while(i < num) {
	        if(instance_exists(child[i])) {
	            with(child[i]) instance_destroy()
	        }
	        i++
	    }
	}

func _gm_event_2_2():
	move_towards_point(obj_heart.x + 8, obj_heart.y + 8, 8)

func _on_destroy():
	i= 0
	while(i < num) {
	    child[i]= instance_create(x, y, 455/* obj_doodlebullet */)
	    i++
	}
	active= 1

func _process(delta: float):
	if(active == 1) {
	    siner++
	    if(r < maxr) r+= 10
	    i= 0
	    while(i < num) {
	        if(instance_exists(child[i])) {
	            child[i].x= x + lengthdir_x(r, i / num * 360 + siner * 2)
	            child[i].y= y + lengthdir_y(r, i / num * 360 + siner * 2)
	        }
	        i++
	    }
	}
	if(x > 800) instance_destroy()
	if(x < -200) instance_destroy()
	if(y > 700) instance_destroy()
	if(y < -200) instance_destroy()
	if(speed > 5) speed--

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
