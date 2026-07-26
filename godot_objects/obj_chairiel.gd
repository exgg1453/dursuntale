# Auto-converted from GameMaker: obj_chairiel
# GM parent: obj_readablesolid
extends CharacterBody2D

func _ready():
	chair= 0
	if(GS.plot > 20 or GS.plot < 19) chair= 1
	if(chair == 0) {
	    dsprite= 1118
	    usprite= 1118
	    lsprite= 1118
	    rsprite= 1118
	    dtsprite= 1118
	    utsprite= 1118
	    ltsprite= 1118
	    rtsprite= 1118
	} else  {
	    dsprite= 1121
	    usprite= 1121
	    lsprite= 1121
	    rsprite= 1121
	    dtsprite= 1121
	    utsprite= 1121
	    ltsprite= 1121
	    rtsprite= 1121
	    sprite_index= 1121/* spr_chairempty */
	}
	myinteract= 0
	facing= 1
	direction= 180
	talkedto= 0
	if(room == 221) {
	    dsprite= 1895
	    usprite= 1895
	    lsprite= 1895
	    rsprite= 1895
	    dtsprite= 1895
	    utsprite= 1895
	    ltsprite= 1895
	    rtsprite= 1895
	    sprite_index= 1895/* spr_chairiel_grey */
	    chair= 9
	}

func _on_destroy():
	myinteract= 3
	if(chair == 0) {
	    GS.msc= 527
	    if(GS.flag[103] > 0) GS.msc= 528
	    if(GS.plot == 19.1) GS.msc= 528
	    if(GS.plot == 19.2) GS.msc= 529
	    if(GS.plot == 19.3) GS.msc= 530
	    if(GS.plot == 19.4) GS.msc= 531
	    GS.choice= -1
	    GS.typer= 4
	    GS.facechoice= 1
	    GS.faceemotion= 99
	    mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	    talkedto++
	} else  {
	    myinteract= 3
	    GS.msc= 0
	    GS.typer= 5
	    GS.facechoice= 0
	    GS.faceemotion= 0
	    if(chair != 9) {
	        GS.msg[0]= "* (Seems like the right size&  for Toriel.)/%%"
	        mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	    } else  {
	        GS.msg[0]= "* (It\'s a great reading chair.^1)&* (But it doesn\'t seem like&  anyone uses it.)/%%"
	        mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	    }
	}

func _process_begin(delta: float):
	if(GS.plot < 19.9) {
	    if(instance_exists(765/* obj_face_torieltalk */))
	        frame= obj_face_torieltalk.frame
	    else  frame= 0
	    script_execute(106/* scr_npcdir */, 2)
	}
	if(GS.plot == 19.9 and not instance_exists(779/* obj_dialoguer */)) {
	    sprite_index= 1120/* spr_chairielgetup */
	    frame= 0
	    image_speed= 0.2
	    GS.interact= 1
	    GS.plot= 20
	}

func _gm_event_7_7():
	if(sprite_index == 1120) {
	    frame= 0
	    image_speed= 0
	    sprite_index= 1121/* spr_chairempty */
	    instance_create(x + 28, y + 3, 861/* obj_toroverworld3 */)
	    // obj_toroverworld3
	    with(861) facing= 1
	    // obj_toroverworld3
	    with(861) path_start(23/* path_torielwalkhouse1 */, 5, 0, 0/* path_action_stop */)
	    GS.plot= 21
	    // obj_mainchara
	    with(1570) uncan= 0
	    GS.interact= 0
	    instance_create(x, y, 869/* obj_chairiel */)
	    instance_destroy()
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
