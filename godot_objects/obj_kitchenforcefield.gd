# Auto-converted from GameMaker: obj_kitchenforcefield
# GM parent: obj_readable
extends Node2D

func _ready():
	myinteract= 0
	scale.y= 4
	$Alarm3.start((1) / 30.0)
	siner= 0
	basic= 1
	canttalk= 0
	disable= 0
	sold= 0
	if(GS.plot >= 185) {
	    if(room == 139) instance_destroy()
	    if(room == 187) instance_destroy()
	}

func _gm_event_1_0():
	if(sold == 1 and is_instance_valid(solid1)) {
	    with(solid1) instance_destroy()
	}

func _gm_event_2_3():
	solid1= instance_create(x, y, 2/* obj_solidsmall */)
	solid1.scale.y= scale.y
	solid1.scale.x= scale.x
	sold= 1

func _on_destroy():
	if(canttalk == 0) {
	    GS.msc= 0
	    GS.typer= 5
	    GS.facechoice= 0
	    GS.msg[0]= "* (As per culinary standard^1,&  a death forcefield surrounds&  the kitchen.)/%%"
	    if(room == 166)
	        GS.msg[0]= "* (As per journalistic standards^1,&  a death forcefield surrounds&  the area of intrigue.)/%%"
	    if(room == 162)
	        GS.msg[0]= "* (It\'s the kind of every-day&  death forcefield you see&  at home.)/%%"
	    if(room == 192 or room == 202)
	        GS.msg[0]= "* (It\'s a forcefield.)/%%"
	    if(room == 195)
	        GS.msg[0]= "* (It\'s a battery-powered&  forcefield.)/%%"
	    if(room == 139 or room == 159 or room == 187 or room == 168 or room == 157)
	        GS.msg[0]= "* (It\'s a forcefield.)/%%"
	    mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	    myinteract= 3
	} else  {
	    GS.interact= 0
	    myinteract= 0
	}

func _process(delta: float):
	if(canttalk == 0) {
	    if(myinteract == 1) {
	        GS.interact= 1
	        $Alarm0.start((1) / 30.0)
	        myinteract= 2
	    }
	    if(myinteract == 3 and not is_instance_valid(mydialoguer)) {
	        GS.interact= 0
	        myinteract= 0
	    }
	}

func _on_outside_room():
	if(basic == 1) {
	    cl= distance_to_object(1570)
	    if(cl > 40) cl= 40
	    if(cl < 10) cl= 10
	    modulate.a= 1 - (cl - 10) / 30
	}
	if(scale.y > 1) {
	    i= 0
	    while(i < scale.y) {
	        done= 0
	        if(i == 0) {
	            draw_sprite_ext(1708/* spr_forcefield_top */, siner / 3, x, y + i * 20, 1, 1, 0, 16777215, modulate.a)
	            done= 1
	        }
	        if(i > 0 and done == 0) {
	            if(i + 1 >= scale.y)
	                draw_sprite_ext(1708/* spr_forcefield_top */, siner / 3, x, y + i * 20 + 20, 1, -1, 0, 16777215, modulate.a)
	            else 
	                draw_sprite_ext(1709/* spr_forcefield_middle */, siner / 3, x, y + i * 20, 1, 1, 0, 16777215, modulate.a)
	            done= 1
	        }
	        i++
	    }
	}
	if(scale.x > 1) {
	    j= 0
	    while(j < scale.x) {
	        done= 0
	        if(j == 0) {
	            draw_sprite_ext(1710/* spr_forcefield_right */, siner / 3, x + j * 20, y, 1, 1, 0, 16777215, modulate.a)
	            done= 1
	        }
	        if(j > 0 and done == 0) {
	            if(j + 1 >= scale.x)
	                draw_sprite_ext(1710/* spr_forcefield_right */, siner / 3, x + j * 20 + 20, y, -1, 1, 0, 16777215, modulate.a)
	            else 
	                draw_sprite_ext(1711/* spr_forcefield_right_middle */, siner / 3, x + j * 20 + 20, y, -1, 1, 0, 16777215, modulate.a)
	            done= 1
	        }
	        j++
	    }
	}
	siner++

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
