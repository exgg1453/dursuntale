# Auto-converted from GameMaker: obj_ripoff_asgore
# GM parent: obj_monsterparent
extends Node2D

func _ready():
	scr_monstersetup()
	image_speed= 0
	part1= 1674
	mypart1= _spawn("part1", x, y)
	mypart1.pause= 0
	mypart1.face= 12
	with(mypart1) z_index= 9
	$Alarm9.start((8) / 30.0)
	hurtanim= 0
	hurtsound= 42
	talked= 0
	whatiheard= -1
	attacked= 0
	killed= 0
	GS.heard= 0
	takedamage= 0
	mercymod= -999999
	sha= 0
	shb= 0
	talkt= 0
	totalmercy= 0
	mercyno= 0
	st= instance_create(x + 160, y + 25, 1662/* obj_strangetangle */)
	ht= 180
	wd= 300

func _gm_event_1_0():
	if(mercymod > 10 and GS.monsterhp[myself] == GS.monstermaxhp[myself])
	    GS.goldreward[3]+= 40
	scr_monsterdefeat(0, 0, 0, 0, 0)
	with(mypart1) instance_destroy()

func _gm_event_2_9():
	mypart1.parent= GS.monsterinstance[myself]

func _gm_event_2_8():
	// obj_dmgwriter
	with(189) instance_destroy()

func _gm_event_2_6():
	blcon= instance_create(x - 50, y, 186/* obj_blconsm */)
	blcon.sprite_index= 20/* spr_blconsm2 */
	gg= floor(random(3))
	mycommand= round(random(100))
	if(talkt == 0) GS.msg[0]= "Forgive&me for&this."
	if(talkt == 1) GS.msg[0]= "This is&my&duty."
	if(talkt == 2) GS.msg[0]= "..."
	if(talkt == 2) talkt= 0
	if(talkt == 1) talkt= 2
	if(talkt == 0) talkt= 1
	GS.msg[1]= "%%%"
	GS.typer= 63
	blconwd= instance_create(blcon.x + 22, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	obj_heart.x= round((GS.idealborder[0] + GS.idealborder[1]) / 2) - 8
	obj_heart.y= round((GS.idealborder[2] + GS.idealborder[3]) / 2) - 8

func _gm_event_2_5():
	with(blconwd) instance_destroy()
	with(blcon) instance_destroy()
	talked= 0
	GS.mnfight= 2

func _gm_event_2_3():
	if(mypart1.pause != 1) {
	    dmgwriter= instance_create(x + sprite_width / 2 - 10, y - 24, 189/* obj_dmgwriter */)
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
	        // obj_monsterparent
	        with(605) totalmercy++
	        mercyno++
	        GS.msg[0]= "* You tell the Lost Soul that&  you\'re going to save&  everyone./"
	        GS.msg[1]= "* Something stirs deep within&  him./^"
	        if(totalmercy >= 4) {
	            GS.msg[1]= "* Something stirs within him..^1.&* It\'s all flooding back!/%%"
	            // obj_ripoff_toriel
	            with(562) saved= 1
	            GS.mnfight= 5
	            if(obj_ripoff_toriel.mercyno == 0) {
	                GS.msg[1]= "* Suddenly^1, his memories are&  flooding back!/"
	                GS.msg[2]= "* Seeing how nice you are^1, the&  female Lost Soul\'s memories&  returned^1, too!/%%"
	            }
	        }
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	        whatiheard= 9
	    }
	    if(whatiheard == 3) {
	        GS.msc= 0
	        // obj_monsterparent
	        with(605) totalmercy++
	        mercyno++
	        GS.msg[0]= "* You tell the Lost Soul that&  you won\'t hurt him^1, no&  matter what./"
	        GS.msg[1]= "* Something about this&  is so familiar to him.../^"
	        if(totalmercy >= 4) {
	            GS.msg[1]= "* Suddenly^1, the memories are&  flooding back!/%%"
	            // obj_ripoff_toriel
	            with(562) saved= 1
	            GS.mnfight= 5
	            if(obj_ripoff_toriel.mercyno == 0) {
	                GS.msg[1]= "* Suddenly^1, his memories are&  flooding back!/"
	                GS.msg[2]= "* Seeing how nice you are^1, the&  female Lost Soul\'s memories&  returned^1, too!/%%"
	            }
	        }
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    if(whatiheard == 1) {
	        GS.msc= 0
	        // obj_monsterparent
	        with(605) totalmercy++
	        mercyno++
	        GS.msg[0]= "* You stare deep into the&  eyes of the Lost Soul./"
	        GS.msg[1]= "* He remembers the gaze of&  humans past.../^"
	        if(totalmercy >= 4) {
	            GS.msg[1]= "* Suddenly^1, the memories are&  flooding back!/%%"
	            // obj_ripoff_toriel
	            with(562) saved= 1
	            GS.mnfight= 5
	            if(obj_ripoff_toriel.mercyno == 0) {
	                GS.msg[1]= "* Suddenly^1, his memories are&  flooding back!/"
	                GS.msg[2]= "* Seeing how nice you are^1, the&  female Lost Soul\'s memories&  returned^1, too!/%%"
	            }
	        }
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    if(whatiheard == 4) {
	        GS.msc= 0
	        // obj_monsterparent
	        with(605) totalmercy++
	        mercyno++
	        GS.msg[0]= "* You hug the Lost Soul./"
	        GS.msg[1]= "* It seems like his aggression&  is slowly melting away.../^"
	        if(totalmercy >= 4) {
	            GS.msg[1]= "* Suddenly^1, his memories&  are flooding back!/%%"
	            // obj_ripoff_toriel
	            with(562) saved= 1
	            GS.mnfight= 5
	            if(obj_ripoff_toriel.mercyno == 0) {
	                GS.msg[1]= "* Suddenly^1, his memories are&  flooding back!/"
	                GS.msg[2]= "* Seeing how nice you are^1, the&  female Lost Soul\'s memories&  returned^1, too!/%%"
	            }
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
