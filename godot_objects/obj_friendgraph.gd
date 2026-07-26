# Auto-converted from GameMaker: obj_friendgraph
extends Node2D

func _ready():
	ideallength= 0
	length= 0
	maxlength= 140
	siner= 0

func _on_outside_room():
	draw_set_color(16777215)
	draw_set_font(1)
	stringo= ""
	if(GS.flag[66] == 1) stringo= "DATE POWER"
	if(GS.flag[66] == 0) stringo= "FRIENDSHIP"
	draw_text(x, y - 36, stringo)
	draw_rectangle(x - 3, y - 3, x + maxlength + 3, y + 27, 0)
	draw_set_color(0)
	draw_rectangle(x - 1, y - 1, x + maxlength + 1, y + 25, 0)
	draw_set_color(8421504)
	draw_rectangle(x, y, x + maxlength, y + 24, 0)
	siner++
	value= 200 + sin(siner * 10 * length / maxlength / 10) * (20 + 35 * length / maxlength)
	if(value > 255) value= 255
	if(value < 180) value= 180
	draw_set_color(make_color_hsv(160, 255, value))
	draw_rectangle(x, y, x + length, y + 24, 0)
	if(ideallength > length) length++
	if(ideallength < length) length--

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
