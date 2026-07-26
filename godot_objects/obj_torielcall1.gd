# Auto-converted from GameMaker: obj_torielcall1
extends CharacterBody2D

func _ready():
	scale.y= 400
	if(GS.plot > 9.1) instance_destroy()

func _process(delta: float):
	if(GS.plot > 9.1) instance_destroy()
	else  {
	    if(GS.interact == 1 and not instance_exists(779/* obj_dialoguer */)) {
	        GS.plot= 9.2
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
	    if(GS.flag[37] == 0) {
	        GS.msg[0]= "* Ring..\\E0.\\TT /"
	        GS.msg[1]= "\\F1 %"
	        GS.msg[2]= "* Hello?&* This is TORIEL./"
	        GS.msg[3]= "\\E1* You have not left&  the room^1, have you?/"
	        GS.msg[4]= "* There are a few puzzles&  ahead that I have&  yet to explain./"
	        GS.msg[5]= "* It would be dangerous&  to try to solve them&  your/"
	        GS.msg[6]= "* Be good^1, alright?/"
	        GS.msg[7]= "\\TS \\F0 \\T0 %"
	        GS.msg[8]= "* Click.../%%"
	    } else  {
	        GS.msg[0]= "* Ring..\\E1.\\TT /"
	        GS.msg[1]= "\\F1 %"
	        GS.msg[2]= "* Hello^1? Hello^1?&* This is TORIEL./"
	        GS.msg[3]= "* My apologies^1.&* A strange dog&  kidnapped my phone./"
	        GS.msg[4]= "* So if you called^1, I&  could not have helped&  you./"
	        GS.msg[5]= "\\E0* However^1, I have&  recovered it./"
	        GS.msg[6]= "* And you are still in&  that room^1, are you not?/"
	        GS.msg[7]= "* What a good child you&  are./"
	        GS.msg[8]= "\\E1* There are a few puzzles&  ahead that I have&  yet to explain./"
	        GS.msg[9]= "* It would be dangerous&  to try to solve them&  your/"
	        GS.msg[10]= "\\E1* Be good^1, alright?/"
	        GS.msg[11]= "\\TS \\F0 \\T0 %"
	        GS.msg[12]= "* Click.../%%"
	        GS.flag[37]= 2
	    }
	    script_execute(146/* scr_writetext */, 0, "x", 0, 0)
	    GS.interact= 1
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
