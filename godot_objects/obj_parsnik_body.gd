# Auto-converted from GameMaker: obj_parsnik_body
extends Node2D

func _ready():
	siner= 0
	timer= 0
	pause= 0
	offset1= 0
	offset2= 0

func _on_outside_room():
	if(pause == 0) {
	    siner++
	    timer++
	    draw_sprite_ext(822/* spr_parsnik_headwrap */, 0, x + 14, y + 24 + sin(1.5 + siner / 5) * 2, 2, 2, 0, 16777215, 1)
	    draw_sprite_ext(823/* spr_parsnik_snake1 */, floor(siner / 6), x + 32, y + 52 + sin(siner / 5) * 1.5, 2, 2, sin(siner / 5) * 6, 16777215, 1)
	    draw_sprite_ext(827/* spr_parsnik_snake5 */, floor((siner + 8) / 6), x + 74, y + 52 + sin(2 + siner / 5) * 1.5, 2, 2, -sin(2 + siner / 5) * 6, 16777215, 1)
	    draw_sprite_ext(824/* spr_parsnik_snake2 */, floor((siner + 2) / 5.5), x + 38, y + 46 + sin(0.5 + siner / 5) * 1.5, 2, 2, sin(siner / 5) * 2, 16777215, 1)
	    draw_sprite_ext(826/* spr_parsnik_snake4 */, floor((siner + 6) / 5.5), x + 60, y + 46 + sin(1.5 + siner / 5) * 1.5, 2, 2, -sin(siner / 5) * 2, 16777215, 1)
	    draw_sprite_ext(825/* spr_parsnik_snake3 */, floor((siner + 4) / 5), x + 52, y + 50 + sin(1 + siner / 5) * 1.5, 2, 2, 0, 16777215, 1)
	    draw_sprite_ext(821/* spr_parsnik_head */, floor(siner / 12), x + 24, y + 46, 2, 2, 0, 16777215, 1)
	} else  {
	    siner= 0
	    timer= 0
	    draw_sprite_ext(820/* spr_parsnik_hurt */, 0, x, y, 1, 1, 0, 16777215, 1)
	}

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
