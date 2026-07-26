# Auto-converted from GameMaker: obj_purplegradienter
extends Node2D

func _ready():
	siner= 0
	amt= 1
	fade= 0

func _on_outside_room():
	ac= 1.5 + sin(siner / 20)
	siner++
	draw_set_alpha(1)
	i= 0
	while(i < 10) {
	    draw_set_alpha((0.8 - i / 16) * amt)
	    draw_set_color(8388736)
	    draw_rectangle(-10, get_viewport_rect().size.y - i * i * ac, get_viewport_rect().size.x + 10, get_viewport_rect().size.y - (i + 1) * (i + 1) * ac, 0)
	    i++
	}
	draw_set_alpha(1)
	if(fade == 1) {
	    amt-= 0.03
	    if(amt < 0.05) instance_destroy()
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
