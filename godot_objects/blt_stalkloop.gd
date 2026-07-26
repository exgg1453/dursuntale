# Auto-converted from GameMaker: blt_stalkloop
# GM parent: blt_parent
extends Node2D

func _ready():
	scale.x= 0.2
	scale.y= 0.2
	scaleadd= 0.1
	move_towards_point(obj_heart.x + 6, obj_heart.y + 6, 3)
	dmg= 8

func _process(delta: float):
	scale.y+= scaleadd
	scale.x+= scaleadd
	scaleadd/= 1.1

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
