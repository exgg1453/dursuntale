# Auto-converted from GameMaker: obj_songwriter
extends Node2D

func _ready():
	sting= "What the fuck is wrong "
	active= 0
	$Alarm1.start((1) / 30.0)
	alpha= 0.3
	$Alarm2.start((6) / 30.0)
	off= 0
	velocity.x= 0.2
	newstring= ""
	myfont= 1
	gggg= 0

func _gm_event_2_2():
	scoord++
	if(scoord <= stringlength)
	    newstring+= string_char_at(sting, scoord)
	else  off= 1
	$Alarm2.start((3) / 30.0)
	if(gggg == 1) $Alarm2.start((2) / 30.0)

func _gm_event_2_1():
	stringlength= string_length(sting)
	scoord= 0
	active= 1
	newstring= ""

func _on_outside_room():
	if(active == 1) {
	    visible= 1
	    if(off == 0 and alpha < 2.2) {
	        alpha+= 0.05
	        if(gggg == 1) alpha+= 0.1
	    }
	    draw_set_font(myfont)
	    draw_set_color(16777215)
	    draw_set_alpha(alpha)
	    draw_text(x, y, newstring)
	}
	if(off == 1) {
	    alpha-= 0.05
	    if(gggg == 1) alpha-= 0.05
	    if(alpha < 0.1) instance_destroy()
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
