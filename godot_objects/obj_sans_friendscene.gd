# Auto-converted from GameMaker: obj_sans_friendscene
# GM parent: obj_friendparent
extends Node2D

func _ready():
	face= 0
	scale.x= 2
	scale.y= 2
	shock= 0
	pause= 0

func _on_outside_room():
	draw_sprite_ext(sprite_index, frame, x, y, scale.x, scale.y, rotation_degrees, image_blend, modulate.a)
	if(shock == 0)
	    draw_sprite_ext(2305/* spr_sans_bface */, face, x + 24, y - 46, scale.x, scale.y, rotation_degrees, image_blend, modulate.a)
	if(shock == 1)
	    draw_sprite_ext(2323/* spr_sanswrapface */, 0, x + 24, y - 46, scale.x, scale.y, rotation_degrees, image_blend, modulate.a)

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
