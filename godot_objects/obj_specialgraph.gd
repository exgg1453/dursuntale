# Auto-converted from GameMaker: obj_specialgraph
# GM parent: obj_graphparent
extends Node2D

func _ready():
	die= 0
	siner= 0

func _on_outside_room():
	draw_rectangle_color(x, y, x + 100, y + 20, 255, 65535, 32768, 255, 0)
	draw_set_color(16777215)
	draw_rectangle(x - 2, y - 2, x + 102, y + 22, 1)
	draw_set_font(1)
	draw_text(x - 10, y - 40, "REEL IT IN!")
	draw_set_color(0)
	draw_rectangle(x + 100, y, x + 60 - sin(siner / 10) * 40, y + 20, 0)
	siner++

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
