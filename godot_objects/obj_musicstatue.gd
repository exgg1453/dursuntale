# Auto-converted from GameMaker: obj_musicstatue
# GM parent: obj_readablesolid
extends CharacterBody2D

func _ready():
	myinteract= 0
	facing= 0
	direction= 270
	talkedto= 0
	image_speed= 0
	mask= instance_create(x, y, 1363/* obj_npc_marker */)
	mask.sprite_index= 1588/* spr_plinkmask */
	mask.image_speed= 0
	shadow= instance_create(0, 0, 1363/* obj_npc_marker */)
	shadow.sprite_index= 1583/* spr_statueshadow */
	shadow.modulate.a= 0.4
	shadow.z_index= 1000
	shadow.visible= 1
	light= instance_create(0, 0, 1363/* obj_npc_marker */)
	light.sprite_index= 1584/* spr_statuelight */
	light.modulate.a= 0.1
	light.z_index= 1000
	light.visible= 1
	bgvol= caster_get_volume(GS.currentsong)
	boxvol= 0.25
	boxactive= 0
	if(GS.flag[86] == 1) {
	    boxactive= 1
	    mask.frame= 1
	    musicbox= caster_load("music/musicbox.ogg")
	    frame= 1
	    caster_loop(musicbox, 0.25, 0.9)
	}
	con= 0
	$Alarm5.start((2) / 30.0)

func _gm_event_2_5():
	instance_create(x + 2 + random(sprite_width - 6), -8 - random(20), 1152/* obj_statuedrop */)
	$Alarm5.start((3) / 30.0)

func _on_destroy():
	myinteract= 3
	GS.msc= 585
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	GS.msg[0]= "* NO!/%%"
	if(GS.flag[7] == 1 and GS.flag[85] == 1 and GS.flag[86] == 0) {
	    GS.msc= 0
	    GS.msg[0]= "* (No point in giving it an&  umbrella now.)/%%"
	}
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	talkedto++

func _process_begin(delta: float):
	scr_depth(0, 0, 0, 0, 0)
	if(con == 1) {
	    con= 2
	    musicbox= caster_load("music/musicbox.ogg")
	    caster_loop(musicbox, 0.25, 0.9)
	    frame= 1
	    boxactive= 1
	    mask.frame= 1
	}
	if(boxactive == 1 and instance_exists(1570/* obj_mainchara */)) {
	    disto= distance_to_object(1570)
	    if(disto < 76)
	        caster_set_volume(musicbox, (100 - disto) / 100)
	}

func _gm_event_7_5():
	if(boxactive == 1) caster_free(musicbox)

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
