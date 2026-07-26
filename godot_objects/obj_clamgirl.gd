# Auto-converted from GameMaker: obj_clamgirl
# GM parent: obj_readablesolid
extends CharacterBody2D

func _ready():
	dsprite= 1219
	usprite= 1219
	lsprite= 1219
	rsprite= 1219
	dtsprite= 1219
	utsprite= 1219
	ltsprite= 1219
	rtsprite= 1219
	myinteract= 0
	facing= 0
	direction= 0
	talkedto= 0
	image_speed= 0
	if(scr_murderlv() >= 8) instance_destroy()
	if(GS.flag[5] < 80 or GS.flag[5] > 89) instance_destroy()

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	GS.msg[0]= "* I\'m visiting Waterfall&  from the city./"
	GS.msg[1]= "* Synchronicity...^1?&* My neighbor\'s daughter looks&  about your age./"
	GS.msg[2]= "\\W* Her name is " + chr(ord('"')) + "\\YSuzy\\W.^1" + chr(ord('"')) + "&* I feel like you two should&  be friends./"
	GS.msg[3]= "* You have..^1.&* A neighbor\'s blessing!!!/%%"
	if(talkedto > 0) {
	    GS.msg[0]= "* Not knowing where I live&  is no issue^1.&* Fate finds a way./"
	    GS.msg[1]= "* In life\'s grand scheme^1, she&  might be why you came here&  in the first place.../%%"
	}
	if(GS.flag[7] == 0) GS.flag[279]= 1
	if(GS.flag[350] == 1) {
	    GS.msg[0]= "* I sense a disturbance in&  the nearby aura.../"
	    GS.msg[1]= "* I think you should leave&  that girl alone./%%"
	}
	if(GS.flag[7] == 1) {
	    if(GS.flag[279] == 1) {
	        GS.msg[0]= "* So you never met my&  neighbor\'s daughter./"
	        GS.msg[1]= "* Don\'t despair^1.&* This world has infinite&  opportunities./"
	        GS.msg[2]= "* But there\'s a limit to the&  things you can do today^1.&* Accepting this is healthy./"
	        GS.msg[3]= "* Take my neighbor\'s blessing^1!&* And consider this blessing&  for anything you like!/%%"
	    }
	    if(GS.flag[279] == 0) {
	        GS.msg[0]= "* I wanted to tell you about&  my neighbor\'s daughter./"
	        GS.msg[1]= "* But you walked right by me&  before I could tell you./"
	        GS.msg[2]= "* Fate has decided that I&  should not tell you./%%"
	    }
	}
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	talkedto++

func _process_begin(delta: float):
	scr_depth(0, 0, 0, 0, 0)
	scr_npc_anim()
	if(myinteract > 0) sprite_index= 1955/* spr_clamgirl_b */
	else  sprite_index= 1954/* spr_clamgirl_a */

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
