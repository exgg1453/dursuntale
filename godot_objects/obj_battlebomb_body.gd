# Auto-converted from GameMaker: obj_battlebomb_body
extends Node2D

func _ready():
	sha= 0
	scale.x= 2
	scale.y= 2
	type= 0
	siner= 0
	blenda= 16777215
	blendb= 32768
	coolwidth= 30
	got= 0
	myspeed= 10
	// obj_battlebg
	with(185) instance_destroy()
	defuse= 0
	image_speed= 0.1
	movetimer= 0
	cc= 0
	dd= 0
	flash= 0
	flasher= 0
	shudder= 0

func _on_outside_room():
	got= 0
	if(collision_rectangle(320 - coolwidth, 80, 320 + coolwidth, GS.idealborder[2] - 10, object_index, 0, 0)) {
	    blenda= 65535
	    if(defuse == 1) blenda= 65280
	    blendb= 65280
	    got= 1
	}
	dd= 0
	if(flash == 1) {
	    flasher++
	    if(flasher == 1) {
	        if(defuse == 0) snd_play(31/* snd_break1 */)
	        if(defuse == 1) {
	            snd_play(30/* snd_break2 */)
	            instance_create(0, 0, 118/* obj_flasher */)
	        }
	    }
	    if(flasher == 1 or flasher == 2 or flasher == 3 or flasher == 4 or flasher == 5)
	        dd= 1
	    if(flasher > 16) {
	        flasher= 0
	        flash= 0
	        dd= 0
	    }
	}
	draw_set_color(blendb)
	if(dd == 1)
	    draw_rectangle(320 - coolwidth, 80, 320 + coolwidth, GS.idealborder[2] - 10, 0)
	if(dd == 0)
	    draw_rectangle(320 - coolwidth, 80, 320 + coolwidth, GS.idealborder[2] - 10, 1)
	draw_rectangle(320 - coolwidth - 2, 82, 320 + coolwidth + 2, GS.idealborder[2] - 12, 1)
	draw_rectangle(320 - coolwidth - 4, 84, 320 + coolwidth + 4, GS.idealborder[2] - 14, 1)
	draw_sprite_ext(sprite_index, frame, x, y, 2, 2, 0, blenda, 1)
	draw_sprite_ext(491/* spr_defusebox */, 0, 320, 30, 2, 2, 0, blendb, 1)
	blenda= 16777215
	blendb= 32768
	if(type == 0) {
	    if(velocity.x == 0) velocity.x= myspeed
	    if(x > 560) {
	        x-= 15
	        velocity.x= -myspeed
	    }
	    if(x < 20) {
	        x+= 15
	        velocity.x= myspeed
	    }
	}
	if(type == 1) {
	    myspeed= 4
	    siner++
	    x+= sin(siner / 3) * 3
	    y+= cos(siner / 4) * 3
	    if(velocity.x == 0) velocity.x= myspeed
	    if(x > 400) {
	        x-= 6
	        velocity.x= -myspeed
	    }
	    if(x < 180) {
	        x+= 6
	        velocity.x= myspeed
	    }
	}
	if(type == 2) {
	    myspeed= 15
	    if(velocity.x == 0) velocity.x= myspeed
	    if(x > 660) {
	        x= 0
	        if(myspeed > 5) myspeed-= 0.5
	    }
	}
	if(type == 3) {
	    if(cc == 0) {
	        cc= 1
	        x= 40
	        startx= x
	    }
	    movetimer++
	    if(movetimer < 80) {
	        myspeed= 10
	        velocity.x= myspeed
	        if(x >= 320 - coolwidth - 110) {
	            velocity.x= 0
	            movetimer+= 10
	        }
	    }
	    if(movetimer > 80 and movetimer <= 160) {
	        myspeed= 5
	        velocity.x= -myspeed
	        if(x < 80) movetimer+= 10
	    }
	    if(movetimer > 160 and movetimer < 240) {
	        myspeed= 13
	        velocity.x= myspeed
	        if(x > 500) movetimer+= 20
	    }
	    if(movetimer > 240 and movetimer < 320) {
	        myspeed= -10
	        velocity.x= myspeed
	        if(x <= 320 + coolwidth + 10) {
	            velocity.x= 0
	            movetimer+= 20
	        }
	    }
	    if(movetimer > 320 and movetimer < 400) {
	        myspeed= 5
	        velocity.x= myspeed
	        if(x > 440) movetimer+= 20
	    }
	    if(movetimer > 400 and movetimer < 480) {
	        myspeed= -13
	        velocity.x= myspeed
	        if(x <= startx + 10) movetimer= 500
	    }
	    if(movetimer > 480) {
	        x= startx
	        movetimer= 0
	        velocity.x= 0
	        myspeed= 0
	    }
	}
	if(type == 4) {
	    siner++
	    x= 260 + sin(siner / 20) * 180
	    y= ystart + cos(siner / 3) * 60
	}
	if(type == 5) {
	    velocity.y= -25
	    if(y < -120) y= 930
	}
	if(type == 5) {
	    if(cc == 0) {
	        x-= 90
	        cc= 1
	    }
	    velocity.y= -20
	    if(y < -120) y= 860
	}
	if(type == 6) {
	    if(cc == 0) {
	        cc= 1
	        x= 320 - coolwidth - sprite_width - 10
	        startx= x
	    }
	    movetimer++
	    if(movetimer > 25 and movetimer < 60) {
	        velocity.x= 16
	        if(x > 320 + coolwidth + 10) movetimer= 100
	    }
	    if(movetimer >= 100 and movetimer < 125) velocity.x= 0
	    if(movetimer > 125 and movetimer < 180) {
	        velocity.x= -16
	        if(x <= startx) {
	            velocity.x= 0
	            movetimer= 0
	        }
	    }
	}
	if(defuse == 1) {
	    if(sprite_index == 492) sprite_index= 493/* spr_battlebomb_defuse */
	    if(sprite_index == 1519) sprite_index= 1520/* spr_tobdogl */
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
