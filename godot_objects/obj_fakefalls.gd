# Auto-converted from GameMaker: obj_fakefalls
extends Node2D

func _ready():
	image_speed= 0.5
	col= 0

func _process(delta: float):
	if(col < 3 and bbox_bottom < obj_mainchara.bbox_top)
	    scr_depth()
	else  z_index= 1000
	col--
	if(col < 0) col= 0

func _on_alarm_0_timeout():
	col+= 2
	if(col > 4) col= 4

func _on_outside_room():
	maxy= bbox_bottom - obj_mainchara.y
	if(col == 0)
	    draw_sprite(sprite_index, frame, x, y)
	if(col == 1)
	    draw_sprite(sprite_index, frame, x, y - 16)
	if(col == 2)
	    draw_sprite(sprite_index, frame, x, y - 25)
	if(col > 2)
	    draw_sprite(sprite_index, frame, x, y - 30)

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
