# Auto-converted from GameMaker: obj_mettatonb_body
extends Node2D

func _ready():
	scale.x= 2
	scale.y= 2
	lefter= -1
	i= 0
	while(i < 5) {
	    pspeed[i]= 0
	    i++
	}
	siner= 0
	arms= 319
	sineron= 1
	shaker= 0
	remx= x

func _gm_event_2_1():
	lefter= 5

func _on_destroy():
	lefter= 2

func _process(delta: float):
	rotation_degrees= pspeed[1] * 2
	if(lefter == 1 or lefter == 0) {
	    if(velocity.x > -20) velocity.x-= 3
	    else  velocity.x-= 0.4
	}
	if(lefter == 2) {
	    velocity.x+= 2
	    if(velocity.x > 1) {
	        velocity.x= 0
	        lefter= 3
	    }
	}
	if(lefter == 4) {
	    if(velocity.x < 20) velocity.x+= 4
	    else  velocity.x+= 0.5
	}
	if(lefter == 5) {
	    velocity.x-= 2
	    if(x < remx and velocity.x < 3) velocity.x= 3
	    if(velocity.x < -1 or x >= remx) {
	        x= remx
	        velocity.x= 0
	        lefter= 16
	    }
	}
	pspeed[0]= velocity.x
	i= 4
	while(i > 0) {
	    pspeed[i]= pspeed[i - 1]
	    i--
	}

func _gm_event_7_11():
	lefter= 4
	$Alarm1.start((9) / 30.0)

func _gm_event_7_10():
	lefter= 0
	$Alarm0.start((9) / 30.0)
	obj_heart.movement= 99

func _on_outside_room():
	sinvalue= 0
	if(velocity.x == 0) {
	    sinvalue+= sin(siner / 3) * 2
	    rotation_degrees+= sinvalue
	}
	draw_sprite_ext(sprite_index, frame, x + sinvalue + random(shaker * 2) - shaker, y + random(shaker * 2) - shaker, scale.x, scale.y, rotation_degrees, 16777215, 1)
	draw_sprite_ext(arms, siner / 6, x + sinvalue, y - sin(siner / 4) * 5, scale.x, scale.y, rotation_degrees, 16777215, 1)
	if(sineron == 1) siner++

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
