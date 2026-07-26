# Auto-converted from GameMaker: obj_quittingmessage
extends Node2D

func _ready():
	image_speed= 0.1
	modulate.a= 0

func _on_outside_room():
	if(instance_exists(1569/* obj_time */)) {
	    if(obj_time.quit > 0)
	        draw_sprite_ext(sprite_index, frame, view_xview[view_current], view_yview[view_current], 1, 1, 0, 16777215, modulate.a)
	    else  instance_destroy()
	} else  instance_destroy()
	if(modulate.a < 0.9) modulate.a+= 0.1

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
