# Auto-converted from GameMaker: obj_spiderstrand
extends Node2D

func _ready():
	siner= 0
	firstx= random(300) - 150
	secondx= random(300) - 150
	xhome= xstart
	scrollspeed= 0.9 - random(0.2)

func _process_end(delta: float):
	myview= view_xview[0]
	gg= get_viewport_rect().size.x - view_wview[0]
	if(myview < 0) myview= 0
	if(view_xview[0] <= 0) x= xhome
	if(view_xview[0] > 0)
	    x= xhome + floor(view_xview[0] - view_xview[0] * scrollspeed)
	if(view_xview[0] >= gg)
	    x= xhome + floor(gg - gg * scrollspeed)

func _on_outside_room():
	draw_set_alpha(0.5)
	siner= x / 2
	full= sin(siner / 4) * 127 + 127
	ofull= cos(siner / 4) * 127 + 127
	col1= make_color_rgb(full, full, full)
	col2= make_color_rgb(ofull, ofull, ofull)
	draw_line_color(x + firstx, 0, x + secondx, 159, col1, col2)
	draw_set_alpha(1)

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
