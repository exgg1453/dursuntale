# Auto-converted from GameMaker: obj_runaway
extends Node2D

func _ready():
	stop= 0
	edge= 0
	vedge= 0
	hedge= 0
	movement= 1
	xmovement= 1
	active= 1
	mykid= instance_create(x, y, 1114/* obj_waterboard */)
	l= 42
	r= 234
	u= 116
	d= 274

func _on_destroy():
	movement= 1
	xmovement= 1

func _process(delta: float):
	if(instance_exists(1570/* obj_mainchara */)) {
	    if(movement == 1 and (obj_mainchara.x != obj_mainchara.xprevious or obj_mainchara.y != obj_mainchara.yprevious)) {
	        shouldir= -1
	        jim= distance_to_object(1570)
	        if(jim < 80) {
	            movement= 0
	            $Alarm0.start((15) / 30.0)
	            if(abs(x - obj_mainchara.x) >= abs(y - obj_mainchara.y)) {
	                velocity.y= 0
	                if(x > obj_mainchara.x) {
	                    velocity.x= 4
	                    x+= 4
	                    shoulddir= 0
	                } else  {
	                    velocity.x= -4
	                    x-= 4
	                    shoulddir= 2
	                }
	                hedge= 0
	            } else  {
	                velocity.x= 0
	                if(y > obj_mainchara.y) {
	                    velocity.y= 4
	                    y+= 4
	                    shoulddir= 3
	                } else  {
	                    velocity.y= -4
	                    y-= 4
	                    shoulddir= 1
	                }
	                vedge= 0
	            }
	        }
	    }
	    if(y < u and velocity.y < 0) {
	        velocity.y= 0
	        vedge= 1
	        y= u
	    }
	    if(y > d and velocity.y > 0) {
	        velocity.y= 0
	        vedge= 2
	        y= d
	    }
	    if(x > r and velocity.x > 0) {
	        velocity.x= 0
	        hedge= 2
	        x= r
	    }
	    if(x < l and velocity.x < 0) {
	        velocity.x= 0
	        hedge= 1
	        x= l
	    }
	    if((vedge > 0 or hedge > 0) and xmovement == 1 and (obj_mainchara.x != obj_mainchara.xprevious or obj_mainchara.y != obj_mainchara.yprevious)) {
	        velocity.y= 0
	        velocity.x= 0
	        if(vedge == 1 and hedge == 1) {
	            if(shoulddir == 2) velocity.y= 4
	            if(shoulddir == 1) velocity.x= 4
	            hedge= 0
	            vedge= 0
	        }
	        if(vedge == 2 and hedge == 2) {
	            if(shoulddir == 3) velocity.x= -4
	            if(shoulddir == 0) velocity.y= -4
	            hedge= 0
	            vedge= 0
	        }
	        if(vedge == 2 and hedge == 1) {
	            if(shoulddir == 2) velocity.y= -4
	            if(shoulddir == 3) velocity.x= 4
	            hedge= 0
	            vedge= 0
	        }
	        if(vedge == 1 and hedge == 2) {
	            if(shoulddir == 1) velocity.x= -4
	            if(shoulddir == 0) velocity.y= 4
	            hedge= 0
	            vedge= 0
	        }
	        if(hedge == 1 or hedge == 2) {
	            velocity.y= choose(4, -4)
	            hedge= 0
	        }
	        if(vedge == 1 or vedge == 2) {
	            velocity.x= choose(4, -4)
	            vedge= 0
	        }
	        movement= 0
	        xmovement= 0
	        $Alarm0.start((12) / 30.0)
	    }
	    mykid.x= x
	    mykid.y= y
	    if(mykid.using == 1) instance_destroy()
	}

func _on_alarm_0_timeout():
	with(mykid) myinteract= 1

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
