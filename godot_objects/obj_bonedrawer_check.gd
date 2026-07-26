# Auto-converted from GameMaker: obj_bonedrawer_check
# GM parent: obj_readable
extends Node2D

func _ready():
	myinteract= 0
	scale.x= 1
	scale.y= 1
	read= 0
	con= 0
	opened= 0

func _gm_event_2_4():
	con++

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	GS.msg[0]= "%%"
	if(room == 118) GS.msc= 716
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)

func _process_end(delta: float):
	if(con == 5 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.interact= 1
	    con= 6
	    $Alarm4.start((6) / 30.0)
	}
	if(con == 6) GS.interact= 1
	if(con == 7) {
	    obj_mainchara.velocity.x= 3
	    obj_mainchara.image_speed= 0.25
	    GS.facing= 1
	    if(obj_mainchara.x > x + 22) con= 6.1
	}
	if(con == 6.1) {
	    GS.facing= 3
	    obj_mainchara.velocity.x= 0
	    obj_mainchara.image_speed= 0
	    con= 7.2
	    $Alarm4.start((10) / 30.0)
	}
	if(con == 8.2) {
	    caster_pause(GS.currentsong)
	    GS.facing= 3
	    obj_mainchara.velocity.x= 0
	    obj_mainchara.image_speed= 0
	    snd_play(106/* snd_noise */)
	    obj_bonedrawer.sprite_index= 1487/* spr_bonedrawer_improved */
	    obj_bonedrawer.frame= 0
	    obj_bonedrawer.drawerdown= 1
	    con= 9
	    $Alarm4.start((35) / 30.0)
	}
	if(con == 10) {
	    snd_play(28/* snd_bell */)
	    obj_bonedrawer.frame= 1
	    con= 11
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 12) {
	    snd_play(106/* snd_noise */)
	    obj_bonedrawer.drawerdown= 3
	    con= 13
	    $Alarm4.start((20) / 30.0)
	}
	if(con == 14) {
	    // obj_mainchara
	    with(1570) uncan= 0
	    caster_resume(GS.currentsong)
	    GS.interact= 0
	    myinteract= 0
	    GS.facing= 0
	    con= 15
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
