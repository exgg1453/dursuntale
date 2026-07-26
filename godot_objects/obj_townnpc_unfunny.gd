# Auto-converted from GameMaker: obj_townnpc_unfunny
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
	GS.msg[0]= "* Everyone is always laughing&  and cracking jokes^1, trying&  to forget our modern crises.../"
	GS.msg[1]= "* Dreariness^1.&* Crowding^1.&* Lack of sunlight./"
	GS.msg[2]= "* I would join them^1, but I\'m&  just not very funny./%%"
	if(talkedto > 0)
	    GS.msg[0]= "* At least I\'m not making puns./%%"
	if(GS.plot >= 122) {
	    GS.msg[0]= "* Wait^1!&* I\'ve got a joke!/"
	    GS.msg[1]= "* Knock knock!/"
	    GS.msg[2]= "* ... Uh^1.&* That\'s all I\'ve thought of./%%"
	}
	if(GS.flag[7] == 1) {
	    GS.msg[0]= "* Looks like I don\'t have&  to worry about cracking&  jokes anymore./"
	    GS.msg[1]= "* .../"
	    GS.msg[2]= "* I was going to say a joke&  here^1, but I really don\'t&  have one./%%"
	}
	if(GS.flag[67] == 1 or scr_deaddog() == 1)
	    GS.msg[0]= "* It just feels like..^1.&* Like everything is getting&  worse and worse./%%"
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
