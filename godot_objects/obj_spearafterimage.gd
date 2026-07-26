# Auto-converted from GameMaker: obj_spearafterimage
extends Node2D

func _ready():
	color= 255
	alpha= 0.8
	originx= x
	originy= y
	outx= x
	outy= y
	outx2= x
	outy2= y

func _on_outside_room():
	draw_set_color(color)
	draw_set_alpha(alpha)
	draw_triangle(originx, originy, outx, outy, outx2, outy2, 0)
	draw_set_alpha(1)
	alpha-= 0.16
	if(alpha < 0.13) instance_destroy()

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
