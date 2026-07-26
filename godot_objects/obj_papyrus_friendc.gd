# Auto-converted from GameMaker: obj_papyrus_friendc
# GM parent: obj_readablesolid
extends Node2D

func _ready():
	dsprite= 1316
	usprite= 1327
	lsprite= 1334
	rsprite= 1335
	dtsprite= 1316
	utsprite= 1327
	ltsprite= 1334
	rtsprite= 1335
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
	GS.typer= 18
	GS.facechoice= 4
	GS.faceemotion= 3
	if(GS.flag[195] == 0) {
	    GS.msg[0]= "\\E3SO^1, ASGORE.../"
	    GS.msg[1]= "\\E0HOW ABOUT MAKING&ME A MEMBER OF&THE ROYAL GUARD?/"
	    scr_asgface(2, 2)
	    GS.msg[3]= "\\E2* Well^1, Papyrus^1, now&  that the war is&  over.../"
	    GS.msg[4]= "\\E0* We might not need&  the Royal Guard&  anymore./"
	    scr_papface(5, 7)
	    GS.msg[6]= "\\E7WHAT!?/"
	    GS.msg[7]= "\\E1THEN WHAT WAS&THE POINT OF THE&HUMAN\'S QUEST!?/"
	    GS.msg[8]= "\\E3THEY JOURNEYED&ALL THAT WAY.../"
	    GS.msg[9]= "\\E4AND I\'M STILL&NOT A MEMBER OF&THE ROYAL GUARD!?/"
	    GS.msg[10]= "\\E0TRULY^1, THIS IS&THE WORST&POSSIBLE ENDING./%%"
	}
	if(GS.flag[195] == 1) {
	    GS.msg[0]= "\\E3IT SEEMS LIKE YOU&REALLY BOTCHED&YOUR QUEST^1, FRISK./"
	    GS.msg[1]= "\\E0BUT^1, I^1, THE&GREAT PAPYRUS.../"
	    GS.msg[2]= "WILL ALWAYS BE&YOUR FRIEND!!!/"
	    scr_sansface(3, 1)
	    GS.msg[4]= "\\E1* no matter how hard&  you try to get&  rid of him./"
	    scr_papface(5, 1)
	    GS.msg[6]= "\\E1HEY!/"
	    GS.msg[7]= "\\E0THAT\'S TRUE./%%"
	}
	if(GS.flag[195] == 2) {
	    GS.msg[0]= "\\E3FRISK^1, WHY DON\'T&YOU TAKE A WALK&AROUND?/"
	    scr_sansface(1, 1)
	    GS.msg[2]= "\\E1* frisk^1, why don\'t you&  fly^1?&* it\'s faster./"
	    scr_papface(3, 0)
	    GS.msg[4]= "\\E0YEAH^1, FRISK^1, WHY&DON\'T YOU FLY?/"
	    scr_torface(5, 1)
	    GS.msg[6]= "\\E1* Hmmm..^1. Flying sounds&  a little dangerous./"
	    scr_alface(7, 3)
	    GS.msg[8]= "\\E3* But they CAN\'T fly./"
	    scr_undface(9, 2)
	    GS.msg[10]= "\\E2* Not with THAT&  attitude!/%%"
	}
	if(GS.flag[195] >= 3) {
	    GS.msg[0]= "\\E3FRISK..^1.&TAKE A HIKE./"
	    GS.msg[1]= "\\E0HIKING IS GOOD&FOR YOUR BONES./%%"
	}
	GS.flag[195]++
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	talkedto++

func _process_begin(delta: float):
	scr_depth(0, 0, 0, 0, 0)
	if(fun == 0) {
	    if(instance_exists(775/* obj_face_papyrus */))
	        frame= obj_face_papyrus.frame
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
