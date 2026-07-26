# Auto-converted from GameMaker: obj_undynedate_afterward
extends Node2D

func _ready():
	con= 0
	if(GS.flag[389] == 3) {
	    GS.flag[20]= 0
	    con= 1
	    $Alarm4.start((45) / 30.0)
	    GS.interact= 1
	    if(instance_exists(1570/* obj_mainchara */)) {
	        obj_mainchara.x= 120
	        obj_mainchara.y= 160
	        GS.interact= 1
	    }
	    undyne= instance_create(150, 135, 1061/* obj_undyne_actor */)
	    undyne.sprite_index= 1415/* spr_undyne_lt */
	    GS.flag[390]= 0
	    exit
	} else  {
	    instance_destroy()
	    exit
	}

func _gm_event_2_4():
	con++

func _process(delta: float):
	if(con == 1) {
	    GS.facing= 1
	    if(instance_exists(1570/* obj_mainchara */)) {
	        obj_mainchara.x= 120
	        obj_mainchara.y= 160
	        GS.interact= 1
	    }
	}
	if(con == 2) {
	    GS.facechoice= 5
	    GS.faceemotion= 9
	    GS.msc= 0
	    GS.typer= 37
	    GS.msg[0]= "* Well^1, that was&  fun^1, huh?/"
	    GS.msg[1]= "\\E6* We\'ll have to hang&  out again another&  time...!/"
	    GS.msg[2]= "\\E9* But^1, uh^1, somewhere&  else I guess./"
	    GS.msg[3]= "\\E0* In the meantime^1,&  I guess I\'ll go&  hang with Papyrus./"
	    GS.msg[4]= "* So if you need&  me^1, drop by Snowdin^1,&  OK!?/"
	    GS.msg[5]= "\\E1* OH^1!&* And if you ever&  need help.../"
	    GS.msg[6]= "\\E9* Just give Papyrus a&  ring^1, ok?/"
	    GS.msg[7]= "\\E0* Since we\'re in the&  same spot^1, I\'ll be&  able to talk too!/"
	    GS.msg[8]= "\\E6* Well^1, see ya&  later^1, punk!!/%%"
	    con= 3
	    ini_open("undertale.ini")
	    won= ini_read_real("General", "Won", 0)
	    ini_close()
	    d= 0
	    if(won < 1) d= 1
	    if(GS.flag[389] < 3) d= 1
	    if(GS.kills > 0) d= 1
	    if(GS.plot <= 198) d= 1
	    if(GS.flag[493] >= 8) d= 1
	    if(d == 0) {
	        scr_itemget(56)
	        if(noroom == 0) {
	            GS.msg[0]= "* Well^1, that was&  fun^1, huh?/"
	            GS.msg[1]= "\\E6* We\'ll have to hang&  out again another&  time...!/"
	            GS.msg[2]= "\\E9* But^1, uh^1, somewhere&  else I guess./"
	            GS.msg[3]= "\\E0* In the meantime^1,&  I guess I\'ll go&  hang with Papyrus./"
	            GS.msg[4]= "* So if you need&  me^1, drop by Snowdin^1,&  OK!?/"
	            GS.msg[5]= "\\E1* OH^1!&* And if you ever&  need help.../"
	            GS.msg[6]= "\\E9* Just give Papyrus a&  ring^1, ok?/"
	            GS.msg[7]= "\\E0* Since we\'re in the&  same spot^1, I\'ll be&  able to talk too!/"
	            GS.msg[8]= "\\E6* Well^1, see ya&  later^1, punk.../"
	            GS.msg[9]= "\\E1* OH!!^1!&* WAIT!!/"
	            GS.msg[10]= "\\E0* This is sudden^1, but.../"
	            GS.msg[11]= "\\E9* Can you deliver&  something for me?/"
	            GS.msg[12]= "\\E0* Papyrus suggested&  that I ask you./"
	            GS.msg[13]= "\\E3* But he told me when&  I still hated you^1,&  so.../"
	            GS.msg[14]= "\\E1* Uh^1! Anyway!!^1!&* Here^1! Just take it!/"
	            GS.msg[15]= "\\TS \\F0 \\T0 %"
	            GS.msg[16]= "* (You got the Undyne\'s&  Letter.)/"
	            scr_undface(17, 2)
	            GS.msg[18]= "* Well^1, what are you&  waiting for!?/"
	            GS.msg[19]= "\\E1* Go deliver it!!!/"
	            GS.msg[20]= "* .../"
	            GS.msg[21]= "\\E9* Uhhhh..^1.&* Oh^1, yeah.../"
	            GS.msg[22]= "* It\'s addressed to&  Dr. Alphys./"
	            GS.msg[23]= "\\E6* OK^1, see you!!/%%"
	            GS.flag[8]= 1
	            GS.flag[493]= 9
	        } else  {
	            GS.msg[0]= "* Well^1, that was&  fun^1, huh?/"
	            GS.msg[1]= "\\E6* We\'ll have to hang&  out again another&  time...!/"
	            GS.msg[2]= "\\E9* But^1, uh^1, somewhere&  else I guess./"
	            GS.msg[3]= "\\E0* In the meantime^1,&  I guess I\'ll go&  hang with Papyrus./"
	            GS.msg[4]= "* So if you need&  me^1, drop by Snowdin^1,&  OK!?/"
	            GS.msg[5]= "\\E1* OH^1!&* And if you ever&  need help.../"
	            GS.msg[6]= "\\E9* Just give Papyrus a&  ring^1, ok?/"
	            GS.msg[7]= "\\E0* Since we\'re in the&  same spot^1, I\'ll be&  able to talk too!/"
	            GS.msg[8]= "\\E6* Well^1, see ya&  later^1, punk.../"
	            GS.msg[9]= "\\E1* OH!!^1!&* WAIT!!/"
	            GS.msg[10]= "\\E0* This is sudden^1, but.../"
	            GS.msg[11]= "* Can you.../"
	            GS.msg[12]= "\\E1* Hey^1, wait^1!&* Your inventory\'s&  full./"
	            GS.msg[13]= "\\E9* Uh^1, well^1, I\'ll be&  at Papyrus\'s./"
	            GS.msg[14]= "\\E6* Come see me when&  you have less&  stuff!/%%"
	            GS.flag[493]= 8
	            GS.flag[8]= 1
	        }
	    }
	    instance_create(0, 0, 779/* obj_dialoguer */)
	}
	if(con == 3 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.flag[20]= 2
	    undyne.velocity.y= 6
	    undyne.image_speed= 0.5
	    undyne.sprite_index= 1404/* spr_undyne_d */
	    con= 4
	    GS.facing= 0
	    $Alarm4.start((60) / 30.0)
	}
	if(con == 5) {
	    con= 6
	    GS.facing= 1
	    GS.interact= 0
	    GS.flag[389]= 4
	    GS.flag[465]= 1
	    instance_destroy()
	}

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
