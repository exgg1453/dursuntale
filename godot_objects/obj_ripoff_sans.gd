# Auto-converted from GameMaker: obj_ripoff_sans
# GM parent: obj_monsterparent
extends Node2D

func _ready():
	scr_monstersetup()
	image_speed= 0
	part1= 1673
	mypart1= _spawn("part1", x, y)
	mypart1.pause= 0
	mypart1.face= 10
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
	st= instance_create(x + 46, y - 30, 1662/* obj_strangetangle */)
	ht= 100
	wd= 100

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
	blcon= instance_create(x - 110, y - 40, 186/* obj_blconsm */)
	blcon.sprite_index= 20/* spr_blconsm2 */
	gg= floor(random(3))
	mycommand= round(random(100))
	if(talkt == 0) GS.msg[0]= "just&give&up.&i did."
	if(talkt == 1) GS.msg[0]= "why&even&try?"
	if(talkt == 2) GS.msg[0]= "you\'ll&never&see \'em&again."
	if(talkt == 2) talkt= 0
	if(talkt == 1) talkt= 2
	if(talkt == 0) talkt= 1
	GS.msg[1]= "%%%"
	GS.typer= 2
	blconwd= instance_create(blcon.x + 15, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)
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
	        GS.msg[0]= "* You asked the Lost Soul to&  take a break from fighting&  with you.../"
	        GS.msg[1]= "* It seems like it wants to./^"
	        if(totalmercy >= 3) {
	            GS.msg[1]= "* It nods its head solemnly..^1.&* Seems like it will!/%%"
	            obj_ripoff_papyrus.saved= 1
	            GS.mnfight= 5
	            if(obj_ripoff_papyrus.mercyno == 0) {
	                GS.msg[1]= "* Suddenly^1, its memories are&  flooding back!/"
	                GS.msg[2]= "* Seeing how nicely you treated&  its brother^1, the other Lost&  Soul remembers^1, too!/%%"
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
	        GS.msg[0]= "* You told the Lost Soul a&  bad pun about skeletons./"
	        GS.msg[1]= "* He seems to love it..^1.&* But the other Lost Soul seems&  to hate it./^"
	        if(totalmercy >= 3) {
	            GS.msg[1]= "* Suddenly^1, the memories are&  flooding back!/%%"
	            obj_ripoff_papyrus.saved= 1
	            GS.mnfight= 5
	            if(obj_ripoff_papyrus.mercyno == 0) {
	                GS.msg[1]= "* Suddenly^1, its memories are&  flooding back!/"
	                GS.msg[2]= "* Seeing how nicely you treated&  its brother^1, the other Lost&  Soul remembers^1, too!/%%"
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
	        GS.msg[0]= "* You told the Lost Soul you\'d&  think about what you\'d&  done./"
	        GS.msg[1]= "* It seems like it\'s trying&  to remember.../^"
	        if(totalmercy >= 3) {
	            GS.msg[1]= "* It nods solemnly...!/%%"
	            obj_ripoff_papyrus.saved= 1
	            GS.mnfight= 5
	            if(obj_ripoff_papyrus.mercyno == 0) {
	                GS.msg[1]= "* Suddenly^1, its memories are&  flooding back!/"
	                GS.msg[2]= "* Seeing how nicely you treated&  its brother^1, the other Lost&  Soul remembers^1, too!/%%"
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
	        if(GS.flag[58] == 0)
	            GS.msg[0]= "* You tell the Lost Soul you&  think that jumble is&  tougher than crosswords./"
	        if(GS.flag[58] == 1)
	            GS.msg[0]= "* You tell the Lost Soul you&  think that crosswords&  are tougher than jumble./"
	        GS.msg[1]= "* It seems to have some dim&  recollection of this&  fact.../^"
	        if(totalmercy >= 3) {
	            GS.msg[1]= "* It nods its head^1, like it&  knew this without question...!/%%"
	            obj_ripoff_papyrus.saved= 1
	            GS.mnfight= 5
	            if(obj_ripoff_papyrus.mercyno == 0) {
	                GS.msg[1]= "* Suddenly^1, its memories are&  flooding back!/"
	                GS.msg[2]= "* The other Lost Soul remembers&  this conversation^1, too!/%%"
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
