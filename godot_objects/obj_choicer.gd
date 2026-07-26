# Auto-converted from GameMaker: obj_choicer
extends Node2D

func _ready():
	$Alarm1.start((3) / 30.0)
	canchoose= 0
	add= view_xview[view_current]
	x= 89 + add
	y= 210 + view_yview[view_current]
	d= -1
	if(instance_exists(779/* obj_dialoguer */)) d= obj_dialoguer.side
	if(room != 179 and (obj_mainchara.y > view_yview[view_current] + 130 or d == 0))
	    y-= 155
	mychoice= 0
	GS.choice= -1
	choiced= 0

func _gm_event_2_1():
	canchoose= 1

func _on_destroy():
	with(creator) script_execute(145/* scr_msgup */)
	// obj_choicer
	with(783) instance_destroy()

func _process(delta: float):
	if(keyboard_multicheck_pressed(0/* NOKEY */) == 1) event_perform(7, 10)

func _gm_event_7_10():
	if(canchoose == 1 and choiced == 0) {
	    choiced= 1
	    GS.choice= mychoice
	    $Alarm0.start((2) / 30.0)
	}

func _gm_event_9_39():
	if(mychoice == 0) mychoice= 1
	else  mychoice= 0
	if(mychoice == 1) x= 185 + add
	else  x= 89 + add

func _gm_event_9_37():
	if(mychoice == 0) mychoice= 1
	else  mychoice= 0
	if(mychoice == 1) x= 185 + add
	else  x= 89 + add

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
