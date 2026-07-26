# Auto-converted from GameMaker: obj_readable_switch1
# GM parent: obj_readable
extends Node2D

func _ready():
	myinteract= 0
	scale.x= 1
	scale.y= 1
	script_execute(113/* scr_depth */)
	image_speed= 0

func _on_destroy():
	myinteract= 3
	if(GS.plot < 5) {
	    if(instance_exists(870/* obj_torinteractable2 */)) {
	        obj_torinteractable2.lsprite= 1110
	        GS.msc= 0
	        GS.typer= 4
	        GS.facechoice= 1
	        GS.faceemotion= 1
	        GS.msg[0]= "* No no no^1!/"
	        GS.msg[1]= "\\E0* You want to press the&  other switch./"
	        GS.msg[2]= "\\E1* I even labelled it for&  you.../%%"
	        if(GS.flag[6] == 1)
	            GS.msg[0]= "* It seems that is not&  the correct switch./%%"
	    } else  {
	        GS.msc= 0
	        GS.typer= 5
	        GS.facechoice= 0
	        GS.faceemotion= 0
	        snd_play(27/* snd_wrongvictory */)
	        GS.msg[0]= "* (Wow!^1)&* (You are superfast at being&  wrong.)/%%"
	    }
	}
	if(GS.plot >= 5) {
	    GS.msc= 0
	    GS.typer= 5
	    GS.facechoice= 0
	    GS.faceemotion= 0
	    GS.msg[0]= "* This switch doesn\'t even&  work.../%%"
	}
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)

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
