# Auto-converted from GameMaker: obj_toroverworld5
# GM parent: obj_toroverworld3
extends Node2D

func _process_end(delta: float):
	if(not instance_exists(779/* obj_dialoguer */)) {
	    instance_create(x, y, 865/* obj_toroverworld6 */)
	    GS.interact= 0
	    instance_destroy()
	}

func _gm_event_7_4():
	if(GS.plot > 7 or GS.plot < 6) instance_destroy()
	else  {
	    direction= 270
	    facing= 0
	    GS.msc= 216
	    GS.typer= 4
	    GS.facechoice= 1
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    GS.interact= 1
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
