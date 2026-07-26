# Auto-converted from GameMaker: obj_undynebody2
extends Node2D

func _ready():
	siner= 0
	face= 0
	noanim= 0
	sine= 0
	tr= 0
	off= 0
	spearalpha= 1
	pause= 0
	bidoof= 0

func _on_outside_room():
	if(pause == 1 and noanim == 0) {
	    siner= 0
	    x= parent.x
	}
	if(noanim == 1) {
	    siner++
	    draw_sprite_ext(282/* spr_undyneb_hair */, siner / 5, x - 60, y - 60 + goof / 3, 2, 2, 0, 16777215, 1)
	    draw_sprite_ext(292/* spr_undyneb_noanim */, 0, x - 4, y + 10, 2, 2, 0, 16777215, 1)
	    draw_sprite_ext(284/* spr_undyneb_face2 */, GS.faceemotion, x, 6 + y - 50, 2, 2, 0, 16777215, 1)
	}
	if(noanim == 0) {
	    if(sine == 0) siner++
	    goof= sin(siner / 5) * 10
	    doof= cos(siner / 4) * 10
	    draw_sprite_ext(282/* spr_undyneb_hair */, siner / 5, x - 60, y - 10 + goof / 2, 2, 2, 0, 16777215, 1)
	    draw_sprite_ext(294/* spr_undyneb2_lowerbody */, 8, x + 32, y + 102 + 70, 2, 2 - goof / 60, 0, 16777215, 1)
	    if(off == 0) {
	        draw_sprite_ext(298/* spr_undyneb2_armr */, 0, x + 44, y + 60 + goof / 1.5, 2, 2, doof / 4 + 10, 16777215, 1)
	        draw_sprite_ext(297/* spr_undyneb2_arml */, 0, x + 22, y + 60 + goof / 1.5, 2, 2, doof / 4, 16777215, 1)
	    }
	    if(off == 1) {
	        draw_sprite_ext(298/* spr_undyneb2_armr */, 1, x + 44, y + 60 + goof / 1.5, 2, 2, doof / 4 + 20, 16777215, 1)
	        draw_sprite_ext(297/* spr_undyneb2_arml */, 1, x + 22, y + 60 + goof / 1.5, 2, 2, doof / 4 - 10, 16777215, 1)
	    }
	    draw_sprite_ext(295/* spr_undyneb2_upperbody */, 8, x + 20, y + 62 + 48 + goof / 3, 2, 2 - goof / 50, 0, 16777215, 1)
	    draw_sprite_ext(284/* spr_undyneb_face2 */, GS.faceemotion, x + doof / 4, 6 + y + goof / 1.5, 2, 2, 0, 16777215, 1)
	    if(off == 0)
	        draw_sprite_ext(296/* spr_undyneb2_spear */, 0, x + 64, y + 100 + goof / 1.5, 2, 2, doof / 4 + 10, 16777215, 1)
	    if(off == 1) {
	        bidoof--
	        sine= 1
	        spearalpha-= 0.03
	        draw_sprite_ext(296/* spr_undyneb2_spear */, 1, x + 64, y + 100 + goof / 1.5 - bidoof * 2, 2, 2, doof / 4 + 10 + bidoof, 16777215, spearalpha)
	        if(spearalpha < -0.2) noanim= 1
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
