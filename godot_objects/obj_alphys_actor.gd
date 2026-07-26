# Auto-converted from GameMaker: obj_alphys_actor
extends Node2D

func _ready():
	scr_depth(0, 0, 0, 0, 0)
	image_speed= 0
	dsprite= 1638
	usprite= 1651
	lsprite= 1650
	rsprite= 1643
	dtsprite= 1642
	utsprite= 1652
	ltsprite= 1649
	rtsprite= 1648
	myinteract= 0
	facing= 0
	fun= 0
	npcdir= 0
	d= 0

func _process(delta: float):
	if(d == 0) scr_depth()
	if(fun == 0) {
	    if(instance_exists(770/* obj_face_alphys */))
	        frame= obj_face_alphys.frame
	    else  {
	        myinteract= 0
	        if(speed == 0 and path_speed == 0) {
	            frame= 0
	            image_speed= 0
	        }
	        if(speed > 0) image_speed= 0.2
	        if(path_speed > 0) image_speed= 0.2
	        if(path_position == 1) {
	            frame= 0
	            image_speed= 0
	        }
	        if(npcdir == 1) scr_npcdir(0)
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
