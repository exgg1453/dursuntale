# Auto-converted from GameMaker: obj_regstar_blt
# GM parent: obj_asbulletparent
extends Node2D

func _ready():
	aa= 4
	h_mode= 1

func _process(delta: float):
	rotation_degrees+= aa
	if(h_mode == 1) direction+= 1.5

func _on_alarm_0_timeout():
	event_user(7)

func _gm_event_7_0():
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
