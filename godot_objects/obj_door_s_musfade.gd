# Auto-converted from GameMaker: obj_door_s_musfade
# GM parent: obj_doorparent
extends Node2D

func _ready():
	touched= 0

func _gm_event_2_2():
	GS.entrance= 19
	instance_create(0, 0, 148/* obj_persistentfader */)
	if(room == 97) get_tree().change_scene_to_file("res://godot_rooms/99.tscn")
	if(room == 99) get_tree().change_scene_to_file("res://godot_rooms/116.tscn")
	if(room == 76) get_tree().change_scene_to_file("res://godot_rooms/68.tscn")
	if(room == 119) get_tree().change_scene_to_file("res://godot_rooms/122.tscn")
	if(room == 122) get_tree().change_scene_to_file("res://godot_rooms/119.tscn")
	if(room == 116) get_tree().change_scene_to_file("res://godot_rooms/99.tscn")
	if(room == 99) get_tree().change_scene_to_file("res://godot_rooms/116.tscn")
	if(room == 101) get_tree().change_scene_to_file("res://godot_rooms/104.tscn")
	if(room == 104) get_tree().change_scene_to_file("res://godot_rooms/101.tscn")
	if(room == 156) get_tree().change_scene_to_file("res://godot_rooms/213.tscn")
	if(room == 157) get_tree().change_scene_to_file("res://godot_rooms/213.tscn")
	if(room == 187) get_tree().change_scene_to_file("res://godot_rooms/213.tscn")
	if(room == 214) get_tree().change_scene_to_file("res://godot_rooms/213.tscn")
	if(room == 168) get_tree().change_scene_to_file("res://godot_rooms/213.tscn")
	if(room == 169) get_tree().change_scene_to_file("res://godot_rooms/213.tscn")
	if(room == 213) {
	    if(GS.flag[398] == 0) get_tree().change_scene_to_file("res://godot_rooms/214.tscn")
	    if(GS.flag[398] == 1) get_tree().change_scene_to_file("res://godot_rooms/156.tscn")
	    if(GS.flag[398] == 2) get_tree().change_scene_to_file("res://godot_rooms/157.tscn")
	    if(GS.flag[398] == 3) get_tree().change_scene_to_file("res://godot_rooms/168.tscn")
	    if(GS.flag[398] == 4) get_tree().change_scene_to_file("res://godot_rooms/169.tscn")
	    if(GS.flag[398] == 5) get_tree().change_scene_to_file("res://godot_rooms/187.tscn")
	}
	if(room == 212) get_tree().change_scene_to_file("res://godot_rooms/215.tscn")
	if(room == 216) get_tree().change_scene_to_file("res://godot_rooms/215.tscn")
	if(room == 215) {
	    if(GS.flag[431] == 0) get_tree().change_scene_to_file("res://godot_rooms/212.tscn")
	    if(GS.flag[431] == 1) get_tree().change_scene_to_file("res://godot_rooms/216.tscn")
	}
	if(room == 232) get_tree().change_scene_to_file("res://godot_rooms/235.tscn")
	if(room == 235) get_tree().change_scene_to_file("res://godot_rooms/232.tscn")
	if(room == 141) get_tree().change_scene_to_file("res://godot_rooms/242.tscn")
	if(room == 242) get_tree().change_scene_to_file("res://godot_rooms/141.tscn")
	if(room == 246) get_tree().change_scene_to_file("res://godot_rooms/261.tscn")
	if(room == 261) get_tree().change_scene_to_file("res://godot_rooms/246.tscn")
	if(room == 43) get_tree().change_scene_to_file("res://godot_rooms/44.tscn")
	if(room == 44) get_tree().change_scene_to_file("res://godot_rooms/43.tscn")
	if(room == 183) get_tree().change_scene_to_file("res://godot_rooms/314.tscn")
	if(room == 80) get_tree().change_scene_to_file("res://godot_rooms/68.tscn")
	if(room == 68) get_tree().change_scene_to_file("res://godot_rooms/80.tscn")
	if(room == 217) get_tree().change_scene_to_file("res://godot_rooms/230.tscn")
	if(room == 230) get_tree().change_scene_to_file("res://godot_rooms/217.tscn")
	if(room == 269) get_tree().change_scene_to_file("res://godot_rooms/268.tscn")

func _gm_event_7_19():
	GS.interact= 3
	instance_create(0, 0, 149/* obj_unfader */)
	if(GS.flag[7] == 0) instance_create(0, 0, 92/* obj_musfadeout */)
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
