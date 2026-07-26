# Auto-converted from GameMaker: obj_testmonster
# GM parent: obj_monsterparent
extends Node2D

func _ready():
	scr_monstersetup(0, 0, 0, 0, 0)
	image_speed= 0
	mypart1= instance_create(x, y, 215/* obj_froghead */)
	mypart2= instance_create(x, y, 214/* obj_froglegs */)
	hurtanim= 0
	hurtsound= 43
	talked= 0
	whatiheard= -1
	attacked= 0
	killed= 0
	GS.heard= 0
	takedamage= 0
	mercymod= 0

func _gm_event_1_0():
	scr_monsterdefeat(0, 0, 0, 0, 0)
	with(mypart1) instance_destroy()
	with(mypart2) instance_destroy()

func _gm_event_2_8():
	snd_play(hurtsound)

func _gm_event_2_6():
	blcon= instance_create(x + sprite_width, y, 186/* obj_blconsm */)
	mycommand= round(random(100))
	if(mycommand >= 0 and mycommand < 30)
	    GS.msg[0]= "Ribbit,&ribbit."
	if(mycommand >= 30 and mycommand < 50)
	    GS.msg[0]= "Croak,&croak."
	if(mycommand >= 50 and mycommand < 80)
	    GS.msg[0]= "Hop,&hop."
	if(mycommand >= 80 and mycommand <= 100) GS.msg[0]= "Meow."
	if(whatiheard == 1) {
	    GS.msg[0]= "(Blushes&deeply.)&Ribbit.."
	    $Alarm5.start((108) / 30.0)
	}
	if(whatiheard == 3) GS.msg[0]= "(Shiver)"
	GS.msg[1]= "%%%"
	GS.typer= 2
	blconwd= instance_create(blcon.x + 15, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	GS.border= 3
	obj_heart.x= round((GS.idealborder[0] + GS.idealborder[1]) / 2) - 8
	obj_heart.y= round((GS.idealborder[2] + GS.idealborder[3]) / 2) - 8

func _gm_event_2_5():
	with(blconwd) instance_destroy()
	with(blcon) instance_destroy()
	talked= 0
	whatiheard= -1
	GS.mnfight= 2

func _gm_event_2_3():
	if(frame != 1) {
	    with(mypart1) instance_destroy()
	    with(mypart2) instance_destroy()
	    dmgwriter= instance_create(x + sprite_width / 2 - 48, y - 24, 189/* obj_dmgwriter */)
	    GS.damage= takedamage
	    with(dmgwriter) dmg= GS.damage
	    frame= 1
	    snd_play(51/* snd_damage */)
	    $Alarm8.start((11) / 30.0)
	}
	x+= shudder
	if(shudder < 0) shudder= -(shudder + 2)
	else  shudder= -shudder
	if(shudder == 0) {
	    GS.hurtanim[myself]= 2
	    exit
	} else  {
	    $Alarm3.start((2) / 30.0)
	    exit
	}

func _process(delta: float):
	if(GS.mnfight == 3) attacked= 0
	if(alarm[5] > 0) {
	    if(GS.monster[0] == 1 and GS.monsterinstance[0].alarm[5] > alarm[5])
	        $Alarm5.start((GS.monsterinstance[0].alarm[5]) / 30.0)
	    if(GS.monster[1] == 1 and GS.monsterinstance[1].alarm[5] > alarm[5])
	        $Alarm5.start((GS.monsterinstance[1].alarm[5]) / 30.0)
	    if(GS.monster[2] == 1 and GS.monsterinstance[2].alarm[5] > alarm[5])
	        $Alarm5.start((GS.monsterinstance[2].alarm[5]) / 30.0)
	}
	if(GS.mnfight == 1 and talked == 0) {
	    $Alarm5.start((60) / 30.0)
	    $Alarm6.start((1) / 30.0)
	    talked= 1
	    GS.heard= 0
	}
	if(keyboard_multicheck_pressed(13/* ENTER */) and alarm[5] > 5 and obj_lborder.x == GS.idealborder[0])
	    $Alarm5.start((2) / 30.0)
	if(GS.hurtanim[myself] == 1) {
	    shudder= 16
	    $Alarm3.start((GS.damagetimer) / 30.0)
	    GS.hurtanim[myself]= 3
	}
	if(GS.hurtanim[myself] == 2) {
	    GS.monsterhp[myself]-= takedamage
	    with(dmgwriter) $Alarm2.start((15) / 30.0)
	    if(GS.monsterhp[myself] >= 1) {
	        mypart1= instance_create(x, y, 215/* obj_froghead */)
	        mypart2= instance_create(x, y, 214/* obj_froglegs */)
	        GS.hurtanim[myself]= 0
	        frame= 0
	        GS.myfight= 0
	        GS.mnfight= 1
	    } else  {
	        GS.myfight= 0
	        GS.mnfight= 1
	        killed= 1
	        instance_destroy()
	    }
	}
	if(GS.hurtanim[myself] == 5) {
	    GS.damage= 0
	    instance_create(x + sprite_width / 2 - 48, y - 24, 189/* obj_dmgwriter */)
	    // obj_dmgwriter
	    with(189) $Alarm2.start((30) / 30.0)
	    GS.myfight= 0
	    GS.mnfight= 1
	    GS.hurtanim[myself]= 0
	}
	if(GS.mnfight == 2 and attacked == 0) {
	    GS.turntimer= 100
	    GS.firingrate= 20
	    gen= instance_create(x, y, 713/* obj_1sidegen */)
	    if(mycommand >= 0)
	        GS.msg[0]= "* You feel intimidated by the&strength of this adversary.^4 &* Just kidding."
	    if(mycommand >= 20)
	        GS.msg[0]= "* The enemy cooks a small&bowl of flies."
	    if(mycommand >= 40)
	        GS.msg[0]= "* You can\'t concentrate&over the sound of croaking."
	    if(mycommand >= 60)
	        GS.msg[0]= "* The battlefield is filled with the smell of mustard seed."
	    if(mycommand >= 80)
	        GS.msg[0]= "* You think hard about words&that rhyme with frog.^4 &* Log.^4 Dog.^4 Snog.^4 Pog?"
	    if(mycommand >= 90)
	        GS.msg[0]= "* A frog can\'t lick its&wounds because its tongue is&just too stretchy."
	    attacked= 1
	}
	if(GS.myfight == 2 and whatiheard != -1 and GS.heard == 0) {
	    if(whatiheard == 1) {
	        GS.msc= 0
	        GS.msg[0]= "* You say some raunchy&things to those frogs.&Jeeeez!/"
	        GS.msg[1]= "* There\'s definitely some&sort of reaction./^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    if(whatiheard == 3) {
	        GS.myfight= 0
	        GS.mnfight= 1
	        OBJ_WRITER.halt= 3
	    }
	    if(whatiheard == 0) {
	        GS.myfight= 3
	        GS.bmenuno= 6
	        GS.msc= 0
	        GS.msg[0]= "* What\'s your favorite color?& &    * Red           * Orange"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 785/* OBJ_INSTAWRITER */)
	        with(iii) halt= 0
	    }
	    if(whatiheard == 6) {
	        GS.msc= 0
	        GS.msg[0]= "* Do robots dream of&electric sex?/^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	    }
	    if(whatiheard == 7) {
	        GS.msc= 0
	        GS.msg[0]= "* I hate programming this./^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    GS.heard= 1
	}
	if(GS.myfight == 4 and GS.mercyuse == 0) {
	    script_execute(163/* scr_mercystandard */)
	    if(mercy < 0) instance_destroy()
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
