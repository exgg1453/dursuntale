# Auto-converted from GameMaker: obj_soundcombo
extends Node2D

func _ready():
	$Alarm0.start((1) / 30.0)
	$Alarm1.start((15) / 30.0)
	sound1= 110
	sound2= 109

func _gm_event_2_1():
	snd_play(sound2)
	instance_destroy()

func _on_destroy():
	snd_play(sound1)

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
