# Auto-converted from GameMaker: obj_reaperbird_body
extends Node2D

func _ready():
	counter= 0
	head_index= 0
	headsprite= 713
	biteon= 1
	torso_index= 0
	bodycounter= 0
	siner= 0
	stretchup= 0
	ystretch= 4
	pause= 0
	mstretch= 0

func _on_outside_room():
	counter++
	bodycounter++
	siner++
	if(counter > 60 and counter < 80) {
	    head_index+= 0.5
	    if(head_index >= 6) counter= 100
	}
	if(counter > 130 and counter < 160) {
	    head_index-= 0.5
	    if(head_index < 1) {
	        head_index= 0
	        counter= 160
	    }
	}
	if(counter > 200 and counter < 210) {
	    head_index= 0
	    headsprite= 712
	    counter= 210
	}
	if(counter > 210) {
	    head_index+= 0.5
	    if(head_index > 14) {
	        head_index= 0
	        counter= -30
	        headsprite= 713
	    }
	}
	if(bodycounter > 150) {
	    torso_index+= 0.2
	    if(torso_index > 7) {
	        bodycounter= 0
	        torso_index= 0
	    }
	}
	sx= sin(siner / 10) * 5
	sy= abs(cos(siner / 8) * 6)
	draw_sprite_ext(711/* spr_reaperbird_torso */, floor(torso_index), x + 14 + sx, y + 90 + sy - mstretch * 20, 2, ystretch, 0, 16777215, modulate.a)
	if(stretchup == 2) {
	    if(ystretch > 0) ystretch-= 0.1
	    else  ystretch= 0
	    if(mstretch < 2) mstretch+= 0.05
	    else  mstretch= 2
	}
	if(stretchup == 1) {
	    if(ystretch > 2) ystretch-= 0.2
	    else  ystretch= 2
	}
	if(stretchup == 0) {
	    if(ystretch < 4) ystretch+= 0.2
	    else  ystretch= 4
	}
	draw_sprite_ext(headsprite, floor(head_index), x, y, 2, 2 - mstretch, 0, 16777215, modulate.a)

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
