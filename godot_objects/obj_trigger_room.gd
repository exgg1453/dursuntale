# Auto-converted from GameMaker: obj_trigger_room
extends Node2D

func _ready():
	if(room == 88 and GS.plot > 106) instance_destroy()
	if(room == 131 and GS.plot > 118) instance_destroy()
	if(room == 131) scale.y= 10
	if(room == 116) scale.y= 20
	if(room == 154) scale.y= 5
	if(room == 154 and GS.plot > 134) instance_destroy()
	con= 0

func _on_alarm_0_timeout():
	if(room == 88 and GS.plot < 107) {
	    GS.plot= 107
	    instance_create(40, 340, 1339/* obj_stalkerflowey */)
	}
	if(room == 131 and GS.plot < 119) {
	    GS.plot= 119
	    instance_create(140, 420, 1339/* obj_stalkerflowey */)
	    obj_echoflower.xxx= 1
	}
	if(room == 116 and GS.flag[94] > 0 and GS.flag[95] == 0 and GS.interact == 0) {
	    GS.interact= 1
	    GS.battlegroup= 46
	    instance_create(0, 0, 142/* obj_battler */)
	}
	if(room == 154 and GS.interact == 0) {
	    GS.interact= 1
	    obj_cookshowevent.con= 50
	}
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
