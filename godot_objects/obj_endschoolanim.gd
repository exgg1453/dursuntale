# Auto-converted from GameMaker: obj_endschoolanim
extends Node2D

func _ready():
	tor= instance_create(188, 170, 1363/* obj_npc_marker */)
	tor.sprite_index= 2452/* spr_toriel_school */
	tor.image_speed= 0
	tor.visible= 1
	asg= instance_create(240, 365, 1363/* obj_npc_marker */)
	asg.sprite_index= 2450/* spr_asgore_shears */
	asg.image_speed= 0.1
	asg.visible= 1
	$Alarm5.start((10) / 30.0)
	image_speed= 0.2
	velocity.x= 6
	con= 0
	timer= 0
	x= -700
	view_xview[0]= -180
	td= 0
	t3= instance_create(15, 140, 1689/* obj_creditsword */)
	t3.text= "TORIEL"
	t3.text2= "by Toby"
	caster_stop(GS.endsong[5])
	caster_stop(GS.endsong[6])
	caster_play(GS.endsong[7], 1, 1)
	vol= 0.9
	GS.inbattle= 0

func _gm_event_2_5():
	$Alarm5.start((20) / 30.0)
	instance_create(asg.x + 57 - random(3) + random(3), asg.y + 11 - random(3) + random(3), 1694/* obj_tinyleaf */)
	instance_create(asg.x + 57 - random(3) + random(3), asg.y + 11 - random(3) + random(3), 1694/* obj_tinyleaf */)

func _gm_event_2_4():
	con++

func _process(delta: float):
	if(x < -100) {
	    if(view_xview[0] < 0) view_xview[0]+= 4
	    else  view_xview[0]= 0
	}
	if(x > -440 and td == 0) {
	    td= 1
	    t1= instance_create(10, view_yview[0] + 20, 1689/* obj_creditsword */)
	    t1.text= "ASGORE"
	    t1.text2= "by Toby"
	}
	if(x > 0 and td == 1) {
	    t2= instance_create(10, view_yview[0] + 120, 1689/* obj_creditsword */)
	    t2.text= "MONSTER#KID"
	    t2.text2= "by#Magnolia Porter"
	    td= 2
	}
	if(x >= 195 and con == 0) {
	    velocity.x= 0
	    x= 198
	    con= 1
	    sprite_index= 1389/* spr_mkid_trip_r */
	    frame= 0
	    image_speed= 0.25
	    asg.sprite_index= 2451/* spr_asgore_shears_sad */
	    asg.image_speed= 0
	    asg.frame= 0
	    $Alarm5.start((-1) / 30.0)
	}
	if(con == 1 and frame >= 19) {
	    image_speed= 0
	    con= 2
	    $Alarm4.start((30) / 30.0)
	}
	if(y < 360 and td == 2) {
	    with(t1) fader= 1
	    with(t2) fader= 1
	    td= 3
	}
	if(is_instance_valid(t3) and t3.y > view_yview[0] + 84)
	    t3.y= view_yview[0] + 84
	if(con == 3) {
	    asg.sprite_index= 2450/* spr_asgore_shears */
	    asg.image_speed= 0.1
	    $Alarm5.start((10) / 30.0)
	    x+= 13
	    sprite_index= 1400/* spr_mkid_u */
	    image_speed= 0.2
	    velocity.y= -1
	    con= 4
	}
	if(con == 4) {
	    if(view_yview[0] > 0) view_yview[0]--
	    else  {
	        velocity.y= -0.5
	        image_speed= 0.1
	        if(is_instance_valid(t3)) t3.fader= 1
	        else  {
	            vol-= 0.01
	            caster_set_volume(-3, vol)
	            view_xview[0]-= 2
	            if(view_xview[0] < -200) get_tree().change_scene_to_file("res://godot_rooms/283.tscn")
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
