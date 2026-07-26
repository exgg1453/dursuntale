# Auto-converted from GameMaker: obj_grillbynpc_foodmonster
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
	direction= 0
	talkedto= 0
	image_speed= 0
	fun= 0
	sansmode= 0
	if(scr_murderlv() >= 7) instance_destroy()

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	GS.msg[0]= "* Hmmm..^1.&* Isn\'t human food different&  from monster food?/"
	GS.msg[1]= "* It does things like " + chr(ord('"')) + "spoil." + chr(ord('"')) + "/"
	GS.msg[2]= "* And when you eat it^1, it&  passes all the way through&  your whole body./"
	GS.msg[3]= "* Disgusting./"
	GS.msg[4]= "* I\'d love to try it sometime./%%"
	if(talkedto > 0)
	    GS.msg[0]= "* And I\'ve heard they have&  things called bathrooms./%%"
	if(GS.plot >= 122) {
	    GS.msg[0]= "* To a human^1, monster food&  would be very interesting./"
	    GS.msg[1]= "* As soon as you eat it^1, it&  converts perfectly into&  energy./"
	    GS.msg[2]= "* ... that makes me wonder^1.&* How do humans do it?/"
	    GS.msg[3]= "* Eat during battle...?/%%"
	    if(talkedto > 0) {
	        GS.msg[0]= "* Ice cream in one hand^1,&  sword in the other./"
	        GS.msg[1]= "* That\'s the way of the&  monster warrior.../%%"
	    }
	}
	if(GS.flag[67] == 1) {
	    GS.msg[0]= "* Hmmm^1, this is around the&  time that Sans comes in./"
	    GS.msg[1]= "* Then^1, a little bit later^1,&  his brother comes in^1,&  irritated./"
	    GS.msg[2]= "* Yes^1, his brother^1.&* Papyrus./"
	    GS.msg[3]= "* He\'s an interesting fellow./"
	    GS.msg[4]= "* He always orders a glass of&  milk.../"
	    GS.msg[5]= "* He says it\'s " + chr(ord('"')) + "full of&  strong bones." + chr(ord('"')) + "/%%"
	    if(talkedto > 0) GS.msg[0]= "* Hope he shows up today./%%"
	}
	if(GS.flag[7] == 1) {
	    GS.msg[0]= "* Soon^1, I\'ll be able to try&  some human food.../"
	    GS.msg[1]= "* And then I guess I\'ll try&  a human bathroom^1, too./%%"
	}
	if(sansmode == 1) {
	    GS.msg[0]= "* Sans is interesting^1.&* He has told me about all&  kinds of incredible foods./"
	    GS.msg[1]= "* But^1, despite his knowledge^1,&  he always orders the worst&  burger off the menu./%%"
	}
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	talkedto++

func _process_begin(delta: float):
	if(fun == 0) scr_npc_anim()

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
