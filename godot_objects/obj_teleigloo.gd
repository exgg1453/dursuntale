# Auto-converted from GameMaker: obj_teleigloo
extends Node2D

func _ready():
	scr_depth()
	con= 0
	xx= 1
	top= scr_marker(x, y, 1241)
	top.z_index= 10000

func _process(delta: float):
	if(con == 5) {
	    GS.interact= 1
	    if(xx < 15) xx+= 0.5
	    obj_mainchara.y= -60
	    obj_mainchara.x+= xx
	    obj_mainchara.x= ceil(obj_mainchara.x)
	    if(obj_mainchara.x >= 2100 and xx > 3) xx--
	    if(obj_mainchara.x >= 2335) {
	        obj_mainchara.x= 2336
	        obj_mainchara.y= 118
	        GS.facing= 0
	        GS.interact= 0
	        con= 0
	        xx= 1
	    }
	}
	if(con == 10) {
	    if(xx < 15) xx+= 0.5
	    GS.interact= 1
	    obj_mainchara.y= -60
	    obj_mainchara.x-= xx
	    obj_mainchara.x= floor(obj_mainchara.x)
	    if(obj_mainchara.x <= 960 and xx > 3) xx--
	    if(obj_mainchara.x <= 734) {
	        obj_mainchara.x= 732
	        obj_mainchara.y= 106
	        GS.facing= 0
	        GS.interact= 0
	        con= 0
	        xx= 1
	    }
	}

func _on_alarm_0_timeout():
	if(con == 0 and GS.interact == 0) {
	    snd_play(50/* snd_escaped */)
	    if(x < 1000) con= 5
	    if(x > 1000) con= 10
	    GS.interact= 1
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
