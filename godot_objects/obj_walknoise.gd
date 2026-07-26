# Auto-converted from GameMaker: obj_walknoise
extends Node2D

func _ready():
	mynoise= caster_load("music/snowwalk.ogg")
	if(GS.plot <= 35) {
	    caster_loop(mynoise, 1, 0.8)
	    caster_set_panning(mynoise, -1)
	}

func _gm_event_1_0():
	caster_free(mynoise)

func _on_destroy():
	if(instance_exists(1570/* obj_mainchara */)) {
	    if(obj_mainchara.xprevious < obj_mainchara.x or GS.facing == 1 or obj_time.right == 1) {
	        if(obj_mainchara.x > x) caster_set_volume(mynoise, 1)
	    } else  caster_set_volume(mynoise, 0)
	    $Alarm0.start((6) / 30.0)
	} else  caster_set_volume(mynoise, 0)
	GS.flag[47]++

func _gm_event_7_5():
	caster_free(mynoise)

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
