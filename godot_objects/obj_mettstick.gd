# Auto-converted from GameMaker: obj_mettstick
extends Node2D

func _ready():
	velocity.y= 0
	rot= 0
	rotspeed= 0
	o= 0

func _process(delta: float):
	rotation_degrees+= rotspeed

func _on_alarm_0_timeout():
	o= -2
	event_user(1)

func _gm_event_7_11():
	xamt= o.x + 4 - x
	rotspeed+= floor(xamt / 6)
	with(o) instance_destroy()

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
