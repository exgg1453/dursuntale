# Auto-converted from GameMaker: obj_failuredog
extends Node2D

func _process(delta: float):
	if(fall == 1) {
	    gravity_direction= 90
	    velocity.y+= friction + 0.3
	    rotation_degrees-= speed * 2
	    if(y > fally) {
	        velocity.x= 6 - random(12)
	        velocity.y= -velocity.y
	        fall= 2
	    }
	}
	if(fall == 2) {
	    velocity.y+= friction + 0.1
	    rotation_degrees-= speed * 4
	    if(y > fally + 7) fall= 3
	}
	if(fall == 3) {
	    velocity.y= 0
	    modulate.a-= 0.03
	    if(modulate.a < 0.06) instance_destroy()
	}
	if(fall == 6) {
	    gravity_direction= 180
	    velocity.y+= friction + 0.3
	    rotation_degrees+= speed * 2
	    if(y > fally) {
	        velocity.x= 4 + random(3) * choose(-1, 1)
	        velocity.y= -velocity.y
	        fall= 2
	    }
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
