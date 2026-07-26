# Auto-converted from GameMaker: obj_creeptree1
extends Node2D

func _process_end(delta: float):
	if(instance_exists(1570/* obj_mainchara */)) {
	    xdiff= xcurrent - obj_mainchara.x
	    x+= xdiff * 1.25
	}

func _process_begin(delta: float):
	if(instance_exists(1570/* obj_mainchara */))
	    xcurrent= obj_mainchara.x

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
