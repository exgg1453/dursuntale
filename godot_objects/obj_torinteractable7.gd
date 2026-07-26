# Auto-converted from GameMaker: obj_torinteractable7
# GM parent: obj_readablesolid
extends CharacterBody2D

func _ready():
	dsprite= 1103
	usprite= 1112
	lsprite= 1108
	rsprite= 1107
	dtsprite= 1105
	utsprite= 1111
	ltsprite= 1110
	rtsprite= 1109
	myinteract= 0
	facing= 1
	direction= 180
	talkedto= 0
	image_speed= 0
	if(GS.flag[7] == 1) {
	    y+= 20
	    dsprite= 2417
	    usprite= 2419
	    lsprite= 2424
	    rsprite= 2421
	    dtsprite= 2418
	    utsprite= 2420
	    ltsprite= 2425
	    rtsprite= 2422
	    ini_open("undertale.ini")
	    curf= ini_read_real("EndF", "EndF", 0)
	    ini_close()
	    if(curf > 0) instance_destroy()
	}

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.msg[0]= "* Do not worry about&  me./"
	GS.msg[1]= "* Someone has to take&  care of these flowers./%%"
	GS.typer= 4
	GS.facechoice= 1
	GS.faceemotion= 0
	if(GS.flag[7] == 1) {
	    GS.typer= 89
	    GS.facechoice= 9
	    GS.msg[0]= "* Don\'t worry about&  me./"
	    GS.msg[1]= "* Someone has to take&  care of these flowers./%%"
	    GS.faceemotion= 0
	    if(GS.flag[511] == 1) {
	        GS.msg[0]= "* Frisk^1, please leave&  me alone./"
	        GS.msg[1]= "\\E3* I can\'t come back^1.&* I just can\'t^1, OK?/%%"
	        GS.faceemotion= 7
	    }
	    if(GS.flag[511] == 2) {
	        GS.msg[0]= "\\E7* I don\'t want to break&  their hearts all over&  again./"
	        GS.msg[1]= "* It\'s better if they&  never see me./%%"
	        GS.faceemotion= 7
	    }
	    if(GS.flag[511] == 3) {
	        GS.msg[0]= "\\E7* ... why are you still&  here?/"
	        GS.msg[1]= "* Are you trying to keep&  me company?/"
	        GS.msg[2]= "\\E0* Frisk.../"
	        GS.msg[3]= "* .../"
	        GS.msg[4]= "\\E7* Hey./"
	        GS.msg[5]= "\\E0* Let me ask you a&  question./"
	        GS.msg[6]= "* Frisk..^1.&* Why did you come&  here?/"
	        GS.msg[7]= "* Everyone knows the&  legend^1, right...?/"
	        GS.msg[8]= "* " + chr(ord('"')) + "Travellers who climb&  Mt. Ebott are said&  to disappear." + chr(ord('"')) + "/"
	        GS.msg[9]= "\\E7* .../"
	        GS.msg[10]= "* Frisk./"
	        GS.msg[11]= "*\\E0 Why would you ever&  climb a mountain&  like that?/"
	        GS.msg[12]= "\\E7* Was it foolishness?/"
	        GS.msg[13]= "\\E0* Was it fate?/"
	        GS.msg[14]= "\\E1* Or was it..^1.&* Because you...?/"
	        GS.msg[15]= "\\E7* Well./"
	        GS.msg[16]= "\\E0* Only you know the&  answer^1, don\'t you...?/%%"
	        GS.faceemotion= 7
	    }
	    if(GS.flag[511] == 4) {
	        GS.msg[0]= "\\E2* I know why " + GS.charname + "&  climbed the mountain./"
	        GS.msg[1]= "\\E7* It wasn\'t for a&  very happy reason./"
	        GS.msg[2]= "\\E2* Frisk^1.&* I\'ll be honest with&  you./"
	        GS.msg[3]= "\\E7 * " + GS.charname + " hated humanity./"
	        GS.msg[4]= "\\E2* Why they did^1, they&  never talked about&  it./"
	        GS.msg[5]= "\\E1* But they felt very&  strongly about&  that./%%"
	        GS.faceemotion= 2
	    }
	    if(GS.flag[511] == 5) {
	        GS.msg[0]= "\\E2* Frisk..^1.&* You really ARE different&  from " + GS.charname + "./"
	        GS.msg[1]= "\\E0* In fact^1, though you&  have similar^1, uh^1,&  fashion choices.../"
	        GS.msg[2]= "* I don\'t know why I&  ever acted like you&  were the same person./"
	        GS.msg[3]= "\\E7* Maybe..^1.&* The truth is.../"
	        GS.msg[4]= "\\E1* " + GS.charname + " wasn\'t really&  the greatest person./"
	        GS.msg[5]= "\\E7* While^1, Frisk.../"
	        GS.msg[6]= "\\E0* You\'re the type of&  friend I wish I&  always had./"
	        GS.msg[7]= "\\E7* So maybe I was kind&  of projecting a&  little bit./"
	        GS.msg[8]= "\\E0* Let\'s be honest^1.&* I did some weird&  stuff as a flower./%%"
	        GS.faceemotion= 2
	    }
	    if(GS.flag[511] == 6) {
	        GS.msg[0]= "\\E2* There\'s one last&  thing I feel like&  I should tell you./"
	        GS.msg[1]= "* Frisk^1, when " + GS.charname + "&  and I combined our&  SOULs together.../"
	        GS.msg[2]= "* The control over our&  body was actually split&  between us./"
	        GS.msg[3]= "* They were the one&  that picked up their&  own empty body./"
	        GS.msg[4]= "* And then^1, when we&  got to the village.../"
	        GS.msg[5]= "\\E2* They were the one&  that wanted to.../"
	        GS.msg[6]= "\\E1* ... to use our full&  power./"
	        GS.msg[7]= "\\E2* I was the one that&  resisted./"
	        GS.msg[8]= "\\E7* And then^1, because of&  me^1, we.../"
	        GS.msg[9]= "\\E1* Well^1, that\'s why I&  ended up a flower./"
	        GS.msg[10]= "\\E2* Frisk.../"
	        GS.msg[11]= "* This whole time^1, I\'ve&  blamed myself for&  that decision./"
	        GS.msg[12]= "* That\'s why I adopted&  that horrible view&  of the world./"
	        GS.msg[13]= "* " + chr(ord('"')) + "Kill or be killed." + chr(ord('"')) + "/"
	        GS.msg[14]= "\\E7* But now..^1.&* After meeting you.../"
	        GS.msg[15]= "\\E0* Frisk^1, I don\'t regret&  that decision anymore./"
	        GS.msg[16]= "\\E4* I did the right&  thing./"
	        GS.msg[17]= "* If I killed those&  humans.../"
	        GS.msg[18]= "* We would have had to&  wage war against all&  of humanity./"
	        GS.msg[19]= "\\E0* And in the end^1,&  everyone went free^1,&  right?/"
	        GS.msg[20]= "\\E7* I still feel kind&  of sad knowing how&  long it took.../"
	        GS.msg[21]= "\\E0* ... so maybe it&  wasn\'t a perfect&  decision./"
	        GS.msg[22]= "* But you can\'t regret&  hard choices your&  whole life^1, right?/"
	        GS.msg[23]= "\\E7* Well^1, not that I&  have much of a life&  left./"
	        GS.msg[24]= "\\E0* But that\'s besides&  the point./%%"
	        GS.faceemotion= 2
	    }
	    if(GS.flag[511] == 7) {
	        GS.msg[0]= "* Frisk^1, thank you&  for listening to me./"
	        GS.msg[1]= "* You should really go&  be with your friends&  now^1, OK?/"
	        GS.msg[2]= "* Oh^1, and^1, please.../"
	        GS.msg[3]= "\\E7* In the future^1, if you&  uh^1, see me.../"
	        GS.msg[4]= "* Don\'t think of it as&  me^1, OK?/"
	        GS.msg[5]= "\\E0* I just want you to&  remember me like this./"
	        GS.msg[6]= "\\E0* Someone that was your&  friend for a little&  while./"
	        GS.msg[7]= "\\E2* Oh^1, and Frisk.../"
	        GS.msg[8]= "\\E0* Be careful in the&  outside world^1, OK?/"
	        GS.msg[9]= "* Despite what everyone&  thinks^1, it\'s not as&  nice as it is here./"
	        GS.msg[10]= "\\E7* There are a lot of&  Floweys out there./"
	        GS.msg[11]= "\\E2* And not everything can&  be resolved by just&  being nice./"
	        GS.msg[12]= "\\E0* Frisk.../"
	        GS.msg[13]= "* Don\'t kill^1, and&  don\'t be killed^1,&  alright?/"
	        GS.msg[14]= "* That\'s the best you&  can strive for./"
	        GS.msg[15]= "* Well^1, see you./%%"
	        GS.faceemotion= 0
	    }
	    if(GS.flag[511] >= 8) {
	        GS.msg[0]= "\\E7* Frisk.../"
	        GS.msg[1]= "\\E6* Don\'t you have&  anything better to&  do?/%%"
	        GS.faceemotion= 0
	    }
	    GS.flag[511]++
	}
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	talkedto++

func _process_begin(delta: float):
	scr_depth(0, 0, 0, 0, 0)
	if(GS.flag[7] == 0) {
	    if(instance_exists(765/* obj_face_torieltalk */))
	        frame= obj_face_torieltalk.frame
	    else  frame= 0
	}
	if(GS.flag[7] == 1) {
	    if(instance_exists(772/* obj_face_asriel */))
	        frame= obj_face_asriel.frame
	    else  frame= 0
	}
	script_execute(106/* scr_npcdir */, 2)

func _gm_event_7_4():
	ex= 0
	if(GS.plot != 25) ex= 1
	if(GS.flag[45] == 4) ex= 1
	if(GS.flag[7] == 1) ex= 0
	if(ex == 1) instance_destroy()

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
