# Auto-converted from GameMaker: obj_afterimage_asriel
extends Node2D

func _ready():
	hue= -20

func _on_outside_room():
	modulate.a-= 0.02
	hue+= 9
	mycolor= make_color_hsv(hue, 255, 250)
	draw_sprite_ext(sprite_index, frame, x, y, 2, 2, 0, mycolor, modulate.a)
	if(modulate.a < 0.06) instance_destroy()

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
