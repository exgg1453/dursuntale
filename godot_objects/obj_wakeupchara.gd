# Auto-converted from GameMaker: obj_wakeupchara
extends Node2D

func _ready():
	active= 0
	if(room == 113 and GS.plot < 114) {
	    GS.flag[17]= 0
	    active= 1
	    obj_mainchara.rotation_degrees= -90
	    obj_mainchara.y+= 10
	    GS.facing= 0
	}

func _gm_event_2_2():
	active++

func _process(delta: float):
	if(active == 0) instance_destroy()
	if(active == 1) {
	    active= 2
	    $Alarm2.start((60) / 30.0)
	}
	if(active == 2) GS.interact= 1
	if(active == 3) {
	    active= 4
	    $Alarm2.start((10) / 30.0)
	}
	if(active == 5) {
	    obj_mainchara.rotation_degrees+= 18
	    obj_mainchara.y-= 4
	    obj_mainchara.x-= 8
	    if(obj_mainchara.rotation_degrees >= -1) {
	        obj_mainchara.rotation_degrees= 0
	        if(room == 113) GS.plot= 115
	        GS.interact= 0
	        instance_destroy()
	    }
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
