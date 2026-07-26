# Auto-converted from GameMaker: obj_mainchara_fake
extends Node2D

func _ready():
	GS.facing= 0
	GS.interact= 0
	if(x % 3 == 2) x++
	if(x % 3 == 1) x--
	if(y % 3 == 2) y++
	if(y % 3 == 1) y--
	lastfacing= 0
	nnn= 0
	cutscene= 0
	oldx= x
	oldy= y
	image_speed= 0
	GS.phasing= 0
	facing= GS.facing
	moving= 0
	movement= 1
	dsprite= 2266
	rsprite= 2265
	usprite= 2267
	lsprite= 2264
	inwater= 0

func _process_end(delta: float):
	if(Input.is_action_pressed("move_left") == 0 and Input.is_action_pressed("move_right") == 0 and Input.is_action_pressed("move_down") == 0 and Input.is_action_pressed("move_up") == 0)
	    moving= 0
	if(GS.interact > 0) {
	    moving= 0
	    movement= 0
	} else  movement= 1
	if(xprevious != x or yprevious != y) moving= 1
	if(moving == 0) {
	    image_speed= 0
	    frame= 0
	}
	if(cutscene == 0 and not instance_exists(1582/* obj_vsflowey_shaker */)) {
	    view_xview[0]= round(x - view_wview[0] / 2 + 10)
	    view_yview[0]= round(y - view_hview[0] / 2 + 10)
	}

func _process(delta: float):
	if(GS.facing == 0) sprite_index= dsprite
	if(GS.facing == 1) sprite_index= rsprite
	if(GS.facing == 2) sprite_index= usprite
	if(GS.facing == 3) sprite_index= lsprite
	crumpet= 0
	strumpet= bbox_top
	trumpet= bbox_left
	if(obj_time.left == 1 and movement == 1) {
	    turned= 1
	    if(xprevious == x + 3) x-= 2
	    else  x-= 3
	    if(moving != 1) frame= 1
	    moving= 1
	    image_speed= 0.2
	    if(obj_time.up == 1 and GS.facing == 2) turned= 0
	    if(obj_time.down == 1 and GS.facing == 0) turned= 0
	    if(turned == 1) GS.facing= 3
	}
	if(obj_time.up == 1 and movement == 1) {
	    turned= 1
	    y-= 3
	    if(moving != 1) frame= 1
	    moving= 1
	    image_speed= 0.2
	    if(obj_time.right == 1 and GS.facing == 1) turned= 0
	    if(obj_time.left == 1 and GS.facing == 3) turned= 0
	    if(turned == 1) GS.facing= 2
	}
	if(obj_time.right == 1 and movement == 1 and Input.is_action_pressed("move_left") == 0) {
	    turned= 1
	    if(xprevious == x - 3) x+= 2
	    else  x+= 3
	    moving= 1
	    image_speed= 0.2
	    if(moving != 1) frame= 1
	    if(obj_time.up == 1 and GS.facing == 2) turned= 0
	    if(obj_time.down == 1 and GS.facing == 0) turned= 0
	    if(turned == 1) GS.facing= 1
	}
	if(obj_time.down == 1 and movement == 1 and Input.is_action_pressed("move_up") == 0) {
	    turned= 1
	    y+= 3
	    if(moving != 1) frame= 1
	    moving= 1
	    image_speed= 0.2
	    if(obj_time.right == 1 and GS.facing == 1) turned= 0
	    if(obj_time.left == 1 and GS.facing == 3) turned= 0
	    if(turned == 1) GS.facing= 0
	}
	if(keyboard_multicheck_pressed(0/* NOKEY */)) event_user(0)
	if(x < 0) x= 0
	if(x > get_viewport_rect().size.x - sprite_width)
	    x= get_viewport_rect().size.x - sprite_width
	if(y < 0) y= 0
	if(y > get_viewport_rect().size.y - sprite_height)
	    y= get_viewport_rect().size.y - sprite_height
	z_index= 50000 - y * 10

func _on_alarm_0_timeout():
	x= xprevious
	y= yprevious
	moving= 0

func _gm_event_7_10():
	if(GS.interact == 0) {
	    if(GS.facing == 1 and collision_rectangle(x + sprite_width / 2, y + 19, x + sprite_width + 15, y + sprite_height, 1368, 0, 1)) {
	        interactedobject= collision_rectangle(x + sprite_width / 2, y + sprite_height / 2, x + sprite_width + 15, y + sprite_height, 1368, 0, 1)
	        if(interactedobject != -4) {
	            with(interactedobject) facing= 3
	            with(interactedobject) myinteract= 1
	        }
	    }
	    if(GS.facing == 3 and collision_rectangle(x + sprite_width / 2, y + 19, x - 15, y + sprite_height, 1368, 0, 1)) {
	        interactedobject= collision_rectangle(x + sprite_width / 2, y + 3 + sprite_height / 2, x - 15, y + sprite_height + 3, 1368, 0, 1)
	        if(interactedobject != -4) {
	            with(interactedobject) facing= 1
	            with(interactedobject) myinteract= 1
	        }
	    }
	    if(GS.facing == 0 and collision_rectangle(x + 4, y + 20, x + sprite_width - 4, y + sprite_height + 15, 1368, 0, 1)) {
	        interactedobject= collision_rectangle(x + 4, y + 20, x + sprite_width - 4, y + sprite_height + 15, 1368, 0, 1)
	        if(interactedobject != -4) {
	            with(interactedobject) facing= 2
	            with(interactedobject) myinteract= 1
	        }
	    }
	    if(GS.facing == 2 and collision_rectangle(x + 4, y + sprite_height - 5, x + sprite_width - 4, y + 5, 1368, 0, 1)) {
	        interactedobject= collision_rectangle(x + 4, y + sprite_height - 5, x + sprite_width - 4, y + 8, 1368, 0, 1)
	        if(interactedobject != -4) {
	            with(interactedobject) facing= 0
	            with(interactedobject) myinteract= 1
	        }
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
