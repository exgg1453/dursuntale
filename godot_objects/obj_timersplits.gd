# Auto-converted from GameMaker: obj_timersplits
extends Node2D

func _gm_event_7_5():
	splitno++

func _on_outside_room():
	split[splitno]++
	draw_set_color(255)
	draw_set_font(2)
	draw_set_halign(0)
	i= 0
	while(i < splitno + 1) {
	    draw_text(view_xview[0] + 10, view_yview[0] + 10 + i * 15, split[i])
	    i++
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
