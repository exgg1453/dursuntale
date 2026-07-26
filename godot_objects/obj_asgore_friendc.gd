# Auto-converted from GameMaker: obj_asgore_friendc
# GM parent: obj_readablesolid
extends Node2D

func _ready():
	dsprite= 1909
	usprite= 1908
	lsprite= 1902
	rsprite= 1903
	dtsprite= 1909
	utsprite= 1908
	ltsprite= 1902
	rtsprite= 1903
	myinteract= 0
	facing= 1
	direction= 270
	talkedto= 0
	fun= 0
	GS.flag[430]= 0
	GS.flag[390]= 0

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 60
	GS.facechoice= 7
	GS.faceemotion= 0
	if(GS.flag[197] == 0) {
	    GS.msg[0]= "\\E0* Howdy^1, Frisk./"
	    GS.msg[1]= "\\E3* Sorry about almost&  trying to take&  your SOUL./"
	    GS.msg[2]= "\\E5* I feel very bad&  about it./"
	    GS.msg[3]= "\\E0* I hope we can&  still be pals./"
	    scr_undface(4, 0)
	    GS.msg[5]= "\\E0* Hey^1, don\'t worry&  about it^1, ASGORE./"
	    GS.msg[6]= "\\E2* I think everybody\'s&  tried to kill Frisk&  at least once./"
	    scr_asgface(7, 2)
	    GS.msg[8]= "\\E2* Oh..^1. I see!/"
	    GS.msg[9]= "\\E0* In that case^1, I\'m&  not sorry^1, Frisk./"
	    scr_undface(10, 6)
	    GS.msg[11]= "\\E6* ASGORE^1!&* That\'s not what I&  meant!/%%"
	}
	if(GS.flag[197] == 1) GS.msc= 810
	if(GS.flag[197] >= 2) {
	    GS.msg[0]= "\\E3* Oh^1, Frisk^1, if you\'re&  not busy.../"
	    GS.msg[1]= "\\E0* On nice days^1, you&  should walk around and&  have a good time./"
	    GS.msg[2]= "\\E0* That\'s important./%%"
	}
	GS.flag[197]++
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	talkedto++

func _process_begin(delta: float):
	scr_depth(0, 0, 0, 0, 0)
	if(fun == 0) {
	    if(instance_exists(771/* obj_face_asgore */))
	        frame= obj_face_asgore.frame
	    else  frame= 0
	    script_execute(106/* scr_npcdir */, 2)
	}

func _gm_event_7_4():
	if(GS.flag[7] == 0) instance_destroy()

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
