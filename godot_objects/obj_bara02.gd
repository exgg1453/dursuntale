# Auto-converted from GameMaker: obj_bara02
# GM parent: obj_monsterparent
extends Node2D

func _ready():
	scr_monstersetup(0, 0, 0, 0, 0)
	image_speed= 0
	part1= 318
	mypart1= _spawn("part1", x + 28, y + 32)
	mypart1.parent= object_index
	mypart1.headpic= 365
	hurtanim= 0
	hurtsound= 43
	talked= 0
	whatiheard= -1
	attacked= 0
	killed= 0
	GS.heard= 0
	takedamage= 0
	mercymod= -9999
	sha= 0
	shb= 0
	flex= 0
	alphaup= 0
	freshdeath= 0
	turn0= 0
	armor= 255
	con= 0
	shirtless= 0
	blconx= 165
	blcony= 55
	ht= sprite_height
	wd= sprite_width
	if(scr_murderlv() >= 12) GS.monsterdef[myself]= -400

func _gm_event_1_0():
	if(killed == 0) GS.flag[27]= 1
	if(mercymod > 10 and GS.monsterhp[myself] == GS.monstermaxhp[myself])
	    GS.goldreward[3]+= 50
	scr_monsterdefeat(0, 0, 0, 0, 0)
	with(mypart1) instance_destroy()

func _gm_event_2_8():
	snd_play(hurtsound)

