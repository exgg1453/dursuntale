# Auto-converted from GameMaker: obj_flyjar
extends Node2D

func _ready():
	modulate.a= 0
	$Alarm0.start((30) / 30.0)
	off= 0
	scale.x= 3
	scale.y= 3

func _on_destroy():
	off= 1
	repeat(54)  instance_create(x + 30, y + 30, 304/* obj_jarfly */)

func _process(delta: float):
	if(off == 1 and modulate.a < 1)
	    modulate.a+= 0.02
	if(obj_questionasker.phase > 2 or obj_questionasker.phase < 1)
	    off= 2
	if(off == 2 and modulate.a > 0) {
	    modulate.a-= 0.05
	    if(modulate.a <= 0.05) instance_destroy()
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
