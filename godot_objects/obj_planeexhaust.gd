# Auto-converted from GameMaker: obj_planeexhaust
extends Node2D

func _ready():
	size= 2
	siner= 0
	alpha= 0
	image_speed= 0.2
	velocity.x= -2 - random(1)
	gravity_direction= 90
	gravity= 0.2
	alpha= 1
	rotation_degrees= random(360)

func _process(delta: float):
	rotation_degrees++
	size+= 0.05
	scale.x= size
	scale.y= size
	siner++
	x+= sin(siner / 2)
	y+= cos(siner / 2)
	if(siner > 7) modulate.a-= 0.04
	if(modulate.a < 0.05) instance_destroy()

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
