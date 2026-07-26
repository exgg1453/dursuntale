# Auto-converted from GameMaker: obj_pyrope
# GM parent: obj_monsterparent
extends Node2D

func _ready():
	scr_monstersetup(0, 0, 0, 0, 0)
	image_speed= 0
	part1= 342
	mypart1= _spawn("part1", x + 8, y + 108)
	$Alarm9.start((8) / 30.0)
	hurtanim= 0
	hurtsound= 43
	talked= 0
	whatiheard= -1
	attacked= 0
	killed= 0
	GS.heard= 0
	takedamage= 0
	mercymod= 20
	sha= 0
	shb= 0
	flex= 0
	encourage= 0
	criticize= 0
	hug= 0
	heat= 0
	ht= sprite_height
	wd= sprite_width

func _gm_event_1_0():
	if(mercymod > 10 and GS.monsterhp[myself] == GS.monstermaxhp[myself]) {
	    GS.goldreward[3]+= 45
	    GS.flag[150]= 1
	}
	scr_monsterdefeat(0, 0, 0, 0, 0)
	with(mypart1) instance_destroy()

func _gm_event_2_9():
	mypart1.parent= id

func _gm_event_2_8():
	snd_play(hurtsound)

func _gm_event_2_6():
	GS.msg[0]= "Hot!!!&Error."
	blcon= instance_create(x + 110, y, 186/* obj_blconsm */)
	gg= floor(random(3))
	mycommand= round(random(100))
	if(mycommand >= 0 and mycommand < 25)
	    GS.msg[0]= "Burn,&baby,&BURN!"
	if(mycommand >= 25 and mycommand < 50)
	    GS.msg[0]= "Hot&enough&for&ya!?"
	if(mycommand >= 50 and mycommand < 75)
	    GS.msg[0]= "Feel&the&heat."
	if(mycommand >= 75 and mycommand < 100)
	    GS.msg[0]= "Is it&cold in&here?"
	if(whatiheard == 1) GS.msg[0]= "Hot!!&HOT!!&Hotter!&HOTTER!!"
	if(whatiheard == 3) GS.msg[0]= "BRRRR!&What\'s&the&deal!?"
	if(whatiheard == 4) GS.msg[0]= "Sorry!!&I\'m all&tied&up!!"
	GS.msg[1]= "%%%"
	GS.typer= 2
	blconwd= instance_create(blcon.x + 15, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	GS.border= 17
	obj_heart.x= round((GS.idealborder[0] + GS.idealborder[1]) / 2) - 8
	obj_heart.y= round((GS.idealborder[2] + GS.idealborder[3]) / 2) - 8

func _gm_event_2_5():
	with(blconwd) instance_destroy()
	with(blcon) instance_destroy()
	talked= 0
	GS.mnfight= 2

func _gm_event_2_3():
	if(mypart1.hurt != 1) {
	    dmgwriter= instance_create(x + sprite_width / 2 - 48, y + ht - 60, 189/* obj_dmgwriter */)
	    GS.damage= takedamage
	    with(dmgwriter) dmg= GS.damage
	    mypart1.hurt= 1
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
	        mypart1.hurt= 0
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
	        GS.turntimer= 180
	        GS.firingrate= 9
	        if(pop == 3) GS.firingrate*= 2.4
	        if(pop == 2) GS.firingrate*= 1.7
	        num= 0
	        if(mycommand < 50 and pop == 1) {
	            GS.turntimer= 180
	            gen= instance_create(x, y, 340/* obj_ropebulgen */)
	            gen.dmg= GS.monsteratk[myself]
	        } else  {
	            GS.firingrate= 40
	            if(pop == 3) GS.firingrate*= 2.6
	            if(pop == 2) GS.firingrate*= 1.1
	            gen= instance_create(0, 0, 346/* obj_bombgen */)
	            gen.dmg= GS.monsteratk[myself]
	        }
	        if(mycommand >= 0)
	            GS.msg[0]= "* Pyrope is protected by its&  winsome smile."
	        if(mycommand >= 25)
	            GS.msg[0]= "* Pyrope is pretending to&  pull the fire alarm."
	        if(mycommand >= 50)
	            GS.msg[0]= "* Pyrope is chuckling through&  its teeth."
	        if(mycommand >= 75)
	            GS.msg[0]= "* Pyrope is pretending to be&  a candle."
	        if(mycommand >= 90) GS.msg[0]= "* Smells like rope burn."
	        if(heat == 1) GS.msg[0]= "* Pyrope wants more heat."
	        if(heat > 1) GS.msg[0]= "* The room is sweltering!"
	        attacked= 1
	    }
	    whatiheard= -1
	}
	if(GS.myfight == 2 and whatiheard != -1 and GS.heard == 0) {
	    if(whatiheard == 0) {
	        GS.msc= 0
	        GS.msg[0]= "* PYROPE - ATK 29 DEF 14&* This mischievous monster&  is never warm enough./^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	        whatiheard= 9
	    }
	    if(whatiheard == 3) {
	        if(instance_exists(341/* obj_heatwaver */)) {
	            // obj_heatwaver
	            with(341) instance_destroy()
	        }
	        GS.msc= 0
	        GS.msg[0]= "* You blow on Pyrope.&* Its flames die down.&* Pyrope\'s ATTACK dropped!/^"
	        // obj_pyrope
	        with(343) {
	            if(GS.monsteratk[myself] > 2)
	                GS.monsteratk[myself]-= 2
	            heat= 0
	            mercymod= -200
	            whatiheard= 3
	        }
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    if(whatiheard == 1) {
	        GS.msc= 0
	        // obj_pyrope
	        with(343) whatiheard= 1
	        // obj_pyrope
	        with(343) mercymod+= 30
	        // obj_pyrope
	        with(343) heat++
	        if(heat > 1) {
	            // obj_pyrope
	            with(343) mercymod= 900
	        }
	        GS.msg[0]= "* You crank up the thermostat.&* Pyrope begins to get&  excited./^"
	        if(heat == 2)
	            GS.msg[0]= "* You crank up the thermostat.&* It\'s super hot!&* Pyrope looks satisfied./^"
	        if(heat > 2)
	            GS.msg[0]= "* You crank up the thermostat.&* It\'s SOOOO hot!/^"
	        if(heat == 1 and not instance_exists(341/* obj_heatwaver */))
	            instance_create(0, 0, 341/* obj_heatwaver */)
	        if(heat > 1 and instance_exists(341/* obj_heatwaver */) and obj_heatwaver.cfactor < 30)
	            obj_heatwaver.cfactor+= 2
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    if(whatiheard == 4) {
	        GS.msc= 0
	        GS.msg[0]= "* You invite Pyrope to hang&  out./^"
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
