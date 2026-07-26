# Auto-converted from GameMaker: obj_shyrentrigger
extends Node2D

func _ready():
	if(GS.plot > 110) {
	    if(GS.flag[81] == 2) {
	    }
	    instance_destroy()
	}
	scale.y= 12

func _on_alarm_0_timeout():
	if(GS.interact == 0) {
	    GS.interact= 1
	    GS.battlegroup= 44
	    instance_create(0, 0, 142/* obj_battler */)
	    if(GS.plot < 111) GS.plot= 111
	    instance_destroy()
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
