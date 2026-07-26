# Auto-converted from GameMaker: obj_waterpillar
extends Node2D

func _ready():
	scr_depth()
	scale.y= 0.1
	modulate.a= 0.5
	scale.x= 2
	on= 1
	snd_play(22/* snd_splash */)

func _on_destroy():
	on= 0

func _process(delta: float):
	if(on == 1) {
	    scale.x-= 0.4
	    modulate.a+= 0.25
	    scale.y+= 0.3
	    if(modulate.a >= 1) modulate.a= 1
	    if(scale.y >= 1) on= 2
	    $Alarm0.start((3) / 30.0)
	}
	if(on == 2) scale.y+= 0.1
	if(on == 0) {
	    scale.x+= 0.25
	    modulate.a-= 0.25
	    scale.y-= 0.4
	    if(scale.y < 0.1) instance_destroy()
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
