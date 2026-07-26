# Auto-converted from GameMaker: obj_endogeny_body
extends Node2D

func _ready():
	shaker= 0
	moutvelocity.x= 0
	mouth= 0
	spared= 0
	pause= 0
	fader= 0

func _on_outside_room():
	xx= random(shaker) - random(shaker)
	yy= random(shaker) - random(shaker)
	if(spared == 0) {
	    draw_sprite_ext(715/* spr_endogeny */, 0, x + xx, y + yy, 2, 2, 0, 16777215, modulate.a)
	    draw_sprite_ext(717/* spr_endogeny_head */, floor(mouth), x + xx, y + yy, 2, 2, 0, 16777215, modulate.a)
	}
	if(spared == 1) {
	    draw_sprite_ext(716/* spr_endogeny_2 */, 0, x + xx, y + yy, 2, 2, 0, 16777215, modulate.a)
	    draw_sprite_ext(717/* spr_endogeny_head */, 0, x + xx, y + yy, 2, 2, 0, 16777215, modulate.a)
	}
	mouth+= moutvelocity.x
	if(spared == 1) {
	    moutvelocity.x= 0
	    shaker= 0
	}
	if(fader == 1 and modulate.a > 0)
	    modulate.a-= 0.02

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
