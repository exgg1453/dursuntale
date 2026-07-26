# Auto-converted from GameMaker: obj_hotlandparalava
extends Node2D

func _ready():
	i= 0
	siner= 0
	xx[0]= 0
	xx[1]= 0
	xx[2]= 0
	xx[3]= 0
	xx[4]= 0
	xx[5]= 0

func _on_outside_room():
	maximum= get_viewport_rect().size.x / 20
	xx[4]+= 0.25
	i= -1
	while(i < maximum + 1) {
	    draw_sprite_ext(1867/* spr_hotlandlava */, 0, i * 20 + xx[4], get_viewport_rect().size.y - 80, 1, 1, 0, 16777215, 0.5)
	    lastx= i * 20 + xx[4]
	    i++
	}
	if(xx[4] >= 20) xx[4]-= 20
	xx[3]+= 0.5
	i= -1
	while(i < maximum + 1) {
	    draw_sprite_ext(1867/* spr_hotlandlava */, 0, i * 20 + xx[3], get_viewport_rect().size.y - 68, 1, 1, 0, 16777215, 0.75)
	    lastx= i * 20 + xx[3]
	    i++
	}
	if(xx[3] >= 20) xx[3]-= 20
	xx[2]+= 0.8
	i= -1
	while(i < maximum + 1) {
	    draw_sprite(1867/* spr_hotlandlava */, 0, i * 20 + xx[2], get_viewport_rect().size.y - 54)
	    lastx= i * 20 + xx[2]
	    i++
	}
	if(xx[2] >= 20) xx[2]-= 20
	xx[1]+= 0.9
	i= -1
	while(i < maximum + 1) {
	    draw_sprite(1867/* spr_hotlandlava */, 0, i * 20 + xx[1], get_viewport_rect().size.y - 38)
	    lastx= i * 20 + xx[1]
	    i++
	}
	if(xx[1] >= 20) xx[1]-= 20
	xx[0]++
	i= -1
	while(i < maximum + 1) {
	    draw_sprite(1867/* spr_hotlandlava */, 0, i * 20 + xx[0], get_viewport_rect().size.y - 20)
	    lastx= i * 20 + xx[0]
	    i++
	}
	if(xx[0] >= 20) xx[0]-= 20

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
