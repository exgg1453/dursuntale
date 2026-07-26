# Auto-converted from GameMaker: obj_vulkin
# GM parent: obj_monsterparent
extends Node2D

func _ready():
	scr_monstersetup(0, 0, 0, 0, 0)
	image_speed= 0
	part1= 336
	mypart1= _spawn("part1", x, y)
	$Alarm9.start((8) / 30.0)
	hurtanim= 0
	hurtsound= 42
	talked= 0
	whatiheard= -1
	attacked= 0
	killed= 0
	GS.heard= 0
	takedamage= 0
	mercymod= -40
	sha= 0
	shb= 0
	flex= 0
	encourage= 0
	criticize= 0
	hug= 0
	specialmessage= 0
	ht= sprite_height
	wd= sprite_width

func _gm_event_1_0():
	if(mercymod > 10 and GS.monsterhp[myself] == GS.monstermaxhp[myself]) {
	    GS.goldreward[3]+= 40
	    GS.flag[148]= 1
	}
	scr_monsterdefeat(0, 0, 0, 0, 0)
	with(mypart1) instance_destroy()

func _gm_event_2_9():
	mypart1.parent= GS.monsterinstance[myself]

func _gm_event_2_8():
	snd_play(hurtsound)

func _gm_event_2_6():
	blcon= instance_create(x + 100, y, 186/* obj_blconsm */)
	gg= floor(random(3))
	mycommand= round(random(100))
	if(GS.hp < GS.maxhp) {
	    if(mycommand >= 0 and mycommand < 50)
	        GS.msg[0]= "Ah! I\'ll&help!&Healing&magmas!"
	    if(mycommand >= 50) GS.msg[0]= "You\'re&hurt!&I\'ll&help!!!"
	}
	if(GS.hp >= GS.maxhp) {
	    if(mycommand >= 0 and mycommand < 50)
	        GS.msg[0]= "Thunder!&Helpful&speed&up!!!"
	    if(mycommand >= 50) GS.msg[0]= "Speed&will&help&dodge!!"
	}
	if(criticize > 0) {
	    if(mycommand >= 0 and mycommand < 50) GS.msg[0]= "Ahh..."
	    if(mycommand >= 50) GS.msg[0]= "Does&not&help..."
	}
	if(hug > 0) {
	    if(mycommand >= 0 and mycommand < 50)
	        GS.msg[0]= "Oh!&Ah!&I\'m&helping!"
	    if(mycommand >= 50) GS.msg[0]= "Feels&so&warm..."
	}
	if(encourage > 0) {
	    if(mycommand >= 0 and mycommand < 50)
	        GS.msg[0]= "Ahh!&Tries&the&hardest!"
	    if(mycommand >= 50) GS.msg[0]= "Works&hard!&Works&hot!"
	}
	if(whatiheard == 1) {
	    GS.msg[0]= "Ahh!&Ahh!&Does&my best!"
	    mypart1.face= 389
	}
	if(whatiheard == 3) {
	    mypart1.face= 391
	    GS.msg[0]= "Ahh...&Not...&helping?&OK..."
	    if(criticize == 2) GS.msg[0]= "Trash...&rump...&Ahh..."
	}
	if(whatiheard == 4) {
	    mypart1.face= 390
	    GS.msg[0]= "Ahh...&So...&LOVEY!"
	    if(hug == 2) GS.msg[0]= "Hug...&continue&..."
	    if(hug == 3) GS.msg[0]= "Starting&to get&weird."
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
	if(criticize == 0) GS.border= 18

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
	        GS.turntimer= 160
	        GS.firingrate= 7
	        if(pop == 3) GS.firingrate*= 2.4
	        if(pop == 2) GS.firingrate*= 1.7
	        num= 0
	        if(whatiheard == 1) num= 1
	        if(GS.hp < GS.maxhp) num= 1
	        if(criticize == 0) {
	            if(num == 1) {
	                GS.turntimer= 160
	                if(encourage > 0) GS.firingrate-= 2
	                gen= instance_create(x, y, 334/* obj_lavafiregen */)
	                gen.dmg= GS.monsteratk[myself]
	            } else  {
	                GS.firingrate= 9
	                if(encourage > 0) GS.firingrate-= 4
	                if(pop == 3) GS.firingrate*= 2.6
	                if(pop == 2) GS.firingrate*= 1.7
	                gen= instance_create((GS.idealborder[0] + GS.idealborder[1]) / 2 - 30, GS.idealborder[2] + 2, 331/* obj_vulkincloudbul */)
	            }
	        }
	        if(mycommand >= 0)
	            GS.msg[0]= "* Vulkin parades around the&  room."
	        if(mycommand >= 25)
	            GS.msg[0]= "* Vulkin is making coffee&  in its crater."
	        if(mycommand >= 50)
	            GS.msg[0]= "* Vulkin is wiggling its&  weird rump."
	        if(mycommand >= 75)
	            GS.msg[0]= "* Vulkin makes a smoke hoop&  and jumps through it."
	        if(mycommand >= 90) GS.msg[0]= "* Smells like a lava lamp."
	        if(hug > 0)
	            GS.msg[0]= "* Vulkin\'s cheeks glow with&  a bright heat."
	        if(encourage > 0)
	            GS.msg[0]= "* Vulkin parades around you&  proudly."
	        if(criticize == 1) GS.msg[0]= "* Vulkin stands in the corner."
	        if(criticize > 1)
	            GS.msg[0]= "* Little streams of lava come&  from Vulkin\'s eyes."
	        if(specialmessage == 1) {
	            GS.msg[0]= "* Vulkin reassures you the&  plane turning tiny is^1, like^1,&  completely intentional."
	            specialmessage= 0
	        }
	        attacked= 1
	    }
	    if(criticize > 0 and pop == 1) {
	        GS.turntimer= -1
	        GS.mnfight= 3
	    }
	    if(criticize > 0 and scr_monstersum() >= 2 and instance_exists(GS.monsterinstance[0]) and instance_exists(GS.monsterinstance[1]) and GS.monsterinstance[0] == 337 and GS.monsterinstance[1] == 337 and GS.monsterinstance[0].criticize > 0 and GS.monsterinstance[1].criticize > 0) {
	        GS.turntimer= -1
	        if(GS.mnfight == 2) GS.mnfight= 3
	    }
	    whatiheard= -1
	}
	if(GS.myfight == 2 and whatiheard != -1 and GS.heard == 0) {
	    if(whatiheard == 0) {
	        GS.msc= 0
	        GS.msg[0]= "* VULKIN - ATK 25 DEF 0&* Mistakenly believes its lava&  can heal people./^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	        whatiheard= 9
	    }
	    if(whatiheard == 3) {
	        GS.msc= 0
	        GS.msg[0]= "* You tell Vulkin that its&  attacks are NOT helpful./^"
	        if(criticize == 1)
	            GS.msg[0]= "* You tell Vulkin that its&  rump looks like a sack&  of trash./^"
	        encourage= 0
	        criticize++
	        hug= 0
	        mercymod= -200
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    if(whatiheard == 1) {
	        GS.msc= 0
	        mercymod= 100
	        encourage++
	        criticize= 0
	        hug= 0
	        GS.msg[0]= "* You tell Vulkin it\'s doing&  a great job.&* Its attacks become extreme.../^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    if(whatiheard == 4) {
	        GS.msc= 0
	        mercymod= 100
	        encourage= 0
	        criticize= 0
	        hug++
	        GS.msg[0]= "* You give Vulkin a hug^1.&* It warms your heart.../"
	        if(GS.df >= 5) {
	            GS.df-= 5
	            GS.msg[1]= "* And your whole body!&* Ouch!&* Your DEFENSE dropped!/^"
	        } else  GS.msg[1]= "* Nothing else happened./^"
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
