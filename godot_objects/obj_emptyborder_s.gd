# Auto-converted from GameMaker: obj_emptyborder_s
extends Node2D

func _ready():
	idealx= x
	idealy= y
	maxx= 20
	maxy= 310

func _process(delta: float):
	x= idealx
	y= idealy
	w= sprite_width
	h= sprite_height
	if(obj_heart.x < x + 4) {
	    if(x > maxx) {
	        idealx-= 0.5
	        x-= 0.5
	        event_user(0)
	    } else  {
	        x= maxx
	        idealx= maxx
	    }
	    obj_heart.x= ceil(x + 5)
	}
	if(obj_heart.y < y + 4) obj_heart.y= y + 4
	if(obj_heart.x > x + w - 16) obj_heart.x= x + w - 16
	if(obj_heart.y > y + h - 16) {
	    if(y < maxy and x == maxx) {
	        idealy+= 0.5
	        y+= 0.5
	        event_user(0)
	    }
	    obj_heart.y= floor(y + h - 17)
	}

func _gm_event_7_10():
	x= idealx + random(1) - random(1)
	y= idealy + random(1) - random(1)

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
