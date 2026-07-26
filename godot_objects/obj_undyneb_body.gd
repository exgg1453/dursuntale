# Auto-converted from GameMaker: obj_undyneb_body
extends Node2D

func _ready():
	part[0]= instance_create(x + 80, y, 1363/* obj_npc_marker */)
	part[1]= instance_create(x + 4, y - 4, 1363/* obj_npc_marker */)
	part[2]= instance_create(x + 52, y + 56, 1363/* obj_npc_marker */)
	part[3]= instance_create(x + 148, y + 78, 1363/* obj_npc_marker */)
	part[4]= instance_create(x + 78, y + 120, 1363/* obj_npc_marker */)
	part[5]= instance_create(x + 12 + 70, y + 78 - 12, 1363/* obj_npc_marker */)
	part[6]= instance_create(x + 78, y + 154, 1363/* obj_npc_marker */)
	ydiff= 0
	xdiff= 0
	siner= 0
	air= 0
	head= part[0]
	head.sprite_index= 283/* spr_undyneb_face */
	hair= part[1]
	hair.sprite_index= 282/* spr_undyneb_hair */
	armor= part[2]
	armor.sprite_index= 286/* spr_undyneb_armor */
	pants= part[4]
	pants.sprite_index= 287/* spr_undyneb_pants */
	larm= part[5]
	larm.sprite_index= 288/* spr_undyneb_leftarm */
	rarm= part[3]
	rarm.sprite_index= 289/* spr_undyneb_rightarm */
	legs= part[6]
	legs.sprite_index= 281/* spr_undyneb_legs */
	i= 0
	while(i < 7) {
	    part[i].z_index= z_index + i
	    part[i].visible= 1
	    part[i].image_speed= 0
	    part[i].scale.x= 2
	    part[i].scale.y= 2
	    i++
	}
	hair.image_speed= 0.25
	movetype= 0
	jumpno= 0
	slashno= 0
	fadeout= 0

func _gm_event_1_0():
	i= 0
	while(i < 7) {
	    with(part[i]) instance_destroy()
	    i++
	}

func _gm_event_2_1():
	slashno++

func _on_destroy():
	event_user(1)

func _gm_event_7_14():
	instance_create(x - 20, y - 20, 262/* obj_undynesiner2 */)

func _gm_event_7_13():
	melter= instance_create(x, y, 1363/* obj_npc_marker */)
	obj_undyneboss.melter= melter
	with(melter) {
	    image_speed= 0
	    visible= 1
	    frame= 1
	    sprite_index= 279/* spr_undyneb_melt */
	    scale.x= 2
	    scale.y= 2
	    z_index= 5
	    modulate.a= 0
	}
	fadeout= 1

func _gm_event_7_12():
	if(movetype == 0) movetype= 2

func _gm_event_7_11():
	movetype= 1
	legs.frame= 1
	velocity.y= -9 - random(4)
	velocity.x= random(6) - 3
	gravity= 1.3
	gravity_direction= 270
	jumpno++
	y= ystart
	if(jumpno == 3) {
	    velocity.y= -12
	    velocity.x= (xstart - x) / 18
	}
	air= 0
	larm.velocity.x= velocity.x / 0.93
	larm.velocity.y= velocity.y - 2
	larm.gravity= gravity + 0.1
	larm.gravity_direction= 270
	rarm.velocity.x= velocity.x / 1.1
	rarm.velocity.y= velocity.y - 2
	rarm.gravity= gravity + 0.1
	rarm.gravity_direction= 270
	legs.velocity.x= velocity.x / 1.1
	legs.velocity.y= velocity.y - 2
	legs.gravity= gravity + 0.1
	legs.gravity_direction= 270

