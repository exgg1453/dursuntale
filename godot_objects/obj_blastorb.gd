# Auto-converted from GameMaker: obj_blastorb
extends Node2D

func _ready():
	scale.x= 1
	scale.y= 1
	modulate.a= 1
	timer= 0
	side= 0

func _process(delta: float):
	timer++
	scale.x++
	scale.y++
	if(timer > 7) modulate.a-= 0.2
	if(modulate.a < 0.2) instance_destroy()

func _gm_event_7_11():
	if(side == 0) x-= 160
	if(side == 1) x+= 160

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
