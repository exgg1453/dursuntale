# Auto-converted from GameMaker: obj_moldsmalx_body
# GM parent: obj_monsterparent
extends Node2D

func _ready():
	image_speed= 0.1
	scale.x= 2
	scale.y= 2
	height= 50
	xsin= 0
	stage= 0

func _gm_event_1_0():
	if(instance_exists(292/* obj_moldsmalx_part */)) obj_moldsmalx_part.f= 1

func _on_outside_room():
	if(stage == 0)
	    draw_sprite(sprite_index, frame, x, y)
	if(stage == 1) {
	    xsin2= cos(xsin / 10) * 4
	    sprite_index= 256/* spr_moldsmalx_up */
	    g= instance_create(x, y + 170, 292/* obj_moldsmalx_part */)
	    g.c= 1
	    g= instance_create(x, y + 140, 292/* obj_moldsmalx_part */)
	    g= instance_create(x, y + 110, 292/* obj_moldsmalx_part */)
	    g.c= 1
	    instance_create(x, y + 80, 292/* obj_moldsmalx_part */)
	    if(room == 278 or room == 305)
	        obj_moldsmalx_part.bborder= ystart + 100
	    stage= 2
	}
	if(stage == 2) {
	    height+= 2
	    y-= 4
	    draw_sprite_part_ext(sprite_index, frame, 0, 0, 50, height, x + xsin2, y, 2, 2, 16777215, 1)
	    if(height > 104) stage= 3
	}
	if(stage == 3) {
	    obj_moldsmalx_part.f= 2
	    xsin2= cos(xsin / 10) * 4
	    draw_sprite_part_ext(sprite_index, frame, 0, 0, 50, height, x + xsin2, y, 2, 2, 16777215, 1)
	    xsin++
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
