# Auto-converted from GameMaker: obj_longsnail
# GM parent: obj_readablesolid
extends CharacterBody2D

func _ready():
	myinteract= 0
	facing= 0
	direction= 180
	talkedto= 0
	image_speed= 0
	if(scr_murderlv() >= 8) instance_destroy()

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	GS.msg[0]= "* Snail snail..^1.&* (A long journey extends&  in front of you...)/"
	GS.msg[1]= "* Snail snail..^1.&* (Reach far and stretch&  beyond the horizons.)/"
	GS.msg[2]= "* Snail snail^1.&* (So snaileth Sam Byool.)/%%"
	if(talkedto > 0) {
	    GS.msg[0]= "* Snail snail./"
	    GS.msg[1]= "* (Good gosh^1, don\'t I look&  like a perfectly normal&  snail?)/%%"
	}
	if(GS.flag[7] == 1) {
	    GS.msg[0]= "* Snail snail^1.&* (You reached the end of&  your extensive journey.)/"
	    GS.msg[1]= "* Snail snail^1.&* (What a long trip^1! Remember&  to stretch your muscles.)/%%"
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
