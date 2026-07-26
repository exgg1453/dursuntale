# Auto-converted from GameMaker: obj_fadebar
extends Node2D

func _ready():
	fadespeed= 0.1
	x+= floor(sprite_width / 2)
	y+= floor(sprite_height / 2)
	image_speed= 0

func _process(delta: float):
	modulate.a-= fadespeed
	if(modulate.a < 0 + fadespeed) instance_destroy()
	scale.x+= 0.1
	scale.y+= 0.1

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
