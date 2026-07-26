# Auto-converted from GameMaker: obj_inwaterspot
extends Node2D

func _ready():
	check= 0
	y-= 4
	active= 0

func _on_destroy():
	active= 1

func _process_end(delta: float):
	if(instance_exists(1570/* obj_mainchara */) and check == 1 and obj_mainchara.inwater == 1 and active == 1)
	    snd_play(106/* snd_noise */)
	check= 0

func _on_alarm_0_timeout():
	check= 0
	if(other.inwater == 0) {
	    other.inwater= 1
	    check= 1
	}

func _gm_event_7_4():
	$Alarm0.start((10) / 30.0)

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
