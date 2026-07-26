# Auto-converted from GameMaker: obj_shyren
# GM parent: obj_monsterparent
extends Node2D

func _ready():
	scr_monstersetup(0, 0, 0, 0, 0)
	image_speed= 0
	part1= 260
	mypart1= _spawn("part1", x, y)
	agent= instance_create(x, y + 3, 261/* obj_agentbody */)
	hurtanim= 0
	hurtsound= 43
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
	emotion= 0
	encourage= 0
	creep= 0
	badnote[0]= caster_load("music/shyren/badnote1.ogg")
	badnote[1]= caster_load("music/shyren/badnote2.ogg")
	badnote[2]= caster_load("music/shyren/badnote3.ogg")
	note[0]= caster_load("music/shyren/note1.ogg")
	note[1]= caster_load("music/shyren/note2.ogg")
	note[2]= caster_load("music/shyren/note3.ogg")
	note[3]= caster_load("music/shyren/note4.ogg")
	note[4]= caster_load("music/shyren/note5.ogg")
	note[5]= caster_load("music/shyren/note6.ogg")
	longnote[0]= caster_load("music/shyren/singF.ogg")
	longnote[1]= caster_load("music/shyren/singG.ogg")
	ht= 100
	wd= 100

func _gm_event_1_0():
	if(mercymod > 10 and GS.monsterhp[myself] == GS.monstermaxhp[myself])
	    GS.goldreward[3]+= 30
	if(killed == 0) GS.flag[27]= 1
	scr_monsterdefeat(0, 0, 0, 0, 0)
	with(mypart1) instance_destroy()
	if(killed == 0) agent.modulate.a= 0.5
	else  {
	    agent.frame= 1
	    GS.flag[81]= 1
	}
	i= 0
	repeat(5)  {
	    caster_free(note[i])
	    i++
	}
	caster_free(longnote[0])
	caster_free(longnote[1])
	caster_free(badnote[0])
	caster_free(badnote[1])
	caster_free(badnote[2])

func _gm_event_2_8():
	caster_play(badnote[0], 1, 1)

func _gm_event_2_6():
	blcon= instance_create(x + 95, y - 25, 186/* obj_blconsm */)
	gg= floor(random(3))
	mycommand= round(random(100))
	GS.msg[0]= "....&....&toot&...."
	if(mycommand >= 50) GS.msg[0]= "....&....&hum hum"
	if(encourage == 1) GS.msg[0]= "si re,&si re&si mi&si mi"
	if(encourage == 2) GS.msg[0]= "Si Fa&Si Fa&So Fa So&Mi Re Re"
	if(encourage == 3) GS.msg[0]= "Mi So&Mi So&Mi Si Mi&La Si So"
	if(encourage == 4) GS.msg[0]= "(agg-&ressive&tooting)"
	if(encourage == 5) GS.msg[0]= "(final&toot)"
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

