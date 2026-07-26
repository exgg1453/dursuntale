# Auto-converted from GameMaker: obj_door_u
# GM parent: obj_doorparent
extends Node2D

func _ready():
	touched= 0

func _gm_event_2_2():
	GS.entrance= 21
	instance_create(0, 0, 148/* obj_persistentfader */)
	if(room == 68) get_tree().change_scene_to_file("res://godot_rooms/74.tscn")
	if(room == 74) get_tree().change_scene_to_file("res://godot_rooms/68.tscn")
	if(room == 273) get_tree().change_scene_to_file("res://godot_rooms/97.tscn")
	if(room == 97) get_tree().change_scene_to_file("res://godot_rooms/273.tscn")
	if(room == 148) get_tree().change_scene_to_file("res://godot_rooms/151.tscn")
	if(room == 151) get_tree().change_scene_to_file("res://godot_rooms/148.tscn")
	if(room == 204) get_tree().change_scene_to_file("res://godot_rooms/200.tscn")
	if(room == 200) get_tree().change_scene_to_file("res://godot_rooms/204.tscn")
	if(room == 196) get_tree().change_scene_to_file("res://godot_rooms/203.tscn")
	if(room == 203) get_tree().change_scene_to_file("res://godot_rooms/196.tscn")
	if(room == 254) get_tree().change_scene_to_file("res://godot_rooms/260.tscn")
	if(room == 260) get_tree().change_scene_to_file("res://godot_rooms/254.tscn")
	if(room == 210) get_tree().change_scene_to_file("res://godot_rooms/189.tscn")
	if(room == 189) get_tree().change_scene_to_file("res://godot_rooms/210.tscn")
	if(room == 268) get_tree().change_scene_to_file("res://godot_rooms/95.tscn")

func _gm_event_7_19():
	GS.interact= 3
	instance_create(0, 0, 149/* obj_unfader */)
	if(touched == 0) {
	    $Alarm2.start((14) / 30.0)
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
