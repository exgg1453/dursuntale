# Auto-converted from GameMaker: obj_gaster_follower_c
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
	if(GS.flag[5] == 63 and file_exists("undertale.ini")) {
	    ini_open("undertale.ini")
	    fsx= ini_read_real("General", "fun", 0)
	    if(fsx == 63 and GS.flag[5] == 63) {
	        gox= 1
	        type= 1
	        ini_write_real("General", "fun", 0)
	        GS.flag[5]= 0
	    }
	    ini_close()
	}
	choos= choose(0, 1)
	if(choos != 1) gox= 0
	if(GS.debug == 1) gox= 2
	if(gox == 0) instance_destroy()
	if(GS.flag[7] == 1) instance_destroy()
	if(scr_murderlv() >= 12) instance_destroy()

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	GS.msg[0]= "* I understand why ASGORE&  waited so long to hire a&  new Royal Scientist./"
	GS.msg[1]= "* The previous one..^1.&* Dr. Gaster./"
	GS.msg[2]= "* His brilliance was&  irreplaceable./"
	GS.msg[3]= "* However^1, his life..^1.&* Was cut short./"
	GS.msg[4]= "* One day^1, his experiments&  went wrong^1, and.../%%"
	if(talkedto >= 1) {
	    GS.msg[0]= "* Well^1, I needn\'t gossip./"
	    GS.msg[1]= "* After all^1, it\'s rude to&  talk about someone who\'s&  listening./%%"
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
