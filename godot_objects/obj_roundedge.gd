# Auto-converted from GameMaker: obj_roundedge
extends Node2D

func _ready():
	edge= 1
	image= 2361
	w0= 800
	h0= 800
	rotspeed= -2
	part= 40
	col= 0
	vk= 1
	modulate.a= 0
	flashtime= 660
	ftimer= 0
	falpha= 0
	if(GS.flag[502] > 0) {
	    ftimer= 9999
	    modulate.a= 0.5
	}

func _on_outside_room():
	if(edge == 0) edge= 0.1
	if(part == 0) part= 1
	wp= w0 / part
	hp= h0 / part
	lside= view_xview[0]
	rside= view_xview[0] + view_wview[0]
	side= 0
	curx= 0
	size= 1
	col++
	color= make_color_hsv(col, 233, 200)
	if(col > 254) col= 0
	i= 0
	while(i < part) {
	    draw_sprite_part_ext(image, frame, wp * i + x, 0, wp * i, 999, get_viewport_rect().size.x / 2 + wp * i - 6, 0 - wp * i / 2, i, i, color, modulate.a)
	    draw_sprite_part_ext(image, frame, wp * i + x, 0, wp * i, 999, get_viewport_rect().size.x / 2 - wp * i + 6, 0 - wp * i / 2, -i, i, color, modulate.a)
	    i++
	}
	x+= rotspeed
	if(x > 800) x-= 800
	if(x < 0) x+= 800
	ftimer++
	if(ftimer > 630 and ftimer < 671) {
	    falpha+= 0.025
	    draw_set_alpha(falpha)
	    draw_set_color(16777215)
	    draw_rectangle(-10, -10, 999, 999, 0)
	}
	if(ftimer >= 671 and ftimer < 685) {
	    modulate.a= 0.5
	    falpha-= 0.1
	    draw_set_alpha(falpha)
	    draw_set_color(16777215)
	    draw_rectangle(-10, -10, 999, 999, 0)
	}
	if(ftimer == 671) {
	    // obj_asriel_body
	    with(569) {
	        aligncon= 4
	        specialnormal= 0
	    }
	    GS.turntimer= -2
	    if(GS.mnfight == 2)
	        GS.msg[0]= "* " + chr(ord('"')) + "The true final battle" + chr(ord('"')) + " was&  finally beginning."
	}
	draw_set_alpha(1)

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
