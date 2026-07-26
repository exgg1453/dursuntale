# Auto-converted from GameMaker: obj_floweyarm
# GM parent: obj_floweybodyparent
extends Node2D

func _ready():
	acon= 0
	acon2= 0
	siner= 0
	reach= 0
	reach2= 0
	reach3= 0
	made= 0
	siner= 0
	frozen= 0
	desperate= 1
	if(scale.x > 0 and instance_exists(1585/* obj_flowey_master */))
	    obj_flowey_master.rightarm= id
	if(scale.x < 0 and instance_exists(1585/* obj_flowey_master */))
	    obj_flowey_master.leftarm= id
	scr_floweybodysave()

func _gm_event_7_16():
	if(scale.x > 0 and instance_exists(1583/* obj_fx_bgen */))
	    obj_fx_bgen.rightarm= id
	if(scale.x < 0 and instance_exists(1583/* obj_fx_bgen */))
	    obj_fx_bgen.leftarm= id

func _gm_event_7_11():
	acon= 1
	reach2= 0
	reach3= 0
	reach= 0
	acon2= 0
	made= 0

func _on_outside_room():
	if(desperate == 0 and acon == 0) {
	    if(frozen == 0) siner+= 0.8
	    growth= 1 + cos(siner / 6) * 0.03
	    ssx= sin(siner / 3) * 4 * scale.x
	    ssy= cos(siner / 3) * 4
	    draw_sprite_ext(sprite_index, frame, x - ssx, y + ssy, scale.x, growth, 0, image_blend, 1)
	}
	if(desperate == 1 and acon == 0) {
	    if(frozen == 0) siner+= 1.2
	    growth= 1 + cos(siner / 6) * 0.03
	    ssx= sin(siner / 3) * 5 * scale.x
	    ssy= cos(siner / 3) * 8
	    draw_sprite_ext(sprite_index, frame, x - ssx, y + ssy + 2, scale.x, growth, 0, image_blend, 1)
	}
	xr= -scale.x
	if(acon == 2) {
	    draw_sprite_ext(2233/* spr_fa_seq_b */, reach, x, y, scale.x, scale.y, rotation_degrees, image_blend, modulate.a)
	    if(reach > 0) reach--
	    if(reach <= 0) {
	        acon= 0
	        reach2= 0
	        reach3= 0
	        reach= 0
	        acon2= 0
	        made= 0
	    }
	}
	if(acon == 1) {
	    if(acon2 == 1 or acon2 == 3) {
	        if(reach2 < 13) reach2+= 2
	        draw_sprite_ext(2232/* spr_fa_stemunder */, reach2, x + xr * 36, y + 195, scale.x, scale.y, rotation_degrees, image_blend, modulate.a)
	    }
	    draw_sprite_ext(2233/* spr_fa_seq_b */, reach, x, y, scale.x, scale.y, rotation_degrees, image_blend, modulate.a)
	    if(reach < 11) reach+= 2
	    if(reach == 12) reach= 11
	    else  {
	        if(acon2 == 0) acon2= 1
	    }
	    if(acon2 == 1) {
	        if(reach2 == 14) reach2= 13
	        if(reach2 == 13 and made == 0) {
	            made= 1
	            venu= instance_create(x - 135 * xr, y + 138, 1652/* obj_venus_pl */)
	            venu.boss= id
	            if(scale.x > 0) {
	                with(venu) {
	                    sider= 1
	                    scale.x= -1
	                }
	            }
	            if(scale.x < 0) {
	                with(venu) sider= 0
	            }
	        }
	    }
	    if(acon2 == 3) reach2++
	    if(reach2 >= 39) acon= 2
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
