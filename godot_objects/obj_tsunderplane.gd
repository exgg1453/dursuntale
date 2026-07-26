# Auto-converted from GameMaker: obj_tsunderplane
# GM parent: obj_monsterparent
extends Node2D

func _ready():
	scr_monstersetup(0, 0, 0, 0, 0)
	image_speed= 0
	part1= 329
	mypart1= _spawn("part1", x, y)
	mypart1.parent= id
	$Alarm9.start((10) / 30.0)
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
	graze= 0
	ht= 200
	wd= 200

func _gm_event_1_0():
	if(mercymod > 10 and GS.monsterhp[myself] == GS.monstermaxhp[myself]) {
	    GS.goldreward[3]+= 60
	    GS.flag[149]= 1
	}
	if(killed == 1) {
	    GS.xpreward[3]+= GS.xpreward[myself]
	    GS.goldreward[3]+= GS.goldreward[myself]
	    with(mypart1) event_user(0)
	    GS.kills++
	    GS.areapop[GS.area]--
	    if(GS.areapop[GS.area] < 0) GS.areapop[GS.area]= 0
	    GS.flag[12]= 1
	}
	if(killed == 0) {
	    // obj_vulkin
	    with(337) specialmessage= 1
	    with(mypart1) instance_destroy()
	    GS.goldreward[3]+= floor(GS.goldreward[myself] * (GS.monstermaxhp[myself] - GS.monsterhp[myself]) / GS.monstermaxhp[myself])
	    GS.monstersprite= sprite_index
	    ddd= instance_create(x, y, 159/* obj_spared */)
	    ddd.image_speed= 0
	    ddd.frame= 1
	    GS.flag[10]= 1
	}
	GS.monster[myself]= 0

func _gm_event_2_9():
	mypart1.parent= GS.monsterinstance[myself]

func _gm_event_2_8():
	snd_play(hurtsound)

func _gm_event_2_6():
	blcon= instance_create(x + 155, y - 25, 186/* obj_blconsm */)
	gg= floor(random(3))
	mycommand= round(random(100))
	if(mycommand >= 0 and mycommand < 25)
	    GS.msg[0]= "It\'s not&like I&LIKE&you."
	if(mycommand >= 25) GS.msg[0]= "Id...&Idiot!"
	if(mycommand >= 50) GS.msg[0]= "Hmph!&Don\'t&get in&my way."
	if(mycommand >= 75) GS.msg[0]= ">_<...&Human&..."
	if(graze >= 5) {
	    if(mycommand >= 0 and mycommand < 50)
	        GS.msg[0]= "...&H-human&...&...?"
	    if(mycommand >= 50) GS.msg[0]= "Id...&Idiot!"
	}
	if(whatiheard == 1) {
	    GS.msg[0]= "Eeeeh?&H-human&...?"
	    if(graze >= 5) GS.msg[0]= "Human,&I..."
	}
	if(whatiheard == 3) {
	    GS.msg[0]= "Huh!?&Y-you&sicko!"
	    if(graze >= 5) GS.msg[0]= "Ah...&Is that&true...?"
	}
	if(whatiheard == 9) {
	    GS.msg[0]= "No way!&Why&would I&like YOU"
	    if(graze >= 5) GS.msg[0]= "Human,&I..."
	}
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
	GS.border= 18

func _gm_event_2_3():
	if(mypart1.hurt != 1) {
	    dmgwriter= instance_create(x, y + 10, 189/* obj_dmgwriter */)
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
	        GS.turntimer= 160
	        GS.firingrate= 20
	        if(pop == 3) GS.firingrate*= 2.4
	        if(pop == 2) GS.firingrate*= 1.7
	        num= 0
	        if(mycommand >= 0 and mycommand <= 50) num= 1
	        if(whatiheard == 1) num= 1
	        if(num == 1) {
	            GS.turntimer= 160
	            gen= instance_create(x, y, 322/* obj_vertplanegen */)
	            gen.dmg= GS.monsteratk[myself]
	            if(whatiheard == 1) gen.green= 1
	        } else  {
	            GS.firingrate= 30
	            if(pop == 3) GS.firingrate*= 2.2
	            if(pop == 2) GS.firingrate*= 1.5
	            gen= instance_create(x, y, 326/* obj_incendiarygen */)
	            gen.dmg= GS.monsteratk[myself]
	            gen.bullettype= 0
	        }
	        gen.myself= myself
	        if(mycommand >= 0)
	            GS.msg[0]= "* Tsunderplane looks over^1,&  then turns up its nose."
	        if(mycommand >= 25)
	            GS.msg[0]= "* Tsunderplane shakes its&  nose dimissively at you."
	        if(mycommand >= 50)
	            GS.msg[0]= "* Tsunderplane " + chr(ord('"')) + "accidentally" + chr(ord('"')) + "&  bumps you with its wing."
	        if(mycommand >= 75)
	            GS.msg[0]= "* Tsunderplane gives you a&  condescending barrel roll."
	        if(mycommand >= 90)
	            GS.msg[0]= "* Smells like an airport&  perfume counter."
	        if(mercymod > 60)
	            GS.msg[0]= "* Tsunderplane is looking away&  shyly."
	        if(GS.monsterhp[myself] < 30)
	            GS.msg[0]= "* Tsunderplane\'s body is smoking."
	        attacked= 1
	    }
	    whatiheard= -1
	}
	if(GS.myfight == 2 and whatiheard != -1 and GS.heard == 0) {
	    if(whatiheard == 0) {
	        GS.msc= 0
	        GS.msg[0]= "* TSUNDERPLANE - ATK 25 DEF 26&* Seems mean^1, but does&  it secretly like you?/^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	        whatiheard= 9
	    }
	    if(whatiheard == 3) {
	        GS.msc= 0
	        GS.msg[0]= "* You tell Tsunderplane it has&  an impressive wingspan./^"
	        g= floor(random(5))
	        if(g == 0)
	            GS.msg[0]= "* You tell Tsunderplane it has&  an impressive wingspan./^"
	        if(g == 1)
	            GS.msg[0]= "* You tell Tsunderplane it has&  nice turbines./^"
	        if(g == 2)
	            GS.msg[0]= "* You tell Tsunderplane it has&  a powerful rudder./^"
	        if(g == 3)
	            GS.msg[0]= "* You tell Tsunderplane that&  you like its taste in&  movies and books./^"
	        if(g == 4)
	            GS.msg[0]= "* You tell Tsunderplane that&  it has cute winglets./^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    if(whatiheard == 1) {
	        GS.msc= 0
	        GS.msg[0]= "* You get close to Tsunderplane^1.&* But not too close./^"
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
