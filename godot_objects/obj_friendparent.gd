# Auto-converted from GameMaker: obj_friendparent
extends Node2D

func _ready():
	$Alarm0.timeout.connect(_on_alarm_0_timeout)

func _on_alarm_0_timeout():
	if(shock == 0) {
	    snd_play(51/* snd_damage */)
	    shk= instance_create(x, y, 1669/* obj_objshake */)
	    shk.obj= object_index
	    shock= 1
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
