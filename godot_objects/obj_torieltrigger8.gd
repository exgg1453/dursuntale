# Auto-converted from GameMaker: obj_torieltrigger8
extends Node2D

func _ready():
	scale.y= 100
	conversation= 0
	if(GS.plot > 19.9) instance_destroy()

func _process(delta: float):
	if(conversation == 2 and not instance_exists(779/* obj_dialoguer */)) {
	    GS.interact= 3
	    obj_mainchara.y= 128
	    obj_mainchara.visible= 0
	    obj_toroverworld3.sprite_index= 1115/* spr_toriel_handhold_l */
	    obj_toroverworld3.lsprite= 1115
	    // obj_mainchara
	    with(1570) path_start(27/* path_torielwalkbasement2 */, 5, 0, 0/* path_action_stop */)
	    // obj_toroverworld3
	    with(861) path_start(27/* path_torielwalkbasement2 */, 5, 0, 0/* path_action_stop */)
	    conversation= 3
	}
	if(instance_exists(861/* obj_toroverworld3 */) and conversation == 1 and obj_toroverworld3.path_position == 1) {
	    GS.interact= 1
	    myinteract= 3
	    GS.typer= 4
	    GS.facechoice= 1
	    GS.faceemotion= 2
	    GS.flag[44]++
	    GS.flag[45]= 1
	    GS.msc= 0
	    if(GS.flag[44] == 1)
	        GS.msg[0]= "* I think you should&  play upstairs&  instead./%%"
	    if(GS.flag[44] == 2)
	        GS.msg[0]= "* It is dangerous&  to play here./%%"
	    if(GS.flag[44] == 3)
	        GS.msg[0]= "* It is drafty here.&* You will catch&  a cold./%%"
	    if(GS.flag[44] == 4)
	        GS.msg[0]= "* It is dusty here.&* You will catch&  a cough./%%"
	    if(GS.flag[44] == 5)
	        GS.msg[0]= "* There is nothing&  to see here./%%"
	    if(GS.flag[44] == 6)
	        GS.msg[0]= "* Do you want to&  read a book?/%%"
	    if(GS.flag[44] == 7)
	        GS.msg[0]= "\\E7* I do not like&  the game you&  are playing./%%"
	    if(GS.flag[44] == 8)
	        GS.msg[0]= "\\E0* Why not go for&  a walk in the&  yard?/%%"
	    if(GS.flag[44] == 9) GS.msg[0]= "* Really now./%%"
	    if(GS.flag[44] > 9) GS.msg[0]= "\\E4* .../%%"
	    if(GS.plot < 19) {
	        GS.flag[44]= 0
	        GS.msg[0]= "* Hey^1, do not go down&  here./"
	        GS.msg[1]= "* I have something&  to show you&  upstairs./%%"
	    }
	    mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	    conversation= 2
	}

func _on_alarm_0_timeout():
	other.x= other.xprevious
	other.y= other.yprevious
	GS.interact= 1
	instance_create(60, 95, 861/* obj_toroverworld3 */)
	// obj_toroverworld3
	with(861) path_start(26/* path_torielwalkbasement1 */, 5, 0, 0/* path_action_stop */)
	conversation= 1

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
