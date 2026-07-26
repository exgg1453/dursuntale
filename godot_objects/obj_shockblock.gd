# Auto-converted from GameMaker: obj_shockblock
extends Node2D

func _ready():
	shocking= 0
	hat= 0

func _on_destroy():
	obj_mainchara.x= memoryx
	obj_mainchara.y= memoryy
	if(obj_mainchara.y > 134 and obj_mainchara.x < 145) obj_mainchara.y= 134
	shocking= 0
	GS.interact= 0
	snd_stop(24)

func _process(delta: float):
	if(instance_exists(995/* obj_orbhead */) and obj_orbhead.onhead == 1) {
	    hat= 1
	    solid= 1
	}
	if(shocking == 1 and hat == 1) {
	    GS.interact= 1
	    shocking= 2
	    snd_play(24/* snd_shock */)
	    $Alarm0.start((15) / 30.0)
	    memoryx= obj_mainchara.xprevious
	    memoryy= obj_mainchara.yprevious
	}
	if(shocking == 1 and hat == 0) {
	    obj_mainchara.x= obj_mainchara.xprevious
	    obj_mainchara.y= obj_mainchara.yprevious
	}
	if(shocking == 2 and hat == 1) {
	    ggg= floor(random(5)) - 2
	    obj_mainchara.x= memoryx + ggg
	    ggg= floor(random(5)) - 2
	    obj_mainchara.y= memoryy + ggg
	}

func _on_alarm_0_timeout():
	if(instance_exists(998/* obj_papyrus2 */)) {
	    if(obj_mainchara.x < 150 and obj_mainchara.y > 135) obj_mainchara.y= 135
	    if(obj_mainchara.x < 84) obj_mainchara.x= 84
	    if(obj_mainchara.x < 108 and obj_mainchara.y < 102) obj_mainchara.y= 102
	    if(shocking == 0) shocking= 1
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
