# Auto-converted from GameMaker: obj_echoflower
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
	w= 0
	v= 0
	xxx= 0
	if(room == 172) visible= 0

func _gm_event_2_4():
	w++

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	GS.msg[0]= "* Error!/%%"
	if(room == 83) {
	    if(instance_exists(1358/* obj_npc_room */)) {
	        if(obj_npc_room.talkedto == 0) {
	            GS.msg[0]= "* All that gives my life&  validation is explaining&  the Echo Flower.../"
	            GS.msg[1]= "* No one can know.../%%"
	            v= 1
	        }
	        if(obj_npc_room.talkedto == 1 and v == 0)
	            GS.msg[0]= "* This is an Echo Flower^1.&* It repeats the last thing&  it heard^1, over and over.../%%"
	        if(obj_npc_room.talkedto > 1 and v == 0)
	            GS.msg[0]= "* Neat^1, huh?/%%"
	        if(obj_npc_room.talkedto > 0 and v == 1)
	            GS.msg[0]= "* Never trust a flower..^1.&* That\'s one of the constants&  of this world./%%"
	    } else  GS.msg[0]= "* (It\'s strangely silent.)/%%"
	}
	if(room == 84) {
	    if(x < get_viewport_rect().size.x / 2)
	        GS.msg[0]= "* Sitting behind rushing water..^1.&* It makes me feel relaxed./%%"
	    if(x > get_viewport_rect().size.x / 2)
	        GS.msg[0]= "* I swore I saw something..^1.&* Behind that rushing water.../%%"
	}
	if(room == 89)
	    GS.msg[0]= "* I just wasn\'t ready for&  the responsibility./%%"
	if(room == 90) {
	    if(x > 40) {
	        GS.msg[0]= "* A long time ago^1, monsters would&  whisper their wishes to the&  stars in the sky./"
	        GS.msg[1]= "* If you hoped with all your&  heart^1, your wish would come&  true./"
	        GS.msg[2]= "* Now^1, all we have are these&  sparkling stones on the&  ceiling.../%%"
	        if(scr_murderlv() >= 8) GS.msg[0]= "* (It\'s strangely silent.)/%%"
	    }
	    if(x > 180) {
	        GS.msg[0]= "* Thousands of people wishing&  together can\'t be wrong!/"
	        GS.msg[1]= "* The king will prove that./%%"
	        if(scr_murderlv() >= 8) GS.msg[0]= "* (It\'s strangely silent.)/%%"
	    }
	    if(x > 280) GS.msg[0]= "* C\'mon^1, sis^1!&* Make a wish!/%%"
	    if(x > 380)
	        GS.msg[0]= "* I wish my sister and I will&  see the real stars someday.../%%"
	    if(x > 620)
	        GS.msg[0]= "* Ah..^1. seems my horoscope is&  the same as last week\'s.../%%"
	    if(scr_murderlv() >= 8 or GS.flag[350] == 1)
	        GS.msg[0]= "* (It\'s strangely silent.)/%%"
	}
	if(room == 91 and x < get_viewport_rect().size.x / 2)
	    GS.msg[0]= "* Sitting behind rushing water..^1.&* It makes me feel relaxed./%%"
	if(room == 94) {
	    GS.msg[0]= "* Squeak./%%"
	    if(scr_murderlv() >= 8) GS.msg[0]= "* (It\'s strangely silent.)/%%"
	}
	if(room == 97) {
	    GS.msg[0]= "* (You hear a passing&  conversation.)/"
	    GS.msg[1]= "* Don\'t say that^1!&* Come on^1, I promise I&  won\'t laugh./%%"
	    if(x < 700 and y < 360) {
	        GS.msg[0]= "* (You hear a passing&  conversation.)/"
	        GS.msg[1]= "* So^1? Don\'t you have any&  wishes to make?/%%"
	    }
	    if(x < 700 and y > 360) {
	        GS.msg[0]= "* (You hear a passing&  conversation.)/"
	        GS.msg[1]= "* ... hmmm^1, just one^1, but.../"
	        GS.msg[2]= "* It\'s kind of stupid./%%"
	    }
	    if(scr_murderlv() >= 8 or GS.flag[350] == 1)
	        GS.msg[0]= "* (It\'s strangely silent.)/%%"
	}
	if(room == 98)
	    GS.msg[0]= "* I can\'t run any longer..^1.&* Somebody^1, anybody.../%%"
	if(room == 131) {
	    GS.msg[0]= "* Someday^1, I\'d like to climb&  this mountain we\'re all&  buried under./%%"
	    if(y == 160) {
	        GS.msg[0]= "* (You hear a passing&  conversation.)/"
	        GS.msg[1]= "* Sorry^1, it\'s just funny.../"
	        GS.msg[2]= "* That\'s my wish^1, too./%%"
	    }
	    if(y == 240) {
	        GS.msg[0]= "* (You hear laughter.)/"
	        GS.msg[1]= "* ... hey^1, you said you wouldn\'t&  laugh at it!/%%"
	    }
	    if(y == 320) {
	        GS.msg[0]= "* (You hear a passing&  conversation.)/"
	        GS.msg[1]= "* Someday^1, I\'d like to climb&  this mountain we\'re all&  buried under./"
	        GS.msg[2]= "* Standing under the sky^1, looking&  at the world all around..^1.&* That\'s my wish./%%"
	    }
	    if(y == 420) {
	        GS.msg[0]= "* (You hear a passing&  conversation.)/"
	        GS.msg[1]= "* Of course I won\'t laugh!/%%"
	    }
	    if(y > 450) {
	        GS.msg[0]= "* (You hear a passing&  conversation.)/"
	        GS.msg[1]= "* ... hmmm..^1. if I say my wish..^1.&* You promise you won\'t&  laugh at me?/%%"
	    }
	    if(xxx == 1 and y == 420) {
	        GS.typer= 4
	        GS.msg[0]= "* Where oh where could that&  child be...?/"
	        GS.msg[1]= "* I\'ve been looking all over&  for them.../"
	        GS.msg[2]= "\\TS* .../"
	        GS.msg[3]= "\\TF* Hee hee hee./"
	        GS.msg[4]= "* THAT\'S not true./"
	        GS.msg[5]= "* She\'ll find another kid^1, and&  instantly forget about you./"
	        GS.msg[6]= "* You\'ll NEVER see her again./%%"
	        if(GS.flag[45] == 4) {
	            GS.typer= 4
	            GS.msg[0]= "* Where am I...?/"
	            GS.msg[1]= "* It\'s so cold here..^1.&* And so dark.../"
	            GS.msg[2]= "* Someone help me..^1.&* Anyone..^1. please..^1.&* Help me.../"
	            GS.msg[3]= "\\TF* .../"
	            GS.msg[4]= "* But nobody came./%%"
	        }
	    }
	    if(scr_murderlv() >= 8 or GS.flag[350] == 1)
	        GS.msg[0]= "* (It\'s strangely silent.)/%%"
	}
	if(room == 9999) {
	    no= 0
	    i= 1
	    while(i < 6) {
	        if(id == instance_find(object_index, i)) no= i
	        i++
	    }
	    if(y > 400) no= 0
	    if(no == 0)
	        GS.msg[0]= "* I\'m gonna run around in a&  huge field of flowers./%%"
	    if(no == 0 and xxx == 1) {
	        GS.typer= 4
	        GS.msg[0]= "* Where oh where could that&  child be...?/"
	        GS.msg[1]= "* I\'ve been looking all over&  for them.../"
	        GS.msg[2]= "\\TS* .../"
	        GS.msg[3]= "\\TF* Hee hee hee./"
	        GS.msg[4]= "* THAT\'S not true./"
	        GS.msg[5]= "* She\'ll find another kid^1, and&  instantly forget about you./"
	        GS.msg[6]= "* You\'ll NEVER see her again./%%"
	        if(GS.flag[45] == 4) {
	            GS.typer= 4
	            GS.msg[0]= "* Where am I...?/"
	            GS.msg[1]= "* It\'s so cold here..^1.&* And so dark.../"
	            GS.msg[2]= "* Someone help me..^1.&* Anyone..^1. please..^1.&* Help me.../"
	            GS.msg[3]= "\\TF* .../"
	            GS.msg[4]= "* But nobody came./%%"
	        }
	    }
	    if(no == 4)
	        GS.msg[0]= "* Maybe I could jump without&  hitting my head./%%"
	    if(no == 3) GS.msg[0]= "* ... I wanna..^1.&* I wanna.../%%"
	    if(no == 2)
	        GS.msg[0]= "* You wanna ride a train^1, right^1,&  honey?/%%"
	    if(no == 1)
	        GS.msg[0]= "* I\'ll climb this mountain&  and.../%%"
	    if(x > 162) {
	        no= 5
	        GS.typer= 5
	    }
	    if(no == 5)
	        GS.msg[0]= "* I just want everyone to be&  happy.../%%"
	    if(scr_murderlv() >= 8) GS.msg[0]= "* (It\'s strangely silent.)/%%"
	}
	if(room == 172)
	    GS.msg[0]= "* (You stop to smell the&  flowers.)/%%"
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
