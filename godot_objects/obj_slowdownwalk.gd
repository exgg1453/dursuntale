# Auto-converted from GameMaker: obj_slowdownwalk
extends Node2D

func _ready():
	sl= 0

func _process_end(delta: float):
	if(sl == 1) {
	    if(obj_mainchara.xprevious == obj_mainchara.x - 3 or obj_mainchara.xprevious == obj_mainchara.x - 2)
	        obj_mainchara.x--
	    if(obj_mainchara.xprevious == obj_mainchara.x + 3 or obj_mainchara.xprevious == obj_mainchara.x + 2)
	        obj_mainchara.x++
	    if(obj_mainchara.yprevious == obj_mainchara.y - 3 or obj_mainchara.yprevious == obj_mainchara.y - 2)
	        obj_mainchara.y--
	    if(obj_mainchara.yprevious == obj_mainchara.y + 3 or obj_mainchara.yprevious == obj_mainchara.y + 2)
	        obj_mainchara.y++
	}

func _on_alarm_0_timeout():
	sl= 1

func _on_outside_room():
	if(sl == 1)
	    draw_sprite(1798/* spr_webgunk_1 */, obj_mainchara.frame, obj_mainchara.x, obj_mainchara.y)
	sl= 0

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
