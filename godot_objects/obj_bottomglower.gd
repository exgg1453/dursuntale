# Auto-converted from GameMaker: obj_bottomglower
extends Node2D

func _ready():
	siner= 0
	xmode= 0

func _gm_event_2_1():
	xmode= 1

func _on_outside_room():
	siner++
	alp= 0
	go= abs(sin(siner / 30))
	draw_set_color(255)
	cw= 0
	w= 0
	i= 0
	while(i < 10) {
	    alp= (go - i / 10) / 1.2
	    if(xmode == 1) alp/= 1.8
	    if(alp < 0) alp= 0
	    draw_set_alpha(alp)
	    w= (10 - i) * go * 1.4
	    if(xmode == 1) w/= 1.2
	    draw_rectangle(view_xview[0] - 10, get_viewport_rect().size.y - cw, view_xview[0] + 330, get_viewport_rect().size.y - cw - w + 1, 0)
	    cw+= w
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
