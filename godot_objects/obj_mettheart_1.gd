# Auto-converted from GameMaker: obj_mettheart_1
# GM parent: obj_mettheart_parent
extends Node2D

func _ready():
	s= 0
	sf= 15
	sp= 15
	image_speed= 0
	lightning_timer= 30
	shake= 0
	memx= x
	memy= y
	life= 800
	movetype= 0

func _process(delta: float):
	if(movetype == 0) {
	    x= xstart + sin(s / sp) * sf
	    if(shake == 0) s++
	    if(shake > 0) {
	        x= memx + random(shake * 2) - shake
	        y= memy + random(shake * 2) - shake
	        shake--
	    }
	}
	lightning_timer++
	if(lightning_timer > 50 and lightning_timer < 60) {
	    ddir= random(360)
	    image_speed= 0.5
	}
	if(lightning_timer == 60) {
	    image_speed= 0
	    i= 0
	    repeat(10)  {
	        lt= instance_create(x, y, 433/* obj_mettlightning_pl */)
	        lt.speed= 2
	        lt.friction= -0.1
	        lt.direction= 0 + i * 360 / 10 + ddir
	        i++
	    }
	}
	if(lightning_timer == 66) {
	    image_speed= 0
	    i= 0
	    repeat(10)  {
	        lt= instance_create(x, y, 433/* obj_mettlightning_pl */)
	        lt.speed= 2
	        lt.friction= -0.1
	        lt.direction= 0 + (i + 0.5) * 360 / 10 + ddir
	        i++
	    }
	}
	if(lightning_timer == 72) {
	    image_speed= 0
	    i= 0
	    repeat(10)  {
	        lt= instance_create(x, y, 433/* obj_mettlightning_pl */)
	        lt.speed= 2
	        lt.friction= -0.1
	        lt.direction= 0 + i * 360 / 10 + ddir
	        i++
	    }
	}
	if(movetype == 99) {
	    if(lightning_timer == 110) {
	        i= 0
	        repeat(7)  {
	            bb[i]= instance_create(GS.idealborder[0] + i * 25, 100, 1363/* obj_npc_marker */)
	            bb[i].sprite_index= 550/* spr_blackbox_pl */
	            i++
	        }
	    }
	    if(lightning_timer > 110 and lightning_timer < 125) {
	        i= 0
	        repeat(7)  {
	            if(bb[i].visible == 0) bb[i].visible= 1
	            else  bb[i].visible= 0
	            i++
	        }
	    }
	    if(lightning_timer == 125) {
	        lightning_timer= 40
	        i= 0
	        repeat(7)  {
	            with(bb[i]) instance_destroy()
	            br[i]= instance_create(GS.idealborder[0] + i * 25, 100, 442/* obj_blackbox_pl */)
	            br[i].friction= -0.05
	            br[i].velocity.y-= random(0.2)
	            i++
	        }
	    }
	}
	if(lightning_timer == 95) {
	    mt= instance_create(GS.idealborder[0], -20, 431/* obj_mettfodder */)
	    mt.velocity.y= 5
	    mt.type= 2
	    mt.early= 200
	    mt= instance_create(GS.idealborder[1] - 25, -20, 431/* obj_mettfodder */)
	    mt.velocity.y= 5
	    mt.early= 200
	    mt.type= 2
	}
	if(lightning_timer == 130) lightning_timer= 36
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
	}
	GS.ratings+= 20

func _gm_event_7_11():
	movetype= 1
	lightning_timer= 400
	visible= 0
	mtb= instance_create(x, y, 449/* obj_mettheart_burst */)
	mtb.homex= xstart
	mtb.homey= ystart

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
