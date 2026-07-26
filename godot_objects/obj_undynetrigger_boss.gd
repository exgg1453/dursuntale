# Auto-converted from GameMaker: obj_undynetrigger_boss
extends Node2D

func _ready():
	fakedrawer= 0
	playthesong= 0
	$Alarm0.start((3) / 30.0)
	con= 0
	y-= 20
	if(GS.plot > 120) instance_destroy()

func _gm_event_2_4():
	con++

func _on_destroy():
	xx= view_xview[0]
	yy= view_yview[0]

func _process(delta: float):
	// obj_undynetrigger_boss
	with(1129) {
	    if(instance_exists(1570/* obj_mainchara */) and obj_mainchara.y < 600 and con == 0 and GS.interact == 0) {
	        remembery= obj_mainchara.y
	        rememberyyy= obj_mainchara.y
	        if(obj_mainchara.x < 128) obj_mainchara.x= 128
	        GS.interact= 1
	        con= 1
	        vol= caster_get_volume(GS.currentsong)
	        undyne= instance_create(137, 135, 1117/* obj_undynea_actor */)
	        undyne.sprite_index= undyne.usprite
	    }
	    if(con == 1) {
	        obj_mainchara.cutscene= 1
	        view_object[0]= -4
	        con= 2
	        $Alarm4.start((33) / 30.0)
	    }
	    if(con == 2) {
	        if(vol > 0) vol-= 0.034
	        caster_set_volume(GS.currentsong, vol)
	    }
	    if(con == 3) {
	        view_yview[0]-= 4
	        if(view_yview[0] < 80) con= 4
	    }
	    if(con == 4) {
	        con= 5
	        $Alarm4.start((30) / 30.0)
	    }
	    if(con == 6) {
	        GS.facechoice= 0
	        GS.typer= 37
	        GS.msc= 0
	        GS.msg[0]= "* Seven./"
	        GS.msg[1]= "\\W* Seven human souls^1, and&  \\RKing ASGORE\\W will become&  a god./"
	        GS.msg[2]= "* Six./"
	        GS.msg[3]= "* That\'s how many we have&  collected thus far./"
	        GS.msg[4]= "* Understand?/"
	        GS.msg[5]= "* Through your seventh and&  final soul^1, this world will&  be transformed./"
	        GS.msg[6]= "* First^1, however^1, as is customary&  for those who make it this&  far.../"
	        GS.msg[7]= "* I shall tell you the tragic&  tale of our people./"
	        GS.msg[8]= "* It all started^1, long ago.../%%"
	        g= instance_create(0, 0, 779/* obj_dialoguer */)
	        g.side= 1
	        con= 7
	    }
	    if(con == 7 and instance_exists(782/* OBJ_WRITER */)) {
	        if(OBJ_WRITER.stringno == 2)
	            undyne.sprite_index= undyne.rsprite
	        if(OBJ_WRITER.stringno == 4)
	            undyne.sprite_index= undyne.dsprite
	        if(OBJ_WRITER.stringno == 6)
	            undyne.sprite_index= undyne.lsprite
	        if(OBJ_WRITER.stringno == 7)
	            undyne.sprite_index= undyne.dsprite
	        if(OBJ_WRITER.stringno == 8)
	            undyne.sprite_index= undyne.lsprite
	    }
	    if(con == 7 and not instance_exists(782/* OBJ_WRITER */)) {
	        con= 8
	        if(GS.flag[67] == 1) con= 49
	        $Alarm4.start((60) / 30.0)
	    }
	    if(con == 9) {
	        undyne.sprite_index= undyne.dsprite
	        GS.msg[0]= "* .../"
	        GS.msg[1]= "* No^1, you know what?/%%"
	        g= instance_create(0, 0, 779/* obj_dialoguer */)
	        g.side= 1
	        con= 10
	    }
	    if(con == 10 and not instance_exists(782/* OBJ_WRITER */)) {
	        GS.msg[0]= "* SCREW IT^3!%%"
	        event_user(1)
	        con= 11
	    }
	    if(con == 11 and not instance_exists(782/* OBJ_WRITER */)) {
	        GS.msg[0]= "* WHY SHOULD I TELL THAT STORY^1 %%"
	        event_user(1)
	        con= 12
	    }
	    if(con == 12 and not instance_exists(782/* OBJ_WRITER */)) {
	        GS.msg[0]= "* WHEN YOU\'RE ABOUT TO DIE!?^1! %%"
	        event_user(1)
	        con= 13
	    }
	    if(con == 13 and not instance_exists(782/* OBJ_WRITER */)) {
	        GS.msg[0]= "* NGAAAAAHHHHHHHHHHHHHHHHH^1! %%"
	        event_user(1)
	        view_angle[0]= 0
	        con= 14
	    }
	    if(con == 14) {
	        con= 15
	        white= instance_create(0, 0, 1363/* obj_npc_marker */)
	        white.sprite_index= 999/* spr_pixwht */
	        white.image_speed= 0
	        white.scale.x= 200
	        white.scale.y= 200
	        white.visible= 1
	        white.modulate.a= 0
	        alp= 0
	    }
	    if(con == 15) {
	        alp+= 0.02
	        white.modulate.a= alp
	        if(alp >= 1) con= 16
	    }
	    if(con == 16) {
	        con= 17
	        undyne.x+= 3
	        undyne.sprite_index= 1434/* spr_undyne_eyeding */
	        undyne.frame= 0
	        undyne.image_speed= 0
	        fakedrawer= 0
	        view_visible[1]= 0
	        view_hview[1]= 240
	        view_wview[1]= 320
	        view_xview[1]= 0
	        view_yview[1]= 60
	        view_object[0]= -4
	        GS.flag[18]= 0
	        view_xview[0]= 0
	        view_yview[0]= 60
	        view_hview[0]= 240
	        view_wview[0]= 320
	        $Alarm4.start((20) / 30.0)
	    }
	    if(con == 18) {
	        con= 19
	        $Alarm4.start((60) / 30.0)
	    }
	    if(con == 19) {
	        if(alp > 0) alp-= 0.05
	        white.modulate.a= alp
	    }
	    if(con == 20) {
	        with(white) instance_destroy()
	        con= 21
	        ax= 0
	        $Alarm4.start((90) / 30.0)
	    }
	    if(con == 21) {
	        if(ax < 8) ax+= 0.2
	        if(ax == 4) snd_play(28/* snd_bell */)
	        undyne.frame= floor(ax)
	    }
	    if(con == 22) {
	        undyne.sprite_index= 1421/* spr_undyne_starkd_nomask */
	        con= 23
	        obj_mainchara.y= 0
	        obj_mainchara.visible= 0
	        $Alarm4.start((2) / 30.0)
	    }
	    if(con == 24) {
	        GS.facechoice= 5
	        GS.faceemotion= 1
	        GS.typer= 37
	        q= 0
	        if(GS.kills > 0) q= 1
	        if(GS.kills == 1 and GS.flag[4] == 1) q= 0
	        if(GS.kills == 0) q= 0
	        if(q == 0) {
	            ini_open("undertale.ini")
	            ud= ini_read_real("Undyne", "UD", 0)
	            ini_close()
	            GS.msg[0]= "* YOU!/"
	            GS.msg[1]= "* You\'re standing in&  the way of everybody\'s&  hopes and dreams!/"
	            GS.msg[2]= "\\E4* Alphys\'s history books&  made me think&  humans were cool.../"
	            GS.msg[3]= "\\E0* ... with their giant&  robots and flowery&  swordswomen./"
	            GS.msg[4]= "\\E1* BUT YOU?/"
	            GS.msg[5]= "\\E2* You\'re just a coward!/"
	            GS.msg[6]= "\\E3* Hiding behind that kid&  so you could run away&  from me again!/"
	            if(GS.flag[98] == 2 or GS.flag[98] == 0)
	                GS.msg[6]= "* You abandoned your&  friend just so you&  could run away!/"
	            GS.msg[7]= "\\E2* And let\'s not forget&  your wimpy goody-two-&  shoes-schtick!/"
	            GS.msg[8]= "\\E6* Oooh^1! I\'m making such a&  difference by hugging&  random strangers!/"
	            GS.msg[9]= "*\\E3 You know what would&  be more valuable&  to everyone?/"
	            GS.msg[10]= "*\\E1 IF YOU WERE DEAD!!!/"
	            GS.msg[11]= "\\E0* That\'s right^1, human^1!&* Your continued&  existence is a crime!/"
	            GS.msg[12]= "* Your life is all&  that stands between&  us and our freedom!/"
	            GS.msg[13]= "* Right now^1, I can&  feel everyone\'s hearts&  pounding together!/"
	            GS.msg[14]= "\\E0* Everyone\'s been&  waiting their whole&  lives for this moment!/"
	            GS.msg[15]= "\\E0* But we\'re not&  nervous at all./"
	            GS.msg[16]= "\\E1* When everyone puts&  their hearts together^1,&  they can\'t lose!/"
	            GS.msg[17]= "\\E5* Now^1, human^1!&* Let\'s end this^1,&  right here^1, right now./"
	            GS.msg[18]= "\\E0* I\'ll show you how&  determined monsters&  can be!/"
	            GS.msg[19]= "\\E0* Step forward when&  you\'re ready^1!&* Fuhuhuhu!/%%"
	            if(ud > 0) {
	                GS.msg[7]= "\\E1* And^1! And!/"
	                GS.msg[8]= "\\E7*... and something\'s&  been bothering me^1,&  too./"
	                GS.msg[9]= "\\E4* The whole time I was&  chasing after you.../"
	                GS.msg[10]= "\\E7* I felt something..^1.&* Strange./"
	                GS.msg[11]= "* The echoes of something&  warm^1, something.../"
	                GS.msg[12]= "\\E9* Something like " + chr(ord('"')) + "I miss&  being friends with you." + chr(ord('"')) + "/"
	                GS.msg[13]= "\\E2* BUT THAT\'S RIDICULOUS!/"
	                GS.msg[14]= "\\E6I WOULD NEVER GET&  CHUMMY WITH A COWARD&  LIKE YOU!/"
	                GS.msg[15]= "\\E1* You^1!&* You must have been&  mind-controlling me!/"
	                GS.msg[16]= "\\E6* Manipulating people to&  make them like you..^1.&* What a Grade-A FREAK!/"
	                GS.msg[17]= "\\E1* Now enough^1!&* For everyone\'s hopes^1!&* For everyone\'s dreams!/"
	                GS.msg[18]= "\\E2* And for my own&  freaking dignity!/"
	                GS.msg[19]= "\\E3* I^1, UNDYNE^1, will&  knock you down!/%%"
	            }
	        }
	        if(q == 1) {
	            GS.msg[0]= "* YOU!/"
	            GS.msg[1]= "* You\'re standing in&  the way of everybody\'s&  hopes and dreams!/"
	            GS.msg[2]= "\\E4* Alphys\'s history books&  made me think humans&  were compassionate.../"
	            GS.msg[3]= "\\E1* BUT YOU?/"
	            GS.msg[4]= "\\E5* You\'re just a&  remorseless criminal!/"
	            GS.msg[5]= "* You wander through the&  caverns^1, attacking&  anyone in your path./"
	            GS.msg[6]= "\\E4* Self-defense^1?&* Please./"
	            GS.msg[7]= "* You didn\'t kill them&  because you had to./"
	            GS.msg[8]= "\\E5* You killed them&  because it was&  easy for you./"
	            GS.msg[9]= "* Because it was fun&  for you./"
	            GS.msg[10]= "\\E4* Do you think it&  was fun when I&  found out...?/"
	            GS.msg[11]= "* Do you think it\'s&  fun when people\'s&  family members.../"
	            GS.msg[12]= "* ... never come home^1?&* Is that fun?/"
	            if(GS.flag[81] == 1) {
	                GS.msg[11]= "* Shyren^1, who was&  just learning to&  sing.../"
	                GS.msg[12]= "* ... was dead^1, because&  of the whims of&  a single human?/"
	            }
	            if(GS.flag[57] == 2) {
	                GS.msg[11]= "* A teenage comedian&  who fell in with&  the wrong crowd.../"
	                GS.msg[12]= "* ... was dead^1, because&  of the whims of&  a single human?/"
	            }
	            if(GS.flag[52] == 1) {
	                GS.msg[11]= "* Doggo^1, who always&  made me laugh.../"
	                GS.msg[12]= "* ... was dead^1, because&  of the whims of&  a single human?/"
	            }
	            if(GS.flag[53] == 1) {
	                GS.msg[11]= "* Those two sweet dogs^1,&  who always took care&  of each other.../"
	                GS.msg[12]= "* ... were dead^1, because&  of the whims of&  a single human?/"
	            }
	            if(GS.flag[54] == 1) {
	                GS.msg[11]= "* That big dog^1, who&  wanted nothing more&  than to play.../"
	                GS.msg[12]= "* ... was dead^1, because&  of the whims of&  a single human?/"
	            }
	            if(GS.flag[55] == 1) {
	                GS.msg[11]= "* Lesser Dog^1, who&  wanted nothing more&  than affection.../"
	                GS.msg[12]= "* ... was dead^1, because&  of the whims of&  a single human?/"
	            }
	            if(GS.flag[55] == 1 and GS.flag[54] == 1 and GS.flag[53] == 1 and GS.flag[52]) {
	                GS.msg[11]= "* The Snowdin Canine&  Unit had been&  completely decimated./"
	                GS.msg[12]= "* My troops and friends^1,&  destroyed..^1.&* Is that fun?/"
	            }
	            GS.msg[13]= "\\E5* No./"
	            GS.msg[14]= "\\E3* But your time\'s up^1,&  villain!/"
	            GS.msg[15]= "\\E0* You won\'t hurt anyone&  else./"
	            GS.msg[16]= "* A knight in shining&  armor has appeared./"
	            GS.msg[17]= "\\E4* And all the pain&  you inflicted on&  the fallen.../"
	            GS.msg[18]= "* Every hope^1, every&  dream you\'ve turned&  to dust.../"
	            GS.msg[19]= "\\E0* She\'s gonna send&  right back through&  her spear!/"
	            GS.msg[20]= "\\E1* NGAHHH!!!/"
	            GS.msg[21]= "\\E0* I\'ll show you how&  determined monsters&  truly are!/"
	            GS.msg[22]= "* Come on^1!&* Step forward and&  let\'s end this!/%%"
	        }
	        g= instance_create(0, 0, 779/* obj_dialoguer */)
	        g.side= 1
	        con= 25
	    }
	    if(con == 25 and not instance_exists(782/* OBJ_WRITER */)) {
	        obj_mainchara.visible= 1
	        obj_mainchara.y= rememberyyy
	        view_yview[0]+= 8
	        if(view_yview[0] >= yy) {
	            save= instance_create(220, 660, 1351/* obj_savepoint */)
	            view_object[0]= 1570
	            obj_mainchara.cutscene= 0
	            GS.interact= 0
	            con= 26
	            GS.plot= 121
	            if(is_instance_valid(undyne)) {
	                with(undyne) instance_destroy()
	            }
	            instance_destroy()
	        }
	    }
	    if(con == 50) {
	        undyne.sprite_index= undyne.usprite
	        GS.msg[0]= "* .../"
	        GS.msg[1]= "* Forget it./%%"
	        con= 51
	        g= instance_create(0, 0, 779/* obj_dialoguer */)
	        g.side= 1
	    }
	    if(con == 51 and not instance_exists(782/* OBJ_WRITER */)) {
	        undyne.sprite_index= undyne.rsprite
	        con= 52
	        $Alarm4.start((60) / 30.0)
	    }
	    if(con == 53) {
	        undyne.sprite_index= undyne.dsprite
	        GS.typer= 37
	        GS.msc= 0
	        GS.facechoice= 5
	        GS.faceemotion= 4
	        GS.msg[0]= "* Look./"
	        GS.msg[1]= "* Papyrus didn\'t come&  to his meeting&  today./"
	        GS.msg[2]= "* Say what you want&  about him./"
	        GS.msg[3]= "* He\'s weird^1, he\'s&  naive^1, he\'s self-&  absorbed.../"
	        GS.msg[4]= "\\E5* But Papyrus has&  NEVER missed a&  meeting./"
	        GS.msg[5]= "\\E4* And no matter what&  time you call him&  on the phone.../"
	        GS.msg[6]= "* Night^1, day^1, afternoon^1,&  morning.../"
	        GS.msg[7]= "\\E5* He ALWAYS answers&  within the first&  two rings./"
	        GS.msg[8]= "\\E4* .../"
	        GS.msg[9]= "* But now he\'s gone./"
	        GS.msg[10]= "* And his brother&  isn\'t around^1,&  either./"
	        GS.msg[11]= "\\E5* .../"
	        GS.msg[12]= "* What did you do&  to him?/"
	        GS.msg[13]= "* What did you DO&  TO HIM?/"
	        GS.msg[14]= "\\E4* Papyrus^1, who I have&  trained every day.../"
	        GS.msg[15]= "* Even though I KNOW&  he\'s too goofy to&  ever hurt anyone.../"
	        GS.msg[16]= "\\E5* .../"
	        GS.msg[17]= "\\E4* Go ahead^1.&* Prepare however you&  want./"
	        GS.msg[18]= "\\E5* But when you step&  forward.../"
	        GS.msg[19]= "\\E1* I will KILL you./%%"
	        g= instance_create(0, 0, 779/* obj_dialoguer */)
	        g.side= 1
	        con= 25
	    }
	}

