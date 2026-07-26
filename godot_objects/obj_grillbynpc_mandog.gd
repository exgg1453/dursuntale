# Auto-converted from GameMaker: obj_grillbynpc_mandog
# GM parent: obj_readablesolid
extends CharacterBody2D

func _ready():
	fun= 0
	dsprite= sprite_index
	usprite= sprite_index
	lsprite= sprite_index
	rsprite= sprite_index
	dtsprite= 1353
	utsprite= 1362
	ltsprite= 1367
	rtsprite= 1363
	myinteract= 0
	facing= 0
	direction= 0
	talkedto= 0
	image_speed= 0
	if(GS.flag[53] == 1) instance_destroy()
	if(GS.flag[7] == 1 and room == 73) instance_destroy()
	if(GS.flag[7] == 0 and room == 68) instance_destroy()
	sansmode= 0

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	GS.msg[0]= "* You better watch where you&  sit down in here^1, kid./"
	GS.msg[1]= "* Because that big guy WILL jump&  into your lap and give you&  lots of love and attention./%%"
	if(GS.flag[67] == 1)
	    GS.msg[0]= "* Where\'s Sans..^1.&* He\'s supposed to give me&  a pat on the head.../%%"
	if(GS.plot >= 122) {
	    GS.msg[0]= "* She hasn\'t been responding&  to our letters.../"
	    GS.msg[1]= "* Maybe it\'s because we let&  Doggo write them all./%%"
	}
	if(sansmode == 1) {
	    GS.msg[0]= "* I was hoping Sans came in&  to give me a pat on the&  head./"
	    GS.msg[1]= "* Interloper...!/%%"
	}
	if(GS.flag[54] == 1)
	    GS.msg[0]= "* Where\'s that big lug^1?&* We can\'t start until he&  shows up./%%"
	if(GS.flag[52] == 1 and GS.flag[54] == 1)
	    GS.msg[0]= "* Smells kinda..^1. quiet./%%"
	if(GS.flag[7] == 1) {
	    GS.msg[0]= "* Hmmm^1, now that our parents&  are the same entity.../"
	    GS.msg[1]= "* Does that mean I\'m&  married to my sister?/"
	    GS.msg[2]= "* .../"
	    GS.msg[3]= "* Wait^1, we\'re dogs^1.&* That stuff\'s normal./%%"
	}
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	talkedto++

func _process_begin(delta: float):
	scr_depth(0, 0, 0, 0, 0)
	if(fun == 0) scr_npc_anim()

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
