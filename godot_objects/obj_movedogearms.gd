# Auto-converted from GameMaker: obj_movedogearms
# GM parent: obj_monsterparent
extends Node2D

func _ready():
	image_speed= 0.5
	scale.x= 2
	scale.y= 2
	a= 0
	b= 0
	y-= 8

func _process(delta: float):
	a++
	if(sin(a / 4.5) > 0) y+= 0.8
	else  y-= 0.8

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
