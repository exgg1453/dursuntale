# Auto-converted from GameMaker: obj_chilldrakenpc
# GM parent: obj_readablesolid
extends Node2D

func _ready():
	dsprite= 1353
	usprite= 1362
	lsprite= 1367
	rsprite= 1363
	dtsprite= 1353
	utsprite= 1362
	ltsprite= 1367
	rtsprite= 1363
	myinteract= 0
	facing= 0
	direction= 270
	talkedto= 0
	image_speed= 0
	if(scr_enemynpc1() != 1) instance_destroy()

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	GS.msg[0]= "* Heh..^1. us teens live&  self-sufficiently off&  the fat of the land.../"
	GS.msg[1]= "* Oh^1, and the box lunches my&  parents bring us every&  day./%%"
	if(talkedto > 0)
	    GS.msg[0]= "* Besides Snowy^1.&* We have to share ours&  with him../%%"
	if(GS.flag[7] == 1) {
	    GS.msg[0]= "* Heh..^1.&* I guess we\'ll have to go to&  the surface./"
	    GS.msg[1]= "* There are woods there we can&  live in^1, right?/%%"
	}
	if(room == 53) {
	    GS.msg[0]= "* Guh huh huh huh^1./"
	    GS.msg[1]= "* Us teens rule these woods&  with a smaller-than-&  adult fist./%%"
	    if(GS.flag[7] == 1) {
	        GS.msg[0]= "* I\'m worried about getting&  older..^1.&* I\'ll stop being a teen./"
	        GS.msg[1]= "* No^1! I refuse^1!&* I\'ll just invent new numbers^1,&  like twenty-teen!/%%"
	    }
	}
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	talkedto++

func _process_begin(delta: float):
	scr_depth(0, 0, 0, 0, 0)
	scr_npc_anim()

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
