# Auto-converted from GameMaker: obj_6shoe_master
# GM parent: obj_6parent
extends Node2D

func _ready():
	stary= 420
	starx= 0
	siner= 0
	ioff= 0
	num= 0
	$Alarm0.start((10) / 30.0)
	type= 0
	stsp= 8

func _on_destroy():
	if(type == 0) {
	    if(num != 12) instance_create(get_viewport_rect().size.x + 10, 400, 1612/* obj_6shoe_part */)
	    else  instance_create(get_viewport_rect().size.x + 50, 400, 1613/* obj_6shoe_act */)
	    num++
	    $Alarm0.start((24) / 30.0)
	}

func _gm_event_7_15():
	type= 2

func _gm_event_7_14():
	if(type == 2 or type == 0) {
	    type= 1
	    i= 0
	    while(i < 30) {
	        instance_create(starx + i * 40, stary + sin(siner / 9) * 10, 1611/* obj_6shoe_musicnote */)
	        i++
	    }
	}

func _gm_event_7_11():
	if(GS.my_inv < 0) {
	    GS.my_inv= 20
	    hitted= 0
	    snd_play(156/* snd_hurt1_c */)
	    instance_create(0, 0, 1582/* obj_vsflowey_shaker */)
	    GS.my_hp-= 2
	    if(GS.my_hp <= 1) GS.my_hp= 1
	}

func _on_outside_room():
	siner++
	if(type == 0) {
	    starx-= 8
	    if(starx < -80) {
	        starx+= 80
	        ioff+= 2
	    }
	}
	if(type == 2) {
	    stsp-= 0.2
	    if(stsp < 0) stsp= 0
	    starx-= stsp
	}
	if(type == 0 or type == 2) {
	    i= 0
	    while(i < 30) {
	        draw_sprite_ext(2218/* spr_6shoe_star */, 0, starx + i * 40, stary + sin(siner / 9) * 10, 2, 2, siner * 4 + (i + ioff) * 16, 16777215, 1)
	        i++
	    }
	    if(collision_line(-20, stary + sin(siner / 9) * 10, get_viewport_rect().size.x + 20, stary + sin(siner / 9) * 10, 1581, 0, 1))
	        event_user(1)
	    if(obj_vsflowey_heart.y < stary + sin(siner / 9) * 10)
	        obj_vsflowey_heart.y= stary + sin(siner / 9) * 10
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
