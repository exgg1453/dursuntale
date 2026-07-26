# Auto-converted from GameMaker: obj_wordfall_word
extends Node2D

func _ready():
	gravity= 0.2 + random(0.2)
	velocity.x= random(2)
	if(x > 100) velocity.x--
	ang= 3 - random(6)
	maxy= 130 + random(20)

func _process(delta: float):
	rotation_degrees+= ang
	if(y > ystart + maxy) {
	    instance_create(x, y, 1228/* obj_wordburst */)
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
