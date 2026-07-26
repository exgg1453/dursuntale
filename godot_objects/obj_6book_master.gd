# Auto-converted from GameMaker: obj_6book_master
# GM parent: obj_6parent
extends Node2D

func _ready():
	booky= 0
	booky2= 0
	col= 0
	alrnum= 0
	$Alarm0.start((20) / 30.0)
	$Alarm5.start((40) / 30.0)
	$Alarm6.start((100) / 30.0)
	$Alarm7.start((30) / 30.0)
	$Alarm8.start((50) / 30.0)
	$Alarm9.start((80) / 30.0)
	$Alarm10.start((105) / 30.0)
	type= 0
	con= 0
	CoolHell= 0

func _gm_event_2_10():
	ry= 430
	rx= choose(100, 430)
	instance_create(rx, ry, 1622/* obj_6book_wordbullet */)
	$Alarm10.start((45 + random(40)) / 30.0)
	event_user(1)

func _gm_event_2_9():
	ry= 380
	rx= choose(100, 430)
	instance_create(rx, ry, 1622/* obj_6book_wordbullet */)
	$Alarm9.start((45 + random(40)) / 30.0)
	event_user(1)

func _gm_event_2_8():
	ry= 330
	rx= choose(100, 430)
	instance_create(rx, ry, 1622/* obj_6book_wordbullet */)
	$Alarm8.start((45 + random(40)) / 30.0)
	event_user(1)

func _gm_event_2_7():
	ry= 280
	rx= choose(100, 430)
	instance_create(rx, ry, 1622/* obj_6book_wordbullet */)
	$Alarm7.start((45 + random(40)) / 30.0)
	event_user(1)

func _gm_event_2_6():
	ry= 230
	rx= choose(100, 430)
	if(alrnum < 4) {
	    instance_create(rx, ry, 1622/* obj_6book_wordbullet */)
	    $Alarm6.start((45 + random(40)) / 30.0)
	    event_user(1)
	}

func _gm_event_2_5():
	if(CoolHell == 0) {
	    ry= 180
	    rx= choose(100, 430)
	    alrnum++
	    if(alrnum < 4) {
	        instance_create(rx, ry, 1622/* obj_6book_wordbullet */)
	        $Alarm5.start((55 + random(10)) / 30.0)
	        event_user(1)
	    } else  {
	        if(not instance_exists(1623/* obj_6book_act */)) {
	            CoolHell= 1
	            act= instance_create(rx, ry, 1623/* obj_6book_act */)
	            with(act) {
	                y+= sprite_height / 2 + 10
	                x+= sprite_width / 2
	            }
	            $Alarm5.start((-1) / 30.0)
	        }
	    }
	}

func _gm_event_2_4():
	con++

func _on_destroy():
	ry= 130
	rx= choose(100, 430)
	instance_create(rx, ry, 1622/* obj_6book_wordbullet */)
	$Alarm0.start((45 + random(40)) / 30.0)
	event_user(1)

func _gm_event_7_11():
	if(alrnum < 4) alarm[0]+= 5
	alarm[5]+= 5
	alarm[6]+= 5
	alarm[7]+= 5
	alarm[8]+= 5
	alarm[9]+= 5
	alarm[10]+= 5

func _on_outside_room():
	i= 0
	while(i < 6) {
	    draw_sprite_ext(2225/* spr_6book */, frame, 100, -170 + 170 * i + booky, 2, 2, 0, 16777215, 1)
	    draw_sprite_ext(2225/* spr_6book */, frame, 540, 170 * i + booky2, -2, -2, 0, 16777215, 1)
	    i++
	}
	booky+= 4
	booky2-= 4
	if(booky > 170) booky-= 170
	if(booky2 < -170) booky2+= 170
	if(con > 0 and con < 3) {
	    modulate.a-= 0.02
	    draw_set_color(16777215)
	    draw_rectangle(4, 4, 140, 230, 0)
	    draw_set_color(0)
	    draw_rectangle(8, 8, 136, 226, 0)
	    draw_set_color(16777215)
	    draw_set_font(10)
	    GS.typer= 70
	    GS.msg[0]= "You&called&for&help&..."
	    GS.msg[1]= "%%%"
	    if(not instance_exists(1598/* obj_flowey_writer */))
	        instance_create(14, 4, 1598/* obj_flowey_writer */)
	}
	if(con == 2) {
	    // obj_flowey_master
	    with(1585) pd= 1
	    type= 1
	    // obj_6book_wordbullet
	    with(1622) event_user(5)
	    con= 2.1
	    $Alarm4.start((50) / 30.0)
	}
	if(con == 3) {
	    GS.soul_rescue= 4
	    ini_open("undertale.ini")
	    ini_write_real("FFFFF", "P", 5)
	    ini_close()
	}
	if(con == 3.1) {
	    // obj_flowey_writer
	    with(1598) instance_destroy()
	    snd_play(154/* snd_break2_c */)
	    instance_create(0, 0, 1602/* obj_6flasher */)
	    // obj_flowey_master
	    with(1585) caster_play(mus_saved, 0.8, 0.9)
	    // obj_flowey_bulletmaster
	    with(1584) soultimer= soulmax - 150
	    // obj_6book_wordbullet
	    with(1622) event_user(4)
	    con= 3
	}
	if(obj_vsflowey_heart.x < 245) obj_vsflowey_heart.x= 245
	if(obj_vsflowey_heart.x > 382) obj_vsflowey_heart.x= 382
	if(obj_vsflowey_heart.y < 138) obj_vsflowey_heart.y= 138

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
