# Auto-converted from GameMaker: obj_puddle
extends Node2D

func _ready():
	mysprite= sprite_index
	simage= 0
	death= 0
	image_speed= 0
	frame= random(12)

func _on_outside_room():
	if(instance_exists(1570/* obj_mainchara */)) {
	    draw_set_color(0)
	    draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, 0)
	    ndtry= 0
	    if(instance_exists(1115/* obj_mkid_actor */)) {
	        mm= 1115
	        sprito2= obj_mkid_actor.sprite_index
	        if(obj_mkid_actor.sprite_index == mm.rsprite) sprito2= 1378
	        if(mm.sprite_index == 1399) sprito2= 1379
	        if(mm.sprite_index == mm.dsprite) sprito2= 1376
	        if(mm.sprite_index == mm.usprite) sprito2= 1380
	        if(mm.sprite_index == mm.lsprite) sprito2= 1377
	        if(mm.z_index > obj_mainchara.z_index)
	            draw_custom_ext(bbox_left, bbox_right, bbox_top, bbox_bottom - 1, sprito2, mm.frame, 1, 1, 0.4, mm.x, mm.y + mm.sprite_height * 1)
	        else  ndtry= 1
	    }
	    sprito= obj_mainchara.sprite_index
	    if(obj_mainchara.rsprite == 1045) {
	        if(obj_mainchara.sprite_index == 1045) sprito= 1004
	        if(obj_mainchara.sprite_index == 1043) sprito= 1000
	        if(obj_mainchara.sprite_index == 1044) sprito= 1002
	        if(obj_mainchara.sprite_index == 1046) sprito= 1003
	    }
	    if(obj_mainchara.rsprite == 1018) {
	        if(obj_mainchara.sprite_index == 1018) sprito= 1014
	        if(obj_mainchara.sprite_index == 1016) sprito= 1012
	        if(obj_mainchara.sprite_index == 1017) sprito= 1013
	        if(obj_mainchara.sprite_index == 1019) sprito= 1015
	    }
	    if(death == 1) {
	        if(obj_mainchara.sprite_index == 1045) sprito= 1023
	        if(obj_mainchara.sprite_index == 1043) sprito= 1021
	        if(obj_mainchara.sprite_index == 1044) sprito= 1027
	        if(obj_mainchara.sprite_index == 1046) sprito= 1025
	    }
	    simage= obj_mainchara.frame
	    if(GS.flag[85] == 0)
	        draw_custom_ext(bbox_left, bbox_right, bbox_top, bbox_bottom - 1, sprito, simage, 1, 1, 0.4, obj_mainchara.x, obj_mainchara.y + obj_mainchara.sprite_height * 1)
	    if(GS.flag[85] == 1) {
	        if(obj_mainchara.sprite_index == obj_mainchara.dsprite) value= 3
	        if(obj_mainchara.sprite_index == obj_mainchara.usprite) value= 16
	        if(obj_mainchara.sprite_index == obj_mainchara.rsprite) value= 10
	        if(obj_mainchara.sprite_index == obj_mainchara.lsprite) value= 9
	        draw_custom_ext(bbox_left, bbox_right, bbox_top, bbox_bottom - 1, sprito, simage, 1, 1, 0.4, obj_mainchara.x - value, obj_mainchara.y + 30)
	    }
	    if(ndtry == 1)
	        draw_custom_ext(bbox_left, bbox_right, bbox_top, bbox_bottom - 1, sprito2, mm.frame, 1, 1, 0.4, mm.x, mm.y + mm.sprite_height * 1)
	    draw_sprite(sprite_index, frame, x, y)
	    if(GS.debug == 1 and Input.is_action_pressed("ui_accept"))
	        death= 1
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
