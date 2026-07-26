# Auto-converted from GameMaker: obj_boysnightout
extends Node2D

func _ready():
	scale.y= 5
	con= 0
	if(GS.plot > 145 or GS.flag[402] != 0) instance_destroy()

func _gm_event_2_4():
	con++

func _process(delta: float):
	if(con == 1) {
	    GS.msc= 0
	    GS.msg[0]= "* Hey^1! You^1!&* Stop!/%%"
	    con= 1.1
	    scr_regulartext()
	}
	if(con == 1.1 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.facing= 1
	    dragon= scr_marker(545, 310, 1838)
	    rabbit= scr_marker(530, 290, 1836)
	    with(dragon) scr_depth()
	    with(rabbit) scr_depth()
	    with(dragon) image_speed= 0.25
	    with(rabbit) image_speed= 0.25
	    dragon.velocity.x= -3
	    rabbit.velocity.x= -3
	    con= 2
	}
	if(con == 2 and dragon.x < obj_mainchara.x + 70 and rabbit.x < obj_mainchara.x + 70) {
	    obj_npc_marker.velocity.x= 0
	    obj_npc_marker.image_speed= 0
	    obj_npc_marker.frame= 0
	    con= 3
	}
	if(con == 3) {
	    GS.msg[0]= "* We\'ve^1, like^1, received an&  anonymous tip about a human&  wearing a striped shirt./"
	    GS.msg[1]= "* They told us they were&  wandering around Hotland&  right now.../"
	    GS.msg[2]= "* I know^1, sounds scary^1, huh?/"
	    GS.msg[3]= "* Well^1, just stay chill^1.&* We\'ll bring you someplace&  safe^1, OK?/%%"
	    scr_regulartext()
	    con= 4
	}
	if(con == 4 and not instance_exists(782/* OBJ_WRITER */)) {
	    with(dragon) sprite_index= 1839/* spr_royalguard_dragon_r */
	    with(rabbit) sprite_index= 1837/* spr_royalguard_rabbit_r */
	    obj_npc_marker.velocity.x= 3
	    obj_mainchara.velocity.x= 3
	    obj_npc_marker.image_speed= 0.25
	    obj_mainchara.image_speed= 0.25
	    con= 5
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 6) {
	    obj_npc_marker.velocity.x= 0
	    obj_npc_marker.image_speed= 0
	    obj_npc_marker.frame= 0
	    con= 7
	    $Alarm4.start((3) / 30.0)
	}
	if(con == 8) {
	    obj_mainchara.velocity.x= 0
	    obj_mainchara.image_speed= 0
	    obj_mainchara.frame= 0
	    con= 9
	    $Alarm4.start((20) / 30.0)
	}
	if(con == 10) {
	    with(rabbit) sprite_index= 1835/* spr_royalguard_rabbit_d */
	    GS.msg[0]= "* ... Huh^1?&* What is it, bro?/"
	    GS.msg[1]= "* The shirt they\'re wearing?/"
	    GS.msg[2]= "* ... like^1, what about it?/%%"
	    scr_regulartext()
	    con= 11
	}
	if(con == 11 and not instance_exists(782/* OBJ_WRITER */)) {
	}
	if(con == 11 and not instance_exists(782/* OBJ_WRITER */)) {
	    with(rabbit) sprite_index= 1836/* spr_royalguard_rabbit_l */
	    with(dragon) sprite_index= 1838/* spr_royalguard_dragon_l */
	    con= 12
	    $Alarm4.start((90) / 30.0)
	}
	if(con == 13) {
	    with(rabbit) sprite_index= 1835/* spr_royalguard_rabbit_d */
	    GS.msg[0]= "* Bro.../"
	    GS.msg[1]= "* Are you thinkin..^1.&* What I\'m thinkin?/"
	    GS.msg[2]= "* Bummer^1.&* This is^1, like..^1.&* Mega embarrassing./"
	    GS.msg[3]= "* We^1, like^1, actually&  totally have to kill&  you and stuff./%%"
	    con= 14
	    scr_regulartext()
	}
	if(con == 14 and not instance_exists(782/* OBJ_WRITER */)) {
	    if(OBJ_WRITER.stringno == 2) {
	        with(rabbit) sprite_index= 1837/* spr_royalguard_rabbit_r */
	    }
	    if(OBJ_WRITER.stringno == 3) {
	        with(rabbit) sprite_index= 1836/* spr_royalguard_rabbit_l */
	    }
	}
	if(con == 14 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.battlegroup= 49
	    GS.mercy= 1
	    instance_create(0, 0, 142/* obj_battler */)
	    con= 15
	    $Alarm4.start((33) / 30.0)
	}
	if(con == 16) {
	    GS.mercy= 0
	    GS.interact= 0
	    caster_resume(GS.currentsong)
	    if(GS.flag[12] == 1) GS.flag[402]= 1
	    con= 17
	    GS.plot= 146
	    // obj_npc_marker
	    with(1363) instance_destroy()
	}

func _on_alarm_0_timeout():
	if(GS.interact == 0 and con == 0) {
	    caster_pause(GS.currentsong)
	    GS.interact= 1
	    con= 1
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
