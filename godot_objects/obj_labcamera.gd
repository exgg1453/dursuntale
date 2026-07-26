# Auto-converted from GameMaker: obj_labcamera
extends Node2D

func _ready():
	drawnlab= 0
	altglow= 0
	not_allowed= 0
	fps_counter= 0
	if(GS.osflavor != 1) {
	    emer= scr_marker(x - 1, y - 1, 986)
	    emer.image_speed= 0.5
	    emer.z_index= 198
	    instance_destroy()
	    exit
	} else  exit

func _gm_event_1_0():
	if(drawnlab == 1 and sprite_exists(lab)) sprite_delete(lab)

func _process_begin(delta: float):
	if(drawnlab == 1 and GS.entrance != 3) sprite_delete(lab)
	charax= (obj_mainchara.x - view_xview[0]) * 2
	charay= obj_mainchara.y * 2
	lab= sprite_create_from_screen_x(charax - 10, charay - 5, 60, 40, 0, 0, 0, 0)
	sprite_index= lab
	scale.x= 0.25
	scale.y= 0.25
	drawnlab= 1
	if(fps <= 21) fps_counter++
	else  fps_counter= 0
	if(fps_counter >= 90) {
	    not_allowed= 1
	    emer= scr_marker(x - 1, y - 1, 986)
	    emer.image_speed= 0.5
	    emer.z_index= 198
	    instance_destroy()
	    exit
	} else  exit

func _gm_event_7_5():
	if(drawnlab == 1 and sprite_exists(lab)) {
	    sprite_delete(lab)
	    drawnlab= 0
	}

func _on_outside_room():
	if(drawnlab == 1 and GS.entrance != 3)
	    draw_sprite(sprite_index, frame, x, y)
	draw_set_color(16776960)
	if(altglow == 0) altglow= 1
	else  altglow= 0
	if(altglow == 0) draw_set_alpha(0.1)
	else  draw_set_alpha(0.3)
	draw_rectangle(x, y, x + 59, y + 39, 0)
	draw_set_alpha(1)
	draw_sprite(1825/* spr_bigmonitor */, 0, x, y)

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
