# Auto-converted from GameMaker: obj_friendscene_gigavine
extends Node2D

func _ready():
	scale.y= 2
	scale.x= 0.01
	x= -100
	xspeed= 0.08 + random(0.05)
	shimmy= 0
	siner= 0

func _process(delta: float):
	if(scale.x < 2)
	    scale.x+= xspeed
	if(shimmy == 1) {
	    z_index= 5
	    siner++
	    x+= sin(siner / 9) * 1
	    y+= cos(siner / 7) * 0.5
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
