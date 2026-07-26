# Auto-converted from GameMaker: obj_hotelreceptionist
# GM parent: obj_readablesolid
extends Node2D

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
	con= 0
	image_speed= 0
	if(scr_murderlv() >= 12) instance_destroy()

func _gm_event_2_4():
	con++

func _on_destroy():
	myinteract= 3
	GS.msc= 866
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	GS.msg[0]= "* bepis/%%"
	if(GS.flag[7] == 1) {
	    GS.msc= 0
	    GS.msg[0]= "* Sorry^1, we aren\'t allowing&  any more guests at this time./"
	    GS.msg[1]= "* Or ever again./%%"
	}
	if(GS.flag[425] == 1) {
	    GS.msc= 0
	    GS.msg[0]= "* How unusual./"
	    GS.msg[1]= "* Mettaton usually shows up&  now to tell everyone they\'re&  doing a great job./"
	    GS.msg[2]= "* Even if I was having a bad&  day^1, we\'ll always give each&  other a thumbs-up^1, and.../"
	    GS.msg[3]= "* ... oh^1, what am I doing^1?&* I\'m not being very&  professional./%%"
	}
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	talkedto++

func _process_begin(delta: float):
	scr_depth(0, 0, 0, 0, 0)
	scr_npc_anim()
	if(con == 1 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.hp= GS.maxhp
	    if(GS.lv == 1) GS.hp= 30
	    if(GS.lv == 2) GS.hp= 32
	    if(GS.lv == 3) GS.hp= 34
	    if(GS.lv == 4) GS.hp= 36
	    if(GS.lv == 5) GS.hp= 38
	    GS.interact= 1
	    con= 2
	    $Alarm4.start((30) / 30.0)
	    instance_create(0, 0, 149/* obj_unfader */)
	    instance_create(0, 0, 92/* obj_musfadeout */)
	}
	if(con == 2) GS.interact= 1
	if(con == 3) {
	    caster_free(-3)
	    GS.entrance= 1
	    instance_create(0, 0, 148/* obj_persistentfader */)
	    get_tree().change_scene_to_file("res://godot_rooms/186.tscn")
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
