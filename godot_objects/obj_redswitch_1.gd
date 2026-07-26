# Auto-converted from GameMaker: obj_redswitch_1
# GM parent: obj_readablesolid
extends CharacterBody2D

func _ready():
	myinteract= 0
	scale.x= 1
	scale.y= 1
	image_speed= 0

func _gm_event_2_3():
	obj_mainchara.modulate.a= 1
	obj_mainchara.velocity.y= 0
	GS.interact= 0
	GS.phasing= 0
	obj_solidparent.solid= 1
	GS.entrance= 24
	instance_create(0, 0, 148/* obj_persistentfader */)
	get_tree().change_scene_to_file("res://godot_rooms/27.tscn")

func _gm_event_2_2():
	snd_play(134/* snd_fall2 */)
	GS.interact= 3
	instance_create(0, 0, 149/* obj_unfader */)
	$Alarm3.start((20) / 30.0)

func _gm_event_2_1():
	if(GS.phasing == 1) {
	    GS.facing++
	    obj_solidparent.solid= 0
	    obj_readablesolid.solid= 0
	    obj_mainchara.velocity.y= 5
	    obj_mainchara.modulate.a= 0.5
	    if(GS.facing > 3) GS.facing= 0
	    $Alarm1.start((4) / 30.0)
	}

func _on_destroy():
	if(room == 24 or room == 26) {
	    GS.interact= 4
	    GS.phasing= 1
	    if(room == 24) GS.flag[51]++
	    $Alarm1.start((30) / 30.0)
	    $Alarm2.start((30) / 30.0)
	    snd_play(106/* snd_noise */)
	    instance_create(obj_mainchara.x, obj_mainchara.y + 20, 921/* obj_cosmetichole */)
	} else  {
	    myinteract= 3
	    if(room == 23) GS.msc= 519
	    if(room == 25) GS.msc= 521
	    GS.typer= 5
	    GS.facechoice= 0
	    GS.faceemotion= 0
	    mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	}

func _process_begin(delta: float):
	scr_depth(0, 0, 0, 0, 0)

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
