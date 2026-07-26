# Auto-converted from GameMaker: obj_growshrink
extends Node2D

func _ready():
	$Alarm0.start(5 / 30.0)

func _gm_event_2_1():
	if(scale.x <= 1) $Alarm0.start((2) / 30.0)
	if(scale.x > 1) {
	    scale.x--
	    $Alarm1.start((2) / 30.0)
	}

func _on_destroy():
	if(scale.x >= 15) $Alarm1.start((2) / 30.0)
	if(scale.x < 15) {
	    scale.x++
	    $Alarm0.start((2) / 30.0)
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
