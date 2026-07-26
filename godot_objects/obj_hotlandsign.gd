# Auto-converted from GameMaker: obj_hotlandsign
extends Node2D

func _ready():
	sizefactor= 4
	xaround= 20
	$Alarm0.start((5) / 30.0)
	sinercolor= 0
	greenbright= 0
	$Alarm1.start((15) / 30.0)
	inactive= 0
	if(GS.flag[350] == 1) inactive= 1
	if(inactive == 1) {
	    xaround= 20
	    $Alarm0.start((-1) / 30.0)
	}

func _gm_event_2_1():
	greenbright++
	if(greenbright > 5) greenbright= 0
	if(inactive == 0) $Alarm1.start((15) / 30.0)
	if(inactive == 1) greenbright= 0

func _on_destroy():
	xaround--
	if(inactive == 0) $Alarm0.start((4) / 30.0)
	if(xaround < -80) xaround= 60

func _on_outside_room():
	draw_set_color(0)
	draw_rectangle(x - 12, y - 12, x + 493, y + 52, 0)
	if(inactive == 0)
	    draw_sprite_part_ext(1864, frame, 0 - xaround, 0, 60, 5, x, y, 8, 8, 255, 1)
	if(inactive == 1)
	    draw_sprite_part_ext(1864, frame, 0 - xaround, 0, 60, 5, x, y, 8, 8, 255, 0.5)
	i= 0
	while(i < 60) {
	    g= 0
	    repeat(5)  {
	        draw_sprite(1865/* spr_hotlandcover */, 0, x + i * 8, y + g * 8)
	        g++
	    }
	    i++
	}
	draw_set_color(32768)
	if(greenbright == 1) draw_set_color(65280)
	draw_roundrect(x - 10, y - 10, x + 490, y + 50, 1)
	draw_set_color(32768)
	if(greenbright == 3) draw_set_color(65280)
	draw_roundrect(x - 11, y - 11, x + 491, y + 51, 1)
	draw_set_color(32768)
	if(greenbright == 5) draw_set_color(65280)
	draw_roundrect(x - 12, y - 12, x + 492, y + 52, 1)

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
