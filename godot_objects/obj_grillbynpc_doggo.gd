# Auto-converted from GameMaker: obj_grillbynpc_doggo
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
	if(GS.flag[52] == 1) instance_destroy()
	if(GS.flag[7] == 1 and room == 73) instance_destroy()
	if(GS.flag[7] == 0 and room == 68) instance_destroy()
	sansmode= 0

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	GS.msg[0]= "* I\'m thinking of getting a&  spiked collar to show off&  my personality./"
	GS.msg[1]= "* It makes a statement like..^1.&* " + chr(ord('"')) + "Attach a leash to me and&  take me for a walk please." + chr(ord('"')) + "/%%"
	if(GS.plot >= 122) {
	    GS.msg[0]= "* He may not look like it^1,&  but this big guy writes&  the most eloquent letters./"
	    GS.msg[1]= "* Here^1, take a look!/"
	    GS.msg[2]= "* (It\'s just the word " + chr(ord('"')) + "Bark" + chr(ord('"')) + "&  but in flowery cursive.)/%%"
	}
	if(GS.flag[67] == 1)
	    GS.msg[0]= "* Papyrus^1?&* Is that you^1?& Come on.../%%"
	if(GS.flag[350] == 1)
	    GS.msg[0]= "* Undyne!^1?&* Did you come all the way&  out here...?/%%"
	if(sansmode == 1) {
	    GS.msg[0]= "* Huh^1?&* Since when did you and&  Sans become friends...?/"
	    GS.msg[1]= "* I don\'t like him..^1.&* He loves to appear without&  moving./%%"
	}
	if(GS.flag[53] == 1) {
	    GS.msg[0]= "* Where\'re the other two^1?&* I can\'t play with this&  big dumb guy alone.../"
	    GS.msg[1]= "* He\'ll just win!!!/%%"
	}
	if(GS.flag[53] == 1 and GS.flag[54] == 1) {
	    GS.msg[0]= "* Sometimes the others like to&  prank me^1. They sit still&  so I can\'t see them./"
	    GS.msg[1]= "* They must be here^1, playing a&  joke on me./"
	    GS.msg[2]= "* I\'ll just wait until one of&  them admits it.../%%"
	}
	if(GS.flag[7] == 1) {
	    GS.msg[0]= "* Having an amorphous^1,&  shambling family member&  is great./"
	    GS.msg[1]= "* They\'re always moving^1, so I&  can see them 100-percent&  of the time!/%%"
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
