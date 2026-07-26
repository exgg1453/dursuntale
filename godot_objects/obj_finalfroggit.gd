# Auto-converted from GameMaker: obj_finalfroggit
# GM parent: obj_monsterparent
extends Node2D

func _ready():
	scr_monstersetup()
	image_speed= 0
	part1= 386
	mypart1= _spawn("part1", x, y + 24)
	$Alarm9.start((8) / 30.0)
	hurtanim= 0
	hurtsound= 43
	talked= 0
	whatiheard= -1
	attacked= 0
	killed= 0
	GS.heard= 0
	takedamage= 0
	mercymod= 15
	sha= 0
	shb= 0
	impress= 0
	ht= 100
	wd= 100

func _gm_event_1_0():
	if(GS.flag[6] == 0 and mercymod > 10 and GS.monsterhp[myself] == GS.monstermaxhp[myself]) {
	    GS.goldreward[3]+= 50
	    GS.flag[151]= 1
	}
	if(GS.flag[6] == 1 and mercymod > 10 and GS.monsterhp[myself] == GS.monstermaxhp[myself])
	    GS.goldreward[3]+= 4
	x+= 10
	y+= 10
	scr_monsterdefeat(0, 0, 0, 0, 0)
	with(mypart1) instance_destroy()

func _gm_event_2_9():
	mypart1.parent= GS.monsterinstance[myself]

func _gm_event_2_8():
	snd_play(hurtsound)

func _gm_event_2_6():
	blcon= instance_create(x + 100, y + 20, 186/* obj_blconsm */)
	gg= floor(random(3))
	mycommand= round(random(100))
	if(mycommand >= 0 and mycommand < 30)
	    GS.msg[0]= "Robbit,&robbit."
	if(mycommand >= 30 and mycommand < 50)
	    GS.msg[0]= "Creak,&creak."
	if(mycommand >= 50 and mycommand < 80)
	    GS.msg[0]= "Skip,&jump."
	if(mycommand >= 80 and mycommand <= 100) GS.msg[0]= "Woof."
	if(whatiheard == 1) GS.msg[0]= "Shudder,&shudder."
	if(whatiheard == 3) GS.msg[0]= "Nod,&nod."
	if(whatiheard == 4) GS.msg[0]= "(Thought&-ful&croak)"
	if(impress == 1) GS.msg[0]= "(Impress&-ed&ribbit)"
	impress= 0
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
	GS.mnfight= 2
	GS.border= 3

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
	    GS.monsterhp[myself]-= takedamage
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
	        if(instance_exists(387/* obj_astigmatism */))
	            GS.firingrate+= 5
	        if(pop == 3) GS.firingrate*= 2.8
	        if(pop == 2) GS.firingrate*= 1.8
	        if(mycommand >= 50 and pop == 1) {
	            gen= instance_create(x, y, 382/* obj_frogbullet_gen */)
	            gen.dmg= GS.monsteratk[myself]
	        } else  {
	            gen= instance_create(x, y, 380/* obj_megaflybulletgen */)
	            gen.dmg= GS.monsteratk[myself]
	        }
	        if(mycommand >= 0)
	            GS.msg[0]= "* Final Froggit knows exactly&  why it\'s here."
	        if(mycommand >= 30)
	            GS.msg[0]= "* Final Froggit jumps ominously&  up and down."
	        if(mycommand >= 60)
	            GS.msg[0]= "* The battlefield is filled&  with the smell of mustard&  seed."
	        if(mycommand >= 80)
	            GS.msg[0]= "* You are intimidated by&  Final Froggit\'s strength^4.&* Truly."
	        if(mercymod > 100)
	            GS.msg[0]= "* Final Froggit seems reluctant&  to fight you."
	        if(GS.monsterhp[myself] < GS.monstermaxhp[myself] / 4)
	            GS.msg[0]= "* Final Froggit stands its&  ground."
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
	        GS.msg[0]= "* FINAL FROGGIT - ATK 30 DEF 24&* Its future looks brighter and&  brighter./^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	        whatiheard= 9
	    }
	    if(whatiheard == 3) {
	        GS.msc= 0
	        GS.msg[0]= "* You compliment Final Froggit^1.&* It understood you perfectly^1.&* Its ATTACK dropped./^"
	        GS.monsteratk[myself]-= 2
	        mercymod+= 40
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    if(whatiheard == 1) {
	        GS.msc= 0
	        GS.msg[0]= "* You threaten Final Froggit^1.&* It understood you perfectly^1.&* Its DEFENSE dropped./^"
	        GS.monsterdef[myself]-= 20
	        mercymod+= 40
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    if(whatiheard == 4) {
	        GS.msc= 0
	        if(mercymod < 200) {
	            GS.msg[0]= "* You did something mysterious./"
	            GS.msg[1]= "* Final Froggit recognizes it&  has more to learn from&  this world./^"
	            mercymod= 200
	        } else 
	            GS.msg[0]= "* You did something mysterious^1.&* But nothing happened./^"
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
