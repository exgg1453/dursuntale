# Auto-converted from GameMaker: obj_lock_and_key
# GM parent: obj_readablesolid
extends Node2D

func _ready():
	myinteract= 0
	scale.x= 1
	scale.y= 1
	salad= instance_create(x, y + 5, 6/* obj_solidexwide */)
	if(GS.flag[454] == 1) {
	    with(salad) instance_destroy()
	    instance_destroy()
	}
	con= 0

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	GS.msg[0]= "* (The way is blocked by two&  padlocks.^1)&* (There\'s a note attached.)/"
	GS.msg[1]= "* (Howdy^1! I\'m in the garden.)/"
	GS.msg[2]= "* (If you have anything you&  need to get off your chest^1,&  please don\'t hesitate to come.)/"
	GS.msg[3]= "* (The keys are in the kitchen&  and the hallway.)/%%"
	if(scr_murderlv() >= 16)
	    GS.msg[0]= "\\R* (He leaves them in the&  kitchen and the hallway.)/%%"
	if(GS.flag[454] == 0.5) {
	    GS.msg[0]= "* (You\'ll need both keys to&  get through.)/%%"
	    if(scr_murderlv() >= 16) GS.msg[0]= "\\R* (There are two keys.)/%%"
	}
	if(GS.flag[452] == 1 and GS.flag[453] == 1) {
	    GS.flag[454]= 1
	    GS.msg[0]= "* (You unlocked the chain.)/%%"
	    if(scr_murderlv() >= 16)
	        GS.msg[0]= "\\R* (I unlocked the chain.)/%%"
	    con= 2
	}
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	if(GS.flag[454] == 0) GS.flag[454]= 0.5

func _process_begin(delta: float):
	scr_depth(0, 0, 0, 0, 0)
	if(con == 2 and not instance_exists(782/* OBJ_WRITER */) and GS.flag[454] == 1) {
	    con= 3
	    GS.interact= 0
	    with(salad) instance_destroy()
	    instance_destroy()
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
