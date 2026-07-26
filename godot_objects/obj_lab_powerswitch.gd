# Auto-converted from GameMaker: obj_lab_powerswitch
# GM parent: obj_readable
extends Node2D

func _ready():
	myinteract= 0
	talkedto= 0
	con= 0

func _gm_event_2_10():
	i= 0
	repeat(4)  {
	    am[i].velocity.y= 0
	    i++
	}
	$Alarm9.start((30) / 30.0)

func _gm_event_2_9():
	caster_play(tr, 0.7, 0.6 + random(0.3))
	i= 0
	repeat(4)  {
	    am[i].velocity.y= -1.5
	    i++
	}
	$Alarm10.start((15) / 30.0)

func _gm_event_2_4():
	con++

func _on_destroy():
	myinteract= 3
	GS.msc= 786
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	talkedto++

func _process_begin(delta: float):
	if(con == 5) {
	    GS.interact= 1
	    caster_pause(GS.currentsong)
	    snd_play(106/* snd_noise */)
	    con= 6
	    $Alarm4.start((60) / 30.0)
	}
	if(con == 6) GS.interact= 1
	if(con == 7) {
	    GS.facing= 0
	    dis= caster_load("music/sfx_disturbing.ogg")
	    caster_loop(dis, 0.4, 0.8)
	    tr= caster_load("music/sfx_generate.ogg")
	    am[0]= scr_marker(60, 280, 2126)
	    am[0].image_speed= 0.1
	    am[1]= scr_marker(120, 280, 2126)
	    am[1].image_speed= 0.1
	    am[2]= scr_marker(160, 280, 2126)
	    am[2].image_speed= 0.1
	    am[3]= scr_marker(220, 280, 2126)
	    am[3].image_speed= 0.1
	    con= 8
	    $Alarm9.start((30) / 30.0)
	    $Alarm4.start((350) / 30.0)
	}
	if(con == 9) {
	    caster_stop(dis)
	    i= 0
	    repeat(4)  {
	        am[i].velocity.y= 0
	        am[i].sprite_index= 2127/* spr_amalgam_sinkless2 */
	        i++
	    }
	    $Alarm9.start((-1) / 30.0)
	    $Alarm10.start((-1) / 30.0)
	    GS.facechoice= 0
	    GS.faceemotion= 0
	    GS.msc= 0
	    GS.typer= 47
	    GS.msg[0]= "* Hey^1!&* Stop!!!/%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 10
	}
	if(con == 10 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 11
	    $Alarm4.start((20) / 30.0)
	    al= instance_create(140, 280, 1171/* obj_alphys_actor */)
	    al.direction= 90
	    al.sprite_index= al.usprite
	    al.velocity.y= -6
	    am[1].velocity.x= -1
	    am[2].velocity.x= 1
	}
	if(con == 12) {
	    i= 0
	    repeat(4)  {
	        am[i].sprite_index= 2128/* spr_amalgam_sinkless3 */
	        i++
	    }
	    al.velocity.y= 0
	    al.fun= 1
	    al.sprite_index= al.utsprite
	    al.image_speed= 0
	    am[1].velocity.x= 0
	    am[2].velocity.x= 0
	    con= 13
	    $Alarm4.start((15) / 30.0)
	}
	if(con == 14) {
	    GS.facechoice= 6
	    GS.faceemotion= 6
	    GS.flag[430]= 3
	    GS.msg[0]= "* I got you guys some&  food^1, okay!?/%%"
	    d= instance_create(0, 0, 779/* obj_dialoguer */)
	    d.side= 0
	    con= 15
	}
	if(not instance_exists(782/* OBJ_WRITER */) and con == 15) {
	    i= 0
	    repeat(4)  {
	        am[i].sprite_index= 2126/* spr_amalgam_sinkless1 */
	        am[i].velocity.y= 3
	        i++
	    }
	    con= 16
	}
	if(con == 16 and am[0].y > view_yview[0] + 300) {
	    con= 20
	    i= 0
	    repeat(4)  {
	        am[i].sprite_index= 2126/* spr_amalgam_sinkless1 */
	        am[i].velocity.y= 0
	        i++
	    }
	}
	if(con == 20) {
	    GS.msg[0]= "\\E4* Sorry about that.../"
	    GS.msg[1]= "\\E2* They get kind of sassy&  when they don\'t get&  fed on time./"
	    GS.msg[2]= "\\E3* Um!!/"
	    if(GS.flag[495] > 0)
	        GS.msg[2]= "\\E3* I think they smelled&  the potato chips you&  had^1, and.../"
	    GS.msg[3]= "\\E3* Anyway!/"
	    GS.msg[4]= "\\E6* The power went out^1,&  and I\'ve been trying&  to turn it back on!/"
	    GS.msg[5]= "\\E4* But it seems like you&  were one step ahead&  of me./"
	    GS.msg[6]= "\\E2* This was probably just&  a big inconvenience&  for you.../"
	    GS.msg[7]= "\\E4* B-but I appreciate&  that you came here&  to back me up!/"
	    GS.msg[8]= "\\E4* As I said^1, I was&  afraid I might.../"
	    GS.msg[9]= "\\E8* Not come back.../"
	    GS.msg[10]= "\\E5* But that\'s not because&  of these guys or&  anything!/"
	    GS.msg[11]= "\\E4* I was just worried I&  would be too afraid.../"
	    GS.msg[12]= "\\E9* To tell the truth.../"
	    GS.msg[13]= "\\E8* That I might run away^1,&  or do something.../"
	    GS.msg[14]= "\\E9* Cowardly./"
	    GS.msg[15]= "* .../"
	    GS.msg[16]= "*\\E8 Uh..^1. I..^1.&* I suppose I owe you&  an explanation./"
	    GS.msg[17]= "\\E9* As you probably know^1,&  ASGORE asked me to study&  the nature of SOULs./"
	    GS.msg[18]= "\\E3* During my research^1, I&  isolated a power I&  called " + chr(ord('"')) + "determination." + chr(ord('"')) + "/"
	    GS.msg[19]= "\\E6* I injected it into dying&  monsters so their SOULs&  would last after death./"
	    GS.msg[20]= "\\E9* But the experiment&  failed./"
	    GS.msg[21]= "* You see^1, unlike humans\',&  monsters\' bodies don\'t&  have enough.../"
	    GS.msg[22]= "* Physical matter to take&  those concentrations&  of " + chr(ord('"')) + "determination." + chr(ord('"')) + "/"
	    GS.msg[23]= "* Their bodies started to&  melt^1, and lost what&  physicality they had./"
	    GS.msg[24]= "\\E3* Pretty soon^1, all of the&  test subjects had melted&  together into.../"
	    GS.msg[25]= "\\E8* Those./"
	    GS.msg[26]= "\\E9* Seeing them like this^1,&  I knew.../"
	    GS.msg[27]= "\\E8* I couldn\'t tell their&  families about it./"
	    GS.msg[28]= "\\E8* I couldn\'t tell anyone&  about it./"
	    GS.msg[29]= "\\E9* No matter how much&  everyone was asking me./"
	    GS.msg[30]= "\\E9* And I was too afraid to&  do any more work^1,&  knowing.../"
	    GS.msg[31]= "\\E8* ... everything I\'d done&  so far had been such&  a horrific failure./"
	    GS.msg[32]= "\\E9* ... but now./"
	    GS.msg[33]= "\\E9* Now^1, I\'ve changed my&  mind about all this./"
	    GS.msg[34]= "\\E9* I\'m going to tell&  everyone what I\'ve done./"
	    GS.msg[35]= "\\E9* .../"
	    GS.msg[36]= "* It\'s going to be hard./"
	    GS.msg[37]= "* Being honest..^1.&* Believing in my../"
	    GS.msg[38]= "* I\'m sure there will be&  times where I\'ll&  struggle./"
	    GS.msg[39]= "* I\'m sure there will be&  times where I screw&  up again./"
	    GS.msg[40]= "\\E0* But knowing^1, deep down^1,&  that I have friends&  to fall back on.../"
	    GS.msg[41]= "\\E7* I know it\'ll be a&  lot easier to stand&  on my own./"
	    GS.msg[42]= "* Thank you./%%"
	    con= 21
	    d= instance_create(0, 0, 779/* obj_dialoguer */)
	    d.side= 0
	}
	if(con == 21 and instance_exists(782/* OBJ_WRITER */)) {
	    sn= OBJ_WRITER.stringno
	    if(sn == 0) al.sprite_index= al.rtsprite
	    if(sn == 1 or sn == 3 or sn == 6 or sn == 9 or sn == 19)
	        al.sprite_index= al.utsprite
	    if(sn == 2 or sn == 5) al.sprite_index= al.rtsprite
	    if(sn == 8 or sn == 13) al.sprite_index= 1645/* spr_alphys_r_sad */
	}
	if(con == 21 and not instance_exists(782/* OBJ_WRITER */)) {
	    i= 0
	    repeat(4)  {
	        am[i].sprite_index= 2126/* spr_amalgam_sinkless1 */
	        am[i].velocity.y= -3
	        i++
	    }
	    con= 22
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 23) {
	    i= 0
	    repeat(4)  {
	        am[i].sprite_index= 2126/* spr_amalgam_sinkless1 */
	        am[i].image_speed= 0
	        am[i].velocity.y= 0
	        i++
	    }
	    al.sprite_index= al.dtsprite
	    con= 24
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 25) {
	    GS.msg[0]= "* Come on^1, guys./"
	    GS.msg[1]= "* It\'s time for everyone&  to go home./%%"
	    ds= instance_create(0, 0, 779/* obj_dialoguer */)
	    ds.side= 0
	    con= 26
	}
	if(con == 26 and not instance_exists(782/* OBJ_WRITER */)) {
	    al.velocity.y= 3
	    al.sprite_index= al.dsprite
	    al.image_speed= 0.25
	    i= 0
	    repeat(4)  {
	        am[i].sprite_index= 2126/* spr_amalgam_sinkless1 */
	        am[i].image_speed= 0.25
	        am[i].velocity.y= 3
	        i++
	    }
	    con= 27
	    $Alarm4.start((60) / 30.0)
	}
	if(con == 28) {
	    // obj_mainchara
	    with(1570) uncan= 0
	    GS.interact= 0
	    GS.flag[430]= 0
	    GS.flag[485]= 1
	    GS.flag[493]= 12
	    GS.flag[454]= 1
	    if(GS.plot < 201) GS.plot= 201
	    con= 0
	    caster_resume(GS.currentsong)
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
