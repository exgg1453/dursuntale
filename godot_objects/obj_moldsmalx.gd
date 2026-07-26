# Auto-converted from GameMaker: obj_moldsmalx
# GM parent: obj_monsterparent
extends Node2D

func _ready():
	scr_monstersetup(0, 0, 0, 0, 0)
	image_speed= 0
	hurtanim= 0
	hurtsound= 51
	talked= 0
	whatiheard= -1
	attacked= 0
	killed= 0
	GS.heard= 0
	takedamage= 0
	outside= 0
	mercymod= -40
	scalevalue= -0.01
	stage= 0
	part1= 295
	mypart1= _spawn("part1", x, y)
	visible= 0
	ht= 100
	wd= 100

func _gm_event_1_0():
	if(mercymod > 100) GS.goldreward[3]+= 20
	if(is_instance_valid(mypart1)) {
	    with(mypart1) instance_destroy()
	}
	scr_monsterdefeat(0, 0, 0, 0, 0)

func _gm_event_2_6():
	blcon= instance_create(x + sprite_width - 8, ystart - 20, 186/* obj_blconsm */)
	mycommand= round(random(100))
	if(mycommand >= 0 and mycommand < 30) GS.msg[0]= "Guoooh!"
	if(mycommand >= 25 and mycommand < 50) GS.msg[0]= "Roar."
	if(mycommand >= 50 and mycommand < 80)
	    GS.msg[0]= "*Slime&sounds*"
	if(mycommand >= 75 and mycommand <= 100)
	    GS.msg[0]= "*Chaste&wiggle*"
	if(stage == 0) {
	    GS.msg[0]= "..."
	    if(whatiheard == 1 or whatiheard == 3) {
	        stage= 1
	        visible= 0
	        with(mypart1) instance_destroy()
	        mypart1= _spawn("part1", x, y)
	        mypart1.stage= stage
	        GS.msg[0]= "Guoooh!"
	    }
	}
	if(stage == 1) GS.monstername[myself]= "Moldbygg"
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
	    stage= 1
	    with(mypart1) instance_destroy()
	    visible= 1
	    dmgwriter= instance_create(x + sprite_width / 2 - 48, y - 24, 189/* obj_dmgwriter */)
	    GS.damage= takedamage
	    with(dmgwriter) dmg= GS.damage
	    frame= 1
	    snd_play(hurtsound)
	    x= xstart
	    y= ystart
	    scale.y= 1
	    scalevalue= 0
	    gravity= 0
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
	scr_blconmatch()
	if(GS.mnfight == 1 and talked == 0) {
	    $Alarm5.start((60) / 30.0)
	    $Alarm6.start((1) / 30.0)
	    talked= 1
	    GS.heard= 0
	}
	if(keyboard_multicheck_pressed(13/* ENTER */) and alarm[5] > 5 and obj_lborder.x == GS.idealborder[0] and alarm[6] < 0)
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
	        visible= 0
	        mypart1= _spawn("part1", x, y)
	        mypart1.stage= stage
	        GS.hurtanim[myself]= 0
	        frame= 0
	        scalevalue= 0.01
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
	    if(stage == 0) {
	        if(GS.turntimer < 10) GS.turntimer= 10
	        if(mycommand >= 0 and mycommand <= 50) {
	            GS.firingrate= 90
	            if(GS.monster[0] + GS.monster[1] + GS.monster[2] == 3)
	                GS.firingrate*= 2
	            if(GS.monster[0] + GS.monster[1] + GS.monster[2] == 2)
	                GS.firingrate*= 1.5
	            gen= instance_create(0, 0, 713/* obj_1sidegen */)
	            gen.bullettype= 3
	        } else  {
	            GS.firingrate= 90
	            if(GS.monster[0] + GS.monster[1] + GS.monster[2] == 3)
	                GS.firingrate*= 2
	            if(GS.monster[0] + GS.monster[1] + GS.monster[2] == 2)
	                GS.firingrate*= 1.5
	            gen= instance_create(0, 0, 713/* obj_1sidegen */)
	            gen.bullettype= 2
	        }
	        gen.myself= myself
	    }
	    if(stage == 1) {
	        pop= scr_monstersum()
	        if(mycommand >= 0 and mycommand <= 50) {
	            GS.turntimer= 180
	            GS.firingrate= 40
	            if(pop == 2) GS.firingrate*= 1.1
	            if(pop == 3) GS.firingrate*= 1
	            instance_create(0, 0, 692/* obj_8smallgen */)
	        } else  {
	            GS.turntimer= 180
	            GS.firingrate= 35
	            if(pop == 2) GS.firingrate= 34
	            if(pop == 3) GS.firingrate*= 0.6
	            instance_create(0, 0, 691/* obj_stalkergen */)
	        }
	    }
	    if(stage == 0) {
	        if(mycommand >= 0) GS.msg[0]= "* Moldsmal sits motionless."
	        if(mycommand >= 30) GS.msg[0]= "* Moldsmal is very normal."
	        if(mycommand >= 70)
	            GS.msg[0]= "* Moldsmal is having quiet&  time."
	        if(mycommand >= 90) GS.msg[0]= "* Smells like a bait shop."
	        if(GS.monsterhp[myself] < 15)
	            GS.msg[0]= "* Quite impossible."
	    }
	    if(stage == 1) {
	        if(mycommand >= 0) GS.msg[0]= "* Moldbygg needs some distance."
	        if(mycommand >= 30) GS.msg[0]= "* Moldbygg gyrates reservedly."
	        if(mycommand >= 70)
	            GS.msg[0]= "* Moldbygg mills about in the&  corner."
	        if(mycommand >= 90) GS.msg[0]= "* Smells like a bait shop."
	        if(mercymod > 100)
	            GS.msg[0]= "* Moldbygg seems comfortable&  with your presence."
	        if(GS.monsterhp[myself] < 30)
	            GS.msg[0]= "* Moldbygg has seen better days."
	    }
	    attacked= 1
	}
	if(GS.myfight == 2 and whatiheard != -1 and GS.heard == 0) {
	    if(whatiheard == 0) {
	        GS.msc= 0
	        if(stage == 0)
	            GS.msg[0]= "* MOLDSMAL? - ATK 6 DEF 0&* It\'s a slime mold...?/^"
	        if(stage == 1)
	            GS.msg[0]= "* MOLDBYGG - ATK 18 DEF 18&* One size greater than&  Moldaverage./^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    if(whatiheard == 3) {
	        GS.msc= 0
	        if(stage == 0)
	            GS.msg[0]= "* You approach Moldsmal.&* Suddenly...!/^"
	        if(stage == 1)
	            GS.msg[0]= "* You lie down.&* Moldbygg lies down too.&* Moldbygg understands life now./^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    if(whatiheard == 1) {
	        GS.msc= 0
	        if(stage == 0)
	            GS.msg[0]= "* You wiggle your hips.&* Suddenly...!/^"
	        if(stage == 1) {
	            GS.msg[0]= "* You hug Moldbygg.&* Gross slime covers you.&* Your SPEED decreased./^"
	            if(GS.sp > 3) GS.sp--
	            if(instance_exists(256/* obj_woshua */)) {
	                obj_woshua.slime= 1
	                obj_woshua.clean= 0
	            }
	        }
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    if(whatiheard == 4) {
	        GS.msc= 0
	        if(stage == 0) GS.msg[0]= "* Wrong message!/^"
	        if(stage == 1) {
	            GS.flag[144]= 1
	            GS.msg[0]= "* You don\'t hug Moldbygg.&* It appreciates your respect&  of its boundaries./^"
	        }
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	        mercymod= 200
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
