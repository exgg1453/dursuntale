# Auto-converted from GameMaker: obj_mettatonb_quiz
# GM parent: obj_monsterparent
extends Node2D

func _ready():
	scr_monstersetup(0, 0, 0, 0, 0)
	image_speed= 0
	part1= 301
	mypart1= _spawn("part1", x, y)
	hurtanim= 0
	hurtsound= 43
	talked= 0
	whatiheard= -1
	attacked= 0
	killed= 0
	GS.heard= 0
	takedamage= 0
	mercymod= -99999
	sha= 0
	shb= 0
	flex= 0
	alphaup= 0
	hurtlast= 0
	skip= 0
	right= 0
	if(instance_exists(185/* obj_battlebg */)) {
	    // obj_battlebg
	    with(185) instance_destroy()
	}
	x-= 100
	y-= 100
	scale.x= 2
	scale.y= 2
	hurta= 0
	ht= 200
	wd= 200

func _gm_event_1_0():
	if(mercymod > 10 and GS.monsterhp[myself] == GS.monstermaxhp[myself])
	    GS.goldreward[3]+= 10
	scr_monsterdefeat(0, 0, 0, 0, 0)
	with(mypart1) instance_destroy()

func _gm_event_2_7():
	attacked= 2

func _gm_event_2_6():
	gg= floor(random(3))
	mycommand= round(random(100))
	qno= obj_questionasker.q
	GS.msc= 0
	if(qno == 0) GS.msg[0]= "LET\'S START WITH&AN EASY ONE!!/%%"
	if(qno == 1) GS.msg[0]= "HERE\'S YOUR TERRIFIC&PRIZE!/%%"
	if(qno == 2)
	    GS.msg[0]= "ENOUGH ABOUT YOU.&LET\'S TALK ABOUT ME!/%%"
	if(qno == 3) GS.msg[0]= "HERE\'S ANOTHER EASY&ONE FOR YOU!/%%"
	if(qno == 4)
	    GS.msg[0]= "DON\'T \'COUNT\'&ON YOUR VICTORY.../%%"
	if(qno == 5) GS.msg[0]= "LET\'S PLAY MEMORY&GAME./%%"
	if(qno == 6) GS.msg[0]= "BUT CAN YOU GET&THIS ONE???/%%"
	if(qno == 7) GS.msg[0]= "HERE\'S A SIMPLE&ONE./%%"
	if(qno == 8) GS.msg[0]= "TIME TO BREAK OUT&THE BIG GUNS!!/%%"
	GS.msg[1]= "%%%"
	GS.typer= 51
	sxx= obj_mettatonb_body.x - 320
	if(sxx < 0) sxx= 0
	scr_blcon(sxx, obj_mettatonb_body.y - 120, 1)
	GS.border= 0
	obj_heart.x= round((GS.idealborder[0] + GS.idealborder[1]) / 2) - 8
	obj_heart.y= round((GS.idealborder[2] + GS.idealborder[3]) / 2) - 8

func _gm_event_2_5():
	talked= 0
	whatiheard= -1
	GS.mnfight= 2
	GS.border= 0

func _gm_event_2_3():
	if(hurta == 0) {
	    dmgwriter= instance_create(x + sprite_width / 2 - 48, y - 24, 189/* obj_dmgwriter */)
	    GS.damage= takedamage
	    with(dmgwriter) dmg= GS.damage
	    hurta= 1
	    snd_play(51/* snd_damage */)
	    $Alarm8.start((11) / 30.0)
	}
	if(shudder < 0) shudder= -(shudder + 1)
	else  shudder= -shudder
	if(shudder == 0) {
	    GS.hurtanim[myself]= 2
	    exit
	} else  {
	    $Alarm3.start((2) / 30.0)
	    exit
	}

func _process(delta: float):
	if(GS.mnfight == 3) {
	    attacked= 0
	    talked= 0
	}
	if(alarm[5] > 0) {
	    if(GS.monster[0] == 1 and GS.monsterinstance[0].alarm[5] > alarm[5])
	        $Alarm5.start((GS.monsterinstance[0].alarm[5]) / 30.0)
	    if(GS.monster[1] == 1 and GS.monsterinstance[1].alarm[5] > alarm[5])
	        $Alarm5.start((GS.monsterinstance[1].alarm[5]) / 30.0)
	    if(GS.monster[2] == 1 and GS.monsterinstance[2].alarm[5] > alarm[5])
	        $Alarm5.start((GS.monsterinstance[2].alarm[5]) / 30.0)
	}
	if(GS.mnfight == 1) {
	    if(talked == 1 and not instance_exists(782/* OBJ_WRITER */)) {
	        $Alarm5.start((1) / 30.0)
	        talked= 2
	    }
	    if(talked == 0) {
	        attacked= 0
	        $Alarm6.start((1) / 30.0)
	        talked= 1
	        GS.heard= 0
	    }
	}
	if(GS.hurtanim[myself] == 1) {
	    shudder= 8
	    $Alarm3.start((GS.damagetimer) / 30.0)
	    GS.hurtanim[myself]= 3
	}
	if(GS.hurtanim[myself] == 2) {
	    with(dmgwriter) $Alarm2.start((15) / 30.0)
	    if(GS.monsterhp[myself] >= 1) {
	        GS.hurtanim[myself]= 0
	        hurta= 0
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
	        with(mypart1) event_user(0)
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
	        if(GS.monsterhp[myself] < 30)
	            GS.msg[0]= "* Aaron\'s muscles droop&  comically."
	        GS.msg[0]= "* Mettaton."
	        attacked= 1
	        $Alarm7.start((20) / 30.0)
	    }
	    if(attacked == 2) {
	        // obj_questionasker
	        with(307) event_user(0)
	        attacked= 3
	    }
	}
	if(GS.myfight == 2 and whatiheard != -1 and GS.heard == 0) {
	    if(whatiheard == 0) {
	        GS.msc= 0
	        GS.msg[0]= "* METTATON - ATK 30 DEF 255&* His metal body renders him&  invulnerable to attack./^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	        whatiheard= 9
	    }
	    if(whatiheard == 3) {
	        GS.msc= 0
	        GS.msg[0]= "* Screaming is against the&  rules./^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
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
