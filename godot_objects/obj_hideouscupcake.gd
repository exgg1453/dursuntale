# Auto-converted from GameMaker: obj_hideouscupcake
extends Node2D

func _ready():
	siner= 0
	siner2= 0
	image_speed= 0.125
	modulate.a= 0

func _on_outside_room():
	siner++
	siner2++
	if(modulate.a < 1) modulate.a+= 0.05
	x+= sin(siner2 / 6) * 1
	y+= sin(siner / 8) * 3
	draw_self_border_e()
	if(GS.turntimer < 2) instance_destroy()

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
