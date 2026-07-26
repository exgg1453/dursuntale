# Auto-converted from GameMaker: obj_moldsmal
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
	mercymod= 99
	scalevalue= -0.01
	ht= 82
	wd= 100

func _gm_event_1_0():
	if(mercymod == 101) GS.goldreward[3]++
	scr_monsterdefeat(0, 0, 0, 0, 0)

func _gm_event_2_6():
	blcon= instance_create(x + sprite_width - 8, ystart - 20, 186/* obj_blconsm */)
	mycommand= round(random(100))
	if(mycommand >= 0 and mycommand < 30)
	    GS.msg[0]= "Burble&burb..."
	if(mycommand >= 25 and mycommand < 50)
	    GS.msg[0]= "Squorch&..."
	if(mycommand >= 50 and mycommand < 80)
	    GS.msg[0]= "*Slime&sounds*"
	if(mycommand >= 75 and mycommand <= 100)
	    GS.msg[0]= "*Sexy&wiggle*"
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
	if(scale.y < 0.9) scalevalue= 0.01
	if(scale.y > 1.1) scalevalue= -0.01
	scale.y+= scalevalue
	y-= 102 * scalevalue
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
	    GS.turntimer= 120
	    if(mycommand >= 0 and mycommand <= 50) {
	        GS.firingrate= 15
	        if(GS.monster[0] + GS.monster[1] + GS.monster[2] == 3)
	            GS.firingrate*= 2
	        if(GS.monster[0] + GS.monster[1] + GS.monster[2] == 2)
	            GS.firingrate*= 1.5
	        gen= instance_create(0, 0, 713/* obj_1sidegen */)
	        gen.bullettype= 3
	    } else  {
	        GS.firingrate= 30
	        if(GS.monster[0] + GS.monster[1] + GS.monster[2] == 3)
	            GS.firingrate*= 2
	        if(GS.monster[0] + GS.monster[1] + GS.monster[2] == 2)
	            GS.firingrate*= 1.5
	        gen= instance_create(0, 0, 713/* obj_1sidegen */)
	        gen.bullettype= 2
	    }
	    gen.myself= myself
	    if(mycommand >= 0) GS.msg[0]= "* Moldsmal burbles quietly."
	    if(mycommand >= 30) GS.msg[0]= "* Moldsmal waits pensively."
	    if(mycommand >= 70) GS.msg[0]= "* Moldsmal is ruminating."
	    if(mycommand >= 90)
	        GS.msg[0]= "* The aroma of lime gelatin&  wafts through."
	    if(GS.monsterhp[myself] < 15)
	        GS.msg[0]= "* Moldsmal has started to spoil."
	    attacked= 1
	}
	if(GS.myfight == 2 and whatiheard != -1 and GS.heard == 0) {
	    if(whatiheard == 0) {
	        GS.msc= 0
	        GS.msg[0]= "* MOLDSMAL - ATK 6 DEF 0&* Stereotypical: Curvaceously&  attractive, but no brains.../^"
	        if(GS.monsteratk[myself] > 6)
	            GS.msg[0]= "* MOLDSMAL - ATK 12 DEF 0&* It\'s a different color^1, so&  it\'s a bit stronger now./^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    if(whatiheard == 3) {
	        GS.flag[132]= 1
	        GS.msc= 0
	        GS.msg[0]= "* You lie immobile with Moldsmal.&* You feel like you understand&  the world a little better./^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	        mercymod= 101
	    }
	    if(whatiheard == 1) {
	        GS.flag[132]= 1
	        GS.msc= 0
	        GS.msg[0]= "* You wiggle your hips.&* Moldsmal wiggles back.&* What a meaningful conversation!/^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	        mercymod= 101
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
