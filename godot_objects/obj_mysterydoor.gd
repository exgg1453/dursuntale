# Auto-converted from GameMaker: obj_mysterydoor
extends Node2D

func _ready():
	frame= 0
	image_speed= 0
	ini_open("undertale.ini")
	on= ini_read_real("reset", "s_key", 0)
	ini_close()
	if(on == 0) {
	    instance_create(x, y + 40, 2/* obj_solidsmall */)
	    instance_create(x + 20, y + 40, 2/* obj_solidsmall */)
	    instance_create(x, y + 40, 1345/* obj_readable_room2 */)
	    instance_create(x + 20, y + 40, 1345/* obj_readable_room2 */)
	} else  {
	    frame= 1
	    instance_create(x + 10, y + 37, 811/* obj_doorAmusicfade */)
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
