# Auto-converted from GameMaker: obj_coverup
extends Node2D

func _ready():
	scale.x= 100
	over= 0

func _gm_event_2_1():
	queue_free()

func _process(delta: float):
	scale.y++
	if(not instance_exists(191/* obj_whtpxlgrav */) and over == 0) {
	    $Alarm1.start((3) / 30.0)
	    over= 1
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
