# Auto-converted from GameMaker: obj_f_handgun
extends Node2D

func _ready():
	side= choose(0, 1)
	visible= 0
	$Alarm0.start((1) / 30.0)
	con= 0
	image_speed= 1
	scale.x= 1

func _gm_event_2_4():
	con++

func _on_destroy():
	visible= 1
	if(side == 0) {
	    x= 70
	    $Alarm4.start((24) / 30.0)
	    con= 1
	}
	if(side == 1) {
	    x= get_viewport_rect().size.x - 70
	    scale.x= -1
	    $Alarm4.start((24) / 30.0)
	    con= 1
	}

func _process(delta: float):
	if(con == 2) {
	    image_speed= 0
	    velocity.x= 0
	    snd_stop(163)
	    snd_play(163/* mus_sfx_a_target */)
	    con= 2.1
	    $Alarm4.start((8) / 30.0)
	}
	if(con == 3.1) {
	    snd_stop(164)
	    caster_play(164, 0.75, 1 + random(0.15))
	    hf= instance_create(x, y, 1628/* obj_f_handfork */)
	    hs= instance_create(x, y, 1630/* obj_f_shotflame */)
	    if(side == 0) {
	        hf.scale.x= 1
	        hf.velocity.x= 16
	        hf.friction= -0.2
	    }
	    if(side == 1) {
	        hf.scale.x= -1
	        hf.velocity.x= -16
	        hf.friction= -0.2
	        hs.scale.x= -0.5
	    }
	    frame= 25
	    image_speed= 1
	    con= 3
	    $Alarm4.start((2) / 30.0)
	}
	if(con == 4) {
	    con= 5
	    $Alarm4.start((6) / 30.0)
	}
	if(con == 6) {
	    con= 7
	    $Alarm4.start((20) / 30.0)
	}
	if(con == 8) instance_destroy()

func _on_outside_room():
	draw_sprite_ext(sprite_index, frame, x, y, scale.x, scale.y, 0, 16777215, 1)
	if(con == 2.1) {
	    draw_set_color(255)
	    draw_line(0, y, 700, y)
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
