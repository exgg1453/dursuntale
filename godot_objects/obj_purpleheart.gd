# Auto-converted from GameMaker: obj_purpleheart
extends Node2D

func _ready():
	ttype= 0
	yadd= 0
	yadd2= 3
	yz2= 0
	if(ttype == 0 or ttype == 3) {
	    type= 0
	    xmid= (GS.idealborder[0] + GS.idealborder[1]) / 2
	    xlen= 100
	    yamt= 3
	    yspace= 40
	    yno= 2
	    yzero= GS.idealborder[2] + 30
	    $Alarm9.start((1) / 30.0)
	    visible= 0
	    moving= 0
	    space= 0
	    yadd2= 3
	}
	if(ttype == 1) {
	    type= 0
	    xmid= (GS.idealborder[0] + GS.idealborder[1]) / 2
	    xlen= 100
	    yamt= 7
	    yspace= 40
	    yno= 2
	    yzero= 100
	    $Alarm9.start((1) / 30.0)
	    visible= 0
	    moving= 0
	    space= 0
	    yadd= 3
	}
	yoff= 0

func _gm_event_2_9():
	x= xmid
	y= yzero + (yno - 1) * yspace
	visible= 1

func _process(delta: float):
	if(GS.invc > 0 or obj_battlecontroller.runaway == 1)
	    image_speed= 0.5
	else  {
	    frame= 0
	    image_speed= 0
	}
	if(type == 0) {
	    if(Input.is_action_pressed("move_left") and x > xmid - xlen)
	        x-= 4
	    if(Input.is_action_pressed("move_right") and x < xmid + xlen)
	        x+= 4
	    if(Input.is_action_pressed("move_up") and moving == 0 and yno > 1)
	        moving= 1
	    if(moving == 1) {
	        space+= yspace / 3
	        y= yzero + (yno - 1) * yspace - space + yoff
	        if(space >= yspace) {
	            yno--
	            space= 0
	            moving= 0
	        }
	    }
	    if(Input.is_action_pressed("move_down") and moving == 0 and yno < yamt)
	        moving= 2
	    if(moving == 2) {
	        space+= yspace / 3
	        y= yzero + (yno - 1) * yspace + space + yoff
	        if(space >= yspace) {
	            yno++
	            space= 0
	            moving= 0
	        }
	    }
	}
	if(ttype == 1) {
	    yoff+= yadd
	    y+= yadd
	    if(yoff > yspace) {
	        yno++
	        if(yno > yamt) {
	            yno= yamt
	            dmg= 6
	            scr_damagestandard_x()
	        }
	        yoff= 0
	        if(moving == 0)
	            y= yzero + (yno - 1) * yspace + space + yoff
	    }
	}
	if(ttype == 3) {
	    if(not instance_exists(349/* obj_hideouscupcake */))
	        instance_create(xmid - xlen, 460, 349/* obj_hideouscupcake */)
	    if(instance_exists(349/* obj_hideouscupcake */) and obj_hideouscupcake.y > 320)
	        obj_hideouscupcake.y-= 4
	    if(yzero > 100) yzero-= 4
	    y-= 4
	    yz2+= 4
	    if(yz2 > yspace) {
	        yz2-= yspace
	        yamt++
	    }
	    if(yzero <= 100) {
	        yzero= 100
	        ttype= 1
	        yadd= yadd2
	    }
	}
	if(GS.mnfight == 2 and instance_exists(743/* obj_heart */))
	    obj_heart.x= -200

func _on_outside_room():
	draw_set_color(8388736)
	if(type == 0) {
	    i= 0
	    while(i < yamt) {
	        draw_line(xmid - xlen, yzero + yspace * i + yoff, xmid + xlen, yzero + yspace * i + yoff)
	        i++
	    }
	}
	draw_sprite(sprite_index, frame, x, y)

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
