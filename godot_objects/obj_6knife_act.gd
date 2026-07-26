# Auto-converted from GameMaker: obj_6knife_act
# GM parent: obj_centeract_parent
extends Node2D

func _ready():
	anger= choose(4, -4)
	sp= choose(-1, 1)
	rotation_degrees= 0
	image_speed= 0
	type= 0
	j= 0
	while(j < 6) {
	    i= 0
	    while(i < 7) {
	        kn= instance_create(-sprite_width * 4 + sprite_width * i, -sprite_width * 2 + sprite_width * j, 1625/* obj_6knife */)
	        kn.relx= kn.xstart - x
	        kn.rely= kn.ystart - y
	        i++
	    }
	    j++
	}
	// obj_flowey_bulletmaster
	with(1584) soulmax+= 90
	visible= 0
	$Alarm0.start((1) / 30.0)
	con= 0

func _gm_event_2_4():
	con++

func _gm_event_2_2():
	velocity.x= 2 * sp
	velocity.y= 2.5

func _on_destroy():
	y= -300
	x= get_viewport_rect().size.x / 2
	visible= 1
	// obj_6knife
	with(1625) visible= 1
	$Alarm2.start((30) / 30.0)

func _process(delta: float):
	if(type == 0) rotation_degrees+= anger
	if(x > get_viewport_rect().size.x - 60 and velocity.x > 0)
	    velocity.x= -velocity.x
	if(x < 60 and velocity.x < 0) velocity.x= -velocity.x
	if(y < 60 and velocity.y < 0) velocity.y= -velocity.y
	if(y > get_viewport_rect().size.y - 60 and velocity.y > 0)
	    velocity.y= -velocity.y
	if(type == 1) {
	    if(speed > 0) speed-= 0.03
	    if(speed < 0) speed= 0
	}

func _on_alarm_0_timeout():
	if(other.type == 0) {
	    // other
	    with(-2) instance_destroy()
	}

func _gm_event_7_14():
	if(con == 0) {
	    event_inherited()
	    con= 1
	    $Alarm4.start((180) / 30.0)
	}

func _on_outside_room():
	draw_sprite_ext(sprite_index, frame, x, y, 1, 1, rotation_degrees, 16777215, modulate.a)
	if(con > 0 and con < 3) {
	    modulate.a-= 0.02
	    draw_set_color(16777215)
	    draw_rectangle(106, 146, 534, 204, 0)
	    draw_set_color(0)
	    draw_rectangle(110, 150, 530, 200, 0)
	    draw_set_color(16777215)
	    draw_set_font(10)
	    GS.typer= 70
	    GS.msg[0]= "* You called for help..."
	    GS.msg[1]= "%%%"
	    if(not instance_exists(1598/* obj_flowey_writer */))
	        instance_create(110, 140, 1598/* obj_flowey_writer */)
	}
	if(con == 2) {
	    type= 1
	    // obj_6knife
	    with(1625) event_user(5)
	    // obj_flowey_master
	    with(1585) pd= 1
	    con= 2.1
	    $Alarm4.start((50) / 30.0)
	}
	if(con == 3) {
	    GS.soul_rescue= 1
	    ini_open("undertale.ini")
	    ini_write_real("FFFFF", "P", 2)
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
	    // obj_6knife
	    with(1625) event_user(4)
	    con= 3
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
