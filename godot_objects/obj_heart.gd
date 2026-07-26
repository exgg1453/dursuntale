# Auto-converted from GameMaker: obj_heart
extends Node2D

func _ready():
	GS.sp= GS.asp
	movement= 0
	jumpstage= 0
	hgo= 0
	vgo= 0
	shot= 0
	GS.bmenuno= 0
	GS.bmenucoord[0]= 0
	GS.bmenucoord[1]= 0
	GS.bmenucoord[2]= 0
	GS.bmenucoord[3]= 0
	GS.bmenucoord[4]= 0
	GS.bmenucoord[6]= 0
	GS.bmenucoord[7]= 0
	GS.bmenucoord[8]= 0
	GS.bmenucoord[9]= 0
	GS.bmenucoord[10]= 0
	GS.hurtanim[0]= 0
	GS.hurtanim[1]= 0
	GS.hurtanim[2]= 0
	GS.hurtanim[3]= 0
	GS.myfight= 0
	GS.mnfight= 0
	GS.xpreward[3]= 0
	GS.goldreward[3]= 0
	confuse= 0
	charge= 0
	ignore_border= 0
	slam_pain= 0

func _process(delta: float):
	if(GS.mnfight != 2) movement= 0
	else  {
	    if(movement == 0) movement= 1
	}
	GS.invc--
	if(GS.invc > 0 or obj_battlecontroller.runaway == 1)
	    image_speed= 0.5
	else  {
	    frame= 0
	    image_speed= 0
	}
	charge--
	if(shot == 1 and keyboard_multicheck_pressed(0/* NOKEY */) and GS.mnfight == 2 and (instance_number(739) == 0 or charge < 0)) {
	    charge= 14
	    instance_create(x + 4, y + 2, 739/* obj_heartshot */)
	    snd_play(116/* snd_heartshot */)
	}
	if(sprite_index == 35) rotation_degrees+= 6
	if(confuse == 1 and GS.mnfight == 2) {
	    if(x < obj_lborder.x + 8) x= obj_lborder.x + 8
	    if(y < obj_uborder.x + 8) y= obj_uborder.x + 8
	    if(x > obj_rborder.x - 8) x= obj_rborder.x - 8
	    if(y > obj_dborder.y - 8) y= obj_dborder.y - 8
	}
	if(movement == 11) {
	    velocity.y= 0
	    if(Input.is_action_pressed("move_up")) y-= GS.sp
	    if(Input.is_action_pressed("move_down")) y+= GS.sp
	    if(Input.is_action_pressed("move_left") and jumpstage == 1 and velocity.x == 0) {
	        jumpstage= 2
	        velocity.x= -6
	    }
	}
	if(movement == 12) {
	    velocity.x= 0
	    if(Input.is_action_pressed("move_left")) x-= GS.sp
	    if(Input.is_action_pressed("move_right")) x+= GS.sp
	    if(Input.is_action_pressed("move_down") and jumpstage == 1 and velocity.y == 0) {
	        jumpstage= 2
	        velocity.y= 6
	    }
	}
	if(movement == 13) {
	    velocity.y= 0
	    if(Input.is_action_pressed("move_up")) y-= GS.sp
	    if(Input.is_action_pressed("move_down")) y+= GS.sp
	    if(Input.is_action_pressed("move_right") and jumpstage == 1 and velocity.x == 0) {
	        jumpstage= 2
	        velocity.x= 6
	    }
	}
	if(jumpstage == 2 and movement == 2) {
	    if(GS.osflavor == 1 and keyboard_check_direct(38) == 0 and velocity.y <= -1)
	        velocity.y= -1
	    if(GS.osflavor == 2 and Input.is_action_pressed("move_up") == 0 and velocity.y <= -1)
	        velocity.y= -1
	    if(velocity.y > 0.5 and velocity.y < 8) velocity.y+= 0.6
	    if(velocity.y > -1 and velocity.y <= 0.5)
	        velocity.y+= 0.2
	    if(velocity.y > -4 and velocity.y <= -1) velocity.y+= 0.5
	    if(velocity.y <= -4) velocity.y+= 0.2
	}
	if(jumpstage == 2 and movement == 11) {
	    if(GS.osflavor == 1 and keyboard_check_direct(37) == 0 and velocity.x <= -1)
	        velocity.x= -1
	    if(GS.osflavor == 2 and Input.is_action_pressed("move_left") == 0 and velocity.x <= -1)
	        velocity.x= -1
	    if(velocity.x > 0.5 and velocity.x < 8) velocity.x+= 0.6
	    if(velocity.x > -1 and velocity.x <= 0.5)
	        velocity.x+= 0.2
	    if(velocity.x > -4 and velocity.x <= -1) velocity.x+= 0.5
	    if(velocity.x <= -4) velocity.x+= 0.2
	}
	if(jumpstage == 2 and movement == 12) {
	    if(GS.osflavor == 1 and keyboard_check_direct(40) == 0 and velocity.y >= 1)
	        velocity.y= 1
	    if(GS.osflavor == 2 and Input.is_action_pressed("move_down") == 0 and velocity.y >= 1)
	        velocity.y= 1
	    if(velocity.y < -0.5 and velocity.y > -8)
	        velocity.y-= 0.6
	    if(velocity.y < 1 and velocity.y >= -0.5)
	        velocity.y-= 0.2
	    if(velocity.y < 4 and velocity.y >= 1) velocity.y-= 0.5
	    if(velocity.y >= 4) velocity.y-= 0.2
	}
	if(jumpstage == 2 and movement == 13) {
	    if(GS.osflavor == 1 and keyboard_check_direct(39) == 0 and velocity.x >= 1)
	        velocity.x= 1
	    if(GS.osflavor == 2 and Input.is_action_pressed("move_right") == 0 and velocity.x >= 1)
	        velocity.x= 1
	    if(velocity.x < -0.5 and velocity.x > -8)
	        velocity.x-= 0.6
	    if(velocity.x < 1 and velocity.x >= -0.5)
	        velocity.x-= 0.2
	    if(velocity.x < 4 and velocity.x >= 1) velocity.x-= 0.5
	    if(velocity.x >= 4) velocity.x-= 0.2
	}
	if(ignore_border == 0 and instance_exists(517/* obj_sansb_body */) and GS.mnfight == 2) {
	    if(x < GS.idealborder[0] + 4) {
	        x= GS.idealborder[0] + 4
	        event_user(7)
	        if(velocity.x < 0) velocity.x= 0
	        if(movement == 13) jumpstage= 1
	    }
	    if(y < GS.idealborder[2] + 4) {
	        y= GS.idealborder[2] + 4
	        event_user(7)
	        if(velocity.y < 0) velocity.y= 0
	        if(movement == 12) jumpstage= 1
	    }
	    if(x > GS.idealborder[1] - 16) {
	        x= GS.idealborder[1] - 16
	        event_user(7)
	        if(velocity.x > 0) velocity.x= 0
	        if(movement == 11) jumpstage= 1
	    }
	    if(y > GS.idealborder[3] - 16) {
	        y= GS.idealborder[3] - 16
	        event_user(7)
	        if(velocity.y > 0) velocity.y= 0
	        if(movement == 2) jumpstage= 1
	    }
	}
	if(instance_exists(154/* obj_battlecontroller */) and obj_battlecontroller.runaway == 1 and x < -20) {
	    if(not instance_exists(149/* obj_unfader */)) instance_create(0, 0, 149/* obj_unfader */)
	    if(x < -60) {
	        if(GS.flag[15] == 0) {
	            caster_stop(GS.batmusic)
	            caster_free(GS.batmusic)
	        }
	        room_goto(GS.currentroom)
	    }
	}

