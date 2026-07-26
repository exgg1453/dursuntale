# Auto-converted from GameMaker: obj_tembody
# GM parent: obj_monsterparent
extends Node2D

func _ready():
	image_speed= 0.1
	scale.x= 2
	scale.y= 2
	facex= x + 22
	facey= y + 40
	facetime= 0
	r= 0.5
	atk= 0
	smuggy= 10

func _gm_event_2_9():
	_play_sound("149")

func _gm_event_2_3():
	smuggy= 10
	if(GS.mnfight == 2 and not instance_exists(671/* blt_temhand */) and not instance_exists(662/* obj_maintem */))
	    GS.mnfight= 3

func _on_outside_room():
	draw_sprite_ext(sprite_index, frame, xstart + random(r), ystart + random(r), scale.x, scale.y, 0, 16777215, 1)
	if(atk != 3)
	    draw_sprite_ext(254/* spr_temface */, frame, facex + random(r), facey + random(r), scale.x, scale.y, 0, 16777215, 1)
	if(r < 2) r+= 0.01
	if(atk > 0) r= 0
	facetime++
	if(facetime > 300 and facex < x + 100)
	    facex+= 0.01
	if(atk == 3) {
	    if(smuggy < 100) smuggy++
	    draw_sprite_part_ext(250, 0, 0, 0, 100, smuggy, x + 100, y, 1, 1, 16777215, 1)
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
