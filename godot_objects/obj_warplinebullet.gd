# Auto-converted from GameMaker: obj_warplinebullet
extends Node2D

func _ready():
	r= 32
	rot= random(260)
	rotspeed= choose(4, 3, -3, -4)
	if(y < get_viewport_rect().size.y / 2) velocity.y= 4
	else  velocity.y= -4
	dmg= 8

func _gm_event_7_11():
	scr_damagestandard_x()

func _on_outside_room():
	draw_set_color(0)
	rot+= rotspeed
	xpart= lengthdir_x(r, rot)
	ypart= lengthdir_y(r, rot)
	draw_set_color(0)
	draw_line_width(x + xpart * 1.1, y + ypart * 1.1, x - xpart * 1.1, y - ypart * 1.1, 8)
	draw_set_color(16777215)
	draw_line_width(x + xpart, y + ypart, x - xpart, y - ypart, 6)
	if(collision_line(x + xpart * 0.8, y + ypart * 0.8, x - xpart * 0.8, y - ypart * 0.8, 743, 0, 1))
	    event_user(1)
	if(y > 800 or y < -200) instance_destroy()
	if(GS.turntimer < 0) instance_destroy()

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
