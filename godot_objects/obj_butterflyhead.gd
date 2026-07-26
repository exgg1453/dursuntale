# Auto-converted from GameMaker: obj_butterflyhead
# GM parent: obj_amalgambul_parent
extends Node2D

func _ready():
	scale.x= 2
	scale.y= 2
	image_speed= 0
	y= GS.idealborder[3] - sprite_height + 15
	x= GS.idealborder[1] - sprite_width + 19
	repeat(50) 
	    instance_create(x + random(20) - random(20), y + random(20) - random(20), 537/* obj_strangeman_butterfly */)
	$Alarm0.start((20) / 30.0)
	walking= 0
	shake= 2
	nowy= y
	nowx= x
	$Alarm5.start((10) / 30.0)
	$Alarm6.start((30) / 30.0)
	factor= 15
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
	$Alarm5.start((factor) / 30.0)
	repeat(3)  {
	    sm= instance_create(x, y, 537/* obj_strangeman_butterfly */)
	    sm.king= 743
	    sm.$Alarm0.start((-1) / 30.0)
	    sm.$Alarm6.start((-1) / 30.0)
	    sm.direction= 160 + random(100)
	    sm.speed= 4
	}

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

func _process(delta: float):
	if(shake > 0) {
	    x= nowx + random(shake) - random(shake)
	    y= nowy + random(shake) - random(shake)
	}
	if(walking == 1) nowx--
	factor+= 0.04

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
