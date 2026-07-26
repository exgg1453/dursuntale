# Auto-converted from GameMaker: obj_mettheart_burst
extends Node2D

func _ready():
	size= 1
	con= 0
	timer= -6
	shake= 0
	GS.turntimer= 40
	$Alarm1.start((1) / 30.0)
	another= 0
	// obj_mettattackgen
	with(414) dark= 0

func _gm_event_2_1():
	hdist= distance_to_point(homex - 5, homey)
	hdir= point_direction(x, y, homex - 5, homey)
	speed= hdist / 5
	direction= hdir

func _process(delta: float):
	scale.x= size
	scale.y= size
	timer++
	obj_mettb_body.hurt= 2
	obj_mettb_body.dsf= 2
	if(timer == 0) {
	    shake= 5
	    speed= 0
	    x= homex
	    y= homey
	}
	if(timer >= 0 and timer < 4) {
	    shake--
	    image_speed= 0.5
	    size-= 0.2
	}
	if(timer == 7) {
	    caster_play(326, 1, 1)
	    shake= 0
	    i= 0
	    while(i < 12) {
	        g= instance_create(x, y, 448/* obj_starburst_x */)
	        g.speed= 5.7 + random(0.6)
	        g.friction= 0.24 + random(0.02)
	        g.direction= i * 360 / 12 + random(5)
	        i++
	    }
	}
	if(timer > 7 and timer < 10) {
	    shake+= 6
	    size+= 0.75
	    if(another == 2) size+= 0.15
	    if(another == 3) size+= 0.25
	}
	if(timer == 13) {
	    image_speed= 0
	    frame= 0
	    size= 1
	}
	if(timer >= 13) {
	    shake-= 2
	    if(shake < 1) shake= 0
	}
	if(timer > 20) {
	    if(another != 0) {
	        if(another == 1) {
	            GS.turntimer= 900
	            mtb= instance_create(homex, homey, 449/* obj_mettheart_burst */)
	            mtb.homex= homex
	            mtb.homey= homey
	            mtb.another= 2
	            mtb.timer= 0
	            instance_destroy()
	        }
	        if(another == 2) {
	            mtb= instance_create(homex, homey, 449/* obj_mettheart_burst */)
	            mtb.homex= homex
	            mtb.homey= homey
	            mtb.another= 3
	            mtb.timer= 0
	            instance_destroy()
	        }
	        if(another == 3) {
	            obj_mettb_body.heartdead= 1
	            GS.turntimer= 900
	            obj_mettheart_4.lastcon= 3
	            instance_destroy()
	        }
	    } else  {
	        if(GS.turntimer > 9) GS.turntimer= 9
	        obj_mettb_body.dsf= 0
	    }
	}
	if(shake > 0) {
	    x= homex - 5 + shake - random(shake * 2)
	    y= homey + shake - random(shake * 2)
	}
	if(GS.turntimer < 0) {
	    if(another == 0) GS.faceemotion= 7
	    instance_destroy()
	}
	GS.faceemotion= 6

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
