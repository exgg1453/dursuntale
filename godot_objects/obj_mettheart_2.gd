# Auto-converted from GameMaker: obj_mettheart_2
# GM parent: obj_mettheart_parent
extends Node2D

func _ready():
	s= 0
	sf= 30
	sp= 20
	s2= 0
	sf2= 30
	image_speed= 0
	lightning_timer= 20
	shake= 0
	memx= x
	memy= y
	life= 800
	movetype= 0
	i= 0
	num= 8
	repeat(num)  {
	    kid[i]= instance_create(x, y, 418/* obj_bulletblocker */)
	    greg= degtorad(i * 360 / num)
	    if(instance_exists(kid[i])) {
	        kid[i].x= x + sin(greg) * sf2 - 10
	        kid[i].y= y + cos(greg) * sf2 - 10
	    }
	    i++
	}

func _process(delta: float):
	q= 0
	s2+= 0.2
	repeat(num)  {
	    greg= degtorad(q * 360 / num)
	    if(instance_exists(kid[q])) {
	        kid[q].x= x + sin(greg + s2) * sf2 - 10
	        kid[q].y= y + cos(greg + s2) * sf2 - 10
	    }
	    q++
	}
	if(movetype == 0) {
	    x= xstart + sin(s / sp) * sf
	    y= ystart + sin(s / sp * 2) * sf / 3
	    if(shake == 0) s++
	    if(shake > 0) {
	        x= memx + random(shake * 2) - shake
	        y= memy + random(shake * 2) - shake
	        shake--
	    }
	}
	lightning_timer++
	if(lightning_timer > 40 and lightning_timer < 50) {
	    ddir= random(360)
	    image_speed= 0.5
	}
	if(lightning_timer == 50) {
	    image_speed= 0
	    i= 0
	    repeat(11)  {
	        lt= instance_create(x, y, 433/* obj_mettlightning_pl */)
	        if(is_instance_valid(lt)) {
	            lt.speed= 2
	            lt.friction= -0.09
	            lt.direction= 0 + i * 360 / 11 + ddir
	        }
	        i++
	    }
	}
	if(lightning_timer == 56) {
	    image_speed= 0
	    i= 0
	    repeat(11)  {
	        lt= instance_create(x, y, 433/* obj_mettlightning_pl */)
	        if(is_instance_valid(lt)) {
	            lt.speed= 2
	            lt.friction= -0.09
	            lt.direction= 0 + (i + 0.5) * 360 / 11 + ddir
	        }
	        i++
	    }
	}
	if(lightning_timer == 62) {
	    image_speed= 0
	    i= 0
	    repeat(11)  {
	        lt= instance_create(x, y, 433/* obj_mettlightning_pl */)
	        if(is_instance_valid(lt)) {
	            lt.speed= 2
	            lt.friction= -0.09
	            lt.direction= 0 + i * 360 / 11 + ddir
	        }
	        i++
	    }
	}
	if(lightning_timer == 94938249) {
	    image_speed= 0
	    i= 0
	    repeat(11)  {
	        lt= instance_create(x, y, 433/* obj_mettlightning_pl */)
	        if(is_instance_valid(lt)) {
	            lt.speed= 2
	            lt.friction= -0.09
	            lt.direction= 0 + (i + 0.5) * 360 / 11 + ddir
	        }
	        i++
	    }
	}
	if(lightning_timer > 100 and lightning_timer < 145) {
	    s2-= 0.17
	    sf2+= 9
	}
	if(lightning_timer == 145) {
	    q= 0
	    repeat(num)  {
	        with(kid[q]) visible= 1
	        q++
	    }
	}
	if(lightning_timer > 145 and lightning_timer < 300) {
	    s2-= 0.15
	    sf2-= 8
	    if(sf2 < 35) {
	        sf2= 30
	        lightning_timer= 40
	    }
	}
	if(movetype == 99) {
	    if(lightning_timer == 110) {
	        i= 0
	        repeat(7)  {
	            bb[i]= instance_create(GS.idealborder[0] + i * 25, 100, 1363/* obj_npc_marker */)
	            with(bb[i]) sprite_index= 515/* spr_plusbomb */
	            i++
	        }
	    }
	    if(lightning_timer > 110 and lightning_timer < 125) {
	        i= 0
	        repeat(7)  {
	            with(bb[i]) {
	                if(visible == 0) visible= 1
	                else  visible= 0
	            }
	            i++
	        }
	    }
	    if(lightning_timer == 125) {
	        lightning_timer= 35
	        i= 0
	        fs= choose(0, 1, 2, 3, 4, 5, 6)
	        fs0= choose(0, 1, 2, 3, 4, 5, 6)
	        if(fs == fs0) fs++
	        if(fs > 6) fs= 0
	        repeat(7)  {
	            with(bb[i]) instance_destroy()
	            br[i]= instance_create(GS.idealborder[0] + i * 25, 100, 445/* obj_plusbomb */)
	            with(br[i]) friction= 0
	            v= choose(4, 4.5, 5)
	            if(instance_exists(br[i])) {
	                br[i].velocity.y= v
	                if(i == fs) br[i].velocity.y= 6
	                if(i == fs0) br[i].velocity.y= 3
	            }
	            i++
	        }
	    }
	}
	if(lightning_timer == 95 and movetype == 99) {
	    mt= instance_create(GS.idealborder[0], -20, 432/* obj_dancemett */)
	    mt.velocity.y= 3
	    mt.type= 2
	    mt.early= 200
	    mt= instance_create(GS.idealborder[1] - 25, -20, 432/* obj_dancemett */)
	    mt.velocity.y= 3
	    mt.early= 200
	    mt.type= 2
	}
	if(GS.turntimer < 5) {
	    // obj_mettb_body
	    with(408) {
	        if(noarm == 0) event_user(2)
	    }
	}
	life--

func _on_alarm_0_timeout():
	snd_play(126/* snd_mtt_hit */)
	event_user(0)
	// other
	with(-2) instance_destroy()
	life-= 40
	if(life < 1 and movetype != 1) {
	    // obj_blackbox_pl
	    with(442) instance_destroy()
	    // obj_mettlightning_pl
	    with(433) instance_destroy()
	    // obj_npc_marker
	    with(1363) instance_destroy()
	    // obj_mettfodder
	    with(431) {
	        flash= 5
	        type= 2
	    }
	    // obj_kissybullet_pl
	    with(434) instance_destroy()
	    event_user(1)
	    q= 0
	    repeat(num)  {
	        kid[q].visible= 0
	        q++
	    }
	}
	GS.ratings+= 20

func _gm_event_7_11():
	movetype= 1
	lightning_timer= 400
	visible= 0
	mtb= instance_create(x, y, 449/* obj_mettheart_burst */)
	mtb.homex= xstart
	mtb.homey= ystart
	// obj_mettb_body
	with(408) {
	    if(noarm == 0) event_user(2)
	}

func _gm_event_7_10():
	memx= x
	memy= y
	shake= 6

func _on_outside_room():
	draw_sprite(sprite_index, frame, x, y)
	draw_set_color(16777215)

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
