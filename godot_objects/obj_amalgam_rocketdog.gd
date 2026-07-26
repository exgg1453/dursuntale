# Auto-converted from GameMaker: obj_amalgam_rocketdog
# GM parent: obj_amalgambul_parent
extends Node2D

func _ready():
	con= 0
	$Alarm4.start((10) / 30.0)
	image_speed= 0
	scale.x= 3
	scale.y= 3
	y= GS.idealborder[3] - sprite_height - 2
	x= GS.idealborder[1] - sprite_width
	shake= 0
	nowx= x
	nowy= y
	dmg= 9

func _gm_event_2_6():
	speed= 0
	nowx= x
	nowy= y
	shake= 1
	betty= distance_to_point(obj_heart.x + 8, obj_heart.y + 8)
	if(distance_to_point(obj_heart.x + 8, obj_heart.y + 8) < 50)
	    alarm[5]+= 8

func _gm_event_2_5():
	move_towards_point(obj_heart.x - 25, obj_heart.y - 20, 7 + random(3))
	$Alarm5.start((20 + random(10)) / 30.0)
	$Alarm6.start((14 + random(5)) / 30.0)
	shake= 0

func _gm_event_2_4():
	con++

func _process(delta: float):
	if(con == 1) {
	    nowx= x
	    nowy= y
	    image_speed= 0.25
	    if(frame >= 3) {
	        image_speed= 0
	        con= 2
	        $Alarm4.start((10) / 30.0)
	    }
	}
	if(con == 3) {
	    con= 4
	    $Alarm4.start((15) / 30.0)
	}
	if(con == 4 or shake == 1) {
	    x= nowx + random(3) - random(3)
	    y= nowy + random(3) - random(3)
	}
	if(con == 5) {
	    $Alarm5.start((1) / 30.0)
	    sprite_index= 705/* spr_nofacedog_rocket */
	    image_speed= 0.334
	    con= 6
	}
	betty= distance_to_point(obj_heart.x + 8, obj_heart.y + 8)
	if(GS.turntimer < 1) {
	    GS.turntimer= -1
	    GS.mnfight= 3
	    instance_destroy()
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
