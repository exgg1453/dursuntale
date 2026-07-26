# Auto-converted from GameMaker: obj_torieltrigger5
extends Node2D

func _ready():
	scale.x= 50
	conversation= 0
	if(GS.plot > 16) instance_destroy()
	volume= 1
	fademusicout= 0

func _gm_event_2_5():
	with(toriel) sprite_index= 1103/* spr_toriel_d */
	toriel.phone= 0
	with(toriel) path_start(18/* path_torielwalk19_3 */, 5, 0, 0/* path_action_stop */)
	conversation= 4

func _gm_event_2_4():
	instance_create(210, 340, 1337/* obj_cosmeticblcon */)
	$Alarm5.start((30) / 30.0)

func _gm_event_2_3():
	GS.interact= 0

func _gm_event_2_2():
	GS.msc= 202
	GS.typer= 4
	GS.interact= 1
	GS.facechoice= 1
	instance_create(0, 0, 779/* obj_dialoguer */)
	conversation= 3

func _process(delta: float):
	if(conversation == 1 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.interact= 1
	    conversation= 2
	    with(toriel) path_start(16/* path_torielwalk19 */, 3, 0, 1/* path_action_restart */)
	    fademusicout= 1
	}
	if(instance_exists(861/* obj_toroverworld3 */) and conversation == 2 and obj_toroverworld3.path_position == 1) {
	    toriel.sprite_index= 1102/* spr_toriel_d_phone */
	    toriel.phone= 1
	    snd_play(104/* snd_phone */)
	    $Alarm4.start((30) / 30.0)
	    conversation= 3
	}
	if(instance_exists(861/* obj_toroverworld3 */) and conversation == 4 and toriel.path_position == 1) {
	    with(toriel) path_end()
	    conversation= 5
	    caster_pause(GS.currentsong)
	    torielsong= caster_load("music/toriel.ogg")
	    caster_loop(torielsong, 0.7, 0.86)
	    GS.msg[0]= "* How did you get&  here^1, my child^1?&* Are you hurt?/"
	    if(GS.hp == GS.maxhp)
	        GS.msg[1]= "* Not a scratch..^1.&*\\E0 Impressive^1!&*\\E1 But still.../"
	    if(GS.hp < GS.maxhp)
	        GS.msg[1]= "* There^1, there^1, I will&  heal you./"
	    if(GS.hp < 4)
	        GS.msg[1]= "* Who did this to you^2?\\E5 &* You will get an apology./"
	    GS.msg[2]= "\\E1* I should not have&  left you alone&  for so long./"
	    GS.msg[3]= "* It was irresponsible&  to try to surprise&  you like this./"
	    GS.msg[4]= "\\E8* Err.../"
	    GS.msg[5]= "\\E0* Well^1, I suppose I&  cannot hide it&  any longer./"
	    GS.msg[6]= "* Come^1, small one!/%%"
	    GS.hp= GS.maxhp
	    instance_create(0, 0, 779/* obj_dialoguer */)
	}
	if(instance_exists(861/* obj_toroverworld3 */) and conversation == 5 and not instance_exists(782/* OBJ_WRITER */)) {
	    conversation= 6
	    // obj_toroverworld3
	    with(861) path_start(19/* path_torielwalk19_4 */, 4, 0, 0/* path_action_stop */)
	    caster_resume(GS.currentsong)
	    fademusicout= 3
	    GS.plot= 17
	    torvolume= 0.8
	}
	if(fademusicout == 1) {
	    if(volume > 0) volume-= 0.02
	    caster_set_volume(GS.currentsong, volume)
	    if(volume < 0.02) fademusicout= 2
	}
	if(fademusicout == 3) {
	    torvolume-= 0.04
	    if(volume < 0.9) volume+= 0.06
	    caster_set_volume(torielsong, torvolume)
	    caster_set_volume(GS.currentsong, volume)
	    if(torvolume < 0.1) {
	        caster_free(torielsong)
	        GS.interact= 0
	        instance_destroy()
	    }
	}

func _on_alarm_0_timeout():
	if(conversation == 0) {
	    toriel= instance_create(140, 240, 861/* obj_toroverworld3 */)
	    GS.msc= 0
	    GS.typer= 4
	    GS.interact= 1
	    GS.facechoice= 1
	    GS.faceemotion= 1
	    GS.msg[0]= "* Oh dear^1, that took&  longer than I&  thought it would./%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    conversation= 1
	    fademusicout= 1
	    GS.interact= 1
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
