# Auto-converted from GameMaker: obj_frypan_star
extends Node2D

func _ready():
	friction= 0.34
	speed= 8
	ang= 12.25

func _process(delta: float):
	if(speed < 6) {
	    modulate.a-= 0.05
	    if(ang > 1) ang-= 0.5
	}
	rotation_degrees+= ang
	if(modulate.a < 0.05) instance_destroy()

func _gm_event_7_15():
	image_blend= merge_color(16777215, 65535, 0.5)

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
