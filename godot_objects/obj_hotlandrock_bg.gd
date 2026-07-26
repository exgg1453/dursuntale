# Auto-converted from GameMaker: obj_hotlandrock_bg
extends Node2D

func _ready():
	siner= 0

func _on_outside_room():
	siner++
	draw_set_color(0)
	maximum= get_viewport_rect().size.y / 40
	draw_set_alpha(0.3 + sin(siner / 15) * 0.1)
	draw_rectangle(-10, -10, get_viewport_rect().size.x + 10, get_viewport_rect().size.y + 10, 0)
	i= 0
	while(i < maximum) {
	    draw_set_alpha(i / maximum)
	    draw_rectangle(-10, i * 40, get_viewport_rect().size.x + 10, i * 40 + 40, 0)
	    i++
	}
	draw_set_alpha(1)

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
