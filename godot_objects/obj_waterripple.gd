# Auto-converted from GameMaker: obj_waterripple
extends Node2D

func _ready():
	x1= 0
	x2= 0
	y1= 0
	y2= 0
	mp= 0
	if(room == 84) {
	    x1= 220
	    y1= 60
	    x2= 380
	    y2= 180
	}
	if(room == 91) {
	    x1= 80
	    y1= 120
	    x2= 260
	    y2= 180
	}
	image_speed= 0

func _on_outside_room():
	if(instance_exists(1570/* obj_mainchara */)) {
	    frame+= 0.2
	    z_index= obj_mainchara.z_index - 100
	    x= obj_mainchara.x
	    y= obj_mainchara.y
	    draw_self_custom(x1, x2, y1, y2)
	    if(obj_mainchara.bbox_left > x1 - 5 and obj_mainchara.bbox_right < x2 + 5 and obj_mainchara.bbox_top > y1 - 5 and obj_mainchara.bbox_bottom < y2 + 5 and (obj_mainchara.frame == 1 or obj_mainchara.frame == 3)) {
	        snd_play(22/* snd_splash */)
	        mp= 0
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
