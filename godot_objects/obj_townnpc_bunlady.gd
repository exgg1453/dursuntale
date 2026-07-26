# Auto-converted from GameMaker: obj_townnpc_bunlady
# GM parent: obj_readablesolid
extends CharacterBody2D

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
	if(scr_murderlv() >= 7) instance_destroy()

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	GS.msg[0]= "* Isn\'t my little Cinnamon&  just the cutest?/"
	GS.msg[1]= "* Bun-buns are so adorable..^1.&* Tee hee!/%%"
	if(talkedto > 0) GS.msg[0]= "* Bun-bun-bun-bun-bun.../%%"
	if(GS.plot > 121) {
	    GS.msg[0]= "* Huh^1? Yes^1, I\'m taking&  my bunny for a walk./"
	    GS.msg[1]= "* It\'s just a very slow one./%%"
	}
	if(GS.flag[7] == 1) {
	    GS.msg[0]= "* That kid over there told&  me that it\'s weird that&  I have a pet bunny./"
	    GS.msg[1]= "* First^1, there\'d be nothing&  weird about it^1.&* It\'s cute!/"
	    GS.msg[2]= "* Second..^1.&* What?/"
	    GS.msg[3]= "* It\'s normal to walk your&  younger brother on a&  leash^1, right?/%%"
	}
	if(scr_deaddog() == 1) {
	    GS.msg[0]= "* Ah^1, it\'s so peaceful&  and quiet.../"
	    GS.msg[1]= "* Usually one of those dogs&  chases my little Cinnamon&  around./%%"
	}
	if(GS.flag[67] == 1) {
	    GS.msg[0]= "* Ah^1, it\'s so peaceful&  and quiet.../"
	    GS.msg[1]= "* Usually one of those&  skeletons chases my little&  Cinnamon around./%%"
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
