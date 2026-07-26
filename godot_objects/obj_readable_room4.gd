# Auto-converted from GameMaker: obj_readable_room4
# GM parent: obj_readable
extends Node2D

func _ready():
	myinteract= 0
	scale.x= 1
	if(room == 252) scale.x= 20
	scale.y= 1
	read= 0

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	GS.msg[0]= "%%"
	if(room == 34) {
	    GS.msg[0]= "* It\'s you!/%%"
	    if(GS.flag[7] == 1) GS.msg[0]= "* Still just you^1, Frisk./%%"
	}
	if(room == 34 and murdererlv1() == 1)
	    GS.msg[0]= "* It\'s me^1, " + GS.charname + "./%%"
	if(room == 221) GS.msg[0]= "* It\'s a golden flower./%%"
	if(room == 222) {
	    GS.msg[0]= "* Despite everything^1, it\'s&  still you./%%"
	    if(scr_murderlv() >= 16)
	        GS.msg[0]= "* It\'s me^1, " + GS.charname + "./%%"
	}
	if(room == 37 and x < 130)
	    GS.msg[0]= "* Inside the cupboard are&  cookie cutters for&  gingerbread monsters./%%"
	if(room == 37 and murdererlv1() == 1 and x < 130)
	    GS.msg[0]= "\\R* Where are the knives./%%"
	if(room == 37 and x > 130)
	    GS.msg[0]= "* The stovetop is very clean^1.&* Toriel must use fire&  magic instead./%%"
	if(room == 37 and x > 130 and GS.flag[45] == 4)
	    GS.msg[0]= "* No one will use this&  anymore.../%%"
	if(room == 225 and x < 130) {
	    GS.msg[0]= "* (It\'s a note.^1)&* Howdy^1! Help yourself to&  anything you want!/%%"
	    if(scr_murderlv() >= 16) GS.msg[0]= "* I\'ve read this already./%%"
	}
	if(room == 225 and x > 130) {
	    GS.msg[0]= "* (The stovetop is very clean.^1)&* (Someone must use fire&  magic instead.)/%%"
	    if(scr_murderlv() >= 16) GS.msg[0]= "* Stovetop./%%"
	}
	if(room == 224) {
	    if(x < 160) {
	        GS.msg[0]= "* (What a comfortable bed.^1)&* (If you laid down here^1,&  you might not ever get up.)/%%"
	        if(scr_murderlv() >= 16) GS.msg[0]= "* My bed./%%"
	    }
	    if(x > 160) {
	        GS.msg[0]= "* (It\'s a twin-sized bed.)/%%"
	        if(scr_murderlv() >= 16) GS.msg[0]= "* His bed./%%"
	    }
	}
	if(room == 223) GS.msg[0]= "* (It\'s a king-sized bed.)/%%"
	if(room == 74) {
	    GS.msg[0]= "* " + chr(ord('"')) + "MONSTER HISTORY PART 4" + chr(ord('"')) + "/"
	    GS.msg[1]= "* Fearing the humans no longer^1,&  we moved out of our old&  city^1, HOME./"
	    GS.msg[2]= "* We braved harsh cold^1, damp&  swampland^1, and searing heat.../"
	    GS.msg[3]= "* Until we reached what we now&  call our capital./"
	    GS.msg[4]= "* " + chr(ord('"')) + "NEW HOME." + chr(ord('"')) + "/"
	    GS.msg[5]= "* Again^1, our King is really&  bad at names...?/%%"
	}
	if(room == 123) {
	    GS.msg[0]= "* Excuse me..^1.&* Yes^1, you^1, with the striped&  shirt./"
	    GS.msg[1]= "* Can you do something about&  your friend...?/"
	    GS.msg[2]= "* Yes^1, your friend..^1.&* The one behind you^1, with the&  creepy smile./%%"
	    if(GS.flag[97] == 1)
	        GS.msg[0]= "* Hmmm^1?&* Where\'d your friend go?/%%"
	    GS.flag[97]= 1
	}
	if(room == 91) {
	    GS.msg[0]= "* If a monster defeats a human^1,&  they can take its SOUL./"
	    GS.msg[1]= "* A monster with a human SOUL..^1.&* A horrible beast with&  unfathomable power./%%"
	}
	if(room == 141) {
	    GS.msg[0]= "* (It\'s a video feed of your&  location.)/%%"
	    if(GS.plot < 126) GS.msg[0]= "* It\'s you...?/%%"
	    if(scr_murderlv() >= 12)
	        GS.msg[0]= "* It\'s me^1, " + GS.charname + "./%%"
	}
	read++
	if(room == 142) GS.msc= 645
	if(room == 154) {
	    GS.msg[0]= "* (It\'s a microwave.^1)&* (That\'s great if you\'re a&  microwave fan.)/%%"
	    if(GS.plot < 134 and scr_murderlv() < 12)
	        GS.msg[0]= "* (It\'s too dark to see&  near the walls.)/%%"
	    if(instance_exists(1173/* obj_mettaton_npc */)) {
	        GS.typer= 27
	        GS.msg[0]= "* MTT-BRAND MICROWAVE^1!&* ORIGIN OF THE MTT CHALLENGE!/"
	        GS.msg[1]= "* PUT YOUR FOOD IN AND SET&  THE MICROWAVE ON HIGH FOR&  FIVE MINUTES.../"
	        GS.msg[2]= "* IF YOU CAN STILL RECOGNIZE&  YOUR MEAL^1, WE\'LL DOUBLE YOUR&  MONEY BACK!!!/%%"
	        if(GS.plot == 134) {
	            GS.msg[0]= "* STILL FIDDLING WITH THAT&  MICROWAVE, EH, DARLING?/"
	            GS.msg[1]= "* CAN\'T BLAME YOU FOR BEING&  TOTALLY ENAMORED WITH AN&  ELECTRONIC BOX./%%"
	        }
	    }
	}
	if(room == 118) {
	    GS.msg[0]= "* (In the sink is a teacup&  in the shape of a fish.)/%%"
	    if(x > 200) {
	        GS.facechoice= 5
	        GS.typer= 37
	        GS.msc= 714
	    }
	}
	if(room == 245) {
	    GS.msg[0]= "* ENTRY NUMBER 5/"
	    GS.msg[1]= "* I\'ve done it./"
	    GS.msg[2]= "* Using the blueprints^1, I\'ve&  extracted it from the&  human SOULs./"
	    GS.msg[3]= "* I believe this is what&  gives their SOULs the strength&  to persist after death./"
	    GS.msg[4]= "* The will to keep living..^1.&* The resolve to change fate./"
	    GS.msg[5]= "* Let\'s call this power.../"
	    GS.msg[6]= "\\Y* " + chr(ord('"')) + "Determination." + chr(ord('"')) + "/%%"
	    if(GS.flag[485] == 1)
	        GS.msg[0]= "* (It seems to be turned off.)/%%"
	}
	if(room == 252) GS.msg[0]= "* (Golden flowers.)/%%"
	if(room == 78) {
	    if(y < 128) GS.msc= 845
	    GS.msg[0]= "* (It\'s Sans\'s dirty sock pile.^1)&* (Sc..^1. scandalous...?)/%%"
	}
	if(room == 80)
	    GS.msg[0]= "* (There\'s a strange machine&  behind the curtain.^1)&* (It seems to be broken.)/%%"
	if(room == 68) {
	    if(GS.flag[497] < 3) GS.msg[0]= "* (It\'s locked.)/%%"
	    if(GS.flag[497] >= 3) {
	        GS.msg[0]= "* (You unlocked the door and&  entered.)/%%"
	        instance_create(0, 0, 963/* obj_sansbasemententer */)
	        snd_play(108/* snd_item */)
	    }
	}
	if(room == 266)
	    GS.msg[0]= "* (Finally^1, the pieces of the&  puzzle are coming together.^1)&* (The jigsaw puzzle.)/%%"
	if(room == 84)
	    GS.msg[0]= "* Huh!^1?&* There\'s a camera behind&  the waterfall./%%"
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
