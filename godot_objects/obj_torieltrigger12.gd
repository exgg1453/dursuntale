# Auto-converted from GameMaker: obj_torieltrigger12
extends Node2D

func _ready():
	scale.y= 1
	scale.x= 100
	conversation= 0
	flames= 0
	if(GS.plot > 24) instance_destroy()
	dingus= 0
	turts= 0

func _gm_event_2_5():
	if(turts == 0) obj_toroverworld3.direction= 0
	if(turts == 1) obj_toroverworld3.direction= 90
	if(turts == 9) obj_toroverworld3.direction= 0
	if(turts == 10) {
	    // obj_toroverworld3
	    with(861) path_start(40/* path_walkdown */, 4, 0, 0/* path_action_stop */)
	}
	if(turts == 13) conversation= 8
	$Alarm5.start((12) / 30.0)
	turts++

func _gm_event_2_4():
	GS.msg[0]= "\\E0* Goodbye^1, my child./%%"
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	conversation= 7.5

func _gm_event_2_3():
	obj_toroverworld3.frame= 0
	obj_toroverworld3.image_speed= 0.2
	obj_toroverworld3.sprite_index= 1124/* spr_toriel_hug3 */
	obj_toroverworld3.dsprite= 1124
	$Alarm4.start((60) / 30.0)

func _gm_event_2_2():
	GS.border= 0
	// obj_pbflame
	with(876) instance_destroy()
	if(GS.flag[45] == 3) {
	    caster_stop(GS.currentsong)
	    caster_loop(GS.currentsong, 0.5, 0.3)
	    obj_mainchara.y+= 8
	    GS.interact= 2
	    GS.typer= 4
	    GS.msc= 0
	    GS.facechoice= 1
	    GS.msg[0]= "\\E2* That is right./"
	    GS.msg[1]= "* Go upstairs./%%"
	    mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	    conversation= 9
	    GS.mercy= 0
	    GS.seriousbattle= 0
	    GS.border= 0
	}
	if(GS.flag[45] == 4) {
	    GS.mercy= 0
	    GS.seriousbattle= 0
	    GS.border= 0
	    // obj_toroverworld3
	    with(861) instance_destroy()
	    GS.plot= 25
	    instance_destroy()
	}
	if(GS.flag[45] == 5) {
	    GS.mercy= 0
	    GS.seriousbattle= 0
	    GS.border= 0
	    obj_mainchara.x= obj_toroverworld3.x + 6
	    obj_mainchara.y= obj_toroverworld3.y + 36
	    obj_toroverworld3.direction= 270
	    caster_stop(GS.currentsong)
	    GS.currentsong= caster_load("music/toriel.ogg")
	    caster_loop(GS.currentsong, 0.8, 0.75)
	    GS.msc= 0
	    GS.typer= 4
	    GS.facechoice= 1
	    GS.msg[0]= "\\E2* If you truly wish to&  leave the RUINS.../"
	    GS.msg[1]= "* I will not stop you./"
	    GS.msg[2]= "\\E2* However^1, when you&  leave.../"
	    GS.msg[3]= "\\E1* Please do not come&  back./"
	    GS.msg[4]= "\\E2* I hope you understand./%%"
	    mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	    conversation= 6
	    GS.interact= 2
	}
	GS.mercy= 0

func _gm_event_2_1():
	if(flames == 0)
	    instance_create(obj_toroverworld3.x, obj_toroverworld3.y, 876/* obj_pbflame */)
	if(flames > 3) {
	    caster_free(-3)
	    room_persistent= 1
	    $Alarm2.start((34) / 30.0)
	    GS.battlegroup= 22
	    instance_create(0, 0, 142/* obj_battler */)
	} else  {
	    caster_stop(GS.currentsong)
	    flames++
	    snd_play(106/* snd_noise */)
	    obj_pbflame.modulate.a+= 0.25
	    $Alarm1.start((10) / 30.0)
	    if(flames == 4) $Alarm1.start((30) / 30.0)
	}

