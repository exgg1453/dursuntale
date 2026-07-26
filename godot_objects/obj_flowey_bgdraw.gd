# Auto-converted from GameMaker: obj_flowey_bgdraw
extends Node2D

func _ready():
	siner= 0

func _gm_event_7_0():
	i= 0
	while(i < 8) {
	    siner2= siner + i
	    background_alpha[i]= 0.5 + sin(siner2 / 8) * 0.4
	    background_x[i]+= sin(siner2 / 8) * 1
	    i++
	}
	siner++

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
