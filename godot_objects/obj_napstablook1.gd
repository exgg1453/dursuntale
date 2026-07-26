# Auto-converted from GameMaker: obj_napstablook1
# GM parent: obj_readablesolid
extends CharacterBody2D

func _ready():
	if(GS.plot > 10.5) instance_destroy()
	myinteract= 0
	scale.x= 1
	scale.y= 1
	talkedto= 0
	if(murdererlv1() == 1 and GS.plot < 10.4) GS.plot= 10.4

func _gm_event_2_4():
	GS.interact= 1
	myinteract= 3
	GS.msc= 0
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	GS.msg[0]= "* i usually come to the&  RUINS because there\'s&  nobody around.../"
	GS.msg[1]= "* but today i met somebody&  nice.../"
	GS.msg[2]= "* .../"
	GS.msg[3]= "* oh^1, i\'m rambling again/"
	GS.msg[4]= "* i\'ll get out of your way/%%"
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	GS.plot= 10.4
	GS.flag[36]= 1

func _on_destroy():
	if(GS.plot < 10.2) {
	    myinteract= 3
	    GS.msc= 510
	    GS.typer= 5
	    GS.facechoice= 0
	    GS.faceemotion= 0
	    talkedto= 1
	    mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	}

func _process_begin(delta: float):
	scr_depth(0, 0, 0, 0, 0)
	if(talkedto == 1 and GS.choice == 0 and not instance_exists(779/* obj_dialoguer */)) {
	    GS.battlegroup= 20
	    GS.flag[200]= 0
	    GS.mercy= 1
	    instance_create(0, 0, 142/* obj_battler */)
	    talkedto= 0
	}
	if(GS.plot == 10.3) {
	    $Alarm4.start((2) / 30.0)
	    GS.plot= 10.35
	}
	if(GS.plot == 10.4 and not instance_exists(779/* obj_dialoguer */)) {
	    modulate.a-= 0.05
	    if(modulate.a < 0.1) {
	        // obj_mainchara
	        with(1570) uncan= 0
	        GS.plot= 11
	        GS.interact= 0
	        instance_destroy()
	    }
	}
	if(GS.plot == 11) {
	    // obj_mainchara
	    with(1570) uncan= 0
	    GS.border= 0
	    GS.mercy= 0
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
