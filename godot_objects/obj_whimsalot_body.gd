# Auto-converted from GameMaker: obj_whimsalot_body
extends Node2D

func _ready():
	siner= 0
	pause= 0

func _on_outside_room():
	siner++
	goof= sin(siner / 5)
	if(pause == 1) {
	    siner= 0
	    x= parent.x + 21
	}
	draw_sprite_ext(489/* spr_whimsalot_wing_r */, siner / 15, x + 60, y + 40 - goof * 2, 2, 2, sin(siner / 2.5) * 30 - 15, 16777215, 1)
	draw_sprite_ext(489/* spr_whimsalot_wing_r */, siner / 15, x + 14, y + 40 - goof * 2, -2, 2, -sin(siner / 2.5) * 30 + 15, 16777215, 1)
	draw_sprite_ext(486/* spr_whimsalot_body */, siner / 18, x, y + 50 + goof * 6, 2, 2, 0, 16777215, 1)
	if(pause == 0)
	    draw_sprite_ext(487/* spr_whimsalot_head */, siner / 10, x + 6, y + goof * 8, 2, 2, 0, 16777215, 1)
	if(pause == 1)
	    draw_sprite_ext(488/* spr_whimsalot_head_hurt */, siner / 10, x + 6, y + goof * 8, 2, 2, 0, 16777215, 1)

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
