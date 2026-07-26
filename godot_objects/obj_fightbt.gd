# Auto-converted from GameMaker: obj_fightbt
# GM parent: obj_btparent
extends Node2D

func _process(delta: float):
	frame= 0
	if(GS.bmenucoord[0] == 0) {
	    if(GS.myfight == 0 and GS.mnfight == 0) frame= 1
	    if(GS.bmenuno == 0) {
	        obj_heart.x= x + 8
	        obj_heart.y= y + 14
	    }
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
