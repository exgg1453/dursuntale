# Auto-converted from GameMaker: obj_lborder
# GM parent: obj_borderparent
extends Node2D

func _process_end(delta: float):
	if(x != GS.idealborder[0]) {
	    if(abs(x - GS.idealborder[0]) <= 15)
	        x= GS.idealborder[0]
	    else  {
	        if(x > GS.idealborder[0]) x-= 15
	        else  x+= 15
	    }
	}
	if(y != GS.idealborder[3]) {
	    if(abs(y - GS.idealborder[3]) <= 15)
	        y= GS.idealborder[3]
	    else  {
	        if(y > GS.idealborder[3]) y-= 15
	        else  y+= 15
	        if(obj_uborder.y > GS.idealborder[2] and obj_dborder.y > GS.idealborder[3])
	            y-= 15
	        if(obj_uborder.y < GS.idealborder[2] and obj_dborder.y < GS.idealborder[3])
	            y+= 15
	    }
	}
	size= round((GS.idealborder[2] - GS.idealborder[3]) / 5)
	if((x == GS.idealborder[0] or GS.idealborder[2] > y + scale.y * 5) and scale.y != size) {
	    if(abs(size - scale.y) <= 3) scale.y= size
	    if(scale.y > size)
	        scale.y-= 3
	    if(scale.y < size)
	        scale.y+= 3
	    if(obj_uborder.y > GS.idealborder[2] and obj_dborder.y > GS.idealborder[3])
	        scale.y+= 3
	    if(obj_uborder.y < GS.idealborder[2] and obj_dborder.y < GS.idealborder[3])
	        scale.y-= 3
	}
	y= obj_dborder.y
	scale.y= (obj_uborder.y - obj_dborder.y) / 5
	if(instaborder == 1) {
	    x= GS.idealborder[0]
	    y= GS.idealborder[2]
	    scale.y= (GS.idealborder[3] - GS.idealborder[2]) / 5
	}

func _gm_event_7_4():
	x= GS.idealborder[0]
	y= GS.idealborder[3]
	scale.y= -27
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