func _process(delta: float):
	dingus++
	if(GS.plot == 24 and dingus == 2) {
	    instance_create(140, 50, 861/* obj_toroverworld3 */)
	    obj_toroverworld3.facing= 2
	    obj_toroverworld3.direction= 90
	}
	if(conversation == 2 and not instance_exists(779/* obj_dialoguer */)) {
	    $Alarm1.start((20) / 30.0)
	    GS.flag[45]= 3
	    conversation= 3
	}
	if(conversation == 9 and not instance_exists(779/* obj_dialoguer */))
	    GS.interact= 0
	if(conversation == 6 and not instance_exists(779/* obj_dialoguer */)) {
	    obj_toroverworld3.y+= 10
	    obj_toroverworld3.frame= 0
	    obj_toroverworld3.dsprite= 1122
	    obj_toroverworld3.sprite_index= 1122/* spr_toriel_hug */
	    obj_mainchara.visible= 0
	    obj_toroverworld3.image_speed= 0.2
	    $Alarm3.start((120) / 30.0)
	    conversation= 7
	}
	if(instance_exists(861/* obj_toroverworld3 */) and conversation == 7.6 and obj_toroverworld3.path_position == 1) {
	    $Alarm5.start((30) / 30.0)
	    conversation= 7.7
	}
	if(conversation == 7.5 and not instance_exists(779/* obj_dialoguer */)) {
	    // obj_toroverworld3
	    with(861) path_start(28/* path_torielwalkbasement3 */, 3, 0, 0/* path_action_stop */)
	    conversation= 7.6
	}
	if(conversation == 8 and not instance_exists(779/* obj_dialoguer */)) {
	    GS.seriousbattle= 0
	    GS.interact= 0
	    // obj_toroverworld3
	    with(861) instance_destroy()
	    GS.plot= 25
	    instance_destroy()
	}
	if(instance_exists(861/* obj_toroverworld3 */) and conversation == 1) {
	    GS.interact= 1
	    myinteract= 3
	    GS.typer= 4
	    GS.facechoice= 1
	    GS.faceemotion= 7
	    GS.msc= 0
	    GS.msg[0]= "* You want to leave&  so badly?/"
	    GS.msg[1]= "\\E6* Hmph./"
	    GS.msg[2]= "* You are just like&  the others./"
	    GS.msg[3]= "\\E7* There is only one&  solution to this./"
	    GS.msg[4]= "* Prove your../"
	    GS.msg[5]= "* Prove to me you&  are strong enough&  to survive./%%"
	    ini_open("undertale.ini")
	    TK= ini_read_real("Toriel", "TK", 0)
	    ini_close()
	    if(TK > 0) {
	        GS.msg[5]= "* Prove to me you&  are strong enough&  to survive!/"
	        GS.msg[6]= "\\E6* ... wait./"
	        GS.msg[7]= "* ... why are you looking&  at me like that?/"
	        GS.msg[8]= "* Like you have seen&  a ghost./"
	        GS.msg[9]= "\\E7* Do you know something&  that I do not?/"
	        GS.msg[10]= "* No...&* That is impossible./%%"
	    }
	    if(GS.flag[202] > 11 and GS.flag[203] > 11) {
	        GS.msg[5]= "* Prove to me that you&  are.../"
	        GS.msg[6]= "\\E1* Hey^1, let me finish%%"
	    }
	    if(GS.flag[45] == 3) {
	        GS.msg[0]= "* Already?/"
	        GS.msg[1]= "* What will it take&  for you to learn&  your lesson?/%%"
	    }
	    mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	    conversation= 2
	}

func _on_alarm_0_timeout():
	if(GS.flag[45] < 4) {
	    other.x= other.xprevious
	    other.y= other.yprevious
	    GS.interact= 1
	    conversation= 1
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
