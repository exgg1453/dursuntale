# Auto-converted from GameMaker: obj_creditbullet
extends Node2D

func _ready():
	text= "test"
	active= 0
	aa= 0
	width= 0
	visible= 0
	$Alarm0.start((1) / 30.0)
	action= 0
	stretch= 0
	hitted= 0

func _on_destroy():
	visible= 1
	active= 1
	width= string_width(text)

func _process(delta: float):
	rotation_degrees+= aa
	if(y > 800 and velocity.y > 0) instance_destroy()
	if(x > 800 and velocity.x > 0) instance_destroy()
	if(y < -200 and velocity.y < 0) instance_destroy()
	if(x < -200 and velocity.x < 0) instance_destroy()
	if(action == 1) {
	    if(velocity.x < 0 and x < get_viewport_rect().size.x - width / 2 and speed > 0)
	        speed-= 0.5
	    if(velocity.x > 0 and x > 0 + width / 2 and speed > 0)
	        speed-= 0.5
	}
	if(action == 3) {
	    if(x < -50 and velocity.x < 0) x+= 710
	    if(x > get_viewport_rect().size.x + 50 and velocity.x > 0) x-= 710
	}

func _gm_event_7_11():
	if(hitted == 0) {
	    hitno= obj_creditsloader.hitno
	    obj_creditsloader.hitname[hitno]= text
	    obj_creditsloader.hitno++
	    hitted= 1
	    obj_creditsloader.ting= 1
	}

func _on_outside_room():
	if(active == 1) {
	    if(stretch == 0) {
	        draw_set_halign(1)
	        xx= lengthdir_x(width * 1, rotation_degrees)
	        yy= lengthdir_y(width * 1, rotation_degrees)
	        xx_off= lengthdir_x(1, rotation_degrees - 90) * 18
	        yy_off= lengthdir_y(1, rotation_degrees - 90) * 18
	        if(hitted == 0 and collision_line(x - xx * 0.8, y - yy * 0.8, x + xx * 0.8, y + yy * 0.8, 1699, 1, 1))
	            event_user(1)
	        draw_set_font(2)
	        draw_set_color(16777215)
	        if(hitted == 1) draw_set_color(65535)
	        draw_text_transformed(x - xx_off, y - yy_off, text, 2, 2, rotation_degrees)
	        draw_set_color(255)
	        draw_set_halign(0)
	    }
	    if(stretch == 1) {
	        draw_set_halign(1)
	        xx= lengthdir_x(width * 1, rotation_degrees)
	        yy= lengthdir_y(width * 1, rotation_degrees)
	        s_factor= 1
	        if(x - xx < 0) {
	            s_loss= abs(x - xx)
	            s_factor= (width - s_loss) / width
	        }
	        if(x + xx > get_viewport_rect().size.x) {
	            s_loss= abs(x + xx - get_viewport_rect().size.x)
	            s_factor= (width - s_loss) / width
	        }
	        xx*= s_factor
	        xx_off= lengthdir_x(1, rotation_degrees - 90) * 18 * s_factor
	        yy_off= lengthdir_y(1, rotation_degrees - 90) * 18
	        if(hitted == 0 and collision_line(x - xx * 0.8, y - yy * 0.8, x + xx * 0.8, y + yy * 0.8, 1699, 1, 1))
	            event_user(1)
	        draw_set_font(2)
	        draw_set_color(16777215)
	        if(hitted == 1) draw_set_color(65535)
	        draw_text_transformed(x - xx_off, y - yy_off, text, 2 * s_factor, 2, rotation_degrees)
	        draw_set_halign(0)
	    }
	    if(stretch == 2) {
	        draw_set_halign(1)
	        s_factor= 1
	        s_factor= stretchfactor / width
	        xx= lengthdir_x(width * 1 * s_factor, rotation_degrees)
	        yy= lengthdir_y(width * 1 * s_factor, rotation_degrees)
	        xx_off= lengthdir_x(1, rotation_degrees - 90) * 18
	        yy_off= lengthdir_y(1, rotation_degrees - 90) * 18
	        if(hitted == 0 and collision_line(x - xx * 0.8, y - yy * 0.8, x + xx * 0.8, y + yy * 0.8, 1699, 1, 1))
	            event_user(1)
	        draw_set_font(2)
	        draw_set_color(16777215)
	        if(hitted == 1) draw_set_color(65535)
	        draw_text_transformed(x - xx_off, y - yy_off, text, 2 * s_factor, 2, rotation_degrees)
	        draw_set_halign(0)
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
