# Auto-converted from GameMaker: obj_torbody
# GM parent: obj_face
extends Node2D

func _ready():
	x= obj_torface.x + obj_torface.sprite_width / 2 - sprite_width / 2
	y= obj_torface.y + 27
	event_inherited()

func _process(delta: float):
	if(not instance_exists(763/* obj_torface */)) instance_destroy()

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
