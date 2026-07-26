# Auto-converted from GameMaker: obj_sans_sentry2
# GM parent: obj_readablesolid
extends CharacterBody2D

func _ready():
	dsprite= 1353
	usprite= 1362
	lsprite= 1367
	rsprite= 1363
	dtsprite= 1353
	utsprite= 1362
	ltsprite= 1367
	rtsprite= 1363
	myinteract= 0
	facing= 0
	direction= 270
	talkedto= 0
	image_speed= 0
	con= 0
	touched= 0
	gone= 0
	if(GS.flag[413] > 0) gone= 1
	if(GS.flag[67] == 1) gone= 1
	if(GS.plot >= 200) gone= 1
	if(gone == 1) instance_destroy()

func _gm_event_2_4():
	con++

func _gm_event_2_2():
	GS.entrance= 23
	instance_create(0, 0, 148/* obj_persistentfader */)
	get_tree().change_scene_to_file("res://godot_rooms/73.tscn")

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 17
	GS.facechoice= 3
	GS.faceemotion= 0
	GS.msg[0]= "* grievous error/%%"
	if(GS.flag[89] == 0) GS.msc= 567
	if(GS.flag[89] == 2)
	    GS.msg[0]= "* let\'s hang out again&  sometime./%%"
	if(scr_murderlv() >= 7) {
	    GS.faceemotion= 3
	    GS.msc= 0
	    GS.msg[0]= "\\E3* hey^1, i really&  respect what you did&  back there./"
	    GS.msg[1]= "\\E2* thanks./%%"
	}
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	talkedto++

func _process_begin(delta: float):
	scr_depth(0, 0, 0, 0, 0)

func _process(delta: float):
	if(myinteract == 1) {
	    GS.interact= 1
	    $Alarm0.start((1) / 30.0)
	    myinteract= 2
	}
	if(myinteract == 3 and not is_instance_valid(mydialoguer) and con == 0) {
	    GS.interact= 0
	    myinteract= 0
	}
	if(con == 1 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 2
	    $Alarm4.start((10) / 30.0)
	    GS.interact= 1
	}
	if(con == 2) GS.interact= 1
	if(con == 3) {
	    sprite_index= lsprite
	    image_speed= 0.25
	    velocity.x= -3
	    con= 4
	    $Alarm4.start((14) / 30.0)
	}
	if(con == 5) {
	    sprite_index= dsprite
	    velocity.x= 0
	    velocity.y= 3
	    con= 6
	    $Alarm4.start((18) / 30.0)
	    GS.facing= 3
	}
	if(con == 7) {
	    sprite_index= rsprite
	    GS.facing= 0
	    velocity.x= 3
	    velocity.y= 0
	    con= 8
	    $Alarm4.start((17) / 30.0)
	}
	if(con == 9) {
	    image_speed= 0
	    velocity.x= 0
	    con= 10
	    $Alarm4.start((20) / 30.0)
	}
	if(con == 11) {
	    instance_create(0, 0, 92/* obj_musfadeout */)
	    GS.facing= 0
	    sprite_index= usprite
	    frame= 0
	    GS.msc= 0
	    GS.facechoice= 3
	    GS.msg[0]= "* over here^1.&* i know a shortcut./%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 12
	}
	if(con == 12 and not instance_exists(782/* OBJ_WRITER */)) {
	    // obj_doorA
	    with(805) instance_destroy()
	    // obj_doorAmusicfade
	    with(811) instance_destroy()
	    GS.facing= 1
	    velocity.x= 3
	    sprite_index= rsprite
	    image_speed= 0.25
	    obj_mainchara.velocity.x= 2
	    obj_mainchara.velocity.y= 1
	    obj_mainchara.image_speed= 0.334
	    con= 13
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 14) {
	    event_user(2)
	    con= 15
	}

func _gm_event_7_12():
	GS.interact= 3
	instance_create(0, 0, 92/* obj_musfadeout */)
	instance_create(0, 0, 149/* obj_unfader */)
	if(touched == 0) {
	    $Alarm2.start((13) / 30.0)
	    touched= 1
	}
	if(GS.flag[89] < 1) GS.flag[89]= 1

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
