# Auto-converted from GameMaker: obj_sidestalk
# GM parent: obj_floweybodyparent
extends Node2D

func _ready():
	siner= 0
	y-= 80
	if(x > 320) x-= 40
	if(x < 320) x+= 40
	image_speed= 3
	frozen= 0
	scr_floweybodysave()

func _on_outside_room():
	if(frozen == 0) siner++
	growth= 1 + cos(siner / 5) * 0.01
	ssx= sin(siner / 3) * 2 * scale.x
	ssy= cos(siner / 3) * 2
	if(frozen != 0) image_speed= 1
	if(frozen == 0) image_speed= 3
	draw_sprite_ext(sprite_index, frame, x - ssx, y + ssy, scale.x, growth, 0, image_blend, 1)

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
