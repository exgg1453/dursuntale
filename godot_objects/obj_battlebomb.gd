# Auto-converted from GameMaker: obj_battlebomb
# GM parent: obj_monsterparent
extends Node2D

func _ready():
	scr_monstersetup()
	image_speed= 0
	part1= 400
	mypart1= _spawn("part1", x + 100, y)
	$Alarm9.start((8) / 30.0)
	hurtanim= 0
	hurtsound= 96
	talked= 0
	whatiheard= -1
	attacked= 0
	killed= 0
	GS.heard= 0
	takedamage= 0
	mercymod= 10
	sha= 0
	shb= 0
	defuse= 0
	con= 0
	gotimer= 2
	remtype= 0
	bombtype= 1
	GS.flag[288]= 0
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
	snd_play(hurtsound)

func _gm_event_2_6():
	blcon= instance_create(200, 100, 187/* obj_blconwdflowey */)
	blcon.sprite_index= 22/* spr_blcontiny */
	gg= floor(random(3))
	mycommand= round(random(100))
	GS.msg[0]= "Tick."
	if(mycommand < 75) GS.msg[0]= "Tock."
	if(mycommand < 50) GS.msg[0]= "Tick."
	if(mycommand < 25) GS.msg[0]= "Tock."
	if(bombtype == 1) GS.msg[0]= "Zzz..."
	if(bombtype == 2) GS.msg[0]= "Swish."
	GS.msg[1]= "%%%"
	GS.typer= 2
	blconwd= instance_create(blcon.x + 15, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)

func _gm_event_2_5():
	with(blconwd) instance_destroy()
	with(blcon) instance_destroy()
	talked= 0
	GS.mnfight= 2

func _gm_event_2_4():
	con++

func _gm_event_2_3():
	if(is_instance_valid(mypart1)) {
	    if(mypart1.got == 1) {
	        with(mypart1) pause= 1
	        if(defuse == 0) {
	            with(mypart1) defuse= 1
	            snd_play(51/* snd_damage */)
	            defuse= 1
	            with(mypart1) shudder= 8
	        }
	    }
	    if(is_instance_valid(mypart1)) mypart1.boss= myself
	    with(mypart1) {
	        if(sha == 0) sha= x
	        x= sha + shudder
	        if(shudder < 0) shudder= -(shudder + 1)
	        else  shudder= -shudder
	        if(shudder == 0) {
	            sha= 0
	            GS.hurtanim[boss]= 2
	            break
	        }
	    }
	    if(is_instance_valid(mypart1) and mypart1.shudder != 0)
	        $Alarm3.start((2) / 30.0)
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
	    $Alarm5.start((70) / 30.0)
	    $Alarm6.start((1) / 30.0)
	    talked= 1
	    GS.heard= 0
	}
	if(GS.myfight == 1) {
	    gotimer--
	    if(mypart1.got == 1 and gotimer > 0) {
	        if(mypart1.type != 99) remtype= mypart1.type
	        mypart1.type= 99
	        mypart1.velocity.x= 0
	        mypart1.velocity.y= 0
	    }
	}
	if(GS.hurtanim[myself] == 1) {
	    if(mypart1.got == 1) {
	        if(mypart1.type != 99) remtype= mypart1.type
	        mypart1.type= 99
	        mypart1.velocity.x= 0
	        mypart1.velocity.y= 0
	        shudder= 8
	        $Alarm3.start((GS.damagetimer) / 30.0)
	        GS.hurtanim[myself]= 3
	    } else  GS.hurtanim[myself]= 2
	}
	if(GS.hurtanim[myself] == 2) {
	    if(defuse == 0) {
	        mypart1.type= bombtype
	        GS.hurtanim[myself]= 0
	        GS.myfight= 0
	        GS.mnfight= 1
	    }
	    if(defuse == 1) {
	        con= 999
	        GS.hurtanim[myself]= 0
	    }
	}
	if(GS.hurtanim[myself] == 5) {
	    mypart1.type= bombtype
	    GS.hurtanim[myself]= 0
	    GS.myfight= 0
	    GS.mnfight= 1
	}
	if(GS.mnfight == 2) {
	    if(attacked == 0) {
	        gotimer= 3
	        if(mycommand >= 0) GS.msg[0]= "* The bomb is still active!"
	        if(bombtype == 1) GS.msg[0]= "* The dog is still active!"
	        GS.turntimer= -1
	        GS.mnfight= 3
	    }
	    whatiheard= -1
	}
	if(GS.myfight == 2 and whatiheard != -1 and GS.heard == 0) {
	    if(whatiheard == 0) {
	        GS.msc= 0
	        GS.msg[0]= "* BOMB&* Could blow at any moment./^"
	        if(bombtype == 1)
	            GS.msg[0]= "* ANNOYING DOG-BOMB&* It\'s blissfully unaware of&  its circumstances./^"
	        if(bombtype == 2)
	            GS.msg[0]= "* EXTREMELY AGILE G.O.W.&* All things considered^1, it\'s an&  extremely agile glass of water./^"
	        if(bombtype == 3)
	            GS.msg[0]= "* SCRIPT BOMB&* Like all modern blockbusters^1,&  it\'s full of explosions./^"
	        if(bombtype == 4)
	            GS.msg[0]= "* BASKET BOMB&* Even if you explode^1, you\'ll&  at least look good./^"
	        if(bombtype == 5)
	            GS.msg[0]= "* PRESENT BOMB&* Regardless^1, you\'ll have to&  write a thank-you letter./^"
	        if(bombtype == 6)
	            GS.msg[0]= "* GAME BOMB&* You really should have rented&  it first./^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	        whatiheard= 9
	    }
	    if(whatiheard == 3) {
	        GS.msc= 0
	        GS.msg[0]= "* Defuse failed^1!&* Aim for DEFUSE ZONE!/^"
	        mypart1.flash= 1
	        if(mypart1.got == 1) {
	            GS.msg[0]= "* Bomb defused!"
	            if(bombtype == 1) GS.msg[0]= "* Dog defused!"
	            mypart1.type= 99
	            mypart1.defuse= 1
	            mypart1.velocity.y= 0
	            mypart1.velocity.x= 0
	            con= 1000
	            $Alarm4.start((45) / 30.0)
	        }
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	        GS.heard= 1
	    }
	}
	if(GS.myfight == 4 and GS.mercyuse == 0) {
	    script_execute(163/* scr_mercystandard */)
	    if(mercy < 0) instance_destroy()
	}
	if(mercymod == 222 and not instance_exists(782/* OBJ_WRITER */)) {
	    script_execute(163/* scr_mercystandard */)
	    if(mercy < 0) instance_destroy()
	}
	if(con == 999) {
	    con= 1000
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 1001) {
	    instance_create(0, 0, 149/* obj_unfader */)
	    con= 1002
	    $Alarm4.start((12) / 30.0)
	}
	if(con == 1003) {
	    instance_create(0, 0, 148/* obj_persistentfader */)
	    room_goto(GS.currentroom)
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
