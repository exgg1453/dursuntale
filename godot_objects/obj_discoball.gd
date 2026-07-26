# Auto-converted from GameMaker: obj_discoball
extends Node2D

func _ready():
	y= view_yview[0] - sprite_width
	on= 1
	amt= 0
	siner= 0
	reverse= 0
	if(instance_exists(instance_find(object_index, 1))) reverse= 1
	else 
	    _spawn("object_index", view_xview[0] + 240, view_yview[0] - sprite_width)
	image_speed= 0.334

func _on_outside_room():
	if(on == 1) {
	    if(amt <= 1) amt+= 0.05
	    if(y < 0) y++
	    else  on= 0
	}
	if(on == 2) {
	    if(amt > 0) amt-= 0.05
	    if(y > ystart) y--
	    else  instance_destroy()
	}
	if(reverse == 0) siner++
	else  siner--
	draw_set_color(16777215)
	draw_set_circle_precision(8)
	draw_set_alpha(0.5 * amt)
	i= 0
	while(i < 12) {
	    draw_set_color(make_color_hsv(i * 20 + siner, 255, 255))
	    draw_circle(x + sin((i * 10 + siner) / 20) * 40, y + cos((i * 10 + siner) / 20) * 20 + 140, 3, 0)
	    i++
	}
	draw_set_alpha(0.4 * amt)
	i= 0
	while(i < 24) {
	    draw_set_color(make_color_hsv(i * 20 + siner, 255, 255))
	    draw_circle(x + sin((i * 10 + siner) / 20) * 80, y + cos((i * 5 + siner) / 20) * 60 + 140, 6, 0)
	    i++
	}
	draw_set_alpha(1)
	draw_sprite(sprite_index, frame, x, y)

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
