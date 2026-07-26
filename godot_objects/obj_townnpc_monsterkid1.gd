# Auto-converted from GameMaker: obj_townnpc_monsterkid1
# GM parent: obj_readablesolid
extends CharacterBody2D

func _ready():
	dsprite= 1392
	usprite= 1400
	lsprite= 1395
	rsprite= 1397
	dtsprite= 1394
	utsprite= 1401
	ltsprite= 1396
	rtsprite= 1399
	myinteract= 0
	facing= 3
	direction= 270
	talkedto= 0
	image_speed= 0
	con= 0
	fun= 0
	if(GS.plot > 100 and room == 68 and GS.flag[7] == 0)
	    instance_destroy()
	if(GS.plot > 103 and room == 83) instance_destroy()

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	GS.msg[0]= "* Yo^1!&* You\'re a kid too^1, right?/"
	GS.msg[1]= "* I can tell \'cause you\'re&  wearing a striped shirt./%%"
	if(talkedto > 0)
	    GS.msg[0]= "* I wonder if that weird skeleton&  is an adult or a kid./%%"
	if(GS.flag[7] == 1) {
	    if(GS.flag[98] == 0) {
	        GS.msg[0]= "* Yo..^1.&* There you are!/"
	        GS.msg[1]= "* I\'ve been kinda worried&  about you since you&  ran away./"
	        GS.msg[2]= "* ... but now I\'m just kinda&  mad^1, ha ha./"
	        GS.msg[3]= "* If Undyne hadn\'t saved me^1,&  that woulda been bad.../%%"
	        if(talkedto > 0) GS.msg[0]= "* .../%%"
	    }
	    if(GS.flag[98] == 2) {
	        GS.msg[0]= "* Yo..^1.&* Uh.../"
	        GS.msg[1]= "* Don\'t talk to me./%%"
	        if(talkedto > 0) GS.msg[0]= "* .../%%"
	    }
	    if(GS.flag[98] == 1) {
	        GS.msg[0]= "* Yo!!^1!&* What\'s up!?/"
	        GS.msg[1]= "* I\'ve been kinda^1, doing&  some thinking.../"
	        GS.msg[2]= "* Maybe Undyne...&* Isn\'t actually as cool as&  we thought./"
	        GS.msg[3]= "* She\'s just kinda..^1. mean./"
	        GS.msg[4]= "* But YO!!^1!&* I just found out about&  someone WAYYY cooler!!!/"
	        GS.msg[5]= "* Nyeh heh heh!!!/%%"
	        if(talkedto > 0) GS.msg[0]= "* Nyeh heh heh^1, dude./%%"
	    }
	}
	if(scr_murderlv() >= 7) {
	    GS.msg[0]= "* Yo^1, everyone ran away and&  hid somewhere./"
	    GS.msg[1]= "* Man^1, adults can be so&  dumb sometimes^1, haha.../"
	    GS.msg[2]= "* Don\'t they know we\'ve&  got Undyne to protect us!?/%%"
	}
	if(room == 83) {
	    GS.msg[0]= "* Yo^1!&* Are you sneaking out to&  see her^1, too?/"
	    GS.msg[1]= "* Awesome..^1.&* She\'s the coolest^1, right!?/"
	    GS.msg[2]= "* I wanna be just like her&  when I grow up.../"
	    GS.msg[3]= "* Hey^1, don\'t tell my parents&  I\'m here^1.&* Ha ha./%%"
	    if(talkedto > 0)
	        GS.msg[0]= "* OK^1, I\'m ready when you&  are./%%"
	    if(talkedto > 0 and con == 2) {
	        GS.msg[0]= "* Yo^1!&* Where were you going...?/"
	        GS.msg[1]= "* My parents didn\'t tell you&  to come here^1, did they?/%%"
	    }
	    if(con == 1 and talkedto > 0) {
	        GS.msg[0]= "* You know where you\'re&  going^1, right...?/"
	        GS.msg[1]= "* I was just gonna follow&  you..^1.&* Ha ha./%%"
	    }
	}
	if(room == 109) {
	    if(talkedto == 0) {
	        GS.msg[0]= "* Yo^1, this ledge is way&  too steep.../%%"
	        if(instance_exists(1125/* obj_monsterkidtrigger6 */))
	            obj_monsterkidtrigger6.con= 4
	    }
	    if(talkedto > 0) GS.msg[0]= "* Hmmm..../%%"
	    if(GS.plot == 112) {
	        if(GS.flag[85] == 0) {
	            myinteract= 0
	            if(instance_exists(1125/* obj_monsterkidtrigger6 */))
	                obj_monsterkidtrigger6.con= 10
	        }
	        if(GS.flag[85] == 1) {
	            GS.msg[0]= "* Yo^1, you aren\'t going to&  be able to climb with&  an umbrella./%%"
	            mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	        }
	    }
	}
	if(GS.plot != 112) mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	talkedto++

func _process_begin(delta: float):
	scr_depth(0, 0, 0, 0, 0)
	if(fun == 0) {
	    script_execute(106/* scr_npcdir */, 2)
	    scr_npc_anim()
	}

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
