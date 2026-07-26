# Auto-converted from GameMaker: obj_tordogcall
extends Node2D

func _ready():
	dogtimer= 0
	con= 0
	d_noise= 0

func _process(delta: float):
	if(GS.interact == 0) dogtimer++
	factor= 40
	if(GS.interact == 0 and dogtimer == 150 * factor) {
	    snd_play(104/* snd_phone */)
	    GS.msc= 0
	    GS.typer= 5
	    GS.facechoice= 0
	    GS.faceemotion= 0
	    GS.msg[0]= "* Ring..\\E0.\\TT /"
	    GS.msg[1]= "\\F1 %"
	    GS.msg[2]= "* Hello^1!&* This is TORIEL./"
	    GS.msg[3]= "\\E1* My errands are taking&  longer than I thought&  they would./"
	    GS.msg[4]= "\\E1* You must wait 5 more&  minutes./"
	    GS.msg[5]= "\\E0* Thank you for being&  patient./"
	    GS.msg[6]= "\\TS \\F0 \\T0 %"
	    GS.msg[7]= "* Click.../%%"
	    GS.interact= 1
	    con= 1
	    instance_create(0, 0, 779/* obj_dialoguer */)
	}
	if(GS.interact == 0 and dogtimer == 300 * factor) {
	    snd_play(104/* snd_phone */)
	    GS.msc= 0
	    GS.typer= 5
	    GS.facechoice= 0
	    GS.faceemotion= 0
	    GS.msg[0]= "* Ring..\\E1.\\TT /"
	    GS.msg[1]= "\\F1 %"
	    GS.msg[2]= "* Hello..^1.&* This is TORIEL./"
	    GS.msg[3]= "\\E1* I found what I was&  looking for./"
	    GS.msg[4]= "* But before I could&  take it.../"
	    GS.msg[5]= "* A small^1, white puppy&  snatched it away./"
	    GS.msg[6]= "\\E0* How odd./"
	    GS.msg[7]= "\\E1* Do dogs even LIKE&  flour?/"
	    GS.msg[8]= "\\E8* Err^1, that is an&  unrelated question^1,&  of course./"
	    GS.msg[9]= "\\E1* It will take a little&  longer^1.&* Please understand./"
	    GS.msg[10]= "\\TS \\F0 \\T0 %"
	    GS.msg[11]= "* Click.../%%"
	    GS.interact= 1
	    con= 1
	    instance_create(0, 0, 779/* obj_dialoguer */)
	}
	if(GS.interact == 0 and dogtimer == 450 * factor) {
	    snd_play(104/* snd_phone */)
	    GS.msc= 0
	    GS.typer= 5
	    GS.facechoice= 0
	    GS.faceemotion= 0
	    GS.msg[0]= "* Ring.../"
	    GS.msg[1]= "* (...)/"
	    GS.msg[2]= "* (You hear heavy panting on&  the other end of the&  phone...)/"
	    GS.msg[3]= "* (...)/"
	    GS.msg[4]= "* Bark^1!&* Bark!/"
	    GS.msg[5]= "* Bark..^1.&* Bark!/"
	    GS.msg[6]= "* (You hear a distant voice.)/"
	    GS.msg[7]= "\\TT* Stop^1, please!/"
	    GS.msg[8]= "* Come back here with my&  CELLPHONE!/"
	    GS.msg[9]= "\\TS \\F0 \\T0 %"
	    GS.msg[10]= "* Click.../%%"
	    GS.interact= 1
	    con= 1
	    GS.flag[37]= 1
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    d= 0
	    d_noise= 1
	}
	if(d_noise == 1 and instance_exists(782/* OBJ_WRITER */)) {
	    if(OBJ_WRITER.stringno == 4 and d == 0) {
	        d= 1
	        snd_play(41/* snd_pombark */)
	    }
	    if(OBJ_WRITER.stringno == 5 and d == 1) {
	        d= 2
	        snd_play(41/* snd_pombark */)
	    }
	}
	if(GS.interact == 0 and dogtimer == 600 * factor) {
	    snd_play(104/* snd_phone */)
	    GS.msc= 0
	    GS.typer= 5
	    GS.facechoice= 0
	    GS.faceemotion= 0
	    GS.msg[0]= "* Ring.../"
	    GS.msg[1]= "* (...)/"
	    GS.msg[2]= "* (Snore..^1. snore...)/"
	    GS.msg[3]= "* (It sounds like a small^1,&  white dog is sleeping on&  the cell phone.)/"
	    GS.msg[4]= "* (You hear a distant voice.)\\TT/"
	    GS.msg[5]= "* Helloooo^1?&* Little puppy...?/"
	    GS.msg[6]= "* Where are you...?/"
	    GS.msg[7]= "* I will give you a nice pat&  on the head!/"
	    GS.msg[8]= "\\T0* (The snoring stops.)/"
	    GS.msg[9]= "\\TT* ... if you return my CELLPHONE./"
	    GS.msg[10]= "\\T0* (The snoring resumes.)/"
	    GS.msg[11]= "\\TS \\F0 \\T0 %"
	    GS.msg[12]= "* Click.../%%"
	    GS.interact= 1
	    con= 1
	    GS.flag[37]= 1
	    instance_create(0, 0, 779/* obj_dialoguer */)
	}
	if(GS.interact == 0 and dogtimer == 750 * factor) {
	    snd_play(104/* snd_phone */)
	    GS.msc= 0
	    GS.typer= 5
	    GS.facechoice= 0
	    GS.faceemotion= 0
	    GS.msg[0]= "* Ring.../"
	    GS.msg[1]= "* (...)/"
	    GS.msg[2]= "* (Snore..^1. snore...)/"
	    GS.msg[3]= "* (Achoo!)/"
	    GS.msg[4]= "* (It sounds like a small^1,&  white dog sneezing in its&  sleep.)/"
	    GS.msg[5]= "* (You hear a distant voice.)\\TT/"
	    GS.msg[6]= "* Here^1, pup-pup-puppy!/"
	    GS.msg[7]= "* Oh dear^1, I should not keep&  my guest waiting any longer./"
	    GS.msg[8]= "* ... Oh no^1, how long has it&  been since I have talked to&  them...?/"
	    GS.msg[9]= "* Perhaps they have been calling&  the phone^1, and...?/"
	    GS.msg[10]= "* ... here^1, puppy!/"
	    GS.msg[11]= "\\TS \\F0 \\T0 %"
	    GS.msg[12]= "* Click.../%%"
	    GS.interact= 1
	    con= 1
	    GS.flag[37]= 1
	    instance_create(0, 0, 779/* obj_dialoguer */)
	}
	if(GS.interact == 0 and dogtimer == 900 * factor) {
	    snd_play(104/* snd_phone */)
	    GS.msc= 0
	    GS.typer= 5
	    GS.facechoice= 0
	    GS.faceemotion= 0
	    GS.msg[0]= "* Ring.../"
	    GS.msg[1]= "* (...)/"
	    GS.msg[2]= "* (Snore..^1. snore...)/"
	    GS.msg[3]= "* (Yawn...)/"
	    GS.msg[4]= "* (Blink blink.)/"
	    GS.msg[5]= "* (Yawn...)/"
	    GS.msg[6]= "* (Snore..^1. snore...)/"
	    GS.msg[7]= "* (You hear a tired voice.)\\TT/"
	    GS.msg[8]= "* Doggie..^1.&* Here^1, doggie.../"
	    GS.msg[9]= "* Oh dear.../"
	    GS.msg[10]= "* I do wonder how they are.../"
	    GS.msg[11]= "\\TS \\F0 \\T0 %"
	    GS.msg[12]= "* Click.../%%"
	    GS.interact= 1
	    con= 1
	    GS.flag[37]= 1
	    instance_create(0, 0, 779/* obj_dialoguer */)
	}
	if(GS.interact == 0 and dogtimer == 1050 * factor) {
	    snd_play(104/* snd_phone */)
	    GS.msc= 0
	    GS.typer= 5
	    GS.facechoice= 0
	    GS.faceemotion= 0
	    GS.msg[0]= "* Ring.../"
	    GS.msg[1]= "* (Snore..^1. snore...)/"
	    GS.msg[2]= "\\TS \\F0 \\T0 %"
	    GS.msg[3]= "* Click.../%%"
	    GS.interact= 1
	    con= 1
	    GS.flag[37]= 1
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    dogtimer= 910 * factor
	}
	if(con == 1 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 0
	    GS.interact= 0
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
