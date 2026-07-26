# Auto-converted from GameMaker: obj_alphys_friendc
# GM parent: obj_readablesolid
extends Node2D

func _ready():
	dsprite= 1642
	usprite= 1652
	lsprite= 1649
	rsprite= 1648
	dtsprite= 1642
	utsprite= 1652
	ltsprite= 1649
	rtsprite= 1648
	myinteract= 0
	facing= 1
	direction= 270
	talkedto= 0
	fun= 0
	GS.flag[430]= 0
	GS.flag[390]= 0

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 47
	GS.facechoice= 6
	GS.faceemotion= 0
	if(GS.flag[196] == 0) GS.msc= 808
	if(GS.flag[196] == 1) {
	    GS.msg[0]= "\\E0* On second thought^1,&  maybe I WON\'T write&  fanfic of real people./"
	    GS.msg[1]= "\\E7* I mean^1, isn\'t real life&  already the greatest&  fanfiction of all?/"
	    GS.msg[2]= "\\E8* .../"
	    GS.msg[3]= "\\E3* Uh^1, don\'t tell&  anyone I said that./"
	    GS.msg[4]= "\\E1* Cause I\'m gonna&  post it online!/%%"
	}
	if(GS.flag[196] == 2) {
	    GS.msg[0]= "\\E0* I sure am excited&  to finally use the&  human internet./"
	    GS.msg[1]= "\\E7* I bet they have all&  sorts of things Undyne&  and I can watch!/"
	    scr_undface(2, 6)
	    GS.msg[3]= "\\E6* Oh man!!!/"
	    GS.msg[4]= "* We\'re gonna be&  able to watch&  anime online!?/"
	    scr_alface(5, 7)
	    GS.msg[6]= "\\E7* Of course^1, Undyne!/"
	    GS.msg[7]= "\\E2* What do you think&  we\'ve been fighting&  for all along?/"
	    scr_sansface(8, 2)
	    GS.msg[9]= "\\E2* yeah^1, what do you.../"
	    GS.msg[10]= "\\E1* whoops./"
	    scr_alface(11, 1)
	    GS.msg[12]= "\\E1* Jinx^1!&* I knew you were&  gonna make that joke!/"
	    scr_papface(13, 3)
	    GS.msg[14]= "\\E3WAIT^1, ALPHYS, I&DIDN\'T KNOW YOU&KNEW SANS./"
	    scr_alface(15, 5)
	    GS.msg[16]= "\\E5* Well..^1.&* I.../"
	    scr_sansface(17, 2)
	    GS.msg[18]= "\\E2* doesn\'t everybody?/"
	    scr_torface(19, 0)
	    GS.msg[20]= "\\E0* Who the hell is Sans?/"
	    GS.msg[21]= "\\E8* .../"
	    GS.msg[22]= "\\E0* Who the HECK is Sans?/"
	    scr_alface(23, 1)
	    GS.msg[24]= "\\E1* TORIEL!?!?!/%%"
	}
	if(GS.flag[196] >= 3) {
	    GS.msg[0]= "\\E0* Hey Frisk^1, why&  don\'t you go look&  for Mettaton?/"
	    GS.msg[1]= "\\E8* He was here for&  a while^1, too.../"
	    GS.msg[2]= "\\E0* But he said he&  had to go somewhere./%%"
	}
	GS.flag[196]++
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	talkedto++

func _process_begin(delta: float):
	scr_depth(0, 0, 0, 0, 0)
	if(fun == 0) {
	    if(instance_exists(770/* obj_face_alphys */))
	        frame= obj_face_alphys.frame
	    else  frame= 0
	    script_execute(106/* scr_npcdir */, 2)
	}

func _gm_event_7_4():
	if(GS.flag[7] == 0) instance_destroy()

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
