# Auto-converted from GameMaker: obj_greatdog
# GM parent: obj_dogeparent
extends Node2D

func _ready():
	scr_monstersetup(0, 0, 0, 0, 0)
	image_speed= 0
	part1= 239
	mypart1= _spawn("part1", x, y)
	hurtanim= 0
	hurtsound= 43
	talked= 0
	whatiheard= -1
	attacked= 0
	killed= 0
	GS.heard= 0
	takedamage= 0
	mercymod= -25
	dogignore= 0
	close= 0
	pet= 0
	GS.sp= 4
	ht= 200
	wd= 200

func _gm_event_1_0():
	if(mercymod > 10 and GS.monsterhp[myself] == GS.monstermaxhp[myself])
	    GS.goldreward[3]+= 40
	if(mercymod == 250) GS.flag[54]= 2
	if(killed == 1) GS.flag[54]= 1
	if(killed == 0) GS.flag[27]= 1
	GS.plot= 60
	scr_monsterdefeat(0, 0, 0, 0, 0)
	with(mypart1) instance_destroy()

func _gm_event_2_6():
	mycommand= round(random(100))
	GS.border= 6
	obj_heart.x= round((GS.idealborder[0] + GS.idealborder[1]) / 2) - 8
	obj_heart.y= round((GS.idealborder[2] + GS.idealborder[3]) / 2) - 8

func _gm_event_2_5():
	talked= 0
	whatiheard= -1
	GS.mnfight= 2
	GS.border= 7

func _gm_event_2_3():
	if(frame != 1) {
	    with(mypart1) instance_destroy()
	    dogignore= 0
	    dmgwriter= instance_create(x + 10, y, 189/* obj_dmgwriter */)
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
	    $Alarm5.start((15) / 30.0)
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
	        mypart1= _spawn("part1", x, y)
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
	    pop= scr_monstersum()
	    GS.turntimer= 120
	    GS.firingrate= 15
	    if(pop == 3) GS.firingrate*= 2.4
	    if(pop == 2) GS.firingrate*= 1.7
	    if(mycommand >= 0 and mycommand <= 50) {
	        gen= instance_create(x, y, 686/* obj_sleepdog */)
	        GS.border= 3
	        gen.bullettype= 1
	    } else  {
	        GS.turntimer= 90
	        GS.border= 8
	        gen= instance_create(x, y, 641/* blt_dogspear */)
	        gen.bullettype= 0
	    }
	    gen.myself= myself
	    if(mycommand >= 0)
	        GS.msg[0]= "* Greater Dog is watching you&  intently."
	    if(mycommand >= 45)
	        GS.msg[0]= "* Greater Dog is waiting for&  your command."
	    if(mycommand >= 90)
	        GS.msg[0]= "* It smells like freshly-&  squeezed puppy juice."
	    if(close == 1)
	        GS.msg[0]= "* Greater Dog is seeking&  affection."
	    if(dogignore > 0)
	        GS.msg[0]= "* Greater Dog just wants&  affection."
	    if(dogignore > 2)
	        GS.msg[0]= "* Greater Dog is making&  puppy-dog eyes."
	    if(pet == 1)
	        GS.msg[0]= "* Greater Dog is patting the&  ground with its front paws."
	    if(pet == 2) GS.msg[0]= "* Greater Dog wants some TLC."
	    if(pet == 3) GS.msg[0]= "* Pet capacity is 40-percent."
	    if(pet == 4) GS.msg[0]= "* Greater Dog is contented."
	    if(GS.monsterhp[myself] < 30)
	        GS.msg[0]= "* Greater Dog is panting&  slowly."
	    attacked= 1
	}
	if(GS.myfight == 2 and whatiheard != -1 and GS.heard == 0) {
	    if(whatiheard == 0) {
	        GS.msc= 0
	        GS.msg[0]= "* GREATER DOG - ATK 15 DEF 8&* It\'s so excited that it&  thinks fighting is just play./^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    if(whatiheard == 1) {
	        GS.msc= 0
	        if(close == 1)
	            GS.msg[0]= "* The Greater Dog\'s ears&  perk up^1.&* Nothing else happens./^"
	        if(close == 0) {
	            GS.msg[0]= "* You call the Greater Dog./"
	            GS.msg[1]= "* It bounds towards you^1,&  flecking slobber into your&  face./^"
	            close= 1
	        }
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    if(whatiheard == 2) {
	        GS.msc= 0
	        if(dogignore < 4) {
	            GS.msg[0]= "* Greater Dog inches closer./^"
	            dogignore++
	            close= 1
	        }
	        if(dogignore == 4)
	            GS.msg[0]= "* Greater Dog decides you are&  too boring./^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    if(pet > 0) GS.monsterdef[myself]= -20
	    if(whatiheard == 3) {
	        GS.msc= 0
	        GS.msg[0]= "* You pet the dog./^"
	        if(pet == 4) GS.msg[0]= "* Tummy rubs are forbidden./^"
	        if(pet == 3) {
	            pet= 4
	            GS.msg[0]= "* You pet decisively^1.&* Pet capacity reaches 100&  percent./"
	            GS.msg[1]= "* The dog flops over with&  its legs hanging in the air./^"
	            GS.sp= obj_battlecontroller.tempspd
	            mercymod= 9999
	            GS.flag[142]= 1
	        }
	        if(pet == 2) {
	            GS.msg[0]= "* As you pet the dog^1,&  it sinks its entire weight&  into you.../"
	            GS.msg[1]= "* Your movements slow./"
	            GS.msg[2]= "* But^1, you still haven\'t&  pet enough...!/^"
	            GS.sp= 3
	            pet= 3
	        }
	        if(pet == 1)
	            GS.msg[0]= "* Greater Dog\'s excitement is&  creating a power field that&  prevents petting./^"
	        if(close == 1 and pet == 0) {
	            GS.msg[0]= "* Greater Dog curls up in&  your lap as it is&  pet by you./"
	            GS.msg[1]= "* It gets so comfortable&  it falls asleep.../"
	            GS.msg[2]= "* Zzzzz.../"
	            GS.msg[3]= "* .../"
	            GS.msg[4]= "* Then it wakes up^1!&* It\'s so excited!/^"
	            pet= 1
	        }
	        if(close == 0)
	            GS.msg[0]= "* Greater Dog is too far&  away to pet^1.&* You just pet the air./^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    if(whatiheard == 4) {
	        GS.msc= 0
	        GS.msg[0]= "* You play with the dog./^"
	        if(pet > 1)
	            GS.msg[0]= "* Greater Dog is too tired&  to play./^"
	        if(pet == 1) {
	            GS.msg[0]= "* You make a snowball and&  throw it for the dog&  to fetch./"
	            GS.msg[1]= "* It splats on the ground./"
	            GS.msg[2]= "* Greater Dog picks up all&  the snow in the area&  and brings it to you./"
	            GS.msg[3]= "* Now dog is very tired..^1.&* It rests its head on you.../^"
	            pet= 2
	        }
	        if(pet == 0)
	            GS.msg[0]= "* Greater Dog is not excited&  enough to play with./^"
	        GS.msc= 0
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
	if(dogignore > 3 and not instance_exists(782/* OBJ_WRITER */)) {
	    mercymod= 6666
	    GS.flag[54]= 3
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
