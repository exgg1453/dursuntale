# Auto-converted from GameMaker: obj_smallfrog_xadvice
# GM parent: obj_readablesolid
extends CharacterBody2D

func _ready():
	myinteract= 0
	scale.x= 1
	scale.y= 1
	image_speed= 0.1
	if(GS.flag[25] > 5 and GS.flag[7] == 0) instance_destroy()
	con= 0
	xed= 0

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.msg[0]= "* Ribbit^1, ribbit^1.&* (Sigh...)/"
	GS.msg[1]= "* (My friend never listens to&  me.)/"
	GS.msg[2]= "* (Whenever I talk^1, they skip&  through my words by pressing&  [X].)/"
	GS.msg[3]= "* (That\'s right.......^1)&* (Pressing [X]............^1)&* (................)/"
	GS.msg[4]= "* (Well^1, at least you listen&  to me.)/%%"
	if(GS.flag[7] == 1) {
	    GS.msg[0]= "* Ribbit^1, ribbit^1.&* (Say...)/"
	    GS.msg[1]= "* (Now that your journey\'s&  over^1, maybe you\'ll have&  time to listen to me.)/"
	    GS.msg[2]= "* (Since most people just&  press [X] to skip through&  my dialogue.)/"
	    GS.msg[3]= "* (That\'s right.......^1)&* (Pressing [X]............^1)&* (................)/"
	    GS.msg[4]= "* (You\'ve really matured^1,&  haven\'t you?)/%%"
	}
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)

func _process_begin(delta: float):
	scr_depth(0, 0, 0, 0, 0)
	if(GS.kills > 16) instance_destroy()
	if(room == 29 and GS.kills > 10) instance_destroy()
	if(room == 12 and GS.kills > 2) instance_destroy()
	if(instance_exists(782/* OBJ_WRITER */) and myinteract != 0) {
	    if(keyboard_multicheck_pressed(1/* ANYKEY */) and OBJ_WRITER.stringno > 1)
	        xed= 1
	    if(xed > 0) {
	        OBJ_WRITER.mystring[4]= "* (Oh^1, not you too!)/%%"
	        if(GS.flag[7] == 1)
	            OBJ_WRITER.mystring[4]= "* (... I suppose some things&  never change.)/%%"
	        xed= 0
	    }
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
