# Auto-converted from GameMaker: obj_doorXmusicfade
# GM parent: obj_doorA
extends Node2D

func _gm_event_2_2():
	instance_create(0, 0, 148/* obj_persistentfader */)
	if(room == 68 and x < 1000) get_tree().change_scene_to_file("res://godot_rooms/311.tscn")
	if(room == 68 and x > get_viewport_rect().size.x - 80) get_tree().change_scene_to_file("res://godot_rooms/81.tscn")
	if(room == 81) get_tree().change_scene_to_file("res://godot_rooms/68.tscn")
	if(room == 65) {
	    get_tree().change_scene_to_file("res://godot_rooms/265.tscn")
	    exit
	} else  {
	    if(room == 265) {
	        get_tree().change_scene_to_file("res://godot_rooms/65.tscn")
	        exit
	    } else  {
	        if(room == 99) get_tree().change_scene_to_file("res://godot_rooms/116.tscn")
	        if(room == 116) get_tree().change_scene_to_file("res://godot_rooms/99.tscn")
	        if(room == 124) get_tree().change_scene_to_file("res://godot_rooms/312.tscn")
	        if(room == 182) get_tree().change_scene_to_file("res://godot_rooms/313.tscn")
	        if(room == 181) get_tree().change_scene_to_file("res://godot_rooms/187.tscn")
	        if(room == 187) get_tree().change_scene_to_file("res://godot_rooms/181.tscn")
	        if(room == 188) get_tree().change_scene_to_file("res://godot_rooms/183.tscn")
	        if(room == 183) get_tree().change_scene_to_file("res://godot_rooms/188.tscn")
	        if(room == 220) get_tree().change_scene_to_file("res://godot_rooms/226.tscn")
	        if(room == 226) get_tree().change_scene_to_file("res://godot_rooms/220.tscn")
	        if(room == 232) get_tree().change_scene_to_file("res://godot_rooms/235.tscn")
	        if(room == 235) get_tree().change_scene_to_file("res://godot_rooms/232.tscn")
	        if(room == 128) get_tree().change_scene_to_file("res://godot_rooms/315.tscn")
	        exit
	    }
	}

func _gm_event_7_19():
	GS.entrance= 24
	GS.interact= 3
	instance_create(0, 0, 149/* obj_unfader */)
	if(GS.flag[7] == 0) instance_create(0, 0, 92/* obj_musfadeout */)
	if(touched == 0) {
	    $Alarm2.start((13) / 30.0)
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
