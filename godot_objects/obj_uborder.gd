# Auto-converted from GameMaker: obj_uborder
# GM parent: obj_borderparent
extends Node2D

func _process(delta: float):
	if(x != GS.idealborder[0]) {
	    if(abs(x - GS.idealborder[0]) <= 15)
	        x= GS.idealborder[0]
	    else  {
	        if(x > GS.idealborder[0]) x-= 15
	        else  x+= 15
	    }
	}
	if((x == GS.idealborder[0] or y < GS.idealborder[2]) and y != GS.idealborder[2]) {
	    if(abs(y - GS.idealborder[2]) <= 15)
	        y= GS.idealborder[2]
	    else  {
	        if(y > GS.idealborder[2]) y-= 15
	        else  y+= 15
	    }
	}
	size= round((GS.idealborder[1] - GS.idealborder[0]) / 5)
	if(scale.x != size) {
	    if(abs(size - scale.x) <= 6) scale.x= size
	    if(scale.x > size)
	        scale.x-= 6
	    if(scale.x < size)
	        scale.x+= 6
	}
	if(instant == 1) y= GS.idealborder[2]
	if(instaborder == 1) {
	    x= GS.idealborder[0]
	    y= GS.idealborder[2]
	    scale.x= (GS.idealborder[1] - GS.idealborder[0]) / 5
	}

func _gm_event_7_4():
	x= GS.idealborder[0]
	y= GS.idealborder[2]
	scale.x= (GS.idealborder[1] - GS.idealborder[0]) / 5
	instant= 0

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
