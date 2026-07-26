# Auto-converted from GameMaker: blt_dummybullet
# GM parent: blt_parent_noborder
extends Node2D

func _ready():
	dmg= 0
	type= 0
	side= 0
	move_towards_point(obj_heart.x, obj_heart.y, 2)
	angel= direction
	speed= 0.001
	image_speed= 0
	part= 0
	visible= 0
	$Alarm1.start((1) / 30.0)

func _gm_event_2_7():
	reds++
	if(sprite_index == 117) sprite_index= 112/* spr_dummybullet */
	else  sprite_index= 117/* spr_dummybullet_red */
	$Alarm7.start((5) / 30.0)
	if(reds > 4) {
	    event_user(1)
	    $Alarm7.start((-1) / 30.0)
	    $Alarm5.start((90) / 30.0)
	    speed= 2
	    friction= -0.2
	}

func _gm_event_2_5():
	instance_destroy()

func _gm_event_2_4():
	if(side == 0) direction= 180
	if(side == 1) direction= 0
	if(side == 2) direction= 90
	if(side == 3) direction= 270
	speed= 4
	$Alarm5.start((30) / 30.0)
	if(type == 0) {
	    fb= instance_create(x, y, 660/* blt_dummyshot */)
	    fb.speed= 1
	    fb.dmg= dmg
	    fb.friction= -0.15
	}
	if(type == 4) {
	    fb= instance_create(x, y, 661/* blt_dummymissle */)
	    fb.dmg= dmg
	}
	part= 2

func _gm_event_2_1():
	visible= 1
	if(side == 0) direction= 0
	if(side == 1) direction= 180
	if(side == 2) direction= 270
	if(side == 3) direction= 90
	speed= 4
	frame= side

func _process(delta: float):
	if(part < 1) {
	    remdir= direction
	    move_towards_point(obj_heart.x + 2, obj_heart.y + 2, 3)
	    angel= direction
	    direction= remdir
	    if(side == 0 and x > GS.idealborder[0] + 4) event_user(1)
	    if(side == 1 and x < GS.idealborder[1] - 22) event_user(1)
	    if(side == 2 and y > GS.idealborder[2] + 4) event_user(1)
	    if(side == 3 and y < GS.idealborder[3] - 22) event_user(1)
	}

func _gm_event_7_12():
	if(side == 0) direction= 180
	if(side == 1) direction= 0
	if(side == 2) direction= 90
	if(side == 3) direction= 270
	$Alarm5.start((90) / 30.0)

func _gm_event_7_11():
	speed= 0
	part= 1
	if(type == 0 or type == 4) $Alarm4.start((20) / 30.0)
	if(type == 1) {
	    $Alarm7.start((1) / 30.0)
	    sprite_index= 117/* spr_dummybullet_red */
	    reds= 0
	}
	if(type == 2) $Alarm5.start((-1) / 30.0)

func _on_outside_room():
	draw_self_border()

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