func _on_alarm_0_timeout():
	if(ignore_border == 0) {
	    y= other.y - sprite_height
	    if(movement == 2) {
	        event_user(7)
	        jumpstage= 1
	        velocity.y= 0
	    }
	    if(confuse == 1 and obj_battlecontroller.runaway != 1)
	        y= other.y - 8
	}

func _gm_event_5_40():
	if(movement == 1) {
	    if(confuse == 0) {
	        y+= GS.sp
	        if(keyboard_multicheck(16/* SHIFT */) == 1)
	            y-= GS.sp / 2
	    }
	    if(confuse == 1 and y > GS.idealborder[2] + 8) {
	        y-= GS.sp
	        if(keyboard_multicheck(16/* SHIFT */) == 1)
	            y+= GS.sp / 2
	    }
	}

func _gm_event_5_39():
	if(movement == 1 or movement == 2) {
	    if(confuse == 0) {
	        x+= GS.sp
	        if(keyboard_multicheck(16/* SHIFT */) == 1)
	            x-= GS.sp / 2
	    }
	    if(confuse == 1 and x > GS.idealborder[0] + 8) {
	        x-= GS.sp
	        if(keyboard_multicheck(16/* SHIFT */) == 1)
	            x+= GS.sp / 2
	    }
	}

func _gm_event_5_38():
	if(movement == 1) {
	    if(confuse == 0) {
	        y-= GS.sp
	        if(keyboard_multicheck(16/* SHIFT */) == 1)
	            y+= GS.sp / 2
	    }
	    if(confuse == 1 and y < GS.idealborder[3] - 8) {
	        y+= GS.sp
	        if(keyboard_multicheck(16/* SHIFT */) == 1)
	            y-= GS.sp / 2
	    }
	}
	if(movement == 2 and jumpstage == 1 and velocity.y == 0) {
	    jumpstage= 2
	    velocity.y= -6
	}

func _gm_event_5_37():
	if(movement == 1 or movement == 2) {
	    if(confuse == 0) {
	        x-= GS.sp
	        if(keyboard_multicheck(16/* SHIFT */) == 1)
	            x+= GS.sp / 2
	    }
	    if(confuse == 1 and x < GS.idealborder[1] - 8) {
	        x+= GS.sp
	        if(keyboard_multicheck(16/* SHIFT */) == 1)
	            x+= GS.sp / 2
	    }
	}

func _gm_event_7_17():
	if(speed > 10) {
	    snd_stop(53)
	    snd_stop(21)
	    if(slam_pain == 1 and GS.hp > 1) GS.hp--
	    snd_play(53/* snd_hurt1 */)
	    snd_play(21/* snd_impact */)
	    s_s= instance_create(0, 0, 512/* obj_sans_shaker */)
	    s_s.intensity= floor(speed / 3)
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
