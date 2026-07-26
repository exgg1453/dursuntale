# Auto-converted from GameMaker: obj_smallfrog
# GM parent: obj_readablesolid
extends CharacterBody2D

func _ready():
	myinteract= 0
	scale.x= 1
	scale.y= 1
	image_speed= 0.1
	if(room == 21 and x > 300 and x < 400) {
	}

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.msg[0]= "* Ribbit^1, ribbit^1.&* (Excuse me^1, human.)/"
	GS.msg[1]= "* (I have some advice&  for you about battling&  monsters.)/"
	GS.msg[2]= "\\W* (If you \\YACT\\W a certain way&  or \\YFIGHT\\W until you&  almost defeat them...)/"
	GS.msg[3]= "* (They might not want to&  battle you anymore.)/"
	GS.msg[4]= "* (If a monster does not&  want to fight you^1, please...)/"
	GS.msg[5]= "\\W* (Use some \\YMERCY^1,\\W human.^1)&* Ribbit./%%"
	if(GS.flag[6] == 1) {
	    GS.msg[0]= "* Ribbit^1, ribbit^1.&* (Excuse me^1, human.)/"
	    GS.msg[1]= "* (I have some advice&  for you about battling&  monsters.)/"
	    GS.msg[2]= "* (The monsters in this world&  are very dangerous and&  aggressive.)/"
	    GS.msg[3]= "* (In this place^1, running away&  will not work on the&  first turn.)/"
	    GS.msg[4]= "* (It may be better to try&  another option.^1)&* Ribbit./%%"
	}
	if(GS.flag[7] == 1) {
	    GS.msg[0]= "* Ribbit^1, ribbit^1.&* (Excuse me^1, human.)/"
	    GS.msg[1]= "* (You seem like you have&  grown into a thoughtful and&  conscientious person.)/"
	    GS.msg[2]= "* (Whether that was from my&  advice or not...^1)&* (I\'m quite proud.)/"
	    GS.msg[3]= "* Ribbit./%%"
	}
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	if(room == 29) {
	    GS.msg[0]= "* Ribbit^1, ribbit^1.&* (Just between you and me...)/"
	    GS.msg[1]= "\\W* (I saw \\BTORIEL\\W come out of&  here just a little&  while ago.)/"
	    GS.msg[2]= "* (She was carrying some&  groceries.)/"
	    GS.msg[3]= "* (I didn\'t ask what they&  were for...)/"
	    GS.msg[4]= "* (We\'re all too intimidated&  to talk to her.^1)&* Ribbit./%%"
	    if(GS.flag[7] == 1) {
	        GS.msg[0]= "* Ribbit^1, ribbit^1.&* (Seems like the RUINS have&  finally opened up.)/"
	        GS.msg[1]= "* (Maybe we should finally&  go out to the rest of&  the underground.)/"
	        GS.msg[2]= "* (Huh^1? The barrier\'s open^1,&  too...?)/"
	        GS.msg[3]= "* (... let\'s just take this&  one step at a time^1, OK?)/%%"
	    }
	    if(GS.flag[6] == 1) {
	        GS.msg[0]= "* Ribbit^1, ribbit^1.&* (Just between you and me...)/"
	        GS.msg[1]= "\\W* (I saw \\BTORIEL\\W come out of&  here just a little&  while ago.)/"
	        GS.msg[2]= "* (Normally^1, she carries&  groceries out of here.)/"
	        GS.msg[3]= "* (But this time^1, she wasn\'t&  carrying anything.)/"
	        GS.msg[4]= "* (She looked disappointed.^1)&* Ribbit./%%"
	    }
	}
	if(room == 21 and x > 300 and x < 400) {
	    GS.msc= 0
	    GS.msg[0]= "* Ribbit ribbit^1.&* (I heard using " + chr(ord('"')) + "F4" + chr(ord('"')) + " can make&  you have a " + chr(ord('"')) + "full screen." + chr(ord('"')) + ")/"
	    GS.msg[1]= "* (But what does " + chr(ord('"')) + "F4" + chr(ord('"')) + " stand for?^1)&* (" + chr(ord('"')) + "Four frogs" + chr(ord('"')) + "?)/"
	    GS.msg[2]= "* (I have only seen a maximum of&  three frogs in this room...)/"
	    GS.msg[3]= "* (This is troubling^1, to say&  the least.^1)&* Ribbit./%%"
	    if(GS.flag[7] == 1)
	        GS.msg[0]= "* Ribbit ribbit^1.&* (Did you ever find this&  room\'s fourth frog?)/%%"
	}
	if(room == 21 and x > 400) {
	    if(GS.flag[22] == 0) GS.msc= 748
	    if(GS.flag[22] == 1) GS.msc= 751
	    if(GS.flag[22] == 2) GS.msc= 753
	    if(GS.flag[7] == 1) {
	        GS.msc= 0
	        if(GS.flag[22] == 0) {
	            GS.msg[0]= "* Ribbit ribbit^1.&* (Yellow names were nice for&  a while.)/"
	            GS.msg[1]= "* (Next time^1, we should try a&  relaxing shade of green.)/%%"
	        }
	        if(GS.flag[22] == 1) {
	            GS.msg[0]= "* Ribbit ribbit^1.&* (How was your adventure?)/"
	            GS.msg[1]= "* (It must have been difficult&  without being able to tell&  the enemy\'s feelings.)/%%"
	        }
	        if(GS.flag[22] == 2) {
	            GS.msg[0]= "* Ribbit ribbit^1.&* (Finally^1, we can all remove&  these aging pink names.)/"
	            GS.msg[1]= "* (Everyone gave you a big favor&  today.^1)&* (Try to respect that!)/%%"
	        }
	    }
	}
	if(not instance_exists(782/* OBJ_WRITER */)) {
	    GS.interact= 1
	    mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	}

func _process_begin(delta: float):
	scr_depth(0, 0, 0, 0, 0)
	if(GS.kills > 16) instance_destroy()
	if(room == 29 and GS.kills > 0) instance_destroy()
	if(room == 12 and GS.kills > 0) instance_destroy()

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
