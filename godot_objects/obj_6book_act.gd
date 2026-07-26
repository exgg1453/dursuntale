# Auto-converted from GameMaker: obj_6book_act
# GM parent: obj_centeract_parent
extends Node2D

func _ready():
	rotation_degrees= 0
	image_speed= 0
	type= 0
	con= 0
	if(x < 320) velocity.x= 2
	else  velocity.x= -2

func _gm_event_2_4():
	con++

func _process(delta: float):
	if(type == 1) {
	    if(speed > 0) speed-= 0.03
	    if(speed < 0) speed= 0
	}
	if(x > 405 - sprite_width / 2 and velocity.x > 0)
	    velocity.x= -velocity.x
	if(x < 250 + sprite_width / 2 and velocity.x < 0)
	    velocity.x= -velocity.x

func _gm_event_7_14():
	if(con == 0 and type == 0) {
	    type= 1
	    event_inherited()
	    // obj_6book_master
	    with(1624) {
	        con= 1
	        $Alarm4.start((100) / 30.0)
	    }
	}

func _on_outside_room():
	if(type == 1) modulate.a-= 0.04
	if(modulate.a < 0.08) instance_destroy()
	draw_sprite_ext(sprite_index, frame, x, y, 1, 1, rotation_degrees, 16777215, modulate.a)
	if(con == 999999) {
	    if(con > 0 and con < 3) {
	        modulate.a-= 0.02
	        draw_set_color(0)
	        draw_rectangle(200, 150, 500, 240, 0)
	        draw_set_color(16777215)
	        draw_set_font(10)
	        draw_text_transformed(200, 180, "You called for help...", 2, 2, 0)
	    }
	    if(con == 2) {
	        type= 1
	        // obj_6book_wordbullet
	        with(1622) event_user(5)
	        con= 2.1
	        $Alarm4.start((50) / 30.0)
	    }
	    if(con == 3.1) {
	        // obj_6book_wordbullet
	        with(1622) event_user(4)
	        con= 3
	    }
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
