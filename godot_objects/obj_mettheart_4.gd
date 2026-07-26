# Auto-converted from GameMaker: obj_mettheart_4
# GM parent: obj_mettheart_parent
extends Node2D

func _ready():
	s= 0
	sf= 40
	sp= 15
	s2= 0
	sf2= 40
	s3= 88
	image_speed= 0
	lightning_timer= 20
	shake= 3
	memx= x
	memy= y
	life= 1000
	movetype= 0
	i= 0
	moving= 0
	ltimer= 0
	times= 0
	size= 1
	moving= 3
	$Alarm3.start((60) / 30.0)
	lastcon= 0
	velocity.y= -1.5

func _gm_event_2_4():
	lastcon++

func _gm_event_2_3():
	moving++
	speed= 0

func _process(delta: float):
	life--
	if(life < 1000 and shake < 0) shake= 1
	if(life < 500 and shake < 2) shake= 2
	if(movetype == 0) {
	    if(moving == 0) {
	        newx= xstart + random(60) - random(60)
	        newy= ystart + random(20) - random(20)
	        distspeed= distance_to_point(newy, newx) / 20
	        move_towards_point(newx, newy, distspeed)
	        $Alarm3.start((8) / 30.0)
	        moving= 1
	        image_speed= 0.5
	    }
	    if(moving == 2) {
	        image_speed= 0
	        frame= 0
	        chch= choose(0, 1)
	        thisx= obj_heart.x + 10
	        thisy= obj_heart.y + 10
	        ltimer= 100
	        speed= 0
	        moving= 3
	        $Alarm3.start((30) / 30.0)
	    }
	    if(moving == 4) moving= 0
	    if(shake > 0) {
	        x+= random(shake) - random(shake)
	        y+= random(shake) - random(shake)
	        shake--
	    }
	}
	lightning_timer++
	if(ltimer >= 100) {
	    ltimer++
	    if(ltimer == 100 or ltimer == 102 or ltimer == 104 or ltimer == 106) {
	        lt= instance_create(x, y, 433/* obj_mettlightning_pl */)
	        lt.friction= -0.1
	        lt.speed= 8
	        lt.direction= point_direction(x, y, thisx, thisy)
	    }
	    if(ltimer == 108 or ltimer == 110 or ltimer == 112 or ltimer == 114) {
	        lt= instance_create(x, y, 433/* obj_mettlightning_pl */)
	        lt.friction= -0.1
	        lt.speed= 8
	        if(chch == 1)
	            lt.direction= point_direction(x, y, thisx, thisy) - 10
	        else 
	            lt.direction= point_direction(x, y, thisx, thisy) + 10
	    }
	    if(ltimer == 116 or ltimer == 118 or ltimer == 120 or ltimer == 122) {
	        lt= instance_create(x, y, 433/* obj_mettlightning_pl */)
	        lt.friction= -0.1
	        lt.speed= 8
	        if(chch == 1)
	            lt.direction= point_direction(x, y, thisx, thisy) + 10
	        else 
	            lt.direction= point_direction(x, y, thisx, thisy) - 10
	    }
	    if(ltimer == 125) ltimer= 0
	}
	if(size > 1) {
	    scale.x= size
	    scale.y= size
	    size-= 0.5
	    if(size == 1) frame= 0
	}
	if(lastcon == 1 and GS.turntimer > 1) {
	    // obj_ratingsmaster
	    with(402) active= 0
	    movetype= 1
	    lightning_timer= 400
	    visible= 0
	    GS.faceemotion= 6
	    obj_mettb_body.pause= 2
	    obj_mettb_body.hurt= 2
	    obj_mettb_body.dsf= 2
	    obj_mettattackgen.dark= 0
	    caster_stop(-3)
	    obj_heart.shot= 0
	    GS.turntimer= 900
	    mtb= instance_create(x, y, 449/* obj_mettheart_burst */)
	    mtb.homex= xstart
	    mtb.homey= ystart
	    mtb.another= 1
	    lastcon= 2
	}
	if(lastcon >= 2) {
	    GS.faceemotion= 6
	    obj_mettb_body.hurt= 2
	}
	if(lastcon == 3) {
	    // obj_mettattackgen
	    with(414) instance_destroy()
	    lastcon= 4
	    $Alarm4.start((50) / 30.0)
	}
	if(lastcon == 4) obj_mettb_body.dsf-= 0.04
	if(lastcon == 5) {
	    obj_mettatonex.con= 50
	    GS.mnfight= -1
	    GS.myfight= -1
	    instance_destroy()
	}

func _on_alarm_0_timeout():
	snd_play(126/* snd_mtt_hit */)
	event_user(0)
	// other
	with(-2) instance_destroy()
	life-= 40
	if(life < 1 and movetype != 1 and GS.turntimer > 0)
	    GS.turntimer= 0
	GS.ratings+= 20

func _gm_event_7_11():
	movetype= 1
	lightning_timer= 400
	visible= 0
	if(lastcon == 0) lastcon= 1
	GS.turntimer= 900

func _gm_event_7_10():
	memx= x
	memy= y
	shake= 10
	frame= 1
	size= 2

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
