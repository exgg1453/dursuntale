# Auto-converted from GameMaker: obj_foodsound
extends Node2D

func _ready():
	$Alarm0.start((10) / 30.0)
	soundtype= 0
	snd_play(110/* snd_swallow */)

func _on_destroy():
	if(soundtype == 2) snd_play(107/* snd_spooky */)
	if(soundtype == 0) snd_play(109/* snd_power */)
	instance_destroy()

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
