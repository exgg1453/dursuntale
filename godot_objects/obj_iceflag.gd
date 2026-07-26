# Auto-converted from GameMaker: obj_iceflag
extends Node2D

func _ready():
	scr_depth()
	image_speed= 0
	type= 0
	yoff= 40
	on= 0

func _on_outside_room():
	draw_self_custom(0, 9999, 0, ystart + 40)
	if(yoff > 1) y--
	yoff--
	if(x > view_xview[0] + view_wview[0]) instance_destroy()
	if(x < view_xview[0] - 10) instance_destroy()
	if(y > view_yview[0] + view_hview[0] + 30)
	    instance_destroy()
	if(y < view_yview[0]) instance_destroy()

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
