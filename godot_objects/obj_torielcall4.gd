# Auto-converted from GameMaker: obj_torielcall4
extends CharacterBody2D

func _ready():
	scale.y= 400
	if(GS.plot > 9.7) instance_destroy()

func _process(delta: float):
	if(GS.plot > 9.7) instance_destroy()
	else  {
	    if(GS.interact == 1 and not instance_exists(779/* obj_dialoguer */)) {
	        GS.plot= 9.8
	        GS.interact= 0
	        instance_destroy()
	    }
	}

func _on_alarm_0_timeout():
	if(GS.interact == 0) {
	    snd_play(104/* snd_phone */)
	    GS.typer= 5
	    GS.facechoice= 0
	    GS.faceemotion= 0
	    GS.msg[0]= "* Ring..\\E0.\\TT /"
	    GS.msg[1]= "\\F1 %"
	    GS.msg[2]= "* Hello?/"
	    GS.msg[3]= "\\E1* You do not have&  any allergies^1, do&  you?/"
	    GS.msg[4]= "* Huh^1?&* Why am I asking?/"
	    GS.msg[5]= "\\E0* No reason..^1.&* No reason at all./"
	    GS.msg[6]= "\\TS \\F0 \\T0 %"
	    GS.msg[7]= "* Click.../%%"
	    script_execute(146/* scr_writetext */, 0, "x", 0, 0)
	    GS.interact= 1
	    script_execute(86/* scr_phoneget */, 202)
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
