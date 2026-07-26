# Auto-converted from GameMaker: obj_goofyrock
# GM parent: obj_readablesolid
extends CharacterBody2D

func _ready():
	phase= 0
	myinteract= 0
	scale.x= 1
	scale.y= 1
	conversation= 0
	pathtravel= 0
	if(GS.flag[33] == 1) {
	    x+= 60
	    conversation= 15
	}

func _gm_event_2_2():
	// obj_mainchara
	with(1570) uncan= 0
	obj_mainchara.speed= 0
	if(obj_mainchara.x > x + 15) obj_mainchara.velocity.x= 1

func _gm_event_2_1():
	// obj_mainchara
	with(1570) uncan= 0
	GS.interact= 0
	conversation++
	path_speed= 0
	obj_mainchara.speed= 0
	if(conversation == 9) {
	    // obj_spikes_room
	    with(1350) frame= 1
	}
	if(conversation > 13) {
	    GS.flag[33]= 1
	    x= 280
	    conversation= 15
	    // obj_spikes_room
	    with(1350) frame= 1
	}

func _on_destroy():
	myinteract= 3
	GS.msc= 505
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	if(conversation != 9) conversation++
	GS.interact= 1

func _process_begin(delta: float):
	scr_depth(0, 0, 0, 0, 0)
	if(not instance_exists(779/* obj_dialoguer */) and conversation == 1) {
	    path_start(38/* path_goofyrock */, 1, 0, 0/* path_action_stop */)
	    $Alarm1.start((11) / 30.0)
	    GS.interact= 1
	    conversation++
	    if(obj_mainchara.x > x + 15) obj_mainchara.velocity.x= 1
	}
	if(not instance_exists(779/* obj_dialoguer */) and conversation == 4) {
	    path_speed= 1
	    $Alarm1.start((11) / 30.0)
	    GS.interact= 1
	    conversation++
	    if(obj_mainchara.z_index > z_index) obj_mainchara.velocity.y= -1
	}
	if(not instance_exists(779/* obj_dialoguer */) and conversation == 7) {
	    path_speed= 1
	    $Alarm1.start((61) / 30.0)
	    GS.interact= 1
	    conversation++
	    if(obj_mainchara.z_index < z_index) obj_mainchara.velocity.y= 1
	    $Alarm2.start((11) / 30.0)
	}
	if(not instance_exists(779/* obj_dialoguer */) and conversation == 10.5) {
	    // obj_spikes_room
	    with(1350) frame= 0
	    path_speed= 2
	    $Alarm1.start((11) / 30.0)
	    conversation+= 0.5
	}
	if(not instance_exists(779/* obj_dialoguer */) and conversation == 13) {
	    path_speed= 1
	    $Alarm1.start((21) / 30.0)
	    GS.interact= 1
	    conversation++
	    if(obj_mainchara.x > x + 15) obj_mainchara.velocity.x= 1
	}
	if(conversation == 15) x= 280

func _on_alarm_0_timeout():
	if(GS.interact == 0) $Alarm0.start((1) / 30.0)

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
