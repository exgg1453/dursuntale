# Auto-converted from GameMaker: obj_radialfakegenx
extends Node2D

func _ready():
	direction= 0
	speed= 12
	$Alarm0.start((61) / 30.0)

func _on_destroy():
	queue_free()

func _process(delta: float):
	direction+= 12
	instance_create(x, y, 610/* obj_fakepellet */)

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
