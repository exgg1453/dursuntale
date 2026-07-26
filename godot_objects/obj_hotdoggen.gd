# Auto-converted from GameMaker: obj_hotdoggen
extends Node2D

func _ready():
	hdno= 0
	negf= 0

func _gm_event_7_10():
	hdno= 0
	oncheck= 0
	parent= 1570
	while(instance_position(parent.x + 10, parent.y - hdno * 4, 1273))
	    hdno++
	hd= instance_create(parent.x + 10, parent.y - hdno * 4, 1273/* obj_hotdog */)
	hd.parent= 1570
	hd.friction= 1 - hdno * 0.1
	hd.relative= hdno * 4
	if(negf == 0 and hd.friction < 0.1) hd.friction= 0.1

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
