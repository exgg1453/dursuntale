# Auto-converted from GameMaker: obj_brokenpiece
extends Node2D

func _ready():
	siner= 0
	image_speed= 0
	modulate.a= 0.8

func _on_outside_room():
	siner++
	modulate.a-= 0.05
	draw_sprite_part_ext(sprite_index, frame, 0, 0, sprite_width / 2, sprite_height / 2, x - siner, y - siner, 1, 1, 16777215, modulate.a)
	draw_sprite_part_ext(sprite_index, frame, sprite_width / 2, 0, sprite_width / 2, sprite_height / 2, x + siner + sprite_width / 2, y - siner, 1, 1, 16777215, modulate.a)
	draw_sprite_part_ext(sprite_index, frame, 0, sprite_height / 2, sprite_width / 2, sprite_height / 2, x - siner, y + siner + sprite_height / 2, 1, 1, 16777215, modulate.a)
	draw_sprite_part_ext(sprite_index, frame, sprite_width / 2, sprite_height / 2, sprite_width / 2, sprite_height / 2, x + siner + sprite_width / 2, y + siner + sprite_height / 2, 1, 1, 16777215, modulate.a)
	if(modulate.a < 0.1) instance_destroy()

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
