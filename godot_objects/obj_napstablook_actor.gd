# Auto-converted from GameMaker: obj_napstablook_actor
# GM parent: obj_readablesolid
extends CharacterBody2D

func _ready():
	scr_depth(0, 0, 0, 0, 0)
	dsprite= 1129
	usprite= 1131
	lsprite= 1126
	rsprite= 1127
	dtsprite= 1129
	utsprite= 1131
	ltsprite= 1126
	rtsprite= 1127
	myinteract= 0
	facing= 0
	direction= 90
	talkedto= 0
	image_speed= 0
	fun= 0
	if(GS.flag[7] == 1) {
	    direction= 270
	    instance_create(216, 122, 1358/* obj_npc_room */)
	}
	if(GS.flag[7] == 0 and room == 119) instance_destroy()
	if(scr_murderlv() >= 10) instance_destroy()

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	GS.msg[0]= "* i\'m..^1. working on a mix cd..^1.&* make yourself at home...?/%%"
	if(GS.flag[36] > 0 and GS.flag[94] == 0) {
	    GS.msg[0]= "* uh^1, do you wanna..^1.&* listen to some tunes.../"
	    GS.msg[1]= "* or something.../%%"
	}
	if(GS.flag[458] == 1)
	    GS.msg[0]= "* uhhhh..^1.&* i\'m gonna keep working&  on that mix cd./%%"
	if(GS.flag[350] == 1) {
	    GS.msg[0]= "* i\'ve almost got a mix cd&  finished for my scary&  neighbor.../"
	    GS.msg[1]= "* it\'s 74 minutes of people&  screaming their signature&  wrestling moves/"
	    GS.msg[2]= "* but they\'re all autotuned^1.&* i hope she likes it/%%"
	}
	if(GS.flag[93] == 9) GS.msg[0]= "* oh............../%%"
	if(GS.flag[94] == 1)
	    GS.msg[0]= "* oh..^1. a classic spooktune..^1.&* they don\'t make songs like&  this anymore.../%%"
	if(GS.flag[94] == 2)
	    GS.msg[0]= "* dang..^1. that ambience...&* it\'s like my whole body&  is being spooked.../%%"
	if(GS.flag[94] == 3) {
	    GS.msg[0]= "* oh^1, this one..^1.&* once you learn the lyrics&  it\'s hard not to sing along.../"
	    GS.msg[1]= "* ooo ooo ooo^2o&* ooo ooo ooo^2o&* oo oo oo^1o oo ooo/%%"
	}
	if(GS.flag[7] == 1) {
	    if(GS.flag[199] == 0) {
	        GS.msg[0]= "* oh..............^1.&* mettaton.......^1.&* i\'m a huge fan......../"
	        GS.msg[1]= "* ..... oh^1, hi/"
	        if(GS.flag[194] > 0) {
	            GS.msg[0]= "* what^1? undyne says hi^1?&* then tell her...^1.&* i say.........../"
	            GS.msg[1]= "* ......................&  ...... something cool./"
	        }
	        if(GS.flag[36] > 0) {
	            GS.msg[2]= "* human...^1.&* i\'ll never forget when you&  cheered me on/"
	            GS.msg[3]= "* when i was pretending to&  sleep.../"
	            GS.msg[4]= "* no one had ever had so&  much faith in my fake&  sleep..../"
	        }
	        if(GS.flag[36] <= 0) {
	            GS.msg[2]= "* human..^1.&* i\'ll never forget.../"
	            GS.msg[3]= "* that time you tried to&  destroy me..^1.&* but... you failed..../"
	            GS.msg[4]= "* sorry..^1.&* i messed it up/"
	        }
	        GS.msg[5]= "* uh........^1.&* also.....^1.&* this is awkward... but/"
	        GS.msg[6]= "* what\'s...^1.&  your name/"
	        GS.msg[7]= "* everyone seems to know&  it now^1, except me...../"
	        GS.msg[8]= "* seems like i\'ve been&  missing out lately/"
	        GS.msg[9]= "* i was just sitting at home&  listening to tunes/"
	        GS.msg[10]= "* there was a flash of light&  outside my window/"
	        GS.msg[11]= "* i saw the snails on the farm&  disappear/"
	        GS.msg[12]= "* then i heard a knock at&  the door/"
	        GS.msg[13]= "* the flash of light wanted&  to come in...&* i closed the blinds.../"
	        GS.msg[14]= "* now everyone knows your&  name except for me/"
	        GS.msg[15]= "* " + chr(ord('"')) + "frisk..." + chr(ord('"')) + "&* ok^1, i wont forget it/%%"
	    }
	    if(GS.flag[199] >= 1) {
	        GS.msg[0]= "* your name...?/"
	        GS.msg[1]= "* .../"
	        GS.msg[2]= "* " + chr(ord('"')) + "frisk" + chr(ord('"')) + "..^1.&* i didnt forget/"
	        GS.msg[3]= "* because i cried the&  letters into my hand/%%"
	    }
	    if(GS.flag[199] >= 2) {
	        GS.msg[0]= "* oh no..^1.&* the letters in my hand&  are joining together/"
	        GS.msg[1]= "* oh no..^1.&* i\'m going to forget your&  name.../"
	        GS.msg[2]= "* oh no..^1.&* i\'m trying to cry more&  tears into my hand.../"
	        GS.msg[3]= "* oh no..^1.&* the tears are all forming&  a big pile.../"
	        GS.msg[4]= "* oh no..^1.&* your name\'s getting really&  long/%%"
	    }
	    GS.flag[199]++
	}
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	talkedto++

func _on_outside_room():
	draw_sprite_ext(sprite_index, frame, x, y, scale.x, scale.y, 0, 16777215, modulate.a)
	if(fun == 0) script_execute(106/* scr_npcdir */, 2)
	scr_depth()

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
