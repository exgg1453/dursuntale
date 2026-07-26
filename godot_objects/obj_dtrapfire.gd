# Auto-converted from GameMaker: obj_dtrapfire
extends Node2D

func _ready():
	image_speed= 0.3334
	y= get_viewport_rect().size.y
	velocity.y= -2
	$Alarm0.start((42) / 30.0)

func _gm_event_2_2():
	instance_destroy()

func _gm_event_2_1():
	velocity.y= 2
	$Alarm2.start((80) / 30.0)

func _on_destroy():
	velocity.y= 0

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
