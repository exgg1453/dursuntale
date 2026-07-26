# Auto-converted from GameMaker: obj_blackbox_o
extends Node2D

func _ready():
	curx= x
	cury= y
	create= 10

func _gm_event_7_13():
	if(not collision_point(x + 10, y + 30, 1242, 0, 1) and not collision_point(x + 10, y + 30, 1240, 0, 1))
	    y+= 20

func _gm_event_7_12():
	if(not collision_point(x + 10, y - 10, 1242, 0, 1) and not collision_point(x + 10, y - 10, 1240, 0, 1))
	    y-= 20

func _gm_event_7_11():
	if(not collision_point(x - 10, y + 10, 1242, 0, 1) and not collision_point(x - 10, y + 10, 1240, 0, 1))
	    x-= 20

func _gm_event_7_10():
	if(not collision_point(x + 30, y + 10, 1242, 0, 1) and not collision_point(x + 30, y + 10, 1240, 0, 1))
	    x+= 20

func _on_outside_room():
	if(create >= 0) {
	    draw_sprite_ext(1812/* spr_blackbox_o_shatter */, 0, x + 10, y + 10, 1 + create / 10, 1 + create / 10, create * 10, 16777215, 1 - create / 10)
	    create--
	}
	if(create < 0)
	    draw_sprite(sprite_index, frame, curx, cury)
	if(curx > x) curx-= 5
	if(curx < x) curx+= 5
	if(cury > y) cury-= 5
	if(cury < y) cury+= 5

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
