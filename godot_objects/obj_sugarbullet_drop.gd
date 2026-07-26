# Auto-converted from GameMaker: obj_sugarbullet_drop
extends Node2D

func _ready():
	gravity= 0.4 + random(0.2)
	friction= 0.2
	velocity.x= random(2) * choose(-1, 1)
	ang= 0
	image_speed= 0

func _process(delta: float):
	if(y > view_yview[0] + 250) instance_destroy()
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
