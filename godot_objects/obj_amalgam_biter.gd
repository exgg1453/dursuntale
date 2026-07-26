# Auto-converted from GameMaker: obj_amalgam_biter
# GM parent: obj_bulletgenparent
extends Node2D

func _ready():
	con= 0
	$Alarm4.start((10) / 30.0)
	mcornerx= GS.idealborder[0]
	mcornery= GS.idealborder[2]
	mcornerx2= GS.idealborder[1]
	mcornery2= GS.idealborder[2]
	eye= 0
	eyestretch= 0
	type= 1
	miss= -1
	times= 0
	maxtimes= 2
	dmg= 10

func _gm_event_2_4():
	con++

func _gm_event_7_11():
	if(miss == -1) miss= floor(random(11))
	else  {
	    missadd= 1 + floor(random(6))
	    miss+= choose(1, -1) * missadd
	    if(miss < 0) miss= 0 + missadd
	    if(miss > 10) miss= 10 - missadd
	}
	toothno= 0
	tx= GS.idealborder[0] - 25
	repeat(5)  {
	    if(toothno != miss) {
	        downtooth= instance_create(tx, 0, 546/* obj_amalgam_tooth */)
	        downtooth.top= 0
	    }
	    toothno++
	    tx+= 25
	    if(toothno != miss) {
	        uptooth= instance_create(tx, 0, 546/* obj_amalgam_tooth */)
	        uptooth.top= 1
	    }
	    toothno++
	    tx+= 25
	}
	if(toothno != miss) {
	    downtooth= instance_create(tx, 0, 546/* obj_amalgam_tooth */)
	    downtooth.top= 0
	}

func _on_outside_room():
	draw_set_color(16777215)
	if(con == 1) {
	    obj_uborder.instant= 1
	    eye= 1
	    con= 2
	    $Alarm4.start((20) / 30.0)
	    event_user(1)
	    con= 4
	    $Alarm4.start((20) / 30.0)
	}
	if(con == 4) {
	    mcornerx-= 2
	    mcornery-= 3
	    mcornerx2+= 2
	    mcornery2-= 3
	}
	if(con == 5) {
	    con= 5.1
	    $Alarm4.start((8) / 30.0)
	}
	if(con == 6.1) {
	    con= 6
	    $Alarm4.start((8) / 30.0)
	}
	if(con == 6) {
	    mcornery--
	    mcornery2--
	    GS.idealborder[2]-= 2
	}
	if(con == 7) {
	    con= 8
	    $Alarm4.start((8) / 30.0)
	}
	if(con == 9) {
	    if(GS.idealborder[2] < 330) {
	        mcornery+= 8
	        mcornery2+= 8
	        GS.idealborder[2]+= 20
	        if(obj_heart.y < GS.idealborder[2] + 4)
	            obj_heart.y= GS.idealborder[2] + 4
	    } else  {
	        GS.idealborder[2]= 340
	        con= 10
	        $Alarm4.start((10) / 30.0)
	        yy= GS.idealborder[2]
	        yy2= GS.idealborder[3]
	        xx= mcornerx
	        xx2= mcornerx2
	    }
	}
	if(con == 10) {
	    mcornerx= xx + random(2) - 2
	    mcornerx2= xx2 + random(2) - 2
	    GS.idealborder[2]= yy + random(2) - 2
	    if(obj_heart.y < GS.idealborder[2] + 4)
	        obj_heart.y= GS.idealborder[2] + 4
	}
	if(con == 11) {
	    if(times >= maxtimes) con= 50
	    if(times < maxtimes) {
	        con= 12
	        obj_amalgam_tooth.con= 10
	        obj_amalgam_tooth.$Alarm2.start((1) / 30.0)
	    }
	}
	if(con == 12) {
	    if(GS.idealborder[2] > 260) {
	        mcornery-= 8
	        mcornery2-= 8
	        GS.idealborder[2]-= 20
	        if(obj_heart.y < GS.idealborder[2] + 4)
	            obj_heart.y= GS.idealborder[2] + 4
	    } else  {
	        event_user(1)
	        times++
	        GS.idealborder[2]= 250
	        con= 5.1
	        $Alarm4.start((20) / 30.0)
	        if(miss == 10 or miss == 0) $Alarm4.start((26) / 30.0)
	        yy= GS.idealborder[2]
	        yy2= GS.idealborder[3]
	        xx= mcornerx
	        xx2= mcornerx2
	    }
	}
	if(con == 50) {
	    eye= 0
	    obj_amalgam_tooth.con= 10
	    obj_amalgam_tooth.$Alarm2.start((1) / 30.0)
	    con= 51
	    $Alarm4.start((15) / 30.0)
	}
	GS.border= 9999
	if(con == 51) {
	    if(GS.idealborder[2] > 260)
	        GS.idealborder[2]-= 10
	    else  {
	        GS.idealborder[2]= 250
	        obj_uborder.instant= 0
	    }
	    if(mcornerx < GS.idealborder[0] - 5)
	        mcornerx+= 4
	    else  mcornerx= GS.idealborder[0]
	    if(mcornery < GS.idealborder[2] - 5)
	        mcornery+= 4
	    else  mcornery= GS.idealborder[2]
	    if(mcornerx2 > GS.idealborder[1] + 5)
	        mcornerx2-= 4
	    else  mcornerx2= GS.idealborder[1]
	    if(mcornery2 < GS.idealborder[2] - 5)
	        mcornery2+= 4
	    else  mcornery2= GS.idealborder[2]
	}
	if(eye == 1) {
	    if(eyestretch < 1) eyestretch+= 0.05
	    else  eyestretch= 1
	}
	if(eye == 0) {
	    if(eyestretch > 0) eyestretch-= 0.1
	    else  eyestretch= 0
	}
	draw_sprite_ext(706/* spr_amalgam_eye */, 0, GS.idealborder[0] + 120, GS.idealborder[2] - 80, 1, eyestretch, 0, 16777215, 1)
	draw_line_width(mcornerx, mcornery, GS.idealborder[0], GS.idealborder[2], 3)
	draw_line_width(mcornerx, mcornery, GS.idealborder[0], GS.idealborder[3], 3)
	draw_line_width(mcornerx2, mcornery2, GS.idealborder[1], GS.idealborder[2], 3)
	draw_line_width(mcornerx2, mcornery2, GS.idealborder[1], GS.idealborder[3], 3)

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
