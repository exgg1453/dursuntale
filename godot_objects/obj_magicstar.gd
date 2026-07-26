# Auto-converted from GameMaker: obj_magicstar
extends Node2D

func _ready():
	rotation_degrees= random(360)
	modulate.a= 1
	size= 0.1
	scale.x= size
	scale.y= size
	image_speed= 0.1

func _process(delta: float):
	if(size > 0.8) modulate.a-= 0.05
	size+= 0.15
	scale.x= size
	scale.y= size
	if(modulate.a < 0.1) instance_destroy()
	rotation_degrees+= 8

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
