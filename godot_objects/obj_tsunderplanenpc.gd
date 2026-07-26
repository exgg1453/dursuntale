# Auto-converted from GameMaker: obj_tsunderplanenpc
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
	talkedto= 0
	image_speed= 0
	if(room == 159 and scr_murderlv() >= 12) {
	    ff= instance_create(80, 100, 1183/* obj_kitchenforcefield */)
	    ff.scale.y= 3
	}
	if(scr_enemynpc3() != 1) instance_destroy()
	if(scr_murderlv() >= 12) instance_destroy()

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	GS.msg[0]= "* Hey^1!&* Watch where you stand^1,&  jerk!/"
	GS.msg[1]= "* Th-though^1, I guess if&  there\'s nowhere else^1, you&  can stand closer.../%%"
	if(talkedto > 0) GS.msg[0]= "* Standing so spicey./%%"
	if(GS.flag[7] == 1) {
	    GS.msg[0]= "* A-ah..^1. H-human..^1.&* You\'re leaving?/"
	    GS.msg[1]= "* I have..^1.&* Something to say to you./"
	    GS.msg[2]= "* Admittedly^1, I may have had&  limerent feelings for you&  before./"
	    GS.msg[3]= "* However^1, upon examining my&  own actions^1, I now&  realize.../"
	    GS.msg[4]= "* I did not love YOU./"
	    GS.msg[5]= "* I was merely infatuated&  with the CONCEPT of love./"
	    GS.msg[6]= "* The idea of romance^1, the&  concept of sharing affection&  with another.../"
	    GS.msg[7]= "* Through these desires^1, I&  built a false concept of&  you in my head./"
	    GS.msg[8]= "* Such a relationship would&  not have ended well./"
	    GS.msg[9]= "* In closing^1, I believe it&  is better that I chose to&  say nothing./"
	    GS.msg[10]= "* Y..^1. y-you i-idiot./%%"
	    if(talkedto > 0) GS.msg[0]= "* I\'m not saying it again./%%"
	}
	if(room == 172) {
	    GS.msg[0]= "* H-hey^1, why do you keep&  following me!!!&* You jerk!!!/"
	    GS.msg[1]= "* Eeeeh^1?&* You\'re walking in the&  opposite direction...?/"
	    GS.msg[2]= "* H-hey^1, you think you\'re too&  good for me^1, huh...?/%%"
	    if(talkedto > 0)
	        GS.msg[0]= "* N-not spicey enough for you^1,&  h-huh.../%%"
	    if(GS.flag[7] == 1) {
	        GS.msg[0]= "* I..^1. I\'m thinking of going&  to the surface.../"
	        GS.msg[1]= "* Eeeeeh^1?&* You\'re going to go there&  too?/"
	        GS.msg[2]= "* Idiot..^1.&* Quit following me!/%%"
	    }
	}
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	talkedto++

func _process_begin(delta: float):
	scr_depth(0, 0, 0, 0, 0)
	scr_npc_anim()

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
