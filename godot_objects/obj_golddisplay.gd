# Auto-converted from GameMaker: obj_golddisplay
extends Node2D

func _on_outside_room():
	xx= view_xview[view_current]
	yy= view_yview[view_current] + 10
	f= 188
	yf= 8
	draw_set_color(16777215)
	draw_rectangle(16 + xx + f, 74 + yy + yf, 116 + xx + f, 127 + yy + yf, 0)
	draw_set_color(0)
	draw_rectangle(19 + xx + f, 77 + yy + yf, 113 + xx + f, 124 + yy + yf, 0)
	draw_set_font(2)
	draw_set_color(16777215)
	draw_text(30 + xx + f, 90 + yy, "$ - " + string(GS.gold) + "G")
	scr_itemroom()
	draw_text(30 + xx + f, 110 + yy, "SPACE - " + string(itemhold) + "/8")
	if(not instance_exists(782/* OBJ_WRITER */)) instance_destroy()

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
