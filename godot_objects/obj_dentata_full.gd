# Auto-converted from GameMaker: obj_dentata_full
extends Node2D

func _ready():
	siner= random(360)
	size= 1
	halfsies= 0
	ssx= sin(siner / 3) * 3 * scale.x
	ssy= cos(siner / 3) * 3
	if(y <= 130) halfsies= 1
	if(y >= 190) halfsies= 2
	maxer= 0
	size= maxer + sin(siner / 2) * 0.02

func _on_outside_room():
	dnty= sin(siner / 4) * 2 * size
	dntyx= cos(siner / 2) * 2 * size
	dnty2= sin(siner / 3) * 4 * size
	rt= cos(siner / 4) * 5
	ssx= sin(siner / 3) * 3 * scale.x
	ssy= cos(siner / 3) * 3
	if(halfsies == 0) {
	    draw_sprite_ext(2187/* spr_dentata_none */, 0, x + ssx, y + dnty + ssy, size, size, rt, 8421504, 1)
	    draw_sprite_ext(2185/* spr_dentata_tophalf */, 0, x - dntyx + ssx, y + dnty2 - 4 * size + ssy, size, size, rt, 16777215, 1)
	    draw_sprite_ext(2186/* spr_dentata_bottomhalf */, 0, x + dntyx, y - dnty2 + 4 * size, size, size, rt, 16777215, 1)
	}
	if(halfsies == 1) {
	    rt+= 90
	    draw_sprite_ext(2181/* spr_halfdentata_none */, 0, x + dnty + ssx, y + ssy, size, size, rt, 8421504, 1)
	    draw_sprite_ext(2184/* spr_halfdentata_top */, 0, x + dnty2 - 4 * size + ssx, y - dntyx + ssy, size, size, rt, 16777215, 1)
	    draw_sprite_ext(2183/* spr_halfdentata_bottom */, 0, x - dnty2 + 4 * size + ssx, y + dntyx + ssy, size, size, rt, 16777215, 1)
	}
	if(halfsies == 2) {
	    rt-= 90
	    draw_sprite_ext(2181/* spr_halfdentata_none */, 0, x + dnty + ssx, y + ssy, size, size, rt, 8421504, 1)
	    draw_sprite_ext(2184/* spr_halfdentata_top */, 0, x - dnty2 + 4 * size + ssx, y - dntyx + ssy, size, size, rt, 16777215, 1)
	    draw_sprite_ext(2183/* spr_halfdentata_bottom */, 0, x + dnty2 - 4 * size + ssx, y + dntyx + ssy, size, size, rt, 16777215, 1)
	}
	siner++
	if(maxer < 0.8) maxer+= 0.1
	size= maxer + sin(siner / 2) * 0.02

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
