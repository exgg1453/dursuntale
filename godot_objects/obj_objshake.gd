# Auto-converted from GameMaker: obj_objshake
extends Node2D

func _ready():
	$Alarm0.start((1) / 30.0)
	$Alarm1.start((2) / 30.0)
	obj= object_index
	shx= 14
	shaketime= 2
	oo= 0

func _gm_event_2_1():
	if(oo == 0) oo= 1
	else  oo= 0
	if(oo == 0) obj.x= thisx - shx
	if(oo == 1) obj.x= thisx + shx
	shx--
	if(shx > 0) $Alarm1.start((shaketime) / 30.0)
	else  {
	    obj.x= thisx
	    instance_destroy()
	}

func _on_destroy():
	thisx= obj.x

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
