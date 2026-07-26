# Auto-converted from GameMaker: obj_rotspeargen
extends Node2D

func _ready():
	$Alarm0.start((1) / 30.0)
	active= 0

func _on_destroy():
	if(type == 0) {
	    curang= 0
	    rotspeed= 8
	    rotmin= 2
	    num= 7
	    rate= 20
	    rr= 220
	}
	if(type == 1) {
	    curang= 0
	    rotspeed= -8
	    rotmin= -2
	    num= 7
	    rate= 20
	    rr= 220
	}
	if(type == 2) {
	    curang= random(360)
	    rotspeed= 8
	    rotmin= 2
	    num= 8
	    rate= 20
	    rr= 230
	}
	if(type == 3) {
	    curang= random(360)
	    rotspeed= -8
	    rotmin= -2
	    num= 8
	    rate= 20
	    rr= 230
	}
	i= 0
	while(i < num) {
	    hx= x + 8 + lengthdir_x(rr, curang + i / num * 360)
	    hy= y + 8 + lengthdir_y(rr, curang + i / num * 360)
	    spear[i]= instance_create(hx, hy, 278/* obj_rotspear */)
	    spear[i].parent= id
	    with(spear[i])
	        rotation_degrees= point_direction(x, y, parent.x, parent.y)
	    i++
	}
	active= 1

func _process(delta: float):
	if(active == 1) {
	    if(rotspeed > rotmin) rotspeed-= 0.2
	    if(rotspeed < rotmin) rotspeed+= 0.2
	    i= 0
	    while(i < num) {
	        if(instance_exists(spear[i])) {
	            hx= x + lengthdir_x(rr, curang + i / num * 360)
	            hy= y + lengthdir_y(rr, curang + i / num * 360)
	            spear[i].x= hx
	            spear[i].y= hy
	            with(spear[i])
	                rotation_degrees= point_direction(x, y, parent.x, parent.y)
	        }
	        if(rr < 8) {
	            with(spear[i]) deactivate= 1
	        }
	        i++
	    }
	    if(rr < 8) {
	        rr++
	        rotspeed*= 0.8
	    }
	    if(rr < -20) instance_destroy()
	    rr-= 4
	    curang+= rotspeed
	}
	if(GS.turntimer < 1) instance_destroy()

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
