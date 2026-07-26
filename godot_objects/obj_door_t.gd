# Auto-converted from GameMaker: obj_door_t
# GM parent: obj_doorparent
extends Node2D

func _ready():
	touched= 0

func _gm_event_2_2():
	GS.entrance= 20
	instance_create(0, 0, 148/* obj_persistentfader */)
	if(room == 68) get_tree().change_scene_to_file("res://godot_rooms/71.tscn")
	if(room == 71) get_tree().change_scene_to_file("res://godot_rooms/68.tscn")
	if(room == 95) get_tree().change_scene_to_file("res://godot_rooms/99.tscn")
	if(room == 97) get_tree().change_scene_to_file("res://godot_rooms/99.tscn")
	if(room == 99) get_tree().change_scene_to_file("res://godot_rooms/95.tscn")
	if(room == 101) get_tree().change_scene_to_file("res://godot_rooms/104.tscn")
	if(room == 104) get_tree().change_scene_to_file("res://godot_rooms/101.tscn")
	if(room == 116) get_tree().change_scene_to_file("res://godot_rooms/124.tscn")
	if(room == 124) get_tree().change_scene_to_file("res://godot_rooms/116.tscn")
	if(room == 148) get_tree().change_scene_to_file("res://godot_rooms/153.tscn")
	if(room == 162) get_tree().change_scene_to_file("res://godot_rooms/159.tscn")
	if(room == 159) get_tree().change_scene_to_file("res://godot_rooms/162.tscn")
	if(room == 153) get_tree().change_scene_to_file("res://godot_rooms/148.tscn")
	if(room == 155) get_tree().change_scene_to_file("res://godot_rooms/148.tscn")
	if(room == 171) get_tree().change_scene_to_file("res://godot_rooms/174.tscn")
	if(room == 174) get_tree().change_scene_to_file("res://godot_rooms/171.tscn")
	if(room == 246) get_tree().change_scene_to_file("res://godot_rooms/250.tscn")
	if(room == 250) get_tree().change_scene_to_file("res://godot_rooms/246.tscn")
	if(room == 251) get_tree().change_scene_to_file("res://godot_rooms/254.tscn")
	if(room == 254) get_tree().change_scene_to_file("res://godot_rooms/251.tscn")
	if(room == 139) get_tree().change_scene_to_file("res://godot_rooms/214.tscn")
	if(room == 214) get_tree().change_scene_to_file("res://godot_rooms/139.tscn")
	if(room == 78) get_tree().change_scene_to_file("res://godot_rooms/76.tscn")
	if(room == 79) get_tree().change_scene_to_file("res://godot_rooms/76.tscn")
	if(room == 76) {
	    if(GS.flag[497] <= 1) get_tree().change_scene_to_file("res://godot_rooms/79.tscn")
	    else  get_tree().change_scene_to_file("res://godot_rooms/78.tscn")
	}

func _gm_event_7_19():
	GS.interact= 3
	instance_create(0, 0, 149/* obj_unfader */)
	if(touched == 0) {
	    $Alarm2.start((14) / 30.0)
	    touched= 1
	}
	if(room == 76 and GS.flag[497] == 1) instance_create(0, 0, 92/* obj_musfadeout */)

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
