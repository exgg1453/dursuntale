# Auto-converted from GameMaker: obj_snowdrakenpc
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
	direction= 270
	talkedto= 0
	image_speed= 0
	if(scr_enemynpc1() != 1) instance_destroy()
	if(GS.flag[7] == 1) {
	    instance_create(x + 40, y - 8, 1358/* obj_npc_room */)
	    instance_create(x + 100, y, 1494/* obj_snowdrakedad */)
	}

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	GS.msg[0]= "* I ran away from home^1.&* Why?/"
	GS.msg[1]= "* \'Cause my father was so&  " + chr(ord('"')) + "cold" + chr(ord('"')) + " to me.../"
	GS.msg[2]= "* WHAT!^1?&* It\'s a JOKE!^1!&* LAUGH at it!!/%%"
	if(talkedto > 0)
	    GS.msg[0]= "* I really don\'t^1!&* I don\'t care if he doesn\'t&  like my jokes!/%%"
	if(GS.flag[7] == 1) {
	    GS.msg[0]= "* Mom might have to share her&  mind with other people now^1,&  but she\'s still my mom./"
	    GS.msg[1]= "* And that\'s " + chr(ord('"')) + "cool!" + chr(ord('"')) + "/"
	    GS.msg[2]= "* \'Cause^1, uhh^1, we\'re made&  of ice and stuff./"
	    GS.msg[3]= "* WHAT!?!^1?&* It\'s a JOKE!^1!&* LAUGH at it!!/%%"
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
