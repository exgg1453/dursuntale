# Auto-converted from GameMaker: obj_signspider
extends Node2D

func _ready():
	scale.x= 2
	scale.y= 2
	image_speed= 0.5
	velocity.x= -10
	con= 0
	signy= 0
	signimg= 0
	buffer= 15
	signno= 0

func _process(delta: float):
	if(x < 580 and con == 0) velocity.x++
	if(x < 580 and velocity.x == 0 and con == 0) con= 1

func _on_outside_room():
	draw_sprite_ext(sprite_index, frame, x, y, 2, 2, 0, 16777215, 1)
	if(con == 1) {
	    frame= 1
	    image_speed= 0
	    draw_sprite_ext(414/* spr_tinyspider_sign */, signimg, x, y, 2, 2, 0, 16777215, 1)
	    if(signimg >= 4) {
	        draw_set_color(16777215)
	        draw_set_font(2)
	        draw_text(x - 20, y - 100, "Up Next")
	        if(signno == 0 or signno == 1 or signno == 6 or signno == 10)
	            draw_sprite(405/* spr_spiderbullet1 */, 0, x, y - 70)
	        if(signno == 8) draw_sprite(409/* spr_croissantl */, 0, x, y - 70)
	        if(signno == 12) {
	            draw_sprite(409/* spr_croissantl */, 0, x - 15, y - 70)
	            draw_sprite(409/* spr_croissantl */, 0, x + 5, y - 70)
	        }
	        if(signno == 2 or signno == 13) {
	            draw_sprite(405/* spr_spiderbullet1 */, 0, x - 15, y - 70)
	            draw_sprite(405/* spr_spiderbullet1 */, 0, x + 15, y - 70)
	        }
	        if(signno == 11) {
	            draw_sprite(406/* spr_donutbullet */, 0, x - 15, y - 70)
	            draw_sprite(406/* spr_donutbullet */, 0, x + 15, y - 70)
	        }
	        if(signno == 3 or signno == 5 or signno == 7) {
	            draw_sprite(405/* spr_spiderbullet1 */, 0, x - 15, y - 70)
	            draw_sprite(406/* spr_donutbullet */, 0, x + 5, y - 70)
	        }
	        if(signno == 4 or signno == 9 or signno == 15)
	            draw_sprite(407/* spr_cupcakebullet */, 0, x, y - 70)
	        if(signno == 14) {
	            draw_sprite(405/* spr_spiderbullet1 */, 0, x - 25, y - 70)
	            draw_sprite(406/* spr_donutbullet */, 0, x, y - 70)
	            draw_sprite(409/* spr_croissantl */, 0, x + 25, y - 70)
	        }
	    }
	    if(signimg < 4) signimg+= 0.5
	}
	buffer--
	if((GS.myfight > 0 or GS.mnfight > 0) and con < 2 and buffer < 1)
	    con= 2
	if(con == 2) {
	    signimg-= 0.5
	    draw_sprite_ext(414/* spr_tinyspider_sign */, signimg, x, y, 2, 2, 0, 16777215, 1)
	    if(signimg < 1) con= 3
	}
	if(con == 3) {
	    image_speed= 0.5
	    if(velocity.x < 10) velocity.x++
	    if(x > 650) instance_destroy()
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