func _gm_event_2_3():
	if(frame != 1) {
	    with(mypart1) instance_destroy()
	    dmgwriter= instance_create(x + sprite_width / 2 - 48, y - 24, 189/* obj_dmgwriter */)
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
	    if(encourage == 5) encourage= 6
	    GS.turntimer= 124
	    GS.firingrate= 25
	    if(pop == 3) GS.firingrate*= 2.4
	    if(pop == 2) GS.firingrate*= 1.7
	    if(mycommand >= 0) {
	        GS.firingrate= 50
	        if(GS.turntimer < 90) GS.turntimer= 90
	        if(emotion == 1) {
	            GS.firingrate= 8 - encourage / 1.5
	            emotion= 2
	            GS.turntimer= 124
	        }
	        gen= instance_create(x + 36, y + 62, 689/* obj_musbulgen */)
	        gen.bullettype= 0
	        if(encourage >= 5) GS.turntimer= 310
	    }
	    gen.myself= myself
	    if(mycommand >= 0) GS.msg[0]= "* Shyren hums very faintly."
	    if(mycommand >= 25)
	        GS.msg[0]= "* Shyren pretends to be a&  pop idol."
	    if(mycommand >= 50)
	        GS.msg[0]= "* Shyren taps a little beat&  with her fins."
	    if(mycommand >= 70)
	        GS.msg[0]= "* Shyren thinks about doing&  karaoke by her"
	    if(mycommand >= 90) GS.msg[0]= "* Smells like music."
	    if(GS.monsterhp[myself] < 30)
	        GS.msg[0]= "* Shyren\'s voice gets raspy."
	    if(encourage == 1)
	        GS.msg[0]= "* Shyren seems much more&  comfortable singing along."
	    if(encourage == 2) {
	        if(GS.flag[67] == 0)
	            GS.msg[0]= "* Sans is selling tickets&  made of toilet paper."
	        else 
	            GS.msg[0]= "* A hooded figure watches&  the commotion from afar."
	    }
	    if(encourage == 3)
	        GS.msg[0]= "* The crowd tosses clothing^1.&* It\'s a storm of socks."
	    if(encourage == 4)
	        GS.msg[0]= "* Shyren thinks about her&  future."
	    if(encourage > 4) GS.msg[0]= " "
	    attacked= 1
	}
	if(GS.myfight == 2 and whatiheard != -1 and GS.heard == 0) {
	    if(whatiheard == 0) {
	        GS.msc= 0
	        GS.msg[0]= "* SHYREN - ATK 19 DEF 0&* Tone deaf^1. She\'s too ashamed&  to sing her deadly song./^"
	        if(encourage == 1)
	            GS.msg[0]= "* SHYREN - ATK 19 DEF 0&* A talented singer^1, with&  a little help./^"
	        if(encourage > 1)
	            GS.msg[0]= "* SHYREN - ATK 19 DEF 0&* That\'s Shyren^1.&* She\'s your band-mate./^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	        whatiheard= 9
	    }
	    if(whatiheard == 1) {
	        GS.msc= 0
	        d= choose(0, 1, 2)
	        if(d == 0)
	            GS.msg[0]= "* You hum a funky tune^1.&* Shyren follows your melody./^"
	        if(d == 1)
	            GS.msg[0]= "* You hum a sad song^1.&* Shyren follows your melody./^"
	        if(d == 2)
	            GS.msg[0]= "* You hum a jazz ballad^1.&* Shyren follows your melody./^"
	        if(encourage == 1) {
	            GS.msg[0]= "* You hum some more^1.&* Monsters are drawn to the&  music./"
	            GS.msg[1]= "* Suddenly^1, it\'s a concert.../^"
	        }
	        if(encourage == 2)
	            GS.msg[0]= "* You hum some more^1.&* The seats are sold out^1.&* You feel like a rock star./^"
	        if(encourage == 3) {
	            GS.msg[0]= "* You hum some more^1.&* But the constant attention.../"
	            GS.msg[1]= "* The tours..^1.&* The groupies..^1.&* It\'s all.../^"
	        }
	        if(encourage == 4) {
	            GS.msg[0]= "* You and Shyren have come so&  far^1, but it\'s time./"
	            GS.msg[1]= "* You both have your own&  journeys to embark on./"
	            GS.msg[2]= "* You hum a farewell song./^"
	        }
	        encourage++
	        emotion= 1
	        GS.monsterdef[myself]= -150
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	        mercymod= 140
	    }
	    if(whatiheard == 3) {
	        GS.msc= 0
	        GS.msg[0]= "* You smile^1.&* You ask to see Shyren\'s smile^1,&  too./"
	        GS.msg[1]= "* Shyren gets quieter^1.&* In the corner^1, Aaron nods&  his head approvingly./^"
	        if(creep == 1)
	            GS.msg[0]= "* You keep smiling^1.&* But nothing happened./^"
	        if(encourage > 1) {
	            GS.msg[0]= "* You give a darling smile and&  a little wink./"
	            GS.msg[1]= "* The crowd goes wild!/^"
	        }
	        creep= 1
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    if(whatiheard == 4) {
	        GS.msc= 0
	        GS.msg[0]= "* You wave your arms wildly^1.&* You are now vulnerable&  to electric attacks./^"
	        if(encourage > 1)
	            GS.msg[0]= "* You wave your arms wildly^1.&* The crowd eats it up./^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    GS.heard= 1
	}
	if(encourage == 6 and GS.turntimer < 40) {
	    encourage= 7
	    if(instance_exists(689/* obj_musbulgen */)) {
	        // obj_musbulgen
	        with(689) instance_destroy()
	    }
	    caster_pause(GS.batmusic)
	}
	if(encourage == 7 and GS.turntimer < 18) GS.border= 0
	if(encourage == 7 and GS.turntimer <= 2) {
	    GS.flag[81]= 2
	    GS.turntimer= -1
	    GS.mnfight= 1
	    GS.myfight= 0
	    GS.border= 0
	    // OBJ_WRITER
	    with(782) instance_destroy()
	    GS.typer= 1
	    obj_heart.visible= 0
	    script_execute(163/* scr_mercystandard */)
	    instance_destroy()
	}
	if(GS.myfight == 4 and GS.mercyuse == 0) {
	    script_execute(163/* scr_mercystandard */)
	    if(mercy < 0) instance_destroy()
	}
	if(mercymod == 222 and not instance_exists(782/* OBJ_WRITER */)) {
	    script_execute(163/* scr_mercystandard */)
	    if(mercy < 0) instance_destroy()
	}

func _gm_event_7_5():
	i= 0
	repeat(5)  {
	    caster_free(note[i])
	    i++
	}
	caster_free(longnote[0])
	caster_free(longnote[1])
	caster_free(badnote[0])
	caster_free(badnote[1])
	caster_free(badnote[2])
	if(killed == 0) GS.flag[27]= 1

func _gm_event_9_51():
	if(GS.debug == 1) emotion++

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
