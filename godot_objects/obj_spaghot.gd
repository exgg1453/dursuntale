# Auto-converted from GameMaker: obj_spaghot
extends Node2D

func _ready():
	level= 0
	levelpic[1]= 1506
	levelpic[2]= 1507
	levelpic[3]= 1508
	levelpic[4]= 1509
	levelpic[5]= 1510
	levelpic[6]= 1511
	levelpic[7]= 1512
	levelpic[8]= 1513
	levelpic[9]= 1513
	image_speed= 0.334

func _gm_event_7_10():
	level++
	sprite_index= levelpic[level]

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
