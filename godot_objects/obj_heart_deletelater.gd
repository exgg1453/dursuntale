# Auto-converted from GameMaker: obj_heart_deletelater
extends Node2D

func _ready():
	GS.idealborder[0]= 192
	GS.idealborder[1]= 442
	GS.idealborder[2]= 250
	GS.idealborder[3]= 385
	x= GS.idealborder[0] + 120
	y= GS.idealborder[2] + 70

func _on_outside_room():
	draw_sprite(sprite_index, frame, x, y)
	draw_set_color(16777215)
	draw_rectangle(GS.idealborder[0], GS.idealborder[2], GS.idealborder[1], GS.idealborder[3], 1)
	if(Input.is_action_pressed("move_right") and x < GS.idealborder[1] - 16)
	    x+= 4
	if(Input.is_action_pressed("move_left") and x > GS.idealborder[0])
	    x-= 4
	if(Input.is_action_pressed("move_down") and y < GS.idealborder[3] - 16)
	    y+= 4
	if(Input.is_action_pressed("move_up") and y > GS.idealborder[2])
	    y-= 4

func _gm_event_9_17():
	room_restart()

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
