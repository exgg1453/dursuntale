# Auto-converted from GameMaker: obj_heart_sansbattle
extends Node2D

func _ready():
	movement= 2
	mv20x= 0
	mv20y= 1
	jumpstage= 1
	image_speed= 0
	y= GS.idealborder[3] - 16
	ignore_border= 0

func _process(delta: float):
	if(movement == 1) {
	    if(Input.is_action_pressed("move_left")) x-= 5
	    if(Input.is_action_pressed("move_right")) x+= 5
	    if(Input.is_action_pressed("move_down")) y+= 5
	    if(Input.is_action_pressed("move_up")) y-= 5
	}
	if(movement == 2) {
	    velocity.x= 0
	    if(Input.is_action_pressed("move_left")) x-= 5
	    if(Input.is_action_pressed("move_right")) x+= 5
	    if(Input.is_action_pressed("move_up") and jumpstage == 1 and velocity.y == 0) {
	        jumpstage= 2
	        velocity.y= -6
	    }
	}
	if(movement == 11) {
	    velocity.y= 0
	    if(Input.is_action_pressed("move_up")) y-= 5
	    if(Input.is_action_pressed("move_down")) y+= 5
	    if(Input.is_action_pressed("move_left") and jumpstage == 1 and velocity.x == 0) {
	        jumpstage= 2
	        velocity.x= -6
	    }
	}
	if(movement == 12) {
	    velocity.x= 0
	    if(Input.is_action_pressed("move_left")) x-= 5
	    if(Input.is_action_pressed("move_right")) x+= 5
	    if(Input.is_action_pressed("move_down") and jumpstage == 1 and velocity.y == 0) {
	        jumpstage= 2
	        velocity.y= 6
	    }
	}
	if(movement == 13) {
	    velocity.y= 0
	    if(Input.is_action_pressed("move_up")) y-= 5
	    if(Input.is_action_pressed("move_down")) y+= 5
	    if(Input.is_action_pressed("move_right") and jumpstage == 1 and velocity.x == 0) {
	        jumpstage= 2
	        velocity.x= 6
	    }
	}
	if(jumpstage == 2 and movement == 2) {
	    if(keyboard_check_direct(38) == 0 and velocity.y <= -1) velocity.y= -1
	    if(velocity.y > 0.5 and velocity.y < 8) velocity.y+= 0.6
	    if(velocity.y > -1 and velocity.y <= 0.5)
	        velocity.y+= 0.2
	    if(velocity.y > -4 and velocity.y <= -1) velocity.y+= 0.5
	    if(velocity.y <= -4) velocity.y+= 0.2
	}
	if(jumpstage == 2 and movement == 11) {
	    if(keyboard_check_direct(37) == 0 and velocity.x <= -1) velocity.x= -1
	    if(velocity.x > 0.5 and velocity.x < 8) velocity.x+= 0.6
	    if(velocity.x > -1 and velocity.x <= 0.5)
	        velocity.x+= 0.2
	    if(velocity.x > -4 and velocity.x <= -1) velocity.x+= 0.5
	    if(velocity.x <= -4) velocity.x+= 0.2
	}
	if(jumpstage == 2 and movement == 12) {
	    if(keyboard_check_direct(40) == 0 and velocity.y >= 1) velocity.y= 1
	    if(velocity.y < -0.5 and velocity.y > -8)
	        velocity.y-= 0.6
	    if(velocity.y < 1 and velocity.y >= -0.5)
	        velocity.y-= 0.2
	    if(velocity.y < 4 and velocity.y >= 1) velocity.y-= 0.5
	    if(velocity.y >= 4) velocity.y-= 0.2
	}
	if(jumpstage == 2 and movement == 13) {
	    if(keyboard_check_direct(39) == 0 and velocity.x >= 1) velocity.x= 1
	    if(velocity.x < -0.5 and velocity.x > -8)
	        velocity.x-= 0.6
	    if(velocity.x < 1 and velocity.x >= -0.5)
	        velocity.x-= 0.2
	    if(velocity.x < 4 and velocity.x >= 1) velocity.x-= 0.5
	    if(velocity.x >= 4) velocity.x-= 0.2
	}
	if(movement != 20) {
	    if(ignore_border == 0) {
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
	} else  {
	    if(Input.is_action_pressed("move_right")) mv20x++
	    if(Input.is_action_pressed("move_left")) mv20x--
	    if(Input.is_action_pressed("move_up")) mv20y= 0
	    if(Input.is_action_pressed("move_down")) mv20y= 1
	    if(mv20x < 0) mv20x= 3
	    if(mv20x > 3) mv20x= 0
	    if(mv20y == 0) {
	        x= 64
	        y= 278
	    }
	    if(mv20y == 1) {
	        y= 444
	        if(mv20x == 0) x= 40
	        if(mv20x == 1) x= 196
	        if(mv20x == 2) x= 354
	        if(mv20x == 3) x= 508
	    }
	}

func _gm_event_7_17():
	if(speed > 10) {
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
