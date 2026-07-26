# Auto-converted from GameMaker: obj_torielcall5
extends CharacterBody2D

func _ready():
	scale.y= 400
	touch= 0
	if(GS.plot > 11) instance_destroy()

func _process(delta: float):
	if(GS.plot > 11) instance_destroy()
	else  {
	    if(GS.interact == 1 and not instance_exists(779/* obj_dialoguer */) and touch == 1) {
	        GS.plot= 12
	        GS.interact= 0
	        instance_destroy()
	    }
	}

func _on_alarm_0_timeout():
	if(GS.interact == 0) {
	    touch= 1
	    snd_play(104/* snd_phone */)
	    GS.typer= 5
	    GS.facechoice= 0
	    GS.faceemotion= 0
	    GS.msg[0]= "* Ring..\\E0.\\TT /"
	    GS.msg[1]= "\\F1 %"
	    GS.msg[2]= "* Hello?/"
	    GS.msg[3]= "\\E1* I just realized that it&  has been a while since&  I have cleaned up./"
	    GS.msg[4]= "\\E0* I was not expecting to&  have company so soon./"
	    GS.msg[5]= "* There are probably a lot&  of things lying about&  here and there./"
	    GS.msg[6]= "* You can pick them up^1,&  but do not carry more&  than you need./"
	    GS.msg[7]= "* Someday you might see&  something you really&  like./"
	    GS.msg[8]= "* You will want to leave&  room in your pockets&  for that./"
	    GS.msg[9]= "\\TS \\F0 \\T0 %"
	    GS.msg[10]= "* Click.../%%"
	    if(GS.flag[6] == 1) {
	        GS.msg[0]= "* Ring..\\E0.\\TT /"
	        GS.msg[1]= "\\F1 %"
	        GS.msg[2]= "* Hello?/"
	        GS.msg[3]= "\\E1* I have a question./"
	        GS.msg[4]= "* You like things other&  than butterscotch or&  cinnamon^1, too.../"
	        GS.msg[5]= "* Do you not?/"
	        GS.msg[6]= "\\E0* ..^1. oh^1, what am I&  asking./"
	        GS.msg[7]= "* I will keep looking./%%"
	        GS.msg[8]= "\\TS \\F0 \\T0 %"
	        GS.msg[9]= "* Click.../%%"
	    }
	    instance_create(140, 200, 1339/* obj_stalkerflowey */)
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
