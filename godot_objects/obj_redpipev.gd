# Auto-converted from GameMaker: obj_redpipev
extends Node2D

func _ready():
	sn= 0

func _on_outside_room():
	sn++
	draw_sprite(914/* spr_redpipe_top */, floor(sn / 4), x, y)
	draw_sprite(912/* spr_redpipe_bottom */, floor(sn / 4), x, y + 16 + (scale.y - 1) * 19)
	i= 0
	while(i < scale.y) {
	    draw_sprite(913/* spr_redpipe_middle */, floor(sn / 4), x, y + 1 + i * 19)
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
