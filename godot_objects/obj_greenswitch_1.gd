# Auto-converted from GameMaker: obj_greenswitch_1
# GM parent: obj_redswitch_1
extends CharacterBody2D

func _ready():
	myinteract= 0
	scale.x= 1
	scale.y= 1
	image_speed= 0
	frame= 2

func _on_destroy():
	if(room == 24 or room == 25) {
	    GS.interact= 4
	    GS.phasing= 1
	    if(room == 24) GS.flag[51]++
	    $Alarm1.start((30) / 30.0)
	    $Alarm2.start((30) / 30.0)
	    instance_create(obj_mainchara.x, obj_mainchara.y + 20, 921/* obj_cosmetichole */)
	} else  {
	    myinteract= 3
	    if(room == 23) GS.msc= 519
	    if(room == 26) GS.msc= 521
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
