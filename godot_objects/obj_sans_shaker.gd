# Auto-converted from GameMaker: obj_sans_shaker
extends Node2D

func _ready():
	intensity= 10
	$Alarm0.start((1) / 30.0)
	self_d= 0
	// obj_sans_shaker
	with(512) {
	    self_d++
	    event_user(0)
	}
	self_d= 1
	view_xview[0]= 0
	view_yview[0]= 0

func _on_destroy():
	view_xview[0]= choose(-1, 1) * intensity
	view_yview[0]= choose(1, -1) * intensity
	intensity--
	if(intensity == 0) instance_destroy()
	$Alarm0.start((1) / 30.0)

func _gm_event_7_10():
	if(self_d >= 2) instance_destroy()

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
