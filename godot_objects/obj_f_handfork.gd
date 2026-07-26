# Auto-converted from GameMaker: obj_f_handfork
# GM parent: obj_floweybullet_parent
extends Node2D

func _ready():
	size= 0.4
	scale.x= size
	scale.y= size

func _process(delta: float):
	if(size < 1) size+= 0.025
	if(velocity.x > 0) scale.x= size
	if(velocity.x < 0) scale.x= -size
	scale.y= size

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
