# Auto-converted from GameMaker: obj_snowdrakedad
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
	direction= 0
	talkedto= 0
	image_speed= 0
	if(GS.flag[7] == 1 and room == 184) instance_destroy()
	if(scr_murderlv() >= 12) instance_destroy()

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	GS.msg[0]= "* I\'m the resort comedian.&* I\'m very funny^1.&* People laugh at my jokes./"
	GS.msg[1]= "* Now^1, my son^1.&* He wants to be a comedian&  like his fathah./"
	GS.msg[2]= "* But his jokes^1.&* Aren\'t funny./"
	GS.msg[3]= "* He tells these awful puns^1.&* He\'s an embarrassment to&  our family./"
	GS.msg[4]= "* Ha ha ha ha.../"
	GS.msg[5]= "* That\'s not funny./"
	GS.msg[6]= "* Since his mothah passed on^1,&  he couldn\'t stand^1.&* Living at home anymore./"
	GS.msg[7]= "* So he ran away^1.&* I haven\'t seen him since./"
	GS.msg[8]= "* I\'m a terrible fathah^1.&* Ha ha ha ha.../"
	GS.msg[9]= "* That\'s not funny./%%"
	if(talkedto > 0) {
	    GS.msg[0]= "* Talking to you about&  this..^1.&* It\'s breakin\' my heart./"
	    GS.msg[1]= "* Ha ha ha ha.../"
	    GS.msg[2]= "* That\'s not funny./%%"
	}
	if(GS.flag[7] == 1) {
	    GS.msg[0]= "* The doctah^1.&* She brought my wife.&* Back from the dead./"
	    GS.msg[1]= "* My son^1.&* He seems happy again./"
	    GS.msg[2]= "* Our family^1.&* It\'s biggah than evah./"
	    GS.msg[3]= "* Now that my wife^1.&* Is combined^1.&* With 16 othah people./%%"
	}
	if(GS.flag[425] == 1) {
	    GS.msg[0]= "* My boss stopped answering my&  calls./"
	    GS.msg[1]= "* I don\'t know when my next&  performance will be./"
	    GS.msg[2]= "* Maybe I shouldn\'t try to be&  a comedian anymore.../"
	    GS.msg[3]= "* It\'s tearing my family apart./%%"
	}
	if(GS.flag[57] == 2) {
	    GS.msg[0]= "* My son..^1.&* He was always making these&  weird ice puns./"
	    GS.msg[1]= "* I hated them^1, so he ran&  away from home.../"
	    GS.msg[2]= "* I think I should try to&  patch things up with him./"
	    GS.msg[3]= "* Have you seen him^1?&* Have you seen my son?/%%"
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
