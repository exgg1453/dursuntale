# Auto-converted from GameMaker: obj_spidergirl_shop
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
	dis= 0
	if(GS.plot > 163) dis= 1
	if(GS.flag[397] == 1) dis= 1
	if(dis == 1) instance_destroy()

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	GS.msg[0]= "* Welcome to our parlor^1, dearie^1~&* Interested in some spider&  pastries?/"
	GS.msg[1]= "* All proceeds go to real&  spiders~/%%"
	if(talkedto > 0)
	    GS.msg[0]= "* Check out the webs to&  make a purchase~/%%"
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	talkedto++

func _process_begin(delta: float):
	scr_depth(0, 0, 0, 0, 0)
	if(myinteract > 0) {
	    sprite_index= 1803/* spr_muffet_buysell */
	    if(instance_exists(782/* OBJ_WRITER */) and OBJ_WRITER.halt == 0)
	        image_speed= 0.1
	} else  {
	    sprite_index= 1802/* spr_muffet_overworld */
	    frame= 0
	    image_speed= 0
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
