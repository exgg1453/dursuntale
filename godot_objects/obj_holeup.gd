# Auto-converted from GameMaker: obj_holeup
extends Node2D

func _ready():
	$Alarm0.timeout.connect(_on_alarm_0_timeout)

func _gm_event_2_2():
	obj_mainchara.visible= 1
	obj_mainchara.velocity.y= 0
	GS.interact= 0
	GS.phasing= 0
	obj_solidparent.solid= 1

func _on_destroy():
	GS.facing= 0
	obj_mainchara.visible= 0
	obj_mainchara.velocity.y= -10
	obj_solidparent.solid= 0
	$Alarm2.start((41) / 30.0)

func _on_alarm_0_timeout():
	if(GS.phasing == 0 and GS.interact == 0) {
	    GS.interact= 4
	    GS.phasing= 1
	    $Alarm0.start((10) / 30.0)
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
