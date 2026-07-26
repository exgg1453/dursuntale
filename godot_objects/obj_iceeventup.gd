# Auto-converted from GameMaker: obj_iceeventup
# GM parent: obj_doorparent
extends Node2D

func _ready():
	velocity.xer= 0
	velocity.yer= 0
	iceme= 0
	scale.x= 1
	scale.y= 1

func _on_destroy():
	obj_mainchara.frame= 0
	obj_mainchara.velocity.y= 0
	obj_mainchara.velocity.x= 0
	GS.interact= 0

func _gm_event_7_19():
	GS.interact= 1
	obj_mainchara.image_speed= 0
	obj_mainchara.velocity.y= -5
	obj_iceeventup.$Alarm0.start((2) / 30.0)

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
