# Auto-converted from GameMaker: obj_librarynpc_wordsearch
# GM parent: obj_readablesolid
extends CharacterBody2D

func _ready():
	dsprite= sprite_index
	usprite= sprite_index
	lsprite= sprite_index
	rsprite= sprite_index
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
	GS.msg[0]= "* (cough, cough)/"
	GS.msg[1]= "* When I was younger^1, my teachers&  gave me word searches when&  they ran out of assignments./"
	GS.msg[2]= "* I thought they were a waste&  of time./"
	GS.msg[3]= "* But look at me now.../"
	GS.msg[4]= "* I\'m the number-one word-search&  creator in the entire&  underground!/%%"
	if(GS.plot >= 122) {
	    GS.msg[0]= "* (cough^1, cough)/"
	    GS.msg[1]= "* There\'s a day I just don\'t&  want to work./"
	    GS.msg[2]= "* It\'s called " + chr(ord('"')) + "Today." + chr(ord('"')) + "/%%"
	}
	if(GS.flag[7] == 1) {
	    GS.msg[0]= "* This will be our newspaper\'s&  last issue.../"
	    GS.msg[1]= "* Why don\'t we just put a&  big " + chr(ord('"')) + "THE END" + chr(ord('"')) + " on the front&  and call it a day?/%%"
	}
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	talkedto++

func _process_begin(delta: float):
	scr_depth(0, 0, 0, 0, 0)
	script_execute(107/* scr_npc_anim */)

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
