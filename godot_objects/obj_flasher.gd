# Auto-converted from GameMaker: obj_flasher
extends Node2D

func _ready():
	x= 0
	y= 0
	modulate.a= 0
	amt= 1
	color= 16777215
	$Alarm0.start((2) / 30.0)
	fadespeed= 0.1
	active= 0

func _on_destroy():
	modulate.a= amt
	active= 1

func _process(delta: float):
	if(active == 1) {
	    modulate.a-= fadespeed
	    if(modulate.a < 0.02) instance_destroy()
	}

func _on_outside_room():
	draw_sprite_ext(sprite_index, frame, 0, 0, 99999, 99999, 0, color, modulate.a)

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
