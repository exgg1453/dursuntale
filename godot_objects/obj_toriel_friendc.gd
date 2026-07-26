# Auto-converted from GameMaker: obj_toriel_friendc
# GM parent: obj_readablesolid
extends Node2D

func _ready():
	dsprite= 1105
	usprite= 1111
	lsprite= 1110
	rsprite= 1109
	dtsprite= 1105
	utsprite= 1111
	ltsprite= 1110
	rtsprite= 1109
	myinteract= 0
	facing= 1
	direction= 270
	talkedto= 0
	fun= 0
	GS.flag[430]= 0

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	if(GS.flag[191] == 0) {
	    GS.msg[0]= "* Hello^1, Frisk^1.&* Alphys upgraded my&  phone./"
	    GS.msg[1]= "* I am having a lot&  of fun with the&  " + chr(ord('"')) + "texting" + chr(ord('"')) + " feature./"
	    GS.msg[2]= "* Sans^1, " + chr(ord('"')) + "check out" + chr(ord('"')) + " this&  one./"
	    scr_sansface(3, 0)
	    GS.msg[4]= "* oh man^1, tori.../"
	    GS.msg[5]= "\\E1* that\'s brutal./"
	    scr_papface(6, 0)
	    GS.msg[7]= "I CAN\'T BELIEVE&THE QUEEN HAS&RETURNED.../"
	    GS.msg[8]= "\\E4AND ALSO THAT&SHE\'S A HUGE&DORK!!!/"
	    GS.msg[9]= "YOU TWO ARE TWO&FEET AWAY FROM&EACH OTHER!!!/"
	    GS.msg[10]= "WHY ARE YOU&TEXTING!!!/"
	    scr_torface(11, 0)
	    GS.msg[12]= "* Worry not^1, Papyrus^1.&* We are texting for&  a good reason./"
	    scr_papface(13, 3)
	    GS.msg[14]= "WHY IS THAT./"
	    scr_sansface(15, 0)
	    GS.msg[16]= "* well./"
	    GS.msg[17]= "\\E2* cause we\'re huge&  dorks./"
	    scr_torface(18, 1)
	    GS.msg[19]= "* Sans^1, please do&  not say that./"
	    GS.msg[20]= "* You are not a dork./"
	    GS.msg[21]= "\\E0* You are more of&  a bonehead!/"
	    scr_papface(22, 0)
	    GS.msg[23]= "HAHAHA^1, WOW!/"
	    GS.msg[24]= "\\E0THOSE PUNS ARE&EVEN LESS FUNNY&COMING FROM HER!/"
	    scr_sansface(25, 1)
	    GS.msg[26]= "* then why are you&  smiling?/"
	    scr_papface(27, 4)
	    GS.msg[28]= "IT\'S A PITY&SMILE!!!/%%"
	}
	if(GS.flag[191] == 1) {
	    GS.msg[0]= "* Frisk^1, do not feel&  left out./"
	    GS.msg[1]= "* I have been writing&  messages to you as&  well!/"
	    GS.msg[2]= "\\W* You still have \\Ymy&  phone number\\W after&  all this time.../"
	    GS.msg[3]= "* Do you not?/%%"
	}
	if(GS.flag[191] >= 2) {
	    GS.msg[0]= "* Frisk^1, how about&  you go look around&  before we all go?/"
	    GS.msg[1]= "* Seeing how many good&  friends you\'ve made&  here.../"
	    GS.msg[2]= "* I am almost certain&  you must have made&  some more./%%"
	}
	GS.flag[191]++
	GS.typer= 4
	GS.facechoice= 1
	GS.faceemotion= 0
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	talkedto++

func _process_begin(delta: float):
	scr_depth(0, 0, 0, 0, 0)
	if(fun == 0) {
	    if(instance_exists(765/* obj_face_torieltalk */))
	        frame= obj_face_torieltalk.frame
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
