# Auto-converted from GameMaker: obj_rainbowbolt
# GM parent: obj_asbulletparent
extends Node2D

func _ready():
	thisx= x
	thisy= y
	shake= 3
	ss= 0
	add= 0
	ac= random(255)
	image_blend= make_color_hsv(ac, 244, 244)
	scale.x= 2
	scale.y= 2
	image_speed= 0
	frame= choose(0, 1)
	giga= 0
	non= 0

func _process(delta: float):
	x= thisx + random(6) - random(6)
	y= thisy + random(6) - random(6)
	if(giga == 1) {
	    ss-= 0.5
	    x= thisx + random(12) - random(12)
	    y= thisy + random(12) - random(12)
	}
	ss++
	if(ss > 2) {
	    modulate.a-= 0.1
	    if(modulate.a < 0.5) scale.x-= 0.2
	    if(modulate.a < 0.1) instance_destroy()
	}
	add+= 10
	image_blend= make_color_hsv(ac + add, 210, 255)

func _on_alarm_0_timeout():
	if(modulate.a > 0.8 and non == 1) event_user(7)

func _on_outside_room():
	draw_sprite_ext(sprite_index, frame, x, y, scale.x, scale.y, 0, image_blend, modulate.a)
	if(modulate.a > 0.8) {
	    draw_set_color(16777215)
	    draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom - 1, 0)
	}
	non= 1

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
