# Auto-converted from GameMaker: obj_exhaustbullet
# GM parent: blt_parent
extends Node2D

func _ready():
	off= 0
	$Alarm0.start((1) / 30.0)

func _on_destroy():
	if(off == 0) {
	    gravity= 0.1
	    gravity_direction= 0
	}
	if(off == 1) {
	    gravity= 0.1
	    gravity_direction= 180
	}
	if(off == 2) {
	    gravity= 0.1
	    gravity_direction= 60 + random(60)
	    pop= scr_monstersum()
	    if(pop > 1) instance_destroy()
	}

func _gm_event_7_0():
	instance_destroy()

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
