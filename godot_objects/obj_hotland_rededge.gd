# Auto-converted from GameMaker: obj_hotland_rededge
extends Node2D

func _ready():
	siner= 0

func _on_outside_room():
	siner++
	i= 0
	while(i < scale.y) {
	    if(i == 0)
	        draw_sprite_ext(910/* spr_hotland_rededge_top */, frame, x, y + i * 40, 1, 1, 0, 16777215, abs(sin(siner / 16)))
	    if(i > 0)
	        draw_sprite_ext(sprite_index, frame, x, y + i * 40, 1, 1, 0, 16777215, abs(sin(siner / 16)))
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
