# Auto-converted from GameMaker: obj_blockbullet2
# GM parent: obj_blockbullet
extends Node2D

func _ready():
	down= 0
	if(instance_exists(264/* obj_greenspeargen */))
	    rating= obj_greenspeargen.rating
	else  rating= 10
	image_speed= 0
	countdown= instance_number(object_index)
	if(countdown <= 1) frame= 1
	part= 0
	site= choose(0, 1, 2, 3)
	$Alarm0.start((1) / 30.0)
	active= 0
	speedmod= 1
	alphoid= 0
	modulate.a= 0
	object0= 263
	dmg= 7

func _on_destroy():
	if(site == 0) truesite= 1
	if(site == 1) truesite= 0
	if(site == 2) truesite= 3
	if(site == 3) truesite= 2
	frame= truesite
	if(site == 0) {
	    x= obj_spearblocker.x - 300
	    y= obj_spearblocker.y
	}
	if(site == 1) {
	    x= object0.x + 300
	    y= object0.y
	}
	if(site == 2) {
	    x= object0.x
	    y= object0.y + 300
	}
	if(site == 3) {
	    x= object0.x
	    y= object0.y - 300
	}
	move_towards_point(object0.x, object0.y, 8 * speedmod)
	active= 1

func _process(delta: float):
	if(active == 1) {
	    if(site == 0 and x > object0.x - 80 and part == 0)
	        part= 1
	    if(site == 1 and x < object0.x + 80 and part == 0)
	        part= 1
	    if(site == 2 and y < object0.y + 80 and part == 0)
	        part= 1
	    if(site == 3 and y > object0.y - 80 and part == 0)
	        part= 1
	    rater= 10
	    r2= 20
	    if(part == 1) {
	        siner= 0
	        part= 2
	        speed= 0
	        remx= x
	        remy= y
	        xrate= 0
	        if(rating > 8) xrate= rating - 8
	        totalx= 145 + xrate * 8
	    }
	    if(down == 1) {
	        countdown--
	        down= 0
	    }
	    if(part == 2) {
	        siner++
	        if(site == 0) {
	            x= remx + sin(siner * 3.14159265358979 / r2) * totalx
	            y= remy - sin(siner * 3.14159265358979 / rater) * 100
	            if(siner == rater) {
	                part= 3
	                velocity.x= -8 * speedmod
	            }
	        }
	        if(site == 1) {
	            x= remx - sin(siner * 3.14159265358979 / r2) * totalx
	            y= remy - sin(siner * 3.14159265358979 / rater) * 100
	            if(siner == rater) {
	                part= 3
	                velocity.x= 8 * speedmod
	            }
	        }
	        if(site == 2) {
	            y= remy - sin(siner * 3.14159265358979 / r2) * totalx
	            x= remx - sin(siner * 3.14159265358979 / rater) * 100
	            if(siner == rater) {
	                part= 3
	                velocity.y= 8 * speedmod
	            }
	        }
	        if(site == 3) {
	            y= remy + sin(siner * 3.14159265358979 / r2) * totalx
	            x= remx + sin(siner * 3.14159265358979 / rater) * 100
	            if(siner == rater) {
	                part= 3
	                velocity.y= -8 * speedmod
	            }
	        }
	    }
	}
	if(alphoid < 1) alphoid+= 0.2
	modulate.a= alphoid

func _on_outside_room():
	draw_sprite_ext(138/* spr_bullet_testx_arrow */, frame, x, y, 1, 1, 0, 16777215, modulate.a)

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
