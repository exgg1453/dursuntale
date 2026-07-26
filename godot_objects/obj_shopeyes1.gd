# Auto-converted from GameMaker: obj_shopeyes1
extends Node2D

func _ready():
	image_speed= 0
	$Alarm0.start((60 + random(20)) / 30.0)
	if(scr_murderlv() >= 7) instance_destroy()

func _on_destroy():
	image_speed= 0.5
	$Alarm0.start((30 + random(120)) / 30.0)

func _gm_event_7_7():
	frame= 0
	image_speed= 0

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
