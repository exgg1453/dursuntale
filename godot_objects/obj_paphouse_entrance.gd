# Auto-converted from GameMaker: obj_paphouse_entrance
# GM parent: obj_readable
extends Node2D

func _ready():
	myinteract= 0
	read= 0
	scale.x= 1
	scale.y= 1
	scr_depth()
	dooract= 0
	touched= 0
	if(GS.flag[88] > 1) dooract= 1

func _gm_event_2_2():
	GS.entrance= 1
	instance_create(0, 0, 148/* obj_persistentfader */)
	get_tree().change_scene_to_file("res://godot_rooms/76.tscn")
	snd_play(92/* snd_chug */)

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	if(GS.flag[88] == 0) GS.msg[0]= "* (It\'s locked.)/%%"
	if(GS.flag[88] == 1) {
	    scr_papface(0, 0)
	    if(GS.flag[66] == 1)
	        GS.msg[1]= "WOW^1, YOU\'RE SO&EAGER TO DATE&ME.../"
	    if(GS.flag[66] == 0)
	        GS.msg[1]= "WOW^1, YOU\'RE SO&EAGER TO HANG&OUT.../"
	    GS.msg[2]= "YOU\'RE TRYING TO&GO INTO MY HOUSE&WITHOUT ME!/"
	    GS.msg[3]= "THAT\'S REALLY&WEIRD!!!/%%"
	}
	if(GS.flag[88] > 1) GS.msg[0]= "* (It\'s unlocked.)/%%"
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)

func _process_begin(delta: float):
	if(dooract == 1 and collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, 1570, 0, 0))
	    event_user(2)

func _process(delta: float):
	if(myinteract == 1) {
	    GS.interact= 1
	    $Alarm0.start((1) / 30.0)
	    myinteract= 2
	}
	if(myinteract == 3 and not is_instance_valid(mydialoguer) and GS.interact != 3) {
	    GS.interact= 0
	    myinteract= 0
	}

func _gm_event_7_12():
	GS.interact= 3
	if(GS.flag[7] == 0) instance_create(0, 0, 92/* obj_musfadeout */)
	instance_create(0, 0, 149/* obj_unfader */)
	if(touched == 0) {
	    $Alarm2.start((13) / 30.0)
	    touched= 1
	}
	if(GS.flag[88] == 1) GS.flag[88]= 2

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
