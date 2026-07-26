# Auto-converted from GameMaker: obj_creditsword
extends Node2D

func _ready():
	active= 0
	text1= "pepis"
	text2= ""
	myspeed= 2
	alpha= 0
	active= 0
	$Alarm0.start((1) / 30.0)
	fader= 0
	size= 1

func _on_destroy():
	height= string_height(text) * size * 2
	active= 1
	speed= myspeed
	friction= 0.1

func _on_outside_room():
	if(active == 1) {
	    if(fader == 0 and alpha < 1) alpha+= 0.05
	    draw_set_alpha(alpha)
	    draw_set_color(16777215)
	    draw_set_font(2)
	    draw_text_transformed(x, y, text, size * 2, size * 2, 0)
	    draw_set_color(65535)
	    draw_text_transformed(x, y + height + 4 * size, text2, size, size, 0)
	    draw_set_alpha(1)
	    if(fader == 1) alpha-= 0.05
	    if(alpha < 0) instance_destroy()
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
