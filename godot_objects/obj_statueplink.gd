# Auto-converted from GameMaker: obj_statueplink
extends Node2D

func _ready():
	direction= 60 + random(60)
	speed= 1 + random(2)
	gravity_direction= 270
	gravity= 0.2
	modulate.a= 1

func _process(delta: float):
	modulate.a-= 0.05
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
