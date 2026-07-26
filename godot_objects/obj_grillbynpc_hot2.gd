# Auto-converted from GameMaker: obj_grillbynpc_hot2
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
	fun= 0
	if(scr_murderlv() >= 7) instance_destroy()
	sansmode= 0

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	GS.msg[0]= "* Those dogs are part of&  the ROYAL GUARD^1, the elite&  military group led by UNDYNE./"
	GS.msg[1]= "* She\'s rude^1, loud^1, and beats up&  everybody who gets in her&  way.../"
	GS.msg[2]= "* It\'s no wonder all the kids&  want to be like her when&  they grow up!/%%"
	if(talkedto > 0)
	    GS.msg[0]= "* I want to be like UNDYNE&  when I grow up^1, too^1!&* Hoo hoo hoo!/%%"
	if(sansmode == 1) {
	    GS.msg[0]= "* Sans is a sentry^1.&* But don\'t let his title make&  you think he does anything./"
	    GS.msg[1]= "\\W* Everyone knows he sits&  around in the forest&  reading \\Ycar magazines\\W./%%"
	}
	if(GS.plot >= 122)
	    GS.msg[0]= "* Ehhhhhhhhnnnnn..^1.&* I wish I had something else&  to do./%%"
	if(scr_deaddog()) {
	    GS.msg[0]= "* Those dogs are part of&  the ROYAL GUARD^1, the.../"
	    GS.msg[1]= "* Huh^1?&* Where are they?/"
	    GS.msg[2]= "* Something feels really off./%%"
	}
	if(GS.flag[7] == 1) {
	    GS.msg[0]= "* Wow^1, a brand new world.../"
	    GS.msg[1]= "* I might not get to&  translate for Grillby&  anymore.../"
	    GS.msg[2]= "* ... which is fine^1, since I&  was actually just making&  up what he was saying./%%"
	}
	if(GS.flag[67] == 1) {
	    GS.msg[0]= "* Grillby is getting nervous./"
	    GS.msg[1]= "* Sans is his best customer^1,&  and he hasn\'t shown up&  at all today.../%%"
	}
	if(GS.flag[350] == 1) {
	    GS.msg[0]= "* Something feels really bad^1.&* Our lives are going nowhere^1,&  aren\'t they...?/"
	    GS.msg[1]= "* I think I need another&  espresso.../%%"
	}
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	talkedto++

func _process_begin(delta: float):
	scr_depth(0, 0, 0, 0, 0)
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
