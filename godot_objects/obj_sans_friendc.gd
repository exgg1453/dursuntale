# Auto-converted from GameMaker: obj_sans_friendc
# GM parent: obj_readablesolid
extends Node2D

func _ready():
	dsprite= 1355
	usprite= 1362
	lsprite= 1367
	rsprite= 1363
	dtsprite= 1355
	utsprite= 1362
	ltsprite= 1367
	rtsprite= 1363
	myinteract= 0
	facing= 1
	direction= 270
	talkedto= 0
	fun= 0

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 17
	GS.facechoice= 3
	GS.faceemotion= 0
	if(GS.flag[192] == 0) {
	    if(GS.flag[41] > 0) {
	        GS.msg[0]= "* hey^1, frisk^1, what\'s&  with that weird&  expression?/"
	        scr_torface(1, 2)
	        GS.msg[2]= "\\E2* Sans^1, did I tell you&  about the time Frisk&  flirted with me...?/"
	        if(GS.flag[42] > 0)
	            GS.msg[3]= "\\E8* And then asked to&  call me " + chr(ord('"')) + "mother?" + chr(ord('"')) + "/"
	        if(GS.flag[42] == 0)
	            GS.msg[3]= "\\E0* I felt so embarrassed&  for them./"
	        scr_sansface(4, 1)
	        GS.msg[5]= "\\E1* oh boy./"
	        scr_papface(6, 3)
	        GS.msg[7]= "\\E3WOW^1, FRISK.../"
	        GS.msg[8]= "\\E0THIS REALLY PUTS&OUR RELATIONSHIP&IN A NEW LIGHT./"
	        scr_sansface(9, 2)
	        GS.msg[10]= "\\E1* hey^1, tori^1, do you&  have any other&  embarrassing stories?/"
	        scr_torface(11, 0)
	        GS.msg[12]= "\\E0* Oh^1, do I ever!/"
	        GS.msg[13]= "\\E1* But, I think that&  story is one of the&  most unbelievable./"
	        GS.msg[14]= "\\E0* It is hard to think&  anyone would want to&  flirt with me./"
	        scr_alface(15, 0)
	        GS.msg[16]= "\\E0* Ehehe.../"
	        GS.msg[17]= "\\E7* Ehehehe.../"
	        GS.msg[18]= "\\E1* AHA^1! AHAHAH^1!&* HA!^1! HA!!!/"
	        GS.msg[19]= "\\E2* Oh^1, Toriel^1.&* You have NO idea./%%"
	    }
	    if(GS.flag[41] == 0 and GS.flag[42] > 0) {
	        GS.msg[0]= "\\E0* oh hey^1, what\'s up^1,&  frisk?/"
	        GS.msg[1]= "\\E2* we were just talking&  about you./"
	        GS.msg[2]= "\\E1* apparently you asked&  to call tori " + chr(ord('"')) + "mom" + chr(ord('"')) + " right&  after meeting her?/"
	        scr_torface(3, 1)
	        GS.msg[4]= "\\E1* Well^1, it was not&  RIGHT after./"
	        GS.msg[5]= "\\E0* It took a couple&  minutes./"
	        scr_sansface(6, 1)
	        GS.msg[7]= "\\E0* frisk..^1.&* i gotta tell ya./"
	        GS.msg[8]= "\\E2* that\'s^1, uh^1, not the&  best way to get&  to know someone./"
	        scr_papface(9, 3)
	        GS.msg[10]= "\\E3IT\'S NOT???/"
	        scr_undface(11, 9)
	        GS.msg[12]= "\\E9* Papyrus^1, we\'ve been&  over this./"
	        scr_papface(13, 4)
	        GS.msg[14]= "\\E4WHATEVER^1, MOM!!!/"
	        scr_undface(15, 1)
	        GS.msg[16]= "\\E1* Don\'t talk back to&  me like that!/"
	        GS.msg[17]= "\\E6* Go to your room^1,&  Papyrus!/"
	        scr_papface(18, 5)
	        GS.msg[19]= "\\E5OK^1, UNDYNE./"
	        scr_undface(20, 1)
	        GS.msg[21]= "\\E1* Wait^1!&* Don\'t ACTUALLY go&  to your room!!/"
	        scr_papface(22, 7)
	        GS.msg[23]= "\\E7I\'M GETTING MIXED&  MESSAGES HERE!!!/%%"
	    }
	    if(GS.flag[41] == 0 and GS.flag[42] == 0) {
	        GS.msg[0]= "\\E0* frisk^1, tori was telling&  me how she made&  b\'scotch pie for you./"
	        scr_torface(1, 0)
	        GS.msg[2]= "\\E0* Oh^1, I should bake it&  for everyone sometime!/"
	        scr_asgface(3, 0)
	        GS.msg[4]= "* .../"
	        scr_alface(5, 3)
	        GS.msg[6]= "\\E3* (O-oh^1, that sounds&  REALLY good.)/"
	        scr_papface(7, 3)
	        GS.msg[8]= "\\E3COOKING???/"
	        GS.msg[9]= "\\E0CAN I HELP?/"
	        scr_undface(10, 1)
	        GS.msg[11]= "* Wait a second!!!/"
	        GS.msg[12]= "\\E6* Can I help too!?/"
	        scr_torface(13, 0)
	        GS.msg[14]= "\\E0* Certainly^1!&* It would be fun to&  cook together!/"
	        scr_alface(15, 9)
	        GS.msg[16]= "\\E9* (On second thought^1,&  maybe I\'ll o-order&  a pizza.)/%%"
	    }
	}
	if(GS.flag[192] >= 1) {
	    GS.msg[0]= "\\E0* sorry..^1.&* i don\'t have time&  to talk^1, frisk./"
	    GS.msg[1]= "\\E1* i\'m supposed to be&  working right now./"
	    scr_papface(2, 4)
	    GS.msg[3]= "\\E4BUT YOU AREN\'T&  WORKING!!!/"
	    scr_sansface(4, 2)
	    GS.msg[5]= "\\E2* i know^1, and it\'s&  taking all my&  concentration./%%"
	}
	GS.flag[192]++
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	talkedto++

func _process_begin(delta: float):
	scr_depth(0, 0, 0, 0, 0)
	if(fun == 0) {
	    frame= 0
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
