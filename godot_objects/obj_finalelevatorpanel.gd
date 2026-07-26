# Auto-converted from GameMaker: obj_finalelevatorpanel
# GM parent: obj_interactable
extends Node2D

func _ready():
	myinteract= 0
	con= 0
	heartx= 0
	hearty= 0
	trigger= 0
	dirdir= 0
	ourx= 0
	oury= 0
	rectaur= 0
	rect= 0
	obj_mainchara.cutscene= 1
	if(room == 243 or room == 261) {
	    fake= scr_marker(x, y, sprite_index)
	    fake.z_index= z_index
	    instance_destroy()
	}

func _gm_event_2_8():
	con= 25
	snd_play(106/* snd_noise */)

func _gm_event_2_4():
	con++

func _on_outside_room():
	draw_sprite(sprite_index, frame, x, y)
	if(myinteract == 1 and GS.interact == 0 and con == 0) {
	    GS.interact= 1
	    con= 5
	    if(GS.flag[431] == 0) GS.flag[431]= 1
	    else  GS.flag[431]= 0
	}
	if(con == 1) {
	    GS.facechoice= 0
	    GS.typer= 5
	    GS.msc= 0
	    GS.msg[0]= "* Please select a location./%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 2
	    buffer= 5
	}
	if(con == 2 and not instance_exists(782/* OBJ_WRITER */)) {
	    buffer--
	    draw_set_color(16777215)
	    draw_rectangle(view_xview[view_current] + 16, view_yview[view_current] + 5, view_xview[view_current] + 304, view_yview[view_current] + 80, 0)
	    draw_set_color(0)
	    draw_rectangle(view_xview[view_current] + 19, view_yview[view_current] + 8, view_xview[view_current] + 301, view_yview[view_current] + 77, 0)
	    draw_set_color(16777215)
	    draw_set_font(2)
	    if(GS.flag[398] != 0)
	        draw_text(view_xview[0] + 50, view_yview[0] + 15, "Left Floor 1")
	    else  draw_text(view_xview[0] + 50, view_yview[0] + 15, "Cancel")
	    if(GS.flag[398] != 1)
	        draw_text(view_xview[0] + 160, view_yview[0] + 15, "Right Floor 1")
	    else 
	        draw_text(view_xview[0] + 160, view_yview[0] + 15, "Cancel")
	    if(GS.flag[398] != 2)
	        draw_text(view_xview[0] + 160, view_yview[0] + 35, "Right Floor 2")
	    else 
	        draw_text(view_xview[0] + 160, view_yview[0] + 35, "Cancel")
	    if(trigger > 0) {
	        if(GS.flag[398] != 3)
	            draw_text(view_xview[0] + 50, view_yview[0] + 35, "Left Floor 2")
	        else  draw_text(view_xview[0] + 50, view_yview[0] + 35, "Cancel")
	    }
	    if(trigger > 0) {
	        if(GS.flag[398] != 4)
	            draw_text(view_xview[0] + 50, view_yview[0] + 55, "Left Floor 3")
	        else  draw_text(view_xview[0] + 50, view_yview[0] + 55, "Cancel")
	    }
	    if(trigger > 1) {
	        if(GS.flag[398] != 5)
	            draw_text(view_xview[0] + 160, view_yview[0] + 55, "Right Floor 3")
	        else 
	            draw_text(view_xview[0] + 160, view_yview[0] + 55, "Cancel")
	    }
	    draw_sprite(49/* spr_heartsmall */, 0, view_xview[0] + 30 + heartx * 110, view_yview[0] + 20 + 20 * hearty)
	    if(buffer < 0) {
	        if(Input.is_action_pressed("move_up") and hearty > 0)
	            hearty--
	        if(Input.is_action_pressed("move_down") and hearty < 2) {
	            if(heartx == 0) {
	                if(hearty == 1 and trigger > 0) hearty++
	                if(hearty == 0 and trigger > 0) hearty++
	            }
	            if(heartx == 1) {
	                if(hearty == 1 and trigger > 1) hearty++
	                if(hearty == 0) hearty++
	            }
	        }
	        if(Input.is_action_pressed("move_right") and heartx == 0) {
	            if(hearty == 0) heartx++
	            if(hearty == 1) heartx++
	            if(hearty == 2 and trigger > 1) heartx++
	        }
	        if(Input.is_action_pressed("move_left") and heartx == 1) {
	            if(hearty == 0) heartx--
	            if(hearty == 1 and trigger > 0) heartx--
	            if(hearty == 2 and trigger > 1) heartx--
	        }
	        if(keyboard_multicheck_pressed(0/* NOKEY */)) {
	            con= 5
	            if(heartx == 0 and hearty == 0) {
	                if(GS.flag[398] != 0) GS.flag[398]= 0
	                else  con= 15
	            }
	            if(heartx == 1 and hearty == 0) {
	                if(GS.flag[398] != 1) GS.flag[398]= 1
	                else  con= 15
	            }
	            if(heartx == 1 and hearty == 1) {
	                if(GS.flag[398] != 2) GS.flag[398]= 2
	                else  con= 15
	            }
	            if(heartx == 0 and hearty == 1) {
	                if(GS.flag[398] != 3) GS.flag[398]= 3
	                else  con= 15
	            }
	            if(heartx == 0 and hearty == 2) {
	                if(GS.flag[398] != 4) GS.flag[398]= 4
	                else  con= 15
	            }
	            if(heartx == 1 and hearty == 2) {
	                if(GS.flag[398] != 5) GS.flag[398]= 5
	                else  con= 15
	            }
	        }
	    }
	}
	if(con == 5) {
	    snd_play(108/* snd_item */)
	    con= 6
	    $Alarm4.start((15) / 30.0)
	}
	if(con == 7) {
	    rect= 1
	    GS.facing= 0
	    snd_play(28/* snd_bell */)
	    con= 8
	    $Alarm4.start((11) / 30.0)
	}
	if(con == 9) {
	    snd_play(106/* snd_noise */)
	    if(GS.flag[432] == 0)
	        elev= caster_load("music/elevator_last.ogg")
	    if(GS.flag[432] == 1) elev= caster_load("music/elevator.ogg")
	    xx= view_xview[0]
	    yy= view_yview[0]
	    siner= 0
	    con= 10
	    intense= 0.5
	    $Alarm4.start((15) / 30.0)
	}
	if(con == 11) {
	    con= 12
	    if(GS.flag[432] == 0) $Alarm4.start((560) / 30.0)
	    if(GS.flag[432] == 1) $Alarm4.start((110) / 30.0)
	    caster_play(elev, 1, 1)
	    if(room == 242) {
	        con= 12
	        $Alarm4.start((-1) / 30.0)
	        $Alarm8.start((85) / 30.0)
	    }
	}
	if(con == 12) {
	    obj_mainchara.cutscene= 1
	    view_object[0]= -4
	    siner++
	    if(alarm[4] > 20 and intense < 1.5)
	        intense+= 0.02
	    if(alarm[8] > 1 and intense < 0.6)
	        intense+= 0.01
	    else  {
	        if(intense > 0) intense-= 0.1
	    }
	    view_xview[0]= xx + sin(siner / 1.3) * intense
	    view_yview[0]= yy + sin(siner / 0.9) * intense
	}
	if(con == 13) {
	    view_xview[0]= xx
	    view_yview[0]= yy
	    rect= 2
	    con= 14
	    snd_play(28/* snd_bell */)
	    $Alarm4.start((11) / 30.0)
	}
	if(con == 15) {
	    GS.flag[432]= 1
	    GS.facing= 0
	    snd_play(106/* snd_noise */)
	    GS.interact= 0
	    con= 0
	    scr_tempsave()
	    myinteract= 0
	}
	if(rect == 1) {
	    if(rectaur < 20) rectaur+= 2
	    draw_set_color(0)
	    draw_rectangle(140, 180, 140 + rectaur, 250, 0)
	    draw_rectangle(180, 180, 180 - rectaur, 250, 0)
	    if(room == 261) {
	        draw_rectangle(0, 120, 100, 120 + rectaur, 0)
	        draw_rectangle(0, 160, 100, 260 - rectaur, 0)
	    }
	}
	if(rect == 2) {
	    if(rectaur > 0) rectaur-= 2
	    draw_set_color(0)
	    draw_rectangle(140, 180, 140 + rectaur, 250, 0)
	    draw_rectangle(180, 180, 180 - rectaur, 250, 0)
	}
	if(con == 25) {
	    caster_free(elev)
	    view_xview[0]= xx
	    view_yview[0]= yy
	    con= 26
	    $Alarm4.start((45) / 30.0)
	}
	if(con == 27) {
	    instance_create(0, 0, 1565/* obj_labelevator_a */)
	    con= 28
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
