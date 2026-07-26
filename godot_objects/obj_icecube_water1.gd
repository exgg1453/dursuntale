# Auto-converted from GameMaker: obj_icecube_water1
extends Node2D

func _ready():
	image_speed= 0.1
	if(room == 82) path_start(33/* path_icecube_water1 */, 1.5, 0, 1/* path_action_restart */)
	if(GS.flag[7] == 1) instance_destroy()
	if(scr_murderlv() >= 7) instance_destroy()

func _process(delta: float):
	if(path_position == 1) {
	    _spawn("object_index", 0, 0)
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
