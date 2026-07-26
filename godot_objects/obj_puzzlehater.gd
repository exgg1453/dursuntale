# Auto-converted from GameMaker: obj_puzzlehater
# GM parent: obj_readablesolid
extends CharacterBody2D

func _ready():
	myinteract= 0
	facing= 0
	direction= 0
	talkedto= 0
	image_speed= 0
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
	GS.msg[0]= "* Bahh!!^1!&* Nevermind!!/%%"
	if(GS.flag[280] == 1)
	    GS.msg[0]= "* So^1?&* What are you waiting for!?/%%"
	if(GS.flag[280] == 0 and GS.flag[7] == 0) {
	    GS.msg[0]= "* Bah^1! Today\'s monsters don\'t&  appreciate what makes&  puzzles great!/"
	    GS.msg[1]= "* Nowadays " + chr(ord('"')) + "puzzles" + chr(ord('"')) + " are nothing&  but lasers and moving rocks.../"
	    GS.msg[2]= "* Bahh!!!/"
	    GS.msg[3]= "* There\'s no ART in that&  actiony^1, mindless schlock^1!&* It\'s just timing-based drivel!/"
	    GS.msg[4]= "* Give me something that&  challenges the deepest&  reaches of my mind.../"
	    GS.msg[5]= "* You^1!&* You\'re young^1!&* You\'ve still got hope!/"
	    GS.msg[6]= "* Geh heh heh...^1!&* Here..^1. try solving this&  block-pushing puzzle!/%%"
	    GS.flag[280]= 1
	}
	if(GS.flag[7] == 1) {
	    GS.msg[0]= "* Geh^1?&* Who are you?/"
	    GS.msg[1]= "* Freedom^1? What^1? Bah^1!&* You\'re pullin\' my leg!/%%"
	    if(GS.flag[280] >= 1) {
	        GS.msg[0]= "* You again!^1?&* Bah^1! I don\'t care about&  going free!/"
	        GS.msg[1]= "* .../"
	        GS.msg[2]= "* Do you think humans could&  appreciate the details&  of classic puzzles...?/%%"
	    }
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
