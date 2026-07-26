# Auto-converted from GameMaker: obj_crimegraph
# GM parent: obj_graphparent
extends Node2D

func _ready():
	die= 0

func _on_outside_room():
	draw_set_color(16777215)
	draw_rectangle(x - 2, y - 2, x + sprite_width * 4 + 2, y + sprite_width * 4 + 2, 1)
	draw_sprite_ext(sprite_index, 0, x + sprite_width * 2, y + sprite_height * 2, 3.5 + random(0.5), 3.5 + random(0.5), 0, 16777215, 1)
	draw_set_font(1)
	draw_text(x - 80, y + 40, "CRIME")

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