func _gm_event_2_6():
	blcon= instance_create(x - blconx + 40, y + 55 + 32, 186/* obj_blconsm */)
	blcon.sprite_index= 20/* spr_blconsm2 */
	gg= floor(random(3))
	attacked= 0
	mycommand= round(random(100))
	if(mycommand >= 0 and mycommand < 25)
	    GS.msg[0]= "...&...&...&sigh."
	if(mycommand >= 25) GS.msg[0]= "...&...&heh."
	if(mycommand >= 50) GS.msg[0]= "...&...&what?"
	if(mycommand >= 75) GS.msg[0]= "...&...&hmph."
	if(turn0 == 0) GS.msg[0]= "...&team&attack."
	turn0= 1
	if(whatiheard == 3) GS.msg[0]= "...&i&won\'t&tell."
	if(whatiheard == 1) {
	    GS.msg[0]= "...&getting&...&warmer."
	    if(shirtless == 1) GS.msg[0]= "...&hello."
	}
	pop= scr_monstersum()
	if(pop < 2) {
	    if(mycommand >= 0 and mycommand < 25) GS.msg[0]= "..."
	    if(mycommand >= 25) GS.msg[0]= "..."
	    if(mycommand >= 50) GS.msg[0]= "..."
	    if(mycommand >= 75) GS.msg[0]= "..."
	    if(freshdeath == 0 and mercymod < 1)
	        GS.msg[0]= "01...&you...!&..!!!!"
	    if(freshdeath == 0 and mercymod > 100)
	        GS.msg[0]= "01...!?&What&the...!?"
	    freshdeath= 1
	    mercymod= -99999
	}
	GS.msg[1]= "%%%"
	GS.typer= 2
	blconwd= instance_create(blcon.x + 15, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	GS.border= 15
	obj_heart.x= round((GS.idealborder[0] + GS.idealborder[1]) / 2) - 8
	obj_heart.y= round((GS.idealborder[2] + GS.idealborder[3]) / 2) - 8

func _gm_event_2_5():
	with(blconwd) instance_destroy()
	with(blcon) instance_destroy()
	talked= 0
	GS.mnfight= 2
	GS.border= 16

func _gm_event_2_4():
	con++

func _gm_event_2_3():
	if(mypart1.pause != 1) {
	    dmgwriter= instance_create(x, y + 24, 189/* obj_dmgwriter */)
	    GS.damage= takedamage
	    with(dmgwriter) dmg= GS.damage
	    with(mypart1) pause= 1
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
	if(GS.mnfight == 3) {
	    attacked= 0
	    // obj_carrotstargen
	    with(699) instance_destroy()
	}
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
	        mypart1.pause= 0
	        GS.hurtanim[myself]= 0
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
	    if(obj_uborder.y > GS.idealborder[2])
	        obj_heart.y= (obj_uborder.y + obj_dborder.y) / 2
	    if(attacked == 0) {
	        pop= scr_monstersum()
	        GS.turntimer= 180
	        if(not instance_exists(699/* obj_carrotstargen */)) {
	            if(whatiheard == 1 and con == 0 and pop > 1)
	                mycommand= 80
	            if(mycommand >= 0 and mycommand <= 50) {
	                GS.firingrate= 25
	                gen= instance_create(x, y, 699/* obj_carrotstargen */)
	                gen.dmg= GS.monsteratk[myself]
	                gen.$Alarm0.start((8) / 30.0)
	                if(con > 6 and scr_monstersum() == 2) gen.shake= 1
	            } else  {
	                GS.firingrate= 20
	                if(whatiheard == 1 and con == 0 and pop > 1) {
	                    instance_create(get_viewport_rect().size.x / 2 - 15, get_viewport_rect().size.y / 2 - 80, 308/* obj_greenarmor */)
	                    GS.firingrate= 35
	                }
	                gen= instance_create(x, y, 699/* obj_carrotstargen */)
	                gen.dmg= GS.monsteratk[myself]
	                gen.$Alarm1.start((8) / 30.0)
	                if(con > 6 and scr_monstersum() == 2) gen.shake= 1
	            }
	            gen.myself= myself
	        }
	        if(mycommand >= 0) GS.msg[0]= "* Sweat pours from 02\'s armor."
	        if(mycommand >= 25) GS.msg[0]= "* 01 is polishing his face."
	        if(mycommand >= 50) GS.msg[0]= "* 01 stands guard."
	        if(mycommand >= 75) GS.msg[0]= "* 02 watches your movements."
	        if(mycommand >= 90) GS.msg[0]= "* Smells like a military zoo."
	        pop= scr_monstersum()
	        if(pop == 1) {
	            if(mycommand >= 0)
	                GS.msg[0]= "* 02 is clenching and unclenching&  his fists."
	            if(mycommand >= 25) GS.msg[0]= "* 02 is shaking his head."
	            if(mycommand >= 50)
	                GS.msg[0]= "* 02 is striking his sword&  against the ground."
	            if(mycommand >= 75) GS.msg[0]= "* 02 is coughing."
	        }
	        if(GS.monsterhp[myself] < 30)
	            GS.msg[0]= "* 02\'s breathing intensifies."
	        attacked= 1
	        whatiheard= -1
	    }
	}
	if(GS.myfight == 2 and whatiheard != -1 and GS.heard == 0) {
	    if(whatiheard == 0) {
	        GS.msc= 0
	        GS.msg[0]= "* RG 02 - ATK 30 DEF 20&* Royal Guard member with&  stuffy armor./^"
	        if(scr_murderlv() >= 12 and GS.flag[27] == 0) {
	            GS.msg[0]= "* Do they both wish for death^1?&* That means their love will&  end in hell./"
	            GS.msg[1]= "* I couldn\'t stop laughing./^"
	        }
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	        whatiheard= 9
	    }
	    if(whatiheard == 1) {
	        GS.msc= 0
	        GS.msg[0]= "* You clean RG 02\'s armor.&* Its cooling dirt begins to&  wash away./^"
	        if(scr_monstersum() < 2) GS.msg[0]= "* You were repelled./^"
	        if(shirtless == 1) {
	            GS.msg[0]= "* You pat RG 02\'s chest&  like a muscular bongo./^"
	            if(instance_exists(309/* obj_bara01 */)) obj_bara01.whatiheard= 12
	        }
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    if(whatiheard == 3) {
	        GS.msc= 0
	        GS.msg[0]= "* You tell RG 02 your favorite&  secret./^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    GS.heard= 1
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
	if(GS.mnfight == 5) {
	    if(con == 0) {
	        obj_heart.x= -800
	        obj_heart.movement= -1
	        GS.border= 0
	        $Alarm4.start((15) / 30.0)
	        con= 1
	    }
	    if(con == 2) {
	        blcon= instance_create(x - blconx, y + blcony, 186/* obj_blconsm */)
	        blcon.sprite_index= 20/* spr_blconsm2 */
	        GS.typer= 2
	        GS.msg[0]= "...&can\'t&...&take it./"
	        GS.msg[1]= "...&armor...&too...&HOT!!!/%%"
	        writer= instance_create(blcon.x + 15, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	        con= 3
	    }
	    if(con == 3 and not instance_exists(782/* OBJ_WRITER */)) {
	        with(blcon) instance_destroy()
	        snd_play(47/* snd_grab */)
	        with(mypart1) bodypic= 363
	        con= 4
	        $Alarm4.start((60) / 30.0)
	    }
	    if(con == 5 and not instance_exists(782/* OBJ_WRITER */)) {
	        if(instance_exists(309/* obj_bara01 */)) {
	            with(obj_bara01.mypart1) event_user(2)
	        }
	        blcon= instance_create(x - blconx, y + blcony, 186/* obj_blconsm */)
	        blcon.sprite_index= 20/* spr_blconsm2 */
	        GS.typer= 2
	        GS.msg[0]= "...&much&better./%%"
	        writer= instance_create(blcon.x + 15, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	        con= 6
	    }
	    if(con == 6 and not instance_exists(782/* OBJ_WRITER */)) {
	        shirtless= 1
	        with(blcon) instance_destroy()
	        GS.msg[0]= "* RG 01 looks bothered by&  something."
	        con= 7
	        GS.mnfight= 3
	        obj_bara01.shake= 1
	        obj_heart.movement= 1
	    }
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
