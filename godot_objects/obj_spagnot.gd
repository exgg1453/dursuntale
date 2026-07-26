# Auto-converted from GameMaker: obj_spagnot
# GM parent: obj_readablesolid
extends CharacterBody2D

func _ready():
	myinteract= 0
	scale.x= 1
	scale.y= 1
	scr_depth(0, 0, 0, 0, 0)

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	GS.msg[0]= "* It\'s a note from Papyrus.../"
	GS.msg[1]= "\\TP %"
	GS.msg[2]= "HUMAN!^1!&PLEASE ENJOY THIS&SPAGHETTI./"
	GS.msg[3]= "(LITTLE DO YOU KNOW^1,&THIS SPAGHETTI IS&A TRAP...)/"
	GS.msg[4]= "(DESIGNED TO ENTICE&YOU!!!)/"
	GS.msg[5]= "(YOU\'LL BE SO BUSY&EATING IT...)/"
	GS.msg[6]= "(THAT YOU WON\'T&REALIZE THAT YOU&AREN\'T PROGRESSING!!)/"
	GS.msg[7]= "(THOROUGHLY JAPED&AGAIN BY THE GREAT&PAPYRUS!!!)/"
	GS.msg[8]= " &      NYEH-HEH-HEH^1,&         PAPYRUS/%%"
	if(GS.flag[7] == 1) {
	    GS.msg[0]= "* It\'s a note from Papyrus.../"
	    GS.msg[1]= "\\TP %"
	    GS.msg[2]= "SEEING AS THIS&SPAGHETTI IS STILL&HERE SOMEHOW.../"
	    GS.msg[3]= "I HEREBY DONATE IT&TO THE PUBLIC./"
	    GS.msg[4]= "IT\'S LIKE A&PLAYGROUND FOR&YOUR MOUTH!/"
	    GS.msg[5]= " &      NYEH-HEH-HEH^1,&         PAPYRUS/%%"
	}
	if(room == 60)
	    GS.msg[0]= "* It\'s illegible chicken-&  scratch./%%"
	if(room == 75) {
	    if(GS.flag[67] == 0)
	        GS.msg[0]= "WHAT!^1?&THAT\'S IMPOSSIBLE./%%"
	    if(GS.flag[67] == -1) {
	        GS.msg[2]= "SORRY^1, I HAVE TO LOCK&YOU IN THE GUEST ROOM&UNTIL UNDYNE ARRIVES./"
	        GS.msg[3]= "FEEL FREE TO MAKE&YOURSELF AT HOME!!!/"
	        GS.msg[4]= "REFRESHMENTS AND&ACCOMODATIONS HAVE&BEEN PROVIDED./"
	        GS.msg[5]= " & - NYEHFULLY YOURS^1,&        PAPYRUS/%%"
	    }
	    if(GS.flag[67] == -2) {
	        GS.msg[2]= "PLEASE ASK BEFORE&YOU ESCAPE!!!/"
	        GS.msg[3]= "WHEN YOU WENT&MISSING I GOT&WORRIED SICK!!!/"
	        GS.msg[4]= "  - SLIGHTLY&  BONETROUSLED^1,&  PAPYRUS/%%"
	    }
	    if(GS.flag[67] == -3) {
	        GS.msg[2]= "IF YOU\'RE JUST&LOOKING FOR A&PLACE TO STAY.../"
	        GS.msg[3]= "JUST ASK!!^1!&YOU DON\'T NEED&TO FIGHT ME!!!/"
	        GS.msg[4]= " & - YOUR HOST^1,&   PAPYRUS/%%"
	    }
	}
	if(room == 49) {
	    GS.msg[0]= "* (This note is written&  very oddly^1, as if the paper was&  moving while it was written.)/"
	    GS.msg[1]= "* (It says...^1)&* (Out to lunch...?)/%%"
	}
	if(room == 152 or room == 150)
	    GS.msg[0]= "* (Shoot the opposing ship!^1)&* (Move the boxes to complete&  your mission.)/%%"
	if(room == 173 or room == 175)
	    GS.msg[0]= "* (Shoot the opposing ship!^1)&* (You have just one shot.)/%%"
	if(room == 182) {
	    GS.msg[0]= "* (Hey^1!)/"
	    GS.msg[1]= "* (Go up the creepy alleyway&  on the right for some&  great deals!)/%%"
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
