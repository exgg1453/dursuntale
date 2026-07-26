# Auto-converted from GameMaker: obj_bgpipe
# GM parent: obj_floweybodyparent
extends Node2D

func _ready():
	frozen= 0
	siner= 0
	scr_floweybodysave()

func _on_outside_room():
	if(frozen == 0) siner++
	msin= sin(siner / 9) * 2
	ysin= cos(siner / 8) * 1
	growth= sin(siner / 7) * 0.012
	msin2= sin(siner / 10) * 1.5
	ysin2= cos(siner / 9) * 0.8
	growth2= sin(siner / 8) * 0.01
	msin3= sin(siner / 11) * 1
	ysin3= cos(siner / 10) * 0.5
	growth3= sin(siner / 9) * 0.005
	blend3= merge_color(image_blend, 0, 0.4)
	draw_sprite_ext(sprite_index, frame, x + (msin3 - 60) * scale.x, y + ysin3 - 20, growth3 + scale.x, 1, 0, blend3, 1)
	draw_sprite_ext(sprite_index, frame, x + (msin2 - 40) * scale.x, y + ysin2 - 10, growth2 + scale.x, 1, 0, blend3, 1)
	draw_sprite_ext(sprite_index, frame, x + msin * scale.x, y + ysin, growth + scale.x, 1, 0, image_blend, 1)

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
