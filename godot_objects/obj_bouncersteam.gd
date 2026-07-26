# Auto-converted from GameMaker: obj_bouncersteam
extends Node2D

func _ready():
	x+= 10
	y+= 10
	rotation_degrees= random(360)
	scale.x= 0.4
	scale.y= 0.4
	size= 0.4
	$Alarm0.start((0) / 30.0)
	direction= 80 + random(20)
	speed= 3
	friction= 0.1

func _process(delta: float):
	size+= 0.08
	scale.x= size
	scale.y= size
	modulate.a-= 0.07
	if(modulate.a < 0.1) instance_destroy()
	rotation_degrees+= 6

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
