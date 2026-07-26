# Auto-converted from GameMaker: obj_6glove_act
# GM parent: obj_centeract_parent
extends Node2D

func _ready():
	frame= 0
	image_speed= 0
	visible= 0
	type= 0
	con= 0

func _gm_event_2_4():
	con++

func _process(delta: float):
	visible= 1

func _gm_event_7_14():
	if(con == 0) {
	    event_inherited()
	    con= 1
	    $Alarm4.start((100) / 30.0)
	}

func _on_outside_room():
	draw_sprite_ext(sprite_index, frame, x, y, 1, 1, rotation_degrees, 16777215, modulate.a)
	if(con > 0 and con < 3) {
	    // obj_6glove_boss
	    with(1617) event_user(5)
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
	    // obj_6glove_part
	    with(1615) event_user(5)
	    con= 2.1
	    // obj_flowey_master
	    with(1585) pd= 1
	    $Alarm4.start((50) / 30.0)
	}
	if(con == 2.1) {
	    // obj_6glove_part
	    with(1615) event_user(5)
	}
	if(con == 3) {
	    GS.soul_rescue= 2
	    ini_open("undertale.ini")
	    ini_write_real("FFFFF", "P", 3)
	    ini_close()
	    // obj_6glove_part
	    with(1615) event_user(4)
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
	    // obj_6glove_part
	    with(1615) event_user(4)
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
