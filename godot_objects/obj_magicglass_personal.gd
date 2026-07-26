# Auto-converted from GameMaker: obj_magicglass_personal
extends Node2D

func _ready():
	modulate.a= 0
	ar= 0

func _process(delta: float):
	ar--
	if(modulate.a > 0 and ar < 0)
	    modulate.a-= 0.1

func _on_alarm_0_timeout():
	if(GS.phasing == 0 and GS.interact == 0) {
	    ar= 3
	    if(modulate.a < 1) modulate.a+= 0.2
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
