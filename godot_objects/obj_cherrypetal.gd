# Auto-converted from GameMaker: obj_cherrypetal
extends Node2D

func _ready():
	gravity_direction= 330 + random(20)
	gravity= 0.03
	velocity.y= 0.1 + random(0.8)
	if(x > 400) instance_destroy()
	rotation_degrees= random(360)
	angspeed= 3 + random(6)

func _process(delta: float):
	rotation_degrees+= angspeed

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
