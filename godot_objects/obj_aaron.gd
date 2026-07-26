# Auto-converted from GameMaker: obj_aaron
# GM parent: obj_monsterparent
extends Node2D

func _ready():
	scr_monstersetup(0, 0, 0, 0, 0)
	image_speed= 0
	part1= 290
	mypart1= _spawn("part1", x, y)
	hurtanim= 0
	hurtsound= 37
	talked= 0
	whatiheard= -1
	attacked= 0
	killed= 0
	GS.heard= 0
	takedamage= 0
	mercymod= 5
	sha= 0
	shb= 0
	flex= 0
	alphaup= 0
	ht= 200
	wd= 100

func _gm_event_1_0():
	if(mercymod > 10 and GS.monsterhp[myself] == GS.monstermaxhp[myself])
	    GS.goldreward[3]+= 30
	scr_monsterdefeat(0, 0, 0, 0, 0)
	with(mypart1) instance_destroy()

func _gm_event_2_8():
	snd_play(hurtsound)

func _gm_event_2_6():
	blcon= instance_create(x + 95, y - 25, 186/* obj_blconsm */)
	gg= floor(random(3))
	mycommand= round(random(100))
	if(mycommand >= 0 and mycommand < 25)
	    GS.msg[0]= "Come on&in, the&water\'s&fine ; )"
	if(mycommand >= 25)
	    GS.msg[0]= "No need&for a&swimming&suit ; )"
	if(mycommand >= 50) GS.msg[0]= "Edu-&cation?&Hobby?&Talent?"
	if(mycommand >= 75) GS.msg[0]= "Whew,&I\'m&sweating&; )"
	if(GS.flag[95] == 1) {
	    if(mycommand >= 0 and mycommand < 25)
	        GS.msg[0]= "Don\'t&get too&close&; )"
	    if(mycommand >= 25) GS.msg[0]= "Sure&isn\'t&creepy&out ; )"
	    if(mycommand >= 50) GS.msg[0]= "I sure&do love&muscles&; )"
	    if(mycommand >= 75) GS.msg[0]= "Whew,&I\'m&sweating&; )"
	}
	if(whatiheard == 3) {
	    GS.msg[0]= "Flagrant&error&; )"
	    if(flex == 1) GS.msg[0]= "Flexing&contest?&OK, flex&more ; )"
	    if(flex == 2) GS.msg[0]= "Nice!!&I won\'t&lose&tho ; )"
	}
	if(whatiheard == 1) {
	    if(gg == 0) GS.msg[0]= "Fiesty,&huh?&; )"
	    if(gg == 1) GS.msg[0]= "Wow!&Spunky!&Love it&; )"
	    if(gg == 2) GS.msg[0]= "You\'ll&change&your&mind ; )"
	}
	if(whatiheard == 9) {
	    GS.msg[0]= "CHECK&all you&want ; )"
	    if(GS.flag[95] == 1) GS.msg[0]= "... ; )"
	}
	if(whatiheard == 12)
	    GS.msg[0]= "Ha, nice.&My kind&of humor&; )"
	if(alphaup == 1) GS.msg[0]= "Just the&two of&us, huh?&; )"
	if(alphaup == 1 and GS.flag[95] == 1) GS.msg[0]= "Hi?&; )"
	alphaup= 0
	GS.msg[1]= "%%%"
	GS.typer= 2
	blconwd= instance_create(blcon.x + 15, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	GS.border= 6
	obj_heart.x= round((GS.idealborder[0] + GS.idealborder[1]) / 2) - 8
	obj_heart.y= round((GS.idealborder[2] + GS.idealborder[3]) / 2) - 8

func _gm_event_2_5():
	with(blconwd) instance_destroy()
	with(blcon) instance_destroy()
	talked= 0
	whatiheard= -1
	GS.mnfight= 2
	GS.border= 7

func _gm_event_2_3():
	if(frame != 1) {
	    with(mypart1) instance_destroy()
	    dmgwriter= instance_create(x + sprite_width / 2 - 48, y + 140, 189/* obj_dmgwriter */)
	    GS.damage= takedamage
	    with(dmgwriter) dmg= GS.damage
	    frame= 1
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
	    GS.turntimer= 160
	    GS.firingrate= 25
	    if(pop == 3) GS.firingrate*= 2.4
	    if(pop == 2) GS.firingrate*= 1.7
	    if(mycommand >= 0 and mycommand <= 50) {
	        GS.turntimer= 160
	        gen= instance_create(x, y, 694/* obj_muscbulgen */)
	        if(pop > 1) gen.offset= 1
	        gen.dmg= GS.monsteratk[myself]
	    } else  {
	        GS.firingrate= 5
	        if(pop == 3) GS.firingrate*= 2.7
	        if(pop == 2) GS.firingrate*= 1.8
	        gen= instance_create(x, y, 693/* obj_sweatbulgen */)
	        gen.bullettype= 0
	    }
	    gen.myself= myself
	    if(mycommand >= 0)
	        GS.msg[0]= "* Aaron is splashing you&  playfully."
	    if(mycommand >= 0 and GS.flag[95] == 1)
	        GS.msg[0]= "* Aaron is looking around^1,&  fearful of something."
	    if(mycommand >= 25)
	        GS.msg[0]= "* Aaron is sweating bullets^3.&* Literally."
	    if(mycommand >= 50)
	        GS.msg[0]= "* Aaron is admiring his own&  muscles."
	    if(mycommand >= 75)
	        GS.msg[0]= "* Smells like an underwater&  barnyard."
	    if(mycommand >= 90) GS.msg[0]= "* Smells like a mussel farm."
	    if(flex > 0)
	        GS.msg[0]= "* Aaron is ready for your&  next flex."
	    if(GS.monsterhp[myself] < 30)
	        GS.msg[0]= "* Aaron\'s muscles droop&  comically."
	    attacked= 1
	}
	if(GS.myfight == 2 and whatiheard != -1 and GS.heard == 0) {
	    if(whatiheard == 0) {
	        GS.msc= 0
	        GS.msg[0]= "* AARON - ATK 24 DEF 12&* This seahorse has a lot of&  HP (Horsepower)./"
	        GS.msg[1]= "* All of his attacks are harder&  to dodge at the bottom of the&  box./^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	        whatiheard= 9
	    }
	    if(whatiheard == 1) {
	        GS.msc= 0
	        GS.msg[0]= "* You tell Aaron to go away./^"
	        mercymod= -10
	        if(GS.flag[95] == 1) {
	            GS.msg[0]= "* You tell Aaron to go away^1.&* He agrees./^"
	            mercymod= 222
	        }
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    if(whatiheard == 3) {
	        GS.msc= 0
	        if(flex == 0)
	            GS.msg[0]= "* You flex^1.&* Aaron flexes twice as hard.&* ATTACK increases for you two./^"
	        if(flex == 1)
	            GS.msg[0]= "* You flex harder^1.&* Aaron flexes thrice as hard.&* ATTACK increases for you two./^"
	        if(flex == 2) {
	            GS.msg[0]= "* You flex^1.&* Aaron flexes very hard.../"
	            mercymod= 400
	            GS.flag[143]= 1
	        }
	        GS.msg[1]= "* He flexes himself out of&  the room!/^"
	        flex++
	        if(GS.at < 150) GS.at+= 15
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	        GS.monsteratk[myself]++
	    }
	    GS.heard= 1
	}
	if(whatiheard == 3 and flex == 3 and instance_exists(782/* OBJ_WRITER */) and OBJ_WRITER.stringno == 1) {
	    velocity.y= -4
	    mypart1.velocity.y= -4
	}
	if(whatiheard == 3 and flex == 3 and not instance_exists(782/* OBJ_WRITER */)) {
	    script_execute(163/* scr_mercystandard */)
	    if(mercy < 0) instance_destroy()
	}
	if(alphaup == 1 and modulate.a < 1)
	    modulate.a+= 0.05
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
