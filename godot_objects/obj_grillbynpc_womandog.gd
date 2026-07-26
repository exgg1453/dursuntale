# Auto-converted from GameMaker: obj_grillbynpc_womandog
# GM parent: obj_readablesolid
extends CharacterBody2D

func _ready():
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
	fun= 0
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
	GS.msg[0]= "* (We\'re sentries^1, but we never&  get any respect.)/"
	GS.msg[1]= "* (I wish those skeletons would&  throw us a bone.)/"
	GS.msg[2]= "* (We love bones.)/%%"
	if(GS.flag[67] == 1)
	    GS.msg[0]= "* (Where are those skeletons?^1)&* (I wanted to get a bone&  from them...)/%%"
	if(GS.plot >= 122) {
	    GS.msg[0]= "* (We\'re considering paying a&  visit to the doctor.)/"
	    GS.msg[1]= "* (No^1! Not the vet!^1)&* (... well^1, maybe she\'s a&  little like a vet.)/%%"
	}
	if(sansmode == 1) {
	    GS.msg[0]= "* (I like Sans.^1)&* (Sometimes he feeds us scraps&  of food under the table.)/"
	    GS.msg[1]= "* (Then his brother gets mad...^1)&* (But why!^1? We\'re adults!^1)&* (We can handle it!)/%%"
	}
	if(GS.flag[52] == 1)
	    GS.msg[0]= "* (Where\'s Doggo?^1)&* (I hope he didn\'t get&  lost again.)/%%"
	if(GS.flag[52] == 1 and GS.flag[54] == 1)
	    GS.msg[0]= "* (It\'s lonely in here today.^1)&* (If our friends don\'t show up^1,&  would you like to play?)/%%"
	if(GS.flag[7] == 1) {
	    GS.msg[0]= "* (All of our parents have&  been combined into one&  horrible being.)/"
	    GS.msg[1]= "* (That\'s OK^1, though.^1)&* (It\'s really " + chr(ord('"')) + "brought our&  families together." + chr(ord('"')) + ")/%%"
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
