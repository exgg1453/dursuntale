# Auto-converted from GameMaker: obj_fileerased_part
extends Node2D

func _ready():
	$Alarm0.start((1) / 30.0)
	image_speed= 0
	ang= choose(1, -1)

func _on_destroy():
	if(frame == 0) direction= 180
	if(frame == 1) direction= 120
	if(frame == 2) direction= 76
	if(frame == 3) direction= 0
	if(frame == 4) direction= 300
	if(frame == 5) direction= 230
	speed= 13
	gravity_direction= 270
	gravity= 2
	friction= 0.05

func _process(delta: float):
	if(y > 600) instance_destroy()
	rotation_degrees+= ang

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
