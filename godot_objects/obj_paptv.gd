# Auto-converted from GameMaker: obj_paptv
# GM parent: obj_readablesolid
extends Node2D

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
	read= 0
	talkedto= 0
	image_speed= 0
	tv= caster_load("music/tv.ogg")
	conversation= 0
	scr_depth()
	buffer= 4

func _gm_event_2_2():
	conversation++

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	read++
	caster_pause(GS.currentsong)
	snd_play(92/* snd_chug */)
	conversation= 1
	$Alarm2.start((15) / 30.0)
	image_speed= 1

func _process(delta: float):
	buffer--
	if(myinteract == 1 and buffer > 0) myinteract= 0
	if(myinteract == 1) {
	    GS.interact= 1
	    $Alarm0.start((1) / 30.0)
	    myinteract= 2
	}
	if(myinteract == 0) sprite_index= 1631/* spr_flattv_off */
	if(conversation == 2) {
	    image_speed= 1
	    sprite_index= 1632/* spr_flattv_on */
	    caster_loop(tv, 0.75, 1)
	    conversation= 3
	    $Alarm2.start((10) / 30.0)
	}
	if(conversation == 4) {
	    if(instance_exists(1025/* obj_papyrusparent */)) {
	        scr_papface(0, 0)
	        GS.msg[1]= "\\E0OOH, IT\'S MY&FAVORITE&GAME-SHOW!/"
	        GS.msg[2]= "\\TS \\F0 \\T0 %"
	        GS.msg[3]= "* (It says " + chr(ord('"')) + "STAY TUNED FOR&  A NEW PROGRAM - MTT." + chr(ord('"')) + ")/"
	        scr_papface(4, 1)
	        GS.msg[5]= "\\E1WHAT!!^1!&IT\'S USUALLY&BETTER THAN THIS!/"
	        GS.msg[6]= "\\E2THIS IS JUST&A BAD EPISODE!!^1!&DON\'T JUDGE ME!!!/%%"
	    } else 
	        GS.msg[0]= "* (It says " + chr(ord('"')) + "STAY TUNED FOR&  A NEW PROGRAM - MTT." + chr(ord('"')) + ")/%%"
	    if(read > 1)
	        GS.msg[0]= "* (It says " + chr(ord('"')) + "STAY TUNED FOR&  A NEW PROGRAM - MTT." + chr(ord('"')) + ")/%%"
	    mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	    conversation= 5
	}
	if(conversation == 5 and not instance_exists(782/* OBJ_WRITER */)) {
	    read++
	    conversation= 0
	    myinteract= 0
	    GS.interact= 0
	    if(buffer <= 0) snd_play(92/* snd_chug */)
	    buffer= 5
	    sprite_index= 1631/* spr_flattv_off */
	    caster_stop(tv)
	    caster_resume(GS.currentsong)
	}

func _gm_event_7_5():
	caster_free(tv)

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
