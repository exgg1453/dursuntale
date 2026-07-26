# Auto-converted from GameMaker: obj_librarynpc_lizard2
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
	GS.msg[0]= "* I love working on the&  newspaper./"
	GS.msg[1]= "* There\'s so little to report&  that we just fill it with&  comics and games./%%"
	if(GS.plot >= 122) {
	    GS.msg[0]= "* Yes^1.&* I illustrate all of the&  comics my/"
	    GS.msg[1]= "* Yes^1.&* I give everyone huge beautiful&  eyes and giant muscles./%%"
	}
	if(GS.flag[7] == 1) {
	    GS.msg[0]= "* Oh my^1, there\'s so much&  news to report^1, I don\'t know&  where to begin!/"
	    GS.msg[1]= "* How about this headline..^1.&* " + chr(ord('"')) + "Monsters Go Free From The&  Underground." + chr(ord('"')) + "/"
	    GS.msg[2]= "* Nah^1, that doesn\'t have&  enough pizazz.../"
	    GS.msg[3]= "* How about " + chr(ord('"')) + "Top 10 Monsters&  You Won\'t Believe Got Freed&  From The Underground?" + chr(ord('"')) + "/%%"
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
