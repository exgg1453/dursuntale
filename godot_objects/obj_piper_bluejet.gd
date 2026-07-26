# Auto-converted from GameMaker: obj_piper_bluejet
extends Node2D

func _ready():
	siner= 0
	timer= 0
	f_l= 0
	f_d= 0

func _on_outside_room():
	timer++
	draw_sprite(915/* spr_steamer_bottom */, 0, x, y)
	draw_sprite(916/* spr_steamer_top */, 0, x, y + f_l * 3)
	if(timer == 30) {
	    f_l= 0
	    f_d= 1
	}
	if(timer > 30 and timer < 50) {
	    f_l+= 0.2
	    if(f_l >= 1) timer= 50
	}
	if(timer >= 50 and timer < 70)
	    f_l= 1 - sin(timer * 1.5) * 0.1
	if(timer >= 70) {
	    f_l-= 0.2
	    if(f_l <= 0) {
	        f_l= 0
	        f_d= 0
	        timer= 0
	    }
	}
	if(f_d == 1)
	    draw_sprite_ext(903/* spr_bluejet */, 0, x + 7, y + 8 + f_l * 3, 0.5 + f_l / 2, f_l, 0, 16777215, f_l)

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
