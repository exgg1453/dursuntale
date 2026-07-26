# Auto-converted from GameMaker: obj_papmailbox
# GM parent: obj_readablesolid
extends CharacterBody2D

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

func _on_destroy():
	myinteract= 3
	GS.msc= 565
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	if(instance_exists(1026/* obj_papyrus_room */) or instance_exists(1029/* obj_papyrus_houseoutside */)) {
	    GS.facechoice= 4
	    GS.typer= 19
	    GS.faceemotion= 0
	    GS.msc= 0
	    GS.msg[0]= "HOW NICE OF YOU&TO CHECK MY MAIL&FOR ME./"
	    GS.msg[1]= "\\E3WAIT^1, NO^1.&THAT\'S VERY&STRANGE./%%"
	    if(talkedto > 0) {
	        GS.msg[0]= "\\E3STOP LOOKING IN&MY EMPTY&MAILBOX./"
	        GS.msg[1]= "\\E0THAT\'S MY&EMPTINESS^1, NOT&YOURS./%%"
	    }
	    if(instance_exists(1313/* obj_undyne_friendc */)) {
	        h= 0
	        scr_itemcheck(56)
	        if(haveit == 1) h= 1
	        scr_itemcheck(57)
	        if(haveit == 1) h= 1
	        if(h == 1) {
	            GS.facechoice= 5
	            GS.typer= 37
	            GS.faceemotion= 1
	            GS.msg[0]= "* Oh my god^1!&* The letter\'s not&  to PAPYRUS!!!/"
	            scr_papface(1, 1)
	            GS.msg[2]= "YEAH^1, UNDYNE\'S&GOT A POINT!/"
	            GS.msg[3]= "\\E0WHY DIDN\'T SHE&WRITE A LETTER&TO ME INSTEAD?/"
	            scr_undface(4, 1)
	            GS.msg[5]= "* Fine^1, you want a&  letter!?/"
	            GS.msg[6]= "* I\'ll give you a&  letter!!!/"
	            GS.msg[7]= "\\E6* YOU GET AN " + chr(ord('"')) + "F" + chr(ord('"')) + "!/"
	            scr_papface(8, 5)
	            GS.msg[9]= "OH NO!!!/"
	            GS.msg[10]= "\\E3WHAT\'S THE F&FOR?/"
	            scr_undface(11, 9)
	            GS.msg[12]= "* Friendship!!!/%%"
	        }
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
