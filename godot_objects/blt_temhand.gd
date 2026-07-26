# Auto-converted from GameMaker: blt_temhand
extends Node2D

func _ready():
	if(instance_exists(294/* obj_tembody */)) obj_tembody.atk= 1
	i= 0
	repeat(10)  {
	    temdir[i]= 0
	    temtim[i]= 0
	    temx1[i]= 0
	    temx2[i]= 0
	    temy1[i]= 0
	    temy2[i]= 0
	    i++
	}
	speed= 4
	temx1[0]= x
	temx2[0]= x + 9
	temy1[0]= y
	temy[0]= y + 9
	temdir[0]= 270
	direction= temdir[0]
	$Alarm0.start((20 + random(20)) / 30.0)
	temtim[0]= 90
	temno= 0
	turned= 0

func _gm_event_1_0():
	if(instance_number(object_index) == 1) {
	    // obj_tembody
	    with(294) $Alarm3.start((30) / 30.0)
	}

func _gm_event_2_1():
	direction= temdir[temno] - 180
	speed= 12
	if(direction == 0 and x >= temx1[temno] - 6) {
	    temx1[temno]= 0
	    temno--
	    x= temx2[temno] - 22
	    y+= 4
	}
	if(direction == 180 and x <= temx1[temno] + 6) {
	    temx1[temno]= 0
	    temno--
	    x= temx2[temno] + 2
	}
	if(direction == 270 and y >= temy1[temno] - 6) {
	    temx1[temno]= 0
	    temno--
	    y= temy2[temno] - 22
	}
	if(direction == 90 and y <= temy1[temno] + 6) {
	    temx1[temno]= 0
	    temno--
	    x+= 4
	    y= temy2[temno] + 2
	}
	$Alarm1.start((1) / 30.0)
	if(temno < 4 and GS.turntimer < 2 and turned == 0) {
	    turned= 1
	    GS.turntimer= -1
	    GS.mnfight= 3
	}
	if(instance_number(object_index) > 1) instance_destroy()
	if(temno == 0 and y < ystart + 25) {
	    temno= 0
	    if(instance_exists(294/* obj_tembody */)) obj_tembody.atk= 0
	    instance_destroy()
	}

func _on_destroy():
	if(temno < 8) {
	    temno++
	    temx1[temno]= x
	    temy1[temno]= y
	    xdif= x - obj_heart.x + 6
	    ydif= y - obj_heart.y + 6
	    final= abs(xdif) - abs(ydif)
	    if(final <= 0) {
	        if(ydif >= 0) direction= 90
	        else  direction= 270
	    } else  {
	        if(xdif >= 0) direction= 180
	        else  direction= 0
	    }
	    temdir[temno]= direction
	    if(temdir[temno] == temdir[temno - 1] + 180 or temdir[temno] == temdir[temno - 1] - 180) {
	        direction-= 90
	        temdir[temno]-= 90
	    }
	    if(temdir[temno] == temdir[temno - 1]) {
	        temx1[temno]= 0
	        temno--
	    }
	    if(temno > 0) {
	        if(direction == 90 and temdir[temno - 1] == 180)
	            temx2[temno - 1]= x
	        if(direction == 180 and temdir[temno - 1] == 90)
	            temy2[temno - 1]= y
	    }
	    $Alarm0.start((60 + random(20)) / 30.0)
	    temtim[temno]= alarm[0]
	} else  $Alarm1.start((1) / 30.0)

func _gm_event_7_11():
	if(GS.invc < 1) {
	    dmgamt= round(dmg - (GS.df + GS.adef) / 5)
	    if(dmgamt < 1) dmgamt= 1
	    GS.hp-= dmgamt
	    snd_play(53/* snd_hurt1 */)
	    GS.hshake= 2
	    GS.shakespeed= 2
	    GS.vshake= 2
	    instance_create(0, 0, 184/* obj_shaker */)
	    GS.invc= GS.inv * 2
	    if(GS.battlegroup == 22 and GS.hp < 1)
	        obj_torielboss.sprite_index= 726/* spr_torielboss_mouthcover */
	}

func _on_outside_room():
	adjustx= 0
	adjusty= 0
	if(direction == 0) adjustx= 4
	if(direction == 180) adjustx= 4
	if(direction == 270) adjusty= 4
	if(direction == 90) adjusty= 4
	draw_sprite(sprite_index, frame, x + adjustx, y + adjusty)
	temx2[temno]= x + 10
	temy2[temno]= y + 10
	xdif= x - obj_heart.x + 2
	ydif= y - obj_heart.y + 6
	if(abs(xdif) < 20 and alarm[0] > 5)
	    alarm[0]-= 2
	if(abs(ydif) < 20 and alarm[0] > 5)
	    alarm[0]-= 2
	if(abs(xdif) < 10 and alarm[0] > 4)
	    alarm[0]/= 2
	if(abs(ydif) < 10 and alarm[0] > 4)
	    alarm[0]/= 2
	i= 0
	while(i < 10) {
	    draw_set_color(16777215)
	    if(temx1[i] > 0) {
	        draw_rectangle(temx1[i], temy1[i], temx2[i], temy2[i], 0)
	        if(collision_rectangle(temx1[i], temy1[i], temx2[i], temy2[i], 743, 0, 1))
	            event_user(1)
	    }
	    i++
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
