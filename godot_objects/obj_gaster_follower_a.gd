# Auto-converted from GameMaker: obj_gaster_follower_a
# GM parent: obj_readablesolid
extends CharacterBody2D

func _ready():
	dsprite= 1219
	usprite= 1219
	lsprite= 1219
	rsprite= 1219
	dtsprite= 1219
	utsprite= 1219
	ltsprite= 1219
	rtsprite= 1219
	myinteract= 0
	facing= 0
	direction= 0
	talkedto= 0
	image_speed= 0
	gox= 0
	if(GS.flag[5] == 61 and file_exists("undertale.ini")) {
	    ini_open("undertale.ini")
	    fsx= ini_read_real("General", "fun", 0)
	    if(fsx == 61 and GS.flag[5] == 61) {
	        gox= 1
	        type= 1
	        ini_write_real("General", "fun", 0)
	        GS.flag[5]= 0
	    }
	    ini_close()
	}
	choos= choose(0, 1, 2, 3, 4)
	if(choos != 4) gox= 0
	if(GS.debug == 1) gox= 1
	if(gox == 0) instance_destroy()
	if(GS.flag[7] == 1) instance_destroy()
	con= 0

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	GS.msg[0]= "* Alphys might work faster^1.&* But the old Royal Scientist^1,&  Doctor W.D. Gaster?/"
	GS.msg[1]= "* One day^1, he vanished&  without a trace./"
	GS.msg[2]= "* They say he shattered&  across time and space./"
	GS.msg[3]= "* Ha ha..^1.&* How can I say so&  without fear?/"
	GS.msg[4]= "* I\'m holding a piece of&  him right here./%%"
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	talkedto++
	con= 1

func _process_begin(delta: float):
	scr_depth(0, 0, 0, 0, 0)
	scr_npc_anim()
	if(con == 1 and not instance_exists(782/* OBJ_WRITER */)) {
	    snd_play(148/* snd_mysterygo */)
	    x= -100
	    y= -100
	    con= 2
	    visible= 0
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
