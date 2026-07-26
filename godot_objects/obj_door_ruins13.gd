# Auto-converted from GameMaker: obj_door_ruins13
# GM parent: obj_doorparent
extends Node2D

func _ready():
	touched= 0

func _gm_event_2_2():
	GS.entrance= 24
	instance_create(0, 0, 148/* obj_persistentfader */)
	if(room == 19) get_tree().change_scene_to_file("res://godot_rooms/21.tscn")
	if(room == 21) get_tree().change_scene_to_file("res://godot_rooms/19.tscn")
	if(room == 27) get_tree().change_scene_to_file("res://godot_rooms/23.tscn")
	if(room == 28) get_tree().change_scene_to_file("res://godot_rooms/31.tscn")
	if(room == 31) get_tree().change_scene_to_file("res://godot_rooms/28.tscn")
	if(room == 32) {
	    if(GS.flag[7] == 0) caster_free(GS.currentsong2)
	    get_tree().change_scene_to_file("res://godot_rooms/38.tscn")
	}
	if(room == 38) get_tree().change_scene_to_file("res://godot_rooms/32.tscn")
	if(room == 33) get_tree().change_scene_to_file("res://godot_rooms/37.tscn")
	if(room == 37) get_tree().change_scene_to_file("res://godot_rooms/33.tscn")
	if(room == 240) get_tree().change_scene_to_file("res://godot_rooms/236.tscn")
	if(room == 232) get_tree().change_scene_to_file("res://godot_rooms/235.tscn")
	if(room == 235) get_tree().change_scene_to_file("res://godot_rooms/232.tscn")
	if(room == 221) get_tree().change_scene_to_file("res://godot_rooms/225.tscn")
	if(room == 225) get_tree().change_scene_to_file("res://godot_rooms/221.tscn")
	if(room == 68) get_tree().change_scene_to_file("res://godot_rooms/69.tscn")
	if(room == 63) get_tree().change_scene_to_file("res://godot_rooms/66.tscn")
	if(room == 66) get_tree().change_scene_to_file("res://godot_rooms/63.tscn")
	if(room == 95) get_tree().change_scene_to_file("res://godot_rooms/97.tscn")
	if(room == 97) get_tree().change_scene_to_file("res://godot_rooms/95.tscn")
	if(room == 99) get_tree().change_scene_to_file("res://godot_rooms/123.tscn")
	if(room == 123) get_tree().change_scene_to_file("res://godot_rooms/99.tscn")
	if(room == 116) get_tree().change_scene_to_file("res://godot_rooms/99.tscn")
	if(room == 171) get_tree().change_scene_to_file("res://godot_rooms/176.tscn")
	if(room == 176) get_tree().change_scene_to_file("res://godot_rooms/171.tscn")
	if(room == 181) get_tree().change_scene_to_file("res://godot_rooms/187.tscn")
	if(room == 187) get_tree().change_scene_to_file("res://godot_rooms/181.tscn")
	if(room == 182) get_tree().change_scene_to_file("res://godot_rooms/313.tscn")
	if(room == 205) get_tree().change_scene_to_file("res://godot_rooms/198.tscn")
	if(room == 198) get_tree().change_scene_to_file("res://godot_rooms/205.tscn")
	if(room == 196) get_tree().change_scene_to_file("res://godot_rooms/204.tscn")
	if(room == 204) get_tree().change_scene_to_file("res://godot_rooms/196.tscn")
	if(room == 199) get_tree().change_scene_to_file("res://godot_rooms/206.tscn")
	if(room == 201) get_tree().change_scene_to_file("res://godot_rooms/207.tscn")
	if(room == 206) get_tree().change_scene_to_file("res://godot_rooms/199.tscn")
	if(room == 207) get_tree().change_scene_to_file("res://godot_rooms/201.tscn")
	if(room == 200) get_tree().change_scene_to_file("res://godot_rooms/208.tscn")
	if(room == 208) get_tree().change_scene_to_file("res://godot_rooms/200.tscn")
	if(room == 202) get_tree().change_scene_to_file("res://godot_rooms/209.tscn")
	if(room == 209) get_tree().change_scene_to_file("res://godot_rooms/202.tscn")
	if(room == 268) get_tree().change_scene_to_file("res://godot_rooms/94.tscn")
	if(room == 95) get_tree().change_scene_to_file("res://godot_rooms/94.tscn")
	if(room == 94) {
	    gox= 0
	    fsx= 0
	    if(GS.flag[5] == 66 and file_exists("undertale.ini")) {
	        ini_open("undertale.ini")
	        fsx= ini_read_real("General", "fun", 0)
	        if(fsx == 66 and GS.flag[5] == 66) {
	            gox= 1
	            GS.flag[5]= 0
	            ini_write_real("General", "fun", 0)
	        }
	        ini_close()
	    }
	    if(gox == 1) get_tree().change_scene_to_file("res://godot_rooms/268.tscn")
	    if(gox == 0) get_tree().change_scene_to_file("res://godot_rooms/95.tscn")
	}

func _gm_event_7_19():
	GS.interact= 3
	instance_create(0, 0, 149/* obj_unfader */)
	if((room == 38 or room == 32) and GS.flag[7] == 0)
	    instance_create(0, 0, 92/* obj_musfadeout */)
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