func _gm_event_7_11():
	if(playthesong == 0) {
	    GS.currentsong= caster_load("music/undynetruetheme.ogg")
	    caster_loop(GS.currentsong, 0.9, 1)
	    playthesong= 1
	}
	GS.flag[18]= 1
	fakedrawer= 1
	instance_create(0, 0, 118/* obj_flasher */)
	scr_shake(3, 3, 2)
	view_object[0]= object_index
	view_hborder[0]= 160
	view_vborder[0]= 100
	view_wview[0]= 160
	view_hview[0]= 120
	snd_play(51/* snd_damage */)
	GS.typer= 37
	GS.msc= 0
	instance_create(10 + xx, 150 + yy, 782/* OBJ_WRITER */)
	if(view_angle[0] <= 0) view_angle[0]= 10 + random(40)
	else  view_angle[0]= -1 - random(40)

func _on_outside_room():
	view_visible[1]= 0
	if(fakedrawer == 1 and instance_exists(782/* OBJ_WRITER */)) {
	    view_visible[1]= 1
	    draw_set_color(16777215)
	    draw_rectangle(xx + 16, yy + 160, xx + 304, yy + 235, 0)
	    draw_set_color(0)
	    draw_rectangle(xx + 19, yy + 163, xx + 301, yy + 232, 0)
	}

func _gm_event_9_32():
	if(GS.debug == 1) {
	    if(playthesong == 0) {
	        undyne= caster_load("music/undynetruetheme.ogg")
	        caster_loop(undyne, 1, 1)
	        playthesong= 1
	    }
	    GS.flag[18]= 1
	    fakedrawer= 1
	    instance_create(0, 0, 118/* obj_flasher */)
	    scr_shake(3, 3, 2)
	    view_object[0]= object_index
	    view_hborder[0]= 160
	    view_vborder[0]= 100
	    view_wview[0]= 160
	    view_hview[0]= 120
	    snd_play(51/* snd_damage */)
	    GS.typer= 5
	    GS.msc= 0
	    GS.msg[0]= "*TEST!!!/%%"
	    instance_create(10 + xx, 150 + yy, 782/* OBJ_WRITER */)
	    if(view_angle[0] <= 0) view_angle[0]= 10 + random(40)
	    else  view_angle[0]= -1 - random(40)
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
