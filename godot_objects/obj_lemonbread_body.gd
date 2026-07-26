# Auto-converted from GameMaker: obj_lemonbread_body
extends Node2D

func _ready():
	counter= -90
	siner= 0
	image_speed= 0
	face_index= 0
	melting= 0
	melt_index= 0
	changed= 0
	pause= 0

func _gm_event_7_10():
	if(melting == 0) melting= 1
	if(melting == 3) melting= 4

func _on_outside_room():
	counter++
	siner++
	if(melting == 0) {
	    draw_sprite_ext(692/* spr_lemonbread_torso */, siner / 10, x - 12, y + 96, 2, 2, 0, 16777215, 1)
	    draw_sprite_ext(691/* spr_lemonbread_head */, face_index, x, y, 2, 2, 0, 16777215, 1)
	}
	if(counter > 100 and counter < 150) {
	    face_index+= 0.25
	    if(face_index >= 3) counter= 150
	}
	if(counter > 200 and counter < 230) {
	    changed= 1
	    face_index+= 0.5
	    if(face_index > 6) face_index--
	}
	if(counter == 230) face_index= 3
	if(counter > 260) {
	    face_index-= 0.25
	    if(face_index < 1) {
	        face_index= 0
	        counter= -90
	    }
	}
	if(melting == 1) {
	    melt_index= 0
	    melting= 2
	}
	if(melting == 2) {
	    melt_index+= 0.5
	    draw_sprite_ext(690/* spr_lemonbread_melt */, floor(melt_index), x - 16, y + 12, 2, 2, 0, 16777215, 1)
	    if(melt_index >= 9) melting= 3
	}
	if(melting == 4) {
	    melt_index-= 0.5
	    draw_sprite_ext(690/* spr_lemonbread_melt */, floor(melt_index), x - 16, y + 12, 2, 2, 0, 16777215, 1)
	    if(melt_index < 1) {
	        melting= 0
	        if(changed == 0) counter= 80
	        else  counter= -50
	        face_index= 0
	    }
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
