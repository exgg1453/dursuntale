# Auto-converted from GameMaker: blt_dummyshot
# GM parent: blt_parent_noborder
extends Node2D

func _ready():
	dmg= 0
	move_towards_point(obj_heart.x, obj_heart.y, 3)

func _on_alarm_0_timeout():
	// obj_maddummy
	with(287) {
	    event_user(3)
	    event_user(7)
	}
	if(obj_maddum_drawer.alarm[5] < 2) {
	    // obj_maddum_drawer
	    with(288) event_user(2)
	}
	instance_destroy()

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
