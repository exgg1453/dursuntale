# Auto-converted from GameMaker: obj_6glove_boss
# GM parent: obj_6parent
extends Node2D

func _ready():
	maxnum= 7
	angspeed= 3
	ourang= 0
	radius= 90
	radiusspeed= 0
	siner= 0
	slower= 0
	spec= 0
	i= 0
	while(i < maxnum) {
	    glove[i]= instance_create(x, y, 1615/* obj_6glove_part */)
	    gloveang[i]= i * 360 / maxnum
	    glove[i].ang= gloveang[i]
	    glove[i].x= x + lengthdir_x(radius, gloveang[i] + ourang)
	    glove[i].y= y + lengthdir_y(radius, gloveang[i] + ourang)
	    glove[i].rotation_degrees= gloveang[i] + ourang
	    i++
	}
	velocity.y= 2.5

func _gm_event_1_0():
	i= 0
	while(i < maxnum) {
	    if(instance_exists(glove[i])) {
	        with(glove[i]) instance_destroy()
	    }
	    i++
	}

func _process(delta: float):
	angspeed= 1.1 + sin(siner / 6) * 0.5
	radius+= sin(siner / 12) * 3
	siner++
	i= 0
	while(i < maxnum) {
	    if(instance_exists(glove[i])) {
	        gloveang[i]+= angspeed
	        glove[i].x= x + lengthdir_x(radius, gloveang[i] + ourang)
	        glove[i].y= y + lengthdir_y(radius, gloveang[i] + ourang)
	        glove[i].rotation_degrees= gloveang[i] + ourang
	    }
	    i++
	}
	if(x < 0) velocity.x= -velocity.x
	if(x > get_viewport_rect().size.x) velocity.x= -velocity.x
	if(slower == 1) {
	    if(speed > 0) speed-= 0.05
	    else  speed= 0
	}
	if(y > 1000 and spec == 0) instance_destroy()
	if(y > get_viewport_rect().size.y and spec == 1 and velocity.y > 0)
	    obj_6glove_boss.velocity.y= -abs(velocity.y)
	if(y < 0 and spec == 1 and velocity.y < 0)
	    obj_6glove_boss.velocity.y= abs(velocity.y)

func _gm_event_7_16():
	with(glove[4]) instance_destroy()
	glove[4]= instance_create(x, y, 1616/* obj_6glove_act */)
	gloveang[4]= 1440 / maxnum
	glove[4].ang= gloveang[4]
	glove[4].x= x + lengthdir_x(radius, gloveang[4] + ourang)
	glove[4].y= y + lengthdir_y(radius, gloveang[4] + ourang)
	glove[4].rotation_degrees= gloveang[4] + ourang
	spec= 1

func _gm_event_7_15():
	slower= 1

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
