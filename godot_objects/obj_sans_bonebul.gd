# Auto-converted from GameMaker: obj_sans_bonebul
# GM parent: obj_sansbullet_parent
extends Node2D

func _ready():
	type= 0
	z_a= 0
	z_b= 0
	z_y= 0
	siner= 0
	velocity.x= 0
	innate_karma= 6

func _gm_event_7_20():
	width= 0
	le= 0
	rc_cut= 0
	rc_le= 0
	ww1= GS.idealborder[1] - x
	if(ww1 > 0) width= ww1
	ww2= x - GS.idealborder[0] + 5
	if(ww2 < 0) {
	    le= -ww2
	    width= 10 + ww2
	}
	if(width > 10) width= 10
	if(width < 9) {
	    rc_cut= 8 - width
	    if(rc_cut < 1) rc_cut= 0
	}
	if(le > 1) {
	    rc_le= le - 2
	    rc_cut= 0
	    if(rc_le > 8) rc_le= 0
	}

func _gm_event_7_12():
	if(type != 1) event_user(7)
	if(type == 1 and (abs(obj_heart.xprevious - obj_heart.x) > 0.01 or abs(obj_heart.yprevious - obj_heart.y) > 0.01))
	    event_user(7)

func _on_outside_room():
	siner++
	z_h= sin(siner * z_b) * z_a
	y= yinit + z_h
	if(type == 0 or type == 1) {
	    event_user(10)
	    if(width > 0) {
	        if(type == 0) image_blend= 16777215
	        if(type == 1) image_blend= 16754964
	        draw_sprite_part_ext(657, 0, le, 0, width, 6, x + le, y, 1, 1, image_blend, 1)
	        if(type == 0) draw_set_color(16777215)
	        if(type == 1) draw_set_color(16754964)
	        draw_rectangle(x + 2 + rc_le, y + 5, x + 8 - rc_cut, GS.idealborder[3] - 6, 0)
	        if(width > 0 and collision_rectangle(x + 2 + rc_le, y + 5, x + 8 - rc_cut, GS.idealborder[3] - 6, 743, 0, 1))
	            event_user(2)
	        draw_sprite_part_ext(659, 0, le, 0, width, 6, x + le, GS.idealborder[3] - 6, 1, 1, image_blend, 1)
	    }
	}
	if(type == 2) {
	    event_user(10)
	    if(width > 0) {
	        draw_sprite_part(657, 0, le, 0, width, 6, x + le, GS.idealborder[2] + 6)
	        draw_set_color(16777215)
	        draw_rectangle(x + 2 + rc_le, GS.idealborder[2] + 11, x + 8 - rc_cut, y, 0)
	        if(width > 0 and collision_rectangle(x + 2 + rc_le, GS.idealborder[2] + 11, x + 8 - rc_cut, y, 743, 0, 1))
	            event_user(2)
	        draw_sprite_part(659, 0, le, 0, width, 6, x + le, y)
	    }
	}
	if(x < 0 and velocity.x < 0) instance_destroy()
	if(x > 640 and velocity.x > 0) instance_destroy()

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
