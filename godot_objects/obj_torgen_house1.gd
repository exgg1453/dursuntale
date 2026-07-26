# Auto-converted from GameMaker: obj_torgen_house1
extends Node2D

func _ready():
	if(GS.flag[45] == 1) $Alarm1.start((2) / 30.0)

func _gm_event_2_1():
	instance_create(240, 70, 861/* obj_toroverworld3 */)
	if(GS.plot < 19) {
	    // obj_toroverworld3
	    with(861) path_start(24/* path_torielwalkhouse2 */, 4, 0, 0/* path_action_stop */)
	}
	if(GS.plot > 18) {
	    // obj_toroverworld3
	    with(861) path_start(25/* path_torielwalkhouse3 */, 4, 0, 0/* path_action_stop */)
	}
	GS.flag[45]= 0

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
