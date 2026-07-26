# Auto-converted from GameMaker: obj_vines_flowey
# GM parent: obj_floweybodyparent
extends Node2D

func _ready():
	frozen= 0
	siner= 0
	gr= make_color_rgb(150, 150, 150)
	grgr= make_color_rgb(110, 110, 110)
	grgrgr= make_color_rgb(70, 70, 70)
	scr_floweybodysave()

func _on_outside_room():
	if(frozen == 0) siner++
	growth= 1 + sin(siner / 6) * 0.05
	growth2= 1 + cos(siner / 6) * 0.05
	growth3= 1 - sin(siner / 7) * 0.05
	ssx= sin(siner / 4) * 2 * scale.x
	ssx2= sin(siner / 5) * 1 * scale.x
	ssx3= cos(siner / 6) * 0.5 * scale.x
	draw_sprite_ext(2195/* spr_vines_flowey_3 */, frame, x - ssx3 + 20, y, scale.x, growth3, 0, image_blend, 1)
	draw_sprite_ext(2194/* spr_vines_flowey_2 */, frame, x - ssx2 - 20, y, scale.x, growth2, 0, image_blend, 1)
	draw_sprite_ext(2193/* spr_vines_flowey */, frame, x - ssx, y, scale.x, growth, 0, image_blend, 1)

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
