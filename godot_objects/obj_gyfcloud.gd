# Auto-converted from GameMaker: obj_gyfcloud
extends Node2D

func _ready():
	friction= 0.15
	velocity.y= 3 + random(0.5)
	velocity.x= 0.5 - random(1)
	scale.x= 0.1
	scale.y= 0.1
	modulate.a= 0.7
	rotation_degrees= random(360)

func _process(delta: float):
	if(speed < 0.5) modulate.a-= 0.03
	if(modulate.a < 0.1) instance_destroy()
	scale.x+= 1 / (4 + scale.x * 8)
	scale.y+= 1 / (4 + scale.y * 8)
	rotation_degrees+= speed + 1

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
