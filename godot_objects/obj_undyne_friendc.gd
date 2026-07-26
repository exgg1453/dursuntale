# Auto-converted from GameMaker: obj_undyne_friendc
# GM parent: obj_readablesolid
extends Node2D

func _ready():
	dsprite= 1407
	usprite= 1413
	lsprite= 1415
	rsprite= 1417
	dtsprite= 1407
	utsprite= 1413
	ltsprite= 1415
	rtsprite= 1417
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
	GS.typer= 37
	GS.facechoice= 5
	GS.faceemotion= 0
	if(GS.flag[7] == 0) {
	    GS.msg[0]= "* Hey^1, punk^1!&* What\'s up!?/"
	    GS.msg[1]= "\\E1* A-ACHOO!/"
	    GS.msg[2]= "\\E2* Papyrus^1, how can you&  stand this cold?/"
	    scr_papface(3, 0)
	    GS.msg[4]= "I HAVE NO SKIN./"
	    scr_undface(5, 9)
	    GS.msg[6]= "* So why don\'t we&  stand in Grillby\'s&  instead?/"
	    scr_papface(7, 3)
	    GS.msg[8]= "BECAUSE I HATE&GREASE./"
	    scr_undface(9, 2)
	    GS.msg[10]= "* But you don\'t have&  a stomach!!/"
	    scr_papface(11, 0)
	    GS.msg[12]= "NO^1, BUT I HAVE&STANDARDS!!!/%%"
	    if(talkedto > 0) {
	        GS.msg[0]= "* Papyrus.../"
	        GS.msg[1]= "\\E1* Why do you live&  in an icy wasteland?/"
	        scr_papface(2, 0)
	        GS.msg[3]= "THE RENT\'S CHEAP./"
	        scr_undface(4, 9)
	        GS.msg[5]= "* Really^1?&* Don\'t you live in&  a huge house?/"
	        scr_papface(6, 0)
	        GS.msg[7]= "YEAH^1, BUT MY&BROTHER PAYS&FOR IT./"
	        scr_undface(8, 2)
	        GS.msg[9]= "* Where\'s your brother&  get the money to&  pay for it...?/"
	        scr_papface(10, 3)
	        GS.msg[11]= "OH^1, THAT\'S SIMPLE./"
	        GS.msg[12]= "\\E0IT\'S A MYSTERY./%%"
	    }
	    if(GS.flag[493] == 9) {
	        GS.faceemotion= 1
	        GS.msg[0]= "* So^1? What are you&  waiting for?/"
	        GS.msg[1]= "* The sooner you get&  it over with^1, the&  better!/%%"
	        if(GS.flag[494] == 1 or GS.flag[494] == 2) {
	            scr_itemget(57)
	            if(noroom == 1) {
	                GS.faceemotion= 1
	                GS.msg[0]= "* Hey^1, you sure&  are carrying a&  lot of things./"
	                GS.msg[1]= "* If someone needed&  to give you a thing^1,&  they sure couldn\'t!/%%"
	            } else  {
	                GS.faceemotion= 1
	                GS.msg[0]= "* What^1?&* You LOST the letter!?/"
	                GS.msg[1]= "* What the HECK!^1?&* How!^1? Why!?/"
	                GS.msg[2]= "\\E7* Ughhh..^1.&* This is unbelievable./"
	                GS.msg[3]= "* I should be really&  disappointed in you./"
	                GS.msg[4]= "\\E9* But^1, uh^1, to tell&  you the truth^1, I\'m&  kind of relieved!/"
	                GS.msg[5]= "\\E1* While you were gone^1,&  I actually wrote&  a WAY BETTER letter!/"
	                GS.msg[6]= "\\E6* And this time^1, you&  WON\'T lose it!!!/"
	                GS.msg[7]= "\\E2* I guarantee it!!!/"
	                GS.msg[8]= "\\TS \\F0 \\T0 %"
	                GS.msg[9]= "* (You got the Undyne Letter&  EX.)/%%"
	                GS.flag[494]= 3
	            }
	        }
	    }
	    if(GS.flag[493] == 8) {
	        scr_itemget(56)
	        if(noroom == 1) {
	            GS.faceemotion= 9
	            GS.msg[0]= "* Hey^1, I have something&  to give you.../"
	            GS.msg[1]= "\\E2* But you\'re carrying&  way too much!!!/%%"
	        } else  {
	            GS.faceemotion= 9
	            GS.msg[0]= "* Um^1, so^1, I have a&  favor to ask you./"
	            GS.msg[1]= "\\E0* Uuuuh^1, I..^1.&* I need you to deliver&  this letter./"
	            GS.msg[2]= "\\E9* To Dr. Alphys./"
	            GS.msg[3]= "\\E1* Huh!^1?&* Why don\'t I do it&  my..?/"
	            GS.msg[4]= "\\E8* ... um^1.&* W-well.../"
	            GS.msg[5]= "\\E9* I-it\'s kind of&  personal^1, but we\'re&  friends..^1. so.../"
	            GS.msg[6]= "\\E8* I\'ll t-tell you.../"
	            GS.msg[7]= "\\E6* Hotland SUUUUCKS!!^1!&* I don\'t wanna have&  to go over there!!!/"
	            GS.msg[8]= "\\E3* So here you go./"
	            GS.msg[9]= "\\TS \\F0 \\T0 %"
	            GS.msg[10]= "* (You got the Undyne\'s Letter.)/"
	            scr_undface(11, 9)
	            GS.msg[12]= "* Oh^1, and if you&  read it.../"
	            GS.msg[13]= "\\E2* I\'ll KILL you./"
	            GS.msg[14]= "\\E9* Thanks so much^1!&* You\'re the best!!/%%"
	            GS.flag[493]= 9
	            GS.flag[8]= 1
	        }
	    }
	}
	if(GS.flag[7] == 1) {
	    if(GS.flag[193] == 0) GS.msc= 806
	    if(GS.flag[193] == 1) {
	        GS.msg[0]= "* Hey^1, Alphys^1!&* Alphys!/"
	        GS.msg[1]= "\\E1* Do you think we&  can watch something&  with fighting next?/"
	        GS.msg[2]= "\\E9* Oh^1, and then...&* Something..^1.&* With princesses!?/"
	        GS.msg[3]= "\\E2* Or FIGHTING&  princesses!?/"
	        scr_alface(4, 5)
	        GS.msg[5]= "\\E5* I-I\'ll see if I&  can manage to find&  any like that^1, Undyne./"
	        scr_undface(6, 6)
	        GS.msg[7]= "\\E6* Yayyyyy!/%%"
	    }
	    if(GS.flag[193] >= 2) {
	        GS.msg[0]= "\\E0* Hey Frisk^1, why don\'t&  you go say hi to&  Napstablook?/"
	        GS.msg[1]= "\\E1* Oh^1, tell them I&  said hi^1, too!/%%"
	        if(GS.flag[194] == 0) GS.flag[194]= 1
	    }
	    GS.flag[193]++
	}
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	talkedto++

func _process_begin(delta: float):
	scr_depth(0, 0, 0, 0, 0)
	if(fun == 0) {
	    if(instance_exists(777/* obj_face_undyne */))
	        frame= obj_face_undyne.frame
	    else  frame= 0
	    script_execute(106/* scr_npcdir */, 2)
	}

func _gm_event_7_4():
	if(room == 236 and GS.flag[7] == 0) instance_destroy()

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
