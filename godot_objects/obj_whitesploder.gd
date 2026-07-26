# Auto-converted from GameMaker: obj_whitesploder
extends Node2D

func _ready():
	splode= 0

func _on_outside_room():
	splode++
	draw_set_color(16777215)
	i= 0
	while(i < 16) {
	    alp= splode / 12 - 0.06 * i
	    if(alp < 0) alp= 0
	    if(alp > 1) alp= 1
	    draw_set_alpha(alp)
	    draw_rectangle(0, get_viewport_rect().size.y / 2 - 8 * (i + 1), get_viewport_rect().size.x, get_viewport_rect().size.y / 2 - 8 * i, 0)
	    draw_rectangle(0, get_viewport_rect().size.y / 2 + 8 * (i + 1), get_viewport_rect().size.x, get_viewport_rect().size.y / 2 + 8 * i, 0)
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
