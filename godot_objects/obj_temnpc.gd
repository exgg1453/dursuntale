# Auto-converted from GameMaker: obj_temnpc
# GM parent: obj_readablesolid
extends CharacterBody2D

func _ready():
	dsprite= 1950
	usprite= 1953
	lsprite= 1950
	rsprite= 1953
	dtsprite= 1950
	utsprite= 1953
	ltsprite= 1950
	rtsprite= 1953
	myinteract= 0
	facing= 0
	direction= 180
	talkedto= 0
	image_speed= 0
	if(scr_murderlv() >= 10) instance_destroy()
	if(x == 145 or x == 205 or x == 450) direction= 0

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 28
	GS.facechoice= 0
	GS.faceemotion= 0
	GS.msg[0]= "* hOI!^1!&* im temmie!!!/"
	GS.msg[1]= "* and dis is my friend..^1.&* temmie!!!/%%"
	if(GS.flag[7] == 1)
	    GS.msg[0]= "* woa..^1. tem hear news..^1.&* VERY GOODS!!!/%%"
	if(x > 190) {
	    GS.msg[0]= "* hOI!^1!&* im temmie!!!/"
	    GS.msg[1]= "* don forget my friend!/%%"
	    if(GS.flag[7] == 1)
	        GS.msg[0]= "* yaYA!!^1!&* tems can go free!!/%%"
	}
	if(x > 220) {
	    GS.msg[0]= "* Hi./"
	    GS.msg[1]= "* I\'m Bob./%%"
	    if(GS.flag[7] == 1)
	        GS.msg[0]= "* A pleasing development^1, no?/%%"
	}
	if(x > 360) {
	    GS.msg[0]= "* awawawawah!!/"
	    GS.msg[1]= "* humans..^1.&* such a.../"
	    GS.msg[2]= "* CUTE!!!!/%%"
	    if(GS.flag[7] == 1) {
	        GS.msg[0]= "* woa..^1.&* if tems can go on surface^1,&  can see,/"
	        GS.msg[1]= "* LOT OF CUTES HUNAN!!!/%%"
	    }
	}
	if(x > 440) {
	    GS.msg[0]= "* tem..^1. WATCH EGG!!!/"
	    GS.msg[1]= "* eg..^1. wil HATCH!!!/"
	    GS.msg[2]= "* tem..^1. PROUD PARENT!!/%%"
	    if(GS.flag[7] == 1) {
	        GS.msg[0]= "* everyones go free..^1.&* BUT TEM!!!/"
	        GS.msg[1]= "* TEM NOT LEAV!!!&* TEM WATCH EG!!!/"
	        GS.msg[2]= "* tem will be happily fambily,/%%"
	    }
	}
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	talkedto++

func _process_begin(delta: float):
	scr_depth(0, 0, 0, 0, 0)
	script_execute(106/* scr_npcdir */, 1)

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
