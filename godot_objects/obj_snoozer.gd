# Auto-converted from GameMaker: obj_snoozer
extends Node2D

func _ready():
	$Alarm0.start((10) / 30.0)
	snooze= 0

func _gm_event_2_1():
	snooze++
	zz[snooze]= instance_create(x, y, 1293/* obj_zzz */)
	if(snooze > 1)
	    zz[snooze].velocity.x= zz[snooze - 1].velocity.x
	if(snooze < 3) $Alarm1.start((20) / 30.0)

func _on_destroy():
	$Alarm1.start((1) / 30.0)
	$Alarm0.start((100) / 30.0)
	snooze= 0
	if(room == 72) $Alarm0.start((150) / 30.0)

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
