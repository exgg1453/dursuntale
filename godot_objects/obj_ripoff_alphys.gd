# Auto-converted from GameMaker: obj_ripoff_alphys
# GM parent: obj_monsterparent
extends Node2D

func _ready():
	scr_monstersetup()
	image_speed= 0
	part1= 176
	mypart1= _spawn("part1", x, y)
	mypart1.pause= 0
	with(mypart1) z_index= 9
	GS.faceemotion= 13
	$Alarm9.start((8) / 30.0)
	hurtanim= 0
	hurtsound= 42
	talked= 0
	whatiheard= -1
	attacked= 0
	killed= 0
	GS.heard= 0
	takedamage= 0
	mercymod= 10
	sha= 0
	shb= 0
	obj_heart.shot= 1
	obj_heart.sprite_index= 2094/* spr_heartyellow_flip */
	turns= 0
	i= 0
	repeat(99)  {
	    GS.failure[i]= 0
	    i++
	}
	GS.specialdam[0]= 0
	GS.specialdam[1]= 0
	GS.specialdam[2]= 0
	mercyno= 0
	talkt= 0
	saved= 0
	st= instance_create(x + 30, y + 35, 1662/* obj_strangetangle */)
	with(st) z_index= 8
	ht= 100
	wd= 150

func _gm_event_1_0():
	if(mercymod > 10 and GS.monsterhp[myself] == GS.monstermaxhp[myself])
	    GS.goldreward[3]+= 40
	scr_monsterdefeat(0, 0, 0, 0, 0)
	with(mypart1) instance_destroy()

func _gm_event_2_11():
	saved++

func _gm_event_2_9():
	mypart1.parent= GS.monsterinstance[myself]

func _gm_event_2_8():
	// obj_dmgwriter
	with(189) instance_destroy()

