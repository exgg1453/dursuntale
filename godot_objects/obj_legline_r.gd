# Auto-converted from GameMaker: obj_legline_r
# GM parent: obj_metttestbulletparent
extends Node2D

func _ready():
	myspeed= 8
	myside= 0
	visible= 1
	$Alarm0.start((1) / 30.0)
	con= 0
	eo= 0
	attacklength= 85
	active= 0
	shake= 0

func _gm_event_2_4():
	con++

func _on_destroy():
	active= 1
	con= 1
	$Alarm4.start((24) / 30.0)

func _on_outside_room():
	if(con == 1) {
	    if(myspeed > 0) {
	        if(eo == 0) draw_set_color(255)
	        if(eo == 1) {
	            draw_set_color(65535)
	            snd_play(118/* snd_block2 */)
	        }
	        if(eo == 2) draw_set_color(0)
	        draw_rectangle(GS.idealborder[1] - 6, GS.idealborder[2] + 6, GS.idealborder[1] - attacklength + 6, GS.idealborder[3] - 4, 1)
	        draw_rectangle(GS.idealborder[1] - 7, GS.idealborder[2] + 7, GS.idealborder[1] - attacklength + 5, GS.idealborder[3] - 3, 1)
	        draw_sprite(522/* spr_exclamationpoint */, eo, GS.idealborder[1] - attacklength / 2, GS.idealborder[2] + 30)
	    }
	    eo++
	    if(eo > 2) eo= 0
	}
	if(con == 2) {
	    snd_play(14/* snd_spearrise */)
	    if(myspeed > 0) {
	        x= GS.idealborder[0] - sprite_width
	        nowx= x
	        myx= 0
	    }
	    con= 3
	}
	if(con == 3) {
	    myx+= myspeed
	    if(myx >= attacklength - myspeed) {
	        myx= attacklength
	        con= 4
	        $Alarm4.start((6) / 30.0)
	        shake= 5
	    }
	}
	if(shake > 0) shake--
	if(con == 5) {
	    shake= 0
	    myx-= myspeed
	    if(myx <= 0) instance_destroy()
	}
	if(con >= 3) {
	    i= 0
	    while(i < 5) {
	        rr= random(shake) - random(shake)
	        draw_sprite_part(sprite_index, frame, 0, 0, myx + rr, sprite_height, GS.idealborder[1] - myx, GS.idealborder[2] + 5 + i * 30 + rr)
	        if(collision_rectangle(GS.idealborder[1], GS.idealborder[2] + 9 + i * 30, GS.idealborder[1] - myx + 30, GS.idealborder[2] + 18 + i * 30, 743, 0, 1))
	            event_user(11)
	        if(collision_line(GS.idealborder[1] - myx + 30, GS.idealborder[2] + 9 + i * 30, GS.idealborder[1] - myx + 8, GS.idealborder[2] + 9 + i * 30, 743, 0, 1) or collision_line(GS.idealborder[1] - myx + 30, GS.idealborder[2] + 23 + i * 30, GS.idealborder[1] - myx + 8, GS.idealborder[2] + 9 + i * 30, 743, 0, 1))
	            event_user(11)
	        i++
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
