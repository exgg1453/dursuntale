# Auto-converted from GameMaker: obj_croissant
# GM parent: obj_spiderbullet
extends Node2D

func _process(delta: float):
	if(instance_exists(363/* obj_purpleheart */)) {
	    op= 363
	    if(side == 0) {
	        velocity.x-= 0.25
	        rotation_degrees+= 8
	    }
	    if(side == 1) {
	        velocity.x+= 0.25
	        rotation_degrees-= 8
	    }
	    if(velocity.x > 0 and x > op.xmid + op.xlen * 5)
	        instance_destroy()
	    if(velocity.x < 0 and x < op.xmid - op.xlen * 5)
	        instance_destroy()
	} else  instance_destroy()

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
