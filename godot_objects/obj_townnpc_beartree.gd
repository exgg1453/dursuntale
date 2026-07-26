# Auto-converted from GameMaker: obj_townnpc_beartree
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
	if(scr_murderlv() >= 7) instance_destroy()

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	GS.msg[0]= "* Awful teens tormented&  a local monster by decorating&  its tree-like horns./"
	GS.msg[1]= "* So we started giving that&  monster presents to make it&  feel better./"
	GS.msg[2]= "* Now it\'s a tradition to put&  presents underneath a decorated&  tree./%%"
	if(talkedto > 0)
	    GS.msg[0]= "* Guess it was a good thing&  those teens tormented that&  monster...?/%%"
	if(GS.plot >= 122) {
	    GS.msg[0]= "* Hmm^1?&* Adjusting the presents is&  my responsibility./"
	    GS.msg[1]= "* Nah^1, to be honest^1, I&  just keep looking to see&  if I\'ve gotten one.../%%"
	}
	if(GS.flag[7] == 1) {
	    GS.msg[0]= "* It\'ll be nice to show humans&  our presents-under-the-tree&  tradition./"
	    GS.msg[1]= "* They\'ll probably be weirded&  out by it./%%"
	}
	if(scr_deaddog() == 1) {
	    GS.msg[0]= "* You know what\'s cute?/"
	    GS.msg[1]= "* Those two married dogs&  always put presents under&  the tree for each other./"
	    GS.msg[2]= "* It\'s always the same^1.&* A single bone./"
	    GS.msg[3]= "* But every time^1, they act&  like it\'s the first time&  they\'ve gotten it./"
	    GS.msg[4]= "* Then Papyrus comes to take&  his bones back./"
	    GS.msg[5]= "* Anyway^1, where are those&  two...?/%%"
	}
	if(GS.flag[67] == 1) {
	    GS.msg[0]= "* That\'s strange^1.&* There was a present here&  for Papyrus.../"
	    GS.msg[1]= "* Now it\'s gone^1.&* Did someone steal it?/%%"
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
