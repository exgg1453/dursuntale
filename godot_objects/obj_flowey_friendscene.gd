# Auto-converted from GameMaker: obj_flowey_friendscene
extends Node2D

func _ready():
	image_speed= 0.5
	type= 0
	con= 0
	drawface= 0
	face= 0
	scale.x= 2
	scale.y= 2
	li= 0
	laugh= 0
	spec= 0
	neut= 0

func _on_outside_room():
	if(laugh == 0) {
	    if(neut == 0)
	        draw_sprite_ext(sprite_index, frame, x, y, 2, 2, 0, 16777215, modulate.a)
	    if(neut == 1)
	        draw_sprite_ext(sprite_index, frame, x, y, 2, 2, 0, 16777215, modulate.a)
	    if(drawface == 1)
	        draw_sprite_ext(2307/* spr_floweyface_end */, GS.faceemotion, x, y, 2, 2, 0, 16777215, modulate.a)
	    if(con == 0 and frame >= 8) {
	        image_speed= 0
	        drawface= 1
	    }
	    if(con == 6) {
	        if(neut == 0) sprite_index= 623/* spr_flowey_riseanim */
	        if(neut == 1) sprite_index= 647/* spr_flowey_riseanim2 */
	        drawface= 0
	        image_speed= -0.5
	        if(frame < 1) {
	            if(spec == 0) {
	                y+= 80
	                x+= 180
	            }
	            if(spec == 1) x= 100
	            if(spec == 2) {
	                y= ystart + 40
	                x= xstart + 110
	            }
	            con= 0
	            image_speed= 0.5
	        }
	    }
	}
	if(laugh == 1) {
	    li++
	    draw_sprite_ext(178/* spr_floweylaugh */, floor(li / 2), x, y, 2, 2, 0, 16777215, modulate.a)
	}
	if(laugh == 2) {
	    li++
	    draw_sprite_ext(178/* spr_floweylaugh */, 0, x, y, 2, 2, 0, 16777215, modulate.a)
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
