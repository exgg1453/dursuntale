# Auto-converted from GameMaker: obj_golfhole
extends Node2D

func _process(delta: float):
	if(instance_exists(1017/* obj_rollsnow */)) {
	    if(distance_to_object(1017) < 8) {
	        if(obj_rollsnow.bbox_bottom < bbox_top)
	            obj_rollsnow.y+= 0.2
	        if(obj_rollsnow.bbox_top > bbox_bottom)
	            obj_rollsnow.y-= 0.2
	    }
	    if(distance_to_object(1017) < 8) {
	        if(obj_rollsnow.x < x + sprite_width / 2)
	            obj_rollsnow.x+= 0.2
	        if(obj_rollsnow.x > x + sprite_width / 2)
	            obj_rollsnow.x-= 0.2
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
