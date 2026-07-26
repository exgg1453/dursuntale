# Auto-converted from GameMaker: obj_kitchenchecker
extends Node2D

func _ready():
	level= 1
	bgalpha= 1
	block[0]= instance_create(160, 54, 3/* obj_solidthin */)
	block[1]= instance_create(160, 77, 3/* obj_solidthin */)
	block[2]= instance_create(280, 54, 3/* obj_solidthin */)
	block[3]= instance_create(280, 77, 3/* obj_solidthin */)
	block[4]= instance_create(83, 90, 15/* obj_solidlong */)
	block[5]= instance_create(180, 60, 2/* obj_solidsmall */)
	block[6]= instance_create(180, 80, 2/* obj_solidsmall */)
	with(block[0]) instance_destroy()
	with(block[1]) instance_destroy()
	with(block[2]) instance_destroy()
	with(block[3]) instance_destroy()
	with(block[5]) instance_destroy()
	with(block[6]) instance_destroy()
	fridgex= obj_papfridge.x
	fridgey= obj_papfridge.y
	sinkx= obj_papsink.x
	sinky= obj_papsink.y
	initcheck= 0
	if(GS.flag[88] >= 4 and GS.flag[283] == 0) GS.flag[283]= 1

func _gm_event_2_2():
	if(obj_mainchara.bbox_top < 134) {
	    level= 0
	    if(not instance_exists(block[0])) {
	        block[0]= instance_create(160, 54, 3/* obj_solidthin */)
	        block[1]= instance_create(160, 77, 3/* obj_solidthin */)
	        block[2]= instance_create(280, 54, 3/* obj_solidthin */)
	        block[3]= instance_create(280, 77, 3/* obj_solidthin */)
	        block[5]= instance_create(180, 60, 2/* obj_solidsmall */)
	        block[6]= instance_create(180, 80, 2/* obj_solidsmall */)
	    }
	    if(instance_exists(block[4])) {
	        with(block[4]) instance_destroy()
	    }
	} else  {
	    level= 1
	    if(instance_exists(block[0])) {
	        with(block[0]) instance_destroy()
	        with(block[1]) instance_destroy()
	        with(block[2]) instance_destroy()
	        with(block[3]) instance_destroy()
	        with(block[5]) instance_destroy()
	        with(block[6]) instance_destroy()
	    }
	    if(not instance_exists(block[4]))
	        block[4]= instance_create(83, 90, 15/* obj_solidlong */)
	}

func _gm_event_2_1():
	if(obj_mainchara.bbox_top < 125) level= 2
	else  level= 1
	if(instance_exists(block[0])) {
	    with(block[0]) instance_destroy()
	    with(block[1]) instance_destroy()
	    with(block[2]) instance_destroy()
	    with(block[3]) instance_destroy()
	    with(block[5]) instance_destroy()
	    with(block[6]) instance_destroy()
	}
	if(not instance_exists(block[4]))
	    block[4]= instance_create(83, 90, 15/* obj_solidlong */)

func _process(delta: float):
	if(collision_line(0, 130, 80, 130, 1570, 0, 1)) $Alarm1.start((3) / 30.0)
	if(collision_line(200, 138, 260, 138, 1570, 0, 1)) $Alarm2.start((3) / 30.0)
	if(level == 0 and bgalpha > 0) {
	    bgalpha-= 0.2
	    if(bgalpha < 0.11) bgalpha= 0
	    background_alpha[2]= bgalpha
	}
	if(level > 0 and bgalpha < 1) {
	    bgalpha+= 0.2
	    if(bgalpha > 0.9) bgalpha= 1
	    background_alpha[2]= bgalpha
	}
	if(initcheck == 0) {
	    if(obj_mainchara.y < 120) $Alarm1.start((1) / 30.0)
	    else  $Alarm2.start((1) / 30.0)
	    initcheck= 1
	}

func _on_outside_room():
	draw_sprite_ext(1625/* spr_upperlayer */, 0, 0, 0, 1, 1, 0, 16777215, bgalpha)
	draw_sprite_ext(1630/* spr_bonepainting */, 0, 140, 15, 1, 1, 0, 16777215, bgalpha)

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
