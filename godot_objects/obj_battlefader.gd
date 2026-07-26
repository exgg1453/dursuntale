# Auto-converted from GameMaker: obj_battlefader
extends Node2D

func _ready():
	scale.x= 640
	scale.y= 320
	heart= 743
	if(instance_exists(748/* obj_fakeheart */)) heart= 748
	heart.z_index= -1001

func _process(delta: float):
	modulate.a-= 0.2
	if(modulate.a < 0.1) {
	    heart.z_index= 0
	    instance_destroy()
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