func _gm_event_2_6():
	blcon= instance_create(x + 110, y, 186/* obj_blconsm */)
	gg= floor(random(3))
	mycommand= round(random(100))
	GS.msg[0]= "Default"
	if(talkt == 0) GS.msg[0]= "You hate&me^1,&don\'t&you...?"
	if(talkt == 1) GS.msg[0]= "I\'ve got&to keep&lying..."
	if(talkt == 2) GS.msg[0]= "All I do&is hurt&people."
	if(talkt == 2) talkt= 0
	if(talkt == 1) talkt= 2
	if(talkt == 0) talkt= 1
	if(turns == 0) turns= 1
	else  turns= 0
	GS.msg[1]= "%%%"
	GS.typer= 74
	blconwd= instance_create(blcon.x + 22, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	GS.border= 24
	if(turns == 0) GS.border= 26
	if(turns == 1) GS.border= 24
	obj_heart.x= round((GS.idealborder[0] + GS.idealborder[1]) / 2) - 8
	obj_heart.y= round((GS.idealborder[2] + GS.idealborder[3]) / 2) - 8

func _gm_event_2_5():
	with(blconwd) instance_destroy()
	with(blcon) instance_destroy()
	talked= 0
	GS.mnfight= 2

func _gm_event_2_3():
	if(mypart1.pause != 1) {
	    dmgwriter= instance_create(x + sprite_width / 2 - 48, y - 24, 189/* obj_dmgwriter */)
	    GS.damage= takedamage
	    with(dmgwriter) dmg= GS.damage
	    mypart1.pause= 1
	    snd_play(51/* snd_damage */)
	    $Alarm8.start((11) / 30.0)
	}
	if(sha == 0) sha= x
	x= sha + shudder
	if(shudder < 0) shudder= -(shudder + 1)
	else  shudder= -shudder
	if(shudder == 0) {
	    sha= 0
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
	    $Alarm5.start((110) / 30.0)
	    $Alarm6.start((1) / 30.0)
	    talked= 1
	    GS.heard= 0
	}
	if(keyboard_multicheck_pressed(13/* ENTER */) and alarm[5] > 5 and obj_lborder.x == GS.idealborder[0] and alarm[6] < 0)
	    $Alarm5.start((2) / 30.0)
	if(GS.hurtanim[myself] == 1) {
	    shudder= 8
	    $Alarm3.start((GS.damagetimer) / 30.0)
	    GS.hurtanim[myself]= 3
	}
	if(GS.hurtanim[myself] == 2) {
	    with(dmgwriter) $Alarm2.start((15) / 30.0)
	    if(GS.monsterhp[myself] >= 1) {
	        GS.hurtanim[myself]= 0
	        mypart1.pause= 0
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
	if(GS.mnfight == 2) {
	    if(attacked == 0) {
	        pop= scr_monstersum()
	        GS.turntimer= 150
	        GS.firingrate= 10
	        if(pop == 3) GS.firingrate*= 2.5
	        if(pop == 2) GS.firingrate*= 1.8
	        GS.turntimer= 10
	        if(turns == 1) {
	            GS.attacktype= 36
	            instance_create(0, 0, 414/* obj_mettattackgen */)
	        }
	        if(turns == 0) {
	            GS.specialdam[1]= 0
	            GS.attacktype= 40
	            instance_create(0, 0, 414/* obj_mettattackgen */)
	        }
	        GS.msg[0]= "* The Lost Soul stands there."
	        attacked= 1
	    }
	    if(mercymod == 999999) {
	        GS.turntimer= -1
	        GS.mnfight= 3
	    }
	    whatiheard= -1
	}
	if(GS.myfight == 2 and whatiheard != -1 and GS.heard == 0) {
	    if(whatiheard == 0) {
	        GS.msc= 0
	        mercyno++
	        GS.msg[0]= "* You tell the Lost Soul that&  you\'ll continue to&  support her./"
	        GS.msg[1]= "* Something about the way you&  said that is familiar to&  her./^"
	        if(mercyno >= 3) {
	            GS.msg[1]= "* Suddenly^1, she remembers..^1.&* It\'s all flooding back!/%%"
	            saved= 1
	            GS.mnfight= 5
	        }
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	        whatiheard= 9
	    }
	    if(whatiheard == 3) {
	        GS.msc= 0
	        mercyno++
	        GS.msg[0]= "* You call the Lost Soul on&  the phone..^1.&* She starts to sweat./"
	        GS.msg[1]= "* She doesn\'t know why^1, but&  this all seems very&  familiar.../^"
	        if(mercyno >= 3) {
	            GS.msg[1]= "* Suddenly^1, the memories are&  flooding back!/%%"
	            saved= 1
	            GS.mnfight= 5
	        }
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    if(whatiheard == 1) {
	        GS.msc= 0
	        mercyno++
	        GS.msg[0]= "* You ask the Lost Soul what&  her favorite cartoon is./"
	        GS.msg[1]= "* She can barely hold back&  from giving you an enormous&  answer.../^"
	        if(mercyno >= 3) {
	            GS.msg[1]= "* Suddenly^1, the memories are&  flooding back!/%%"
	            saved= 1
	            GS.mnfight= 5
	        }
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    if(whatiheard == 4) {
	        GS.msc= 0
	        mercyno++
	        GS.msg[0]= "* You ask the Lost Soul for&  help on a quiz question./"
	        GS.msg[1]= "* She barely holds back from&  giving you the answer.../^"
	        if(mercyno >= 3) {
	            GS.msg[1]= "* Suddenly^1, memories are&  flooding back!/%%"
	            saved= 1
	            GS.mnfight= 5
	        }
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
	if(mercymod == 222 and not instance_exists(782/* OBJ_WRITER */)) {
	    script_execute(163/* scr_mercystandard */)
	    if(mercy < 0) instance_destroy()
	}
	if(GS.mnfight == 5 and not instance_exists(782/* OBJ_WRITER */)) {
	    if(saved == 1) {
	        if(GS.hp < GS.maxhp) {
	            GS.hp= GS.maxhp
	            snd_play(155/* snd_heal_c */)
	        }
	        // obj_strangetangle
	        with(1662) instance_destroy()
	        instance_create(0, 0, 118/* obj_flasher */)
	        snd_play(30/* snd_break2 */)
	        saved= 2
	        $Alarm11.start((3) / 30.0)
	    }
	    if(saved == 3) {
	        GS.faceemotion= 5
	        GS.msc= 0
	        GS.typer= 74
	        part1.noanim= 1
	        part1.spearalpha= 0
	        GS.msg[0]= " No^1, that\'s not true^1!& My friends like me^1!& And I like you^1,& too!/%%"
	        scr_blcon_x(x + 110, y)
	        saved= 4
	    }
	    if(saved == 4 and not instance_exists(782/* OBJ_WRITER */)) {
	        instance_create(-10, -10, 557/* obj_screenwhiter */)
	        saved= 5
	        instance_create(0, 0, 557/* obj_screenwhiter */)
	        $Alarm11.start((34) / 30.0)
	    }
	    if(saved == 6) {
	        GS.battlegroup= 256
	        GS.flag[506]= 1
	        room_restart()
	    }
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
