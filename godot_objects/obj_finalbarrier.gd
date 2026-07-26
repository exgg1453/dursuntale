# Auto-converted from GameMaker: obj_finalbarrier
extends Node2D

func _ready():
	u[0]= 0
	u[1]= 0
	u[2]= 0
	c[0]= 0
	c[1]= 0
	c[2]= 0
	m= instance_number(object_index)
	maxm= 100
	j= 0
	$Alarm0.start((1) / 30.0)
	y-= 2000 / m
	z_index= 500000 - m

func _on_destroy():
	if(m < maxm)
	    _spawn("object_index", get_viewport_rect().size.x / 2 - get_viewport_rect().size.x / (m + 1), get_viewport_rect().size.y / 2 - get_viewport_rect().size.y / (m + 1))

func _on_outside_room():
	script_execute(29/* scr_colorcycle */)
	draw_set_color(color)
	draw_rectangle(x, y, get_viewport_rect().size.x / 2 + get_viewport_rect().size.x / m, get_viewport_rect().size.y / 2 + get_viewport_rect().size.y / m, 0)

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
