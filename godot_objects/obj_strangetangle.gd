# Auto-converted from GameMaker: obj_strangetangle
extends Node2D

func _ready():
	w= 30
	h= 30
	$Alarm0.start((1) / 30.0)
	active= 0
	siner= 0
	// obj_battlebg
	with(185) instance_destroy()

func _on_destroy():
	active= 1
	i= 0
	while(i < 30) {
	    x1[i]= x + random(w) - random(w)
	    x2[i]= x + random(w) - random(w)
	    y1[i]= y + random(h) - random(h)
	    y2[i]= y + random(h) - random(h)
	    i++
	}
	$Alarm0.start((4) / 30.0)

func _on_outside_room():
	if(active == 1) {
	    draw_set_alpha(modulate.a)
	    oo= 0
	    i= 0
	    while(i < 30) {
	        if(oo == 0) draw_set_color(16777215)
	        draw_rectangle(x1[i], y1[i], x1[i] + 16, y1[i] + 16, 0)
	        if(oo == 0) oo= 1
	        else  oo= 0
	        i++
	    }
	    draw_set_alpha(1)
	}
	siner++
	w+= sin(siner / 5) * 2
	h+= sin(siner / 5) * 2

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
