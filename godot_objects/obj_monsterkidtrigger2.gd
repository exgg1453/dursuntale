# Auto-converted from GameMaker: obj_monsterkidtrigger2
extends Node2D

func _ready():
	if(GS.plot > 103) {
	    // obj_townnpc_monsterkid1
	    with(1481) instance_destroy()
	    instance_destroy()
	} else  {
	    conversation= 0
	    scale.y= 999
	}

func _process(delta: float):
	if(conversation == 1) {
	    t= 0
	    // obj_monsterkidtrigger1
	    with(1120) instance_destroy()
	    obj_townnpc_monsterkid1.velocity.x= 6
	    if(obj_mainchara.y < obj_townnpc_monsterkid1.y + 10)
	        obj_townnpc_monsterkid1.velocity.y= 2
	    GS.plot= 104
	}

func _on_alarm_0_timeout():
	if(conversation == 0) conversation= 1

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
