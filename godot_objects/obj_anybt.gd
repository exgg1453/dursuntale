# Auto-converted from GameMaker: obj_anybt
extends Node2D

func _ready():
	on= 0
	type= 0
	image_speed= 0

func _gm_event_2_6():
	// obj_npc_marker
	with(1363) instance_destroy()

func _process(delta: float):
	if(on <= 0) frame= 0
	if(on > 0) frame= 1
	on--
	if(on > 0 and keyboard_multicheck_pressed(0/* NOKEY */))
	    event_user(0)

func _on_alarm_0_timeout():
	if(on <= 0) snd_play(114/* snd_squeak */)
	on= 2

func _gm_event_7_10():
	if(type == 0) {
	    if(instance_exists(493/* obj_asgore_lastcutscene */))
	        obj_asgore_lastcutscene.con= 45
	    obj_asgore_lastcutscene.hearts= 0
	    snd_play(111/* snd_select */)
	    obj_heart.x= -999
	    // obj_fakeheart
	    with(748) instance_destroy()
	    // obj_anybt
	    with(756) instance_destroy()
	}
	if(type == 1) {
	    if(instance_exists(493/* obj_asgore_lastcutscene */))
	        obj_asgore_lastcutscene.con= 15
	    obj_asgore_lastcutscene.hearts= 1
	    snd_play(111/* snd_select */)
	    obj_heart.x= -999
	    // obj_fakeheart
	    with(748) instance_destroy()
	    // obj_anybt
	    with(756) instance_destroy()
	}
	if(type == 2) {
	    snd_play(111/* snd_select */)
	    caster_stop(-3)
	    snd_play(44/* snd_laz */)
	    strike= scr_marker(obj_flowey_wilt.x + 25, obj_flowey_wilt.y - 20, 757)
	    strike.scale.x= 1
	    strike.scale.y= 1
	    strike.image_speed= 0.25
	    obj_flowey_wilt.$Alarm8.start((22) / 30.0)
	    obj_flowey_wilt.$Alarm7.start((60) / 30.0)
	    // obj_anybt
	    with(756) instance_destroy()
	    // obj_fakeheart
	    with(748) instance_destroy()
	}
	if(type == 3) {
	    snd_play(111/* snd_select */)
	    // obj_flowey_wilt
	    with(522) event_user(1)
	    // obj_anybt
	    with(756) instance_destroy()
	    // obj_fakeheart
	    with(748) instance_destroy()
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
