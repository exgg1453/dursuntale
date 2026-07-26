# Auto-converted from GameMaker: obj_friendprotector
extends Node2D

func _ready():
	fade= 0
	oo= 0
	timer= 0
	l_timer= 0
	image_speed= 0.2
	go= 0

func _process(delta: float):
	if(fade == 1) {
	    l_timer++
	    if(l_timer > 15) modulate.a-= 0.1
	    if(modulate.a < 0.1) instance_destroy()
	}
	if(oo == 0) visible= 0
	if(oo == 1) visible= 1
	if(timer > 7) {
	    oo= 1
	    visible= 1
	    if(go == 1) speed= 0.5
	}
	if(oo == 0) oo= 1
	else  oo= 0
	timer++

func _on_alarm_0_timeout():
	if(other.fade == 0) {
	    // other
	    with(-2) fade= 1
	    // other
	    with(-2) speed= -6
	    // other
	    with(-2) friction= 0.1
	    // obj_friendscene
	    with(1675) ting_s= 1
	}
	fade= 1

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
