# Auto-converted from GameMaker: obj_woshbody
# GM parent: obj_monsterparent
extends Node2D

func _ready():
	scale.x= 2
	scale.y= 2
	anim= 0
	hy= 34
	fy= 0
	fu= 1
	$Alarm1.start((5) / 30.0)
	ducky= 18
	wd= x + 40
	wy= y + 34
	waterxx= 0
	$Alarm2.start((5) / 30.0)
	wu= 1
	bull= 0
	con= 0

func _gm_event_1_0():
	// obj_woshpart
	with(257) $Alarm8.start((1) / 30.0)

func _gm_event_2_4():
	con++

func _gm_event_2_2():
	waterxx+= wu
	if(waterxx > 15) wu= -1
	if(waterxx < 1) wu= 1
	ducky-= wu
	$Alarm2.start((5) / 30.0)

func _gm_event_2_1():
	if(bull == 0) {
	    $Alarm1.start((5) / 30.0)
	    fy+= fu
	    hy+= -fu / 2
	    if(fy > 3) fu= -2
	    if(fy < -6) fu= 2
	}

func _on_outside_room():
	anim+= 0.2
	draw_sprite_ext(265/* spr_woshhanger */, frame, x, y, 2, 2, 0, 16777215, 1)
	draw_sprite_ext(259/* spr_woshduck */, frame, x + 46, y + ducky, 2, 2, 0, 16777215, 1)
	draw_sprite_part_ext(264, 0, 0, 0, 16, 28, 40 + x - sin(anim / 2) * 4, wy, 2, 2, 16777215, 1)
	draw_sprite_part_ext(264, 0, 0, 0, 16, 28, 40 + x + sin(anim / 2) * 4, wy, 2, 2, 16777215, 1)
	draw_sprite_ext(sprite_index, frame, x, y, 2, 2, 0, 16777215, 1)
	draw_sprite_ext(263/* spr_woshtail */, anim, x + 88, y + 50, 2, 2, 0, 16777215, 1)
	draw_sprite_ext(260/* spr_woshhead */, frame, x, y + hy, 2, 2, 0, 16777215, 1)
	if(bull == 0)
	    draw_sprite_ext(261/* spr_woshface */, frame, x, y + hy + fy, 2, 2, 0, 16777215, 1)
	if(bull == 1)
	    draw_sprite_ext(262/* spr_woshface_bull */, frame, x, y + hy + fy, 2, 2, 0, 16777215, 1)
	if(con > 0) {
	    if(con == 1) {
	        if(instance_exists(782/* OBJ_WRITER */)) {
	            // OBJ_WRITER
	            with(782) instance_destroy()
	        }
	        GS.myfight= 2
	        GS.mnfight= 9
	    }
	    if(con == 2) {
	        bull= 1
	        obj_aaronbody.bull= 1
	        obj_aaronbody.sprite_index= 249/* spr_aaronbody_bull */
	        aaron= 289
	        con= 3
	        $Alarm4.start((45) / 30.0)
	    }
	    if(con == 4) {
	        GS.typer= 33
	        GS.msc= 0
	        GS.msg[0]= "... what the&HECK is that&music?/%%"
	        scr_blcon(x + 80, y, 0)
	        con= 5
	    }
	    if(con == 5 and not instance_exists(782/* OBJ_WRITER */)) {
	        GS.msg[0]= "I-I DUNNO^1, DUDE&BUT IT\'S SPOOKIN&ME OUT ; )/%%"
	        with(aaron) scr_blcon(x + 80, y, 0)
	        obj_aaronbody.shake= 2
	        con= 6
	    }
	    if(con == 6 and not instance_exists(782/* OBJ_WRITER */)) {
	        GS.msg[0]= "... this is worse&than Shyren./%%"
	        scr_blcon(x + 80, y, 0)
	        con= 7
	    }
	    if(con == 7 and not instance_exists(782/* OBJ_WRITER */)) {
	        GS.msg[0]= "No way^1, Shyren is&way less scary&; )/%%"
	        with(aaron) scr_blcon(x + 80, y, 0)
	        obj_aaronbody.shake= 2
	        con= 8
	    }
	    if(con == 8 and not instance_exists(782/* OBJ_WRITER */)) {
	        GS.msg[0]= "... if you\'re so&scared^1, why do&you keep winking?/%%"
	        scr_blcon(x + 80, y, 0)
	        con= 9
	    }
	    if(con == 9 and not instance_exists(782/* OBJ_WRITER */)) {
	        GS.msg[0]= "THESE ARE WINKS&OF FEAR ; )/%%"
	        with(aaron) scr_blcon(x + 100, y, 0)
	        obj_aaronbody.shake= 3
	        con= 10
	    }
	    if(con == 10 and not instance_exists(782/* OBJ_WRITER */)) {
	        GS.msg[0]= "Forget it^1.&This beat is&too.../"
	        GS.msg[1]= "... filthy./%%"
	        scr_blcon(x + 80, y, 0)
	        con= 11
	    }
	    if(con == 11 and not instance_exists(782/* OBJ_WRITER */)) {
	        velocity.x= 4
	        GS.msg[0]= "Wosh^1! Wait^1!&Don\'t leave me ; )/"
	        GS.msg[1]= "Is this creepy&music my punishment&for being creepy?&; )/"
	        GS.msg[2]= "Please..^1. stop..^1.&I\'ll never creep&again ; )/%%"
	        obj_aaronbody.shake= 3
	        with(aaron) scr_blcon(x + 80, y, 0)
	        con= 13
	    }
	    if(con == 13 and not instance_exists(782/* OBJ_WRITER */)) {
	        obj_aaronbody.velocity.y= -8
	        GS.msg[0]= "Wahhhhh!!!!!&; )^3 %%"
	        obj_aaronbody.shake= 0
	        with(aaron) scr_blcon(x + 80, y, 0)
	        con= 14
	        $Alarm4.start((90) / 30.0)
	    }
	    if(con == 15) {
	        GS.flag[95]= 1
	        instance_create(0, 0, 149/* obj_unfader */)
	        con= 16
	        $Alarm4.start((8) / 30.0)
	    }
	    if(con == 17) room_goto(GS.currentroom)
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
