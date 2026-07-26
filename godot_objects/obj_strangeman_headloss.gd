# Auto-converted from GameMaker: obj_strangeman_headloss
# GM parent: obj_amalgambul_parent
extends Node2D

func _ready():
	scale.x= 2
	scale.y= 2
	image_speed= 0
	y= GS.idealborder[3] - sprite_height + 15
	x= GS.idealborder[1] - sprite_width + 19
	walking= 0
	shake= 2
	nowy= y
	nowx= x
	$Alarm5.start((30) / 30.0)
	trueindex= 5
	active= 0
	atimer= 0
	dmg= 9

func _gm_event_2_6():
	$Alarm6.start((40) / 30.0)
	sm= instance_create(x, y, 537/* obj_strangeman_butterfly */)
	sm.king= 743
	sm.$Alarm0.start((-1) / 30.0)
	sm.$Alarm6.start((-1) / 30.0)
	sm.direction= point_direction(sm.x, sm.y, obj_heart.x + 6, obj_heart.y + 6)
	sm.speed= 4

func _gm_event_2_5():
	active= 1
	trueindex= 0
	instance_create(x, y, 534/* obj_strangeman_head */)
	$Alarm5.start((15) / 30.0)
	atimer= 0

func _gm_event_2_1():
	frame= 0
	$Alarm0.start((20) / 30.0)
	walking= 0
	image_speed= 0

func _on_destroy():
	walking= 1
	frame= 1
	image_speed= 0.2
	$Alarm1.start((20) / 30.0)

func _process_end(delta: float):
	if(GS.turntimer < 1) instance_destroy()

func _on_outside_room():
	if(shake > 0) {
	    x= nowx + random(shake) - random(shake)
	    y= nowy + random(shake) - random(shake)
	}
	if(walking == 1) nowx--
	if(active == 1) {
	    atimer++
	    if(atimer > 5 and trueindex < 5)
	        trueindex++
	}
	draw_sprite_ext(sprite_index, 0, x, y, 2, 2, 0, 16777215, 1)
	draw_sprite_ext(693/* spr_growneck */, trueindex, x, y, 2, 2, 0, 16777215, 1)

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
