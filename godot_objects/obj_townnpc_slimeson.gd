# Auto-converted from GameMaker: obj_townnpc_slimeson
# GM parent: obj_readablesolid
extends CharacterBody2D

func _ready():
	dsprite= 1217
	usprite= 1217
	lsprite= 1217
	rsprite= 1217
	dtsprite= 1217
	utsprite= 1217
	ltsprite= 1217
	rtsprite= 1217
	myinteract= 0
	facing= 0
	direction= 0
	talkedto= 0
	image_speed= 0
	if(GS.flag[67] == 1 or scr_deaddog() == 1) instance_destroy()
	if(scr_murderlv() >= 7) instance_destroy()

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	GS.msg[0]= "* Let\'s play Monsters and Humans!/%%"
	if(GS.plot >= 122)
	    GS.msg[0]= "* Let\'s continue to play&  Monsters and Humans!/%%"
	if(GS.flag[7] == 1)
	    GS.msg[0]= "* Now we can play Monsters&  and Humans with REAL humans!/%%"
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
