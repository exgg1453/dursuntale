# Auto-converted from GameMaker: obj_blookdiary
# GM parent: obj_readablesolid
extends Node2D

func _ready():
	myinteract= 0
	facing= 0
	direction= 270
	talkedto= 0
	image_speed= 0
	con= 0
	touched= 0
	mydialoguer= 3948394839
	scr_depth()

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	GS.msg[0]= "%%"
	if(x > 60) {
	    GS.msg[0]= "* Dear Diary^1:&* Shyren\'s sister " + chr(ord('"')) + "fell down" + chr(ord('"')) + "&  recently./"
	    GS.msg[1]= "* It\'s sad^1.&* Without her sister to&  speak for her.../"
	    GS.msg[2]= "* She\'s become more&  reclusive than ever./"
	    GS.msg[3]= "* So I reached out to her^1,&  and told her.../"
	    GS.msg[4]= "* That she^1, Blooky^1, and I&  should all perform together&  sometime./"
	    GS.msg[5]= "* She seemed to like&  that idea./%%"
	}
	if(x > 95) {
	    GS.msg[0]= "* Dearer Diary^1:&* I like to buy a new diary&  for every entry I make./"
	    GS.msg[1]= "* I love to collect diaries./%%"
	}
	if(x > 120) {
	    GS.msg[0]= "* Dearest Diary^1:&* Our cousin left the farm&  to become a training dummy./"
	    GS.msg[1]= "* That leaves just Blooky&  and I./"
	    GS.msg[2]= "* Blooky asked me if I was&  going to try to become&  corporeal^1, too./"
	    GS.msg[3]= "* They sounded so..^1.&* Resigned.../"
	    GS.msg[4]= "* Come on^1, Blooky^1.&* You know I\'d never leave&  you behind./"
	    GS.msg[5]= "* And besides.../"
	    GS.msg[6]= "* I\'d never find the kind&  of body I\'m looking for^1,&  anyway./%%"
	}
	if(x > 145) {
	    GS.msg[0]= "* My Darling Diary^1:&* I met someone..^1.&* Interesting today./"
	    GS.msg[1]= "* Last week I posted that&  advertisement for my&  Human Fanclub./"
	    GS.msg[2]= "* Today was our first meeting./"
	    GS.msg[3]= "* Only one other person came./"
	    GS.msg[4]= "* Honestly^1, she\'s a dork^1.&* And she\'s obsessed with&  these awful cartoons./"
	    GS.msg[5]= "* But she\'s kind of funny^1,&  too..../"
	    GS.msg[6]= "* I want to see her again./%%"
	}
	if(x > 170) {
	    GS.msg[0]= "* Diary... My dear:&* My diary collection is&  going fabulously./"
	    GS.msg[1]= "* I have like five now./%%"
	}
	if(x > 200) {
	    GS.msg[0]= "* Dear Diary^1:&* She surpised me with&  something today./"
	    GS.msg[1]= "* Sketches of a body that&  she wants to create for&  me.../"
	    GS.msg[2]= "* A form beyond my wildest&  fantasies./"
	    GS.msg[3]= "* In a form like that^1, I&  could finally feel&  like... " + chr(ord('"')) + "my" + chr(ord('"')) + "/"
	    GS.msg[4]= "* After all^1, there\'s no&  way I can be a star&  the way I am now./"
	    GS.msg[5]= "* Sorry^1, Blooky^1.&* My dreams can\'t wait&  for anyone.../%%"
	}
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)

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
