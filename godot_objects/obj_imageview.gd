# Auto-converted from GameMaker: obj_imageview
extends Node2D

func _ready():
	type= 0
	GS.interact= 1
	buffer= 0
	$Alarm0.start((6) / 30.0)

func _on_destroy():
	buffer= 1

func _on_outside_room():
	draw_sprite(sprite_index, frame, view_xview[0], view_yview[0])
	if(buffer == 1 and keyboard_multicheck_pressed(1/* ANYKEY */) == 1)
	    buffer= 2
	if(buffer == 1 and keyboard_multicheck_pressed(0/* NOKEY */) == 1)
	    buffer= 2
	GS.interact= 1
	if(buffer == 2) {
	    GS.interact= 0
	    instance_destroy()
	}

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
