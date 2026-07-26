# Auto-converted from GameMaker: obj_lightray
extends Node2D

func _ready():
	s= 0
	siner= 0
	minusy= random(80)

func _process_end(delta: float):
	yy= view_yview[0]
	if(yy < 0) yy= 0
	if(yy > get_viewport_rect().size.y - 240) yy= get_viewport_rect().size.y - 240
	y= yy - minusy

func _on_outside_room():
	siner++
	ac= sin(siner / 60) * 0.12
	s= 0
	while(s < 40) {
	    draw_set_color(16777215)
	    ac= sin((s + siner) / 35) * 0.17
	    draw_set_alpha(0.7 + ac - s / 40)
	    draw_rectangle(x, y + s * 4, x + 30, y + 4 + s * 4, 0)
	    s++
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
