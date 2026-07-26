# Auto-converted from GameMaker: obj_holedown
extends Node2D

func _ready():
	visible= 0

func _gm_event_2_2():
	obj_mainchara.modulate.a= 1
	obj_mainchara.velocity.y= 0
	GS.interact= 0
	GS.phasing= 0
	obj_solidparent.solid= 1

func _gm_event_2_1():
	if(GS.phasing == 1) {
	    GS.facing++
	    if(GS.facing > 3) GS.facing= 0
	    $Alarm1.start((4) / 30.0)
	}

func _on_destroy():
	GS.facing= 0
	obj_mainchara.modulate.a= 0.5
	obj_mainchara.velocity.y= 5
	obj_solidparent.solid= 0
	$Alarm2.start((81) / 30.0)
	$Alarm1.start((4) / 30.0)
	snd_play(134/* snd_fall2 */)

func _on_alarm_0_timeout():
	if(GS.phasing == 0 and GS.interact == 0) {
	    GS.interact= 4
	    GS.phasing= 1
	    $Alarm0.start((10) / 30.0)
	    ns= 1
	    instance_create(other.x, other.y + 20, 921/* obj_cosmetichole */)
	    if(instance_number(921) > 10 and room == 16) {
	        ns= 0
	        snd_play(3/* snd_hero */)
	        // obj_cosmetichole
	        with(921) destroyme= 1
	        GS.interact= 0
	        GS.phasing= 0
	        instance_destroy()
	    }
	    if(instance_number(921) >= 1000) {
	        // obj_cosmetichole
	        with(921) destroyme= 1
	        instance_create(other.x, other.y + 20, 921/* obj_cosmetichole */)
	    }
	    if(ns == 1) snd_play(106/* snd_noise */)
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
