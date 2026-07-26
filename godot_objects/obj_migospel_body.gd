# Auto-converted from GameMaker: obj_migospel_body
extends Node2D

func _ready():
	pause= 0
	siner= 0
	sad= 0
	timer= 0
	offset1= 0
	offset2= 0
	mouth_index= 0
	bodyy= 0
	timer_e= 0
	eyey= 0

func _on_outside_room():
	if(pause == 0) {
	    if(sad == 0) {
	        siner++
	        timer++
	        timer_e++
	        bodyy= floor(sin(siner / 6) * 2)
	    } else  {
	        timer= 0
	        timer_e= 0
	        bodyy= 0
	        eyey= -20
	        siner+= 0.2
	        mouth_index+= 0.25
	    }
	} else  {
	    siner= 0
	    eyey= 0
	    simer= 0
	    timer_e= 0
	    bodyy= 0
	    mouth_index= 0
	}
	draw_sprite_ext(818/* spr_migospel_wingA */, 0, x + sin(siner / 4) * 2, y + 6 + 52 + sin(siner / 4) * 2, 2, 2, 0, 16777215, modulate.a)
	draw_sprite_ext(818/* spr_migospel_wingA */, 0, x + 52 - sin(siner / 4) * 2, y + 6 + 52 + sin(siner / 4) * 2, -2, 2, 0, 16777215, modulate.a)
	draw_sprite_ext(819/* spr_migospel_wingB */, 0, x + sin(siner / 4) * 2, y + 16 + 56 - sin(siner / 4) * 2, 2, 2, 0, 16777215, modulate.a)
	draw_sprite_ext(819/* spr_migospel_wingB */, 0, x + 52 - sin(siner / 4) * 2, y + 16 + 56 - sin(siner / 4) * 2, -2, 2, 0, 16777215, modulate.a)
	draw_sprite_ext(814/* spr_migospel_leg */, 0, x, y + 100, 2, 2, 0, 16777215, modulate.a)
	draw_sprite_ext(814/* spr_migospel_leg */, 0, x + 50, y + 100, -2, 2, 0, 16777215, modulate.a)
	draw_sprite_ext(811/* spr_migospel_body */, 0, x, y + bodyy, 2, 2, 0, 16777215, modulate.a)
	if(pause == 0) {
	    if(sad == 0)
	        draw_sprite_ext(812/* spr_migospel_eye */, eyey, x + 6, floor(y + 50 + bodyy + eyey), 2, 2, 0, 16777215, modulate.a)
	    if(sad == 1)
	        draw_sprite_ext(812/* spr_migospel_eye */, mouth_index, x + 6, floor(y + 50 + bodyy + eyey), 2, 2, 0, 16777215, modulate.a)
	    if(sad == 0)
	        draw_sprite_ext(815/* spr_migospel_mouthA */, floor(mouth_index), x + 8, y + 66 + bodyy, 2, 2, 0, 16777215, modulate.a)
	    if(sad == 1)
	        draw_sprite_ext(817/* spr_migospel_mouthB */, 0, x + 8, y + 66 + bodyy, 2, 2, 0, 16777215, modulate.a)
	}
	if(pause == 1) {
	    draw_sprite_ext(813/* spr_migospel_eyeB */, eyey, x + 6, floor(y + 50 + bodyy + eyey), 2, 2, 0, 16777215, modulate.a)
	    draw_sprite_ext(816/* spr_migospel_mouthC */, 0, x + 8, y + 66 + bodyy, 2, 2, 0, 16777215, modulate.a)
	}
	if(timer >= 40 and timer <= 50)
	    mouth_index+= 0.5
	if(timer == 51) {
	    timer= 0
	    mouth_index= 0
	}
	if(sad == 0) {
	    if(timer_e > 90 and timer_e <= 110) eyey-= 0.8
	    if(timer_e > 150 and timer_e <= 170) eyey+= 0.8
	    if(timer_e == 180) timer_e= 0
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
