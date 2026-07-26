# Auto-converted from GameMaker: obj_townnpc_bear1
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
	GS.msg[0]= "* This town doesn\'t have a&  mayor./"
	GS.msg[1]= "* But if there\'s ever a problem^1,&  a skeleton will tell a fish&  lady about it./"
	GS.msg[2]= "* Thaaaaaat\'s politics!/%%"
	if(talkedto > 0) GS.msg[0]= "* Politics./%%"
	if(GS.plot >= 122) {
	    GS.msg[0]= "* What if I ran for mayor...?/"
	    GS.msg[1]= "* I don\'t think I would do&  a good job^1, and I hate&  responsibility.../"
	    GS.msg[2]= "* But I love politics^1.&* So I might be a perfect&  match./%%"
	}
	if(GS.flag[7] == 1) {
	    GS.msg[0]= "* I heard Dr. Alphys told&  the king and queen the&  awful things she\'d done./"
	    GS.msg[1]= "* The king felt so bad&  that he didn\'t know^1.&* He gave her a big hug./"
	    GS.msg[2]= "* Then the queen fired her./"
	    GS.msg[3]= "* Now we don\'t have a Royal&  Scientist anymore.../"
	    GS.msg[4]= "* Thaaaaat\'s politics!/%%"
	    if(talkedto > 0)
	        GS.msg[0]= "* Too bad there are no&  politics on the surface./%%"
	}
	if(GS.flag[67] == 1) {
	    GS.msg[0]= "* Hmmm^1, usually that skeleton&  goes to meet with Undyne&  about now./"
	    GS.msg[1]= "* Where is he...^1?&* I can feel our political&  system crumbling apart.../%%"
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
