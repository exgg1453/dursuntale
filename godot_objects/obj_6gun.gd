# Auto-converted from GameMaker: obj_6gun
# GM parent: obj_6bparent
extends Node2D

func _ready():
	counter= 0
	con= 0
	rotation_degrees= 270
	$Alarm4.start((20) / 30.0)
	rr= 80
	scale.x= 2
	scale.y= 2
	dirspeed= 0
	shakeboy= 0
	shake= 0
	num= 0
	type= 0

func _gm_event_2_4():
	con++

func _process(delta: float):
	if(con == 1) {
	    cr[0]= instance_create(obj_vsflowey_heart.x - rr + random(rr * 2), obj_vsflowey_heart.y - rr + random(rr * 2), 1608/* obj_6gun_crosshair */)
	    if(type == 1) {
	        with(cr[0]) sprite_index= 2212/* spr_6gun_crosshair_heart */
	    }
	    con= 2
	    $Alarm4.start((6) / 30.0)
	}
	if(con == 3) {
	    cr[1]= instance_create(obj_vsflowey_heart.x - rr + random(rr * 2), obj_vsflowey_heart.y - rr + random(rr * 2), 1608/* obj_6gun_crosshair */)
	    if(type == 1) {
	        with(cr[1]) sprite_index= 2212/* spr_6gun_crosshair_heart */
	    }
	    con= 4
	    $Alarm4.start((6) / 30.0)
	}
	if(con == 5) {
	    cr[2]= instance_create(obj_vsflowey_heart.x - rr + random(rr * 2), obj_vsflowey_heart.y - rr + random(rr * 2), 1608/* obj_6gun_crosshair */)
	    if(type == 1) {
	        with(cr[2]) sprite_index= 2212/* spr_6gun_crosshair_heart */
	    }
	    if(Input.is_action_pressed("move_down")) cr[2].y+= 100
	    if(Input.is_action_pressed("move_up")) cr[2].y-= 100
	    if(Input.is_action_pressed("move_right")) cr[2].x+= 100
	    if(Input.is_action_pressed("move_left")) cr[2].x-= 100
	    con= 6
	    no= 0
	    $Alarm4.start((3) / 30.0)
	}
	if(con == 7) {
	    dgoal= point_direction(x, y, cr[no].x, cr[no].y)
	    curdir= rotation_degrees
	    idealdir= dgoal
	    facingMinusTarget= curdir - idealdir
	    angleDiff= facingMinusTarget
	    if(abs(facingMinusTarget) > 180) {
	        if(curdir > idealdir)
	            angleDiff= -1 * (360 - curdir + idealdir)
	        else  angleDiff= 360 - idealdir + curdir
	    }
	    leastAccurateAim= 5
	    if(abs(angleDiff) > leastAccurateAim) {
	        dirspeed= 1
	        angleDiff2= abs(angleDiff)
	        if(angleDiff2 > 10) dirspeed= 5
	        if(angleDiff2 > 20) dirspeed= 8
	        if(angleDiff2 > 30) dirspeed= 12
	        if(angleDiff2 > 40) dirspeed= 15
	        if(angleDiff2 > 50) dirspeed= 18
	        if(angleDiff2 > 60) dirspeed= 24
	        if(angleDiff2 > 70) dirspeed= 30
	        if(angleDiff2 > 80) dirspeed= 36
	        if(angleDiff2 > 90) dirspeed= 42
	        if(angleDiff2 > 100) dirspeed= 50
	        if(angleDiff < 0) dirspeed= -dirspeed
	        rotation_degrees-= dirspeed
	    } else  {
	        con= 8
	        rotation_degrees= dgoal
	        $Alarm4.start((1) / 30.0)
	    }
	}
	if(con == 9) {
	    if(num != 23) {
	        bl= instance_create(x, y, 1607/* obj_6gun_bullet */)
	        bl.direction= dgoal
	        bl.rotation_degrees= dgoal
	        bl.speed= 30
	        if(type == 1) {
	            with(bl) event_user(4)
	        }
	    } else  {
	        bl= instance_create(x, y, 1610/* obj_6gun_act */)
	        bl.direction= dgoal
	        bl.rotation_degrees= dgoal
	        bl.speed= 20
	    }
	    num++
	    with(cr[no]) instance_destroy()
	    if(no < 2) {
	        no++
	        con= 6
	        $Alarm4.start((3) / 30.0)
	    } else  con= 1
	}
	if(shakeboy == 1) {
	    shake+= 0.2
	    x+= random(shake) - random(shake)
	    y+= random(shake) - random(shake)
	}

func _on_alarm_0_timeout():
	if(type == 0) event_inherited()

func _gm_event_7_15():
	shakeboy= 1
	type= 2

func _gm_event_7_14():
	type= 1
	shakeboy= 0

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
