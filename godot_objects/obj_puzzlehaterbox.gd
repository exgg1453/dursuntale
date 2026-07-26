# Auto-converted from GameMaker: obj_puzzlehaterbox
# GM parent: obj_readablesolid
extends CharacterBody2D

func _ready():
	myinteract= 0
	facing= 0
	direction= 0
	talkedto= 0
	image_speed= 0
	con= 0
	dm= 0
	if(scr_murderlv() >= 8) dm= 1
	if(GS.plot < 122) dm= 1
	if(GS.flag[350] == 1) dm= 1
	if(dm == 1) {
	    instance_destroy()
	    exit
	} else  {
	    spec= 0
	    exit
	}

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	GS.msg[0]= "* (It\'s a box.^1)&* (Presumably to be pushed.)/%%"
	if(GS.flag[280] == 2) {
	    // obj_puzzlehater
	    with(1512) spec= 1
	    GS.facing= 3
	    GS.msg[0]= "* Bah!/%%"
	}
	if(GS.flag[280] == 1) {
	    // obj_puzzlehater
	    with(1512) spec= 1
	    GS.facing= 3
	    GS.msg[0]= "* What...^1?&* WHAT are you doing!^1?&* You\'re pushing it ALL WRONG!/"
	    GS.msg[1]= "* Bah^1, forget it^1!&* This generation is REALLY&  hopeless!/%%"
	    GS.flag[280]= 2
	}
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	talkedto++

func _process_begin(delta: float):
	scr_depth(0, 0, 0, 0, 0)
	if(spec == 0) scr_npc_anim()
	if(spec == 1 and instance_exists(782/* OBJ_WRITER */))
	    image_speed= 0.25
	if(not instance_exists(782/* OBJ_WRITER */)) {
	    spec= 0
	    image_speed= 0
	}

func _on_alarm_0_timeout():
	if(GS.flag[280] == 1 and myinteract == 0 and GS.interact == 0) {
	    myinteract= 1
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
