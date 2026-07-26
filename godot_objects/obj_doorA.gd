# Auto-converted from GameMaker: obj_doorA
# GM parent: obj_doorparent
extends Node2D

func _ready():
	touched= 0

func _gm_event_2_2():
	GS.entrance= 1
	instance_create(0, 0, 148/* obj_persistentfader */)
	if(room != 236) room_goto(room_next(room))
	else  {
	    if(GS.flag[7] == 1) get_tree().change_scene_to_file("res://godot_rooms/240.tscn")
	    else  room_goto_next()
	}

func _gm_event_7_19():
	GS.interact= 3
	instance_create(0, 0, 149/* obj_unfader */)
	if(touched == 0) {
	    $Alarm2.start((8) / 30.0)
	    touched= 1
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
