# Auto-converted from GameMaker: obj_specialdrophole
# GM parent: obj_superdrophole
extends Node2D

func _process(delta: float):
	if(GS.plot >= 63) {
	    instance_create(x, y, 1370/* obj_iceevent */)
	    if(not instance_exists(1376/* obj_fakebridge */))
	        instance_create(x + 3, y, 1376/* obj_fakebridge */)
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