func _gm_event_7_0():
	head.frame= GS.faceemotion
	if(movetype == 0) {
	    siner+= 1.2
	    if(obj_undyneboss.order == -39) siner-= 0.2
	    if(obj_undyneboss.order == -38) siner-= 0.4
	    if(obj_undyneboss.order == -37) siner-= 0.6
	    if(obj_undyneboss.order == -36) siner-= 0.8
	    if(obj_undyneboss.order == -35 or obj_undyneboss.order == -35)
	        siner--
	    legs.frame= 0
	    ydiff= y - ystart
	    xdiff= x - xstart
	    larm.z_index= z_index + 5
	    hair.y= hair.ystart + sin(siner / 6) * 4 + ydiff
	    head.y= head.ystart + sin(siner / 6) * 2 + ydiff
	    armor.y= armor.ystart + sin(siner / 6) * 4 + ydiff
	    pants.y= pants.ystart + sin(siner / 6) * 2 + ydiff
	    larm.y= larm.ystart + sin(siner / 6) * 5 + ydiff
	    larm.x= larm.xstart + sin(siner / 6) * 5 + xdiff
	    rarm.y= rarm.ystart + sin(siner / 6) * 6 + sin(siner / 3) * 2 + ydiff
	    rarm.x= rarm.xstart - sin(siner / 3) * 2 + xdiff
	    legs.y= legs.ystart + ydiff
	    if(rarm.rotation_degrees > 0)
	        rarm.rotation_degrees-= 15
	    if(larm.rotation_degrees < 0)
	        larm.rotation_degrees+= 15
	} else  {
	    ydiff= y - ystart
	    xdiff= x - xstart
	    i= 0
	    while(i < 3) {
	        part[i].x= part[i].xstart + xdiff
	        part[i].y= part[i].ystart + ydiff
	        i++
	    }
	    part[4].x= part[4].xstart + xdiff
	    part[4].y= part[4].ystart + ydiff
	    if(y <= ystart) air++
	    larm.rotation_degrees+= larm.velocity.y
	    rarm.rotation_degrees-= rarm.velocity.y
	}
	if(movetype == 1 and velocity.y > 0 and y > ystart - 8) {
	    y= ystart
	    i= 0
	    while(i < 7) {
	        part[i].x= part[i].xstart + xdiff
	        part[i].y= part[i].ystart + ydiff
	        i++
	    }
	    legs.gravity= 0
	    legs.velocity.y= 0
	    legs.velocity.x= 0
	    legs.gravity= 0
	    legs.frame= 0
	    larm.gravity= 0
	    larm.velocity.y= 0
	    larm.velocity.x= 0
	    larm.gravity= 0
	    larm.frame= 0
	    rarm.gravity= 0
	    rarm.velocity.y= 0
	    rarm.velocity.x= 0
	    rarm.gravity= 0
	    rarm.frame= 0
	    velocity.y= 0
	    velocity.x= 0
	    gravity= 0
	    if(jumpno <= 2) $Alarm0.start((4) / 30.0)
	    else  movetype= 0
	}
	if(movetype == 2) {
	    if(slashno == 0 and larm.rotation_degrees > -84)
	        larm.rotation_degrees-= 25
	    if(slashno == 0 and larm.rotation_degrees <= -84) {
	        larm.rotation_degrees= -84
	        $Alarm1.start((5) / 30.0)
	        slashno= 0.1
	    }
	    if(slashno == 1.1) {
	        slashno= 1
	        $Alarm1.start((2) / 30.0)
	    }
	    if(slashno == 1) {
	        larm.z_index= 4
	        larm.rotation_degrees+= 55
	    }
	    if(slashno == 2) {
	        larm.rotation_degrees= 66
	        slash= instance_create(larm.x - 180, larm.y + 20, 1363/* obj_npc_marker */)
	        slash.sprite_index= 280/* spr_undyneb_smear */
	        slash.visible= 1
	        slash.modulate.a= 1
	        slashno= 3
	    }
	    if(slashno == 3) {
	        slash.modulate.a-= 0.1
	        larm.rotation_degrees+= 0.5
	        if(larm.rotation_degrees > 70) {
	            with(slash) instance_destroy()
	            slashno= 4
	            $Alarm1.start((3) / 30.0)
	        }
	    }
	    if(slashno == 5) {
	        larm.rotation_degrees-= 15
	        if(larm.rotation_degrees <= 6) {
	            larm.rotation_degrees= 0
	            slashno= 0
	            movetype= 0
	        }
	    }
	}
	if(fadeout == 1) {
	    melter.frame= 0
	    modulate.a-= 0.05
	    i= 0
	    while(i < 7) {
	        part[i].modulate.a-= 0.2
	        i++
	    }
	    with(melter) modulate.a+= 0.2
	    if(modulate.a <= 0) instance_destroy()
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
