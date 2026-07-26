# Auto-converted from GameMaker: obj_sans_z_battle
extends Node2D

func _ready():
	modulate.a= 1
	scale.x= 0.1
	scale.y= 0.1
	siner= 0
	velocity.y= -1
	gravity= -0.04

func _process(delta: float):
	velocity.x= 2
	siner++
	x+= sin(siner / 4)
	y+= cos(siner / 4)
	if(scale.x < 1) scale.x+= 0.04
	if(scale.y < 1) scale.y+= 0.04
	if(siner > 60) {
	    modulate.a-= 0.1
	    if(modulate.a < 0.1) instance_destroy()
	}

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
