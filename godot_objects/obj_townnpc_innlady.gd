# Auto-converted from GameMaker: obj_townnpc_innlady
# GM parent: obj_readablesolid
extends Node2D

func _ready():
	jtext= 0
	myinteract= 0
	facing= 0
	direction= 270
	talkedto= 0
	image_speed= 0
	conversation= 0
	if(GS.flag[73] == 1) {
	    conversation= 5
	    GS.interact= 1
	    $Alarm6.start((15) / 30.0)
	}
	if(scr_murderlv() >= 7) instance_destroy()

func _gm_event_2_6():
	conversation= 6

func _gm_event_2_5():
	instance_create(0, 0, 148/* obj_persistentfader */)
	caster_free(-3)
	room_goto_next()

func _on_destroy():
	myinteract= 3
	GS.msc= 547
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	GS.msg[0]= "* Error./%%"
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	talkedto++

func _process_begin(delta: float):
	scr_depth(0, 0, 0, 0, 0)
	script_execute(107/* scr_npc_anim */)
	if(conversation == 2 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.interact= 1
	    instance_create(0, 0, 149/* obj_unfader */)
	    $Alarm5.start((20) / 30.0)
	    m= instance_create(0, 0, 92/* obj_musfadeout */)
	    m.fadespeed= 0.05
	    conversation= 3
	}
	if(conversation == 6) {
	    if(GS.hp < GS.maxhp) GS.hp= GS.maxhp
	    if(GS.hp == 36) GS.hp= 38
	    if(GS.hp == 32) GS.hp= 36
	    if(GS.hp == 28) GS.hp= 34
	    if(GS.hp == 24) GS.hp= 32
	    if(GS.hp == 20) GS.hp= 30
	    GS.msc= 0
	    GS.msg[0]= "* Hiya^1!&* You look like you&  had a great sleep./"
	    GS.msg[1]= "* Which is incredible^1, because&  you were only up there for&  about two minutes.../"
	    if(GS.flag[72] == 1)
	        GS.msg[2]= "* Here\'s your money back^1.&* You can pay me if you\'re&  going to stay overnight./%%"
	    if(GS.flag[72] == 2)
	        GS.msg[2]= "* Feel free to come back&  if you get tired./%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    conversation= 7
	}
	if(conversation == 7 and not instance_exists(782/* OBJ_WRITER */)) {
	    conversation= 0
	    GS.interact= 0
	    myinteract= 0
	    GS.flag[73]= 0
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
