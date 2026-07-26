# Auto-converted from GameMaker: obj_demodoorA
# GM parent: obj_doorparent
extends Node2D

func _ready():
	touched= 0
	if(room == 43) {
	    if(GS.flag[7] == 1) {
	        instance_create(x, y, 789/* obj_door_s_musfade */)
	        instance_destroy()
	    } else  {
	        instance_create(140, 400, 2/* obj_solidsmall */)
	        instance_create(160, 400, 2/* obj_solidsmall */)
	    }
	}

func _gm_event_2_2():
	caster_free(cym)
	if(room == 43) get_tree().change_scene_to_file("res://godot_rooms/325.tscn")
	if(room == 238) get_tree().change_scene_to_file("res://godot_rooms/239.tscn")

func _gm_event_7_19():
	GS.interact= 3
	if(touched == 0) {
	    caster_free(-3)
	    cym= caster_load("music/cymbal.ogg")
	    caster_play(cym, 0.9, 0.95)
	    instance_create(0, 0, 150/* obj_whitefader */)
	    $Alarm2.start((180) / 30.0)
	    touched= 1
	    GS.plot= 30
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
