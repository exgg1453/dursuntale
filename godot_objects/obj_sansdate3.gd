# Auto-converted from GameMaker: obj_sansdate3
extends Node2D

func _ready():
	con= 20
	if(GS.flag[413] != 1) instance_destroy()
	else  peeepee= 34892348932

func _gm_event_2_4():
	con++

func _process(delta: float):
	if(con == 20) {
	    con= 21
	    GS.facing= 3
	    sans= scr_marker(obj_mainchara.x - 86, obj_mainchara.y, 1363)
	    sans.z_index= 800
	    sans.image_speed= 0
	    // obj_mainchara
	    with(1570) {
	        view_xview[0]= round(x - view_wview[0] / 2 + 10)
	        view_yview[0]= round(y - view_hview[0] / 2 + 10)
	    }
	    obj_mainchara.cutscene= 1
	    view_object[0]= -4
	    idealx= view_xview[0]
	    view_xview[0]-= 40
	    if(GS.interact == 0) GS.interact= 1
	    GS.msc= 0
	    GS.facechoice= 3
	    GS.faceemotion= 0
	    GS.typer= 17
	    caster_free(-3)
	    GS.currentsong= caster_load("music/sansdate.ogg")
	    con= 21
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 22) {
	    caster_loop(GS.currentsong, 0.8, 1)
	    con= 30
	    GS.msg[0]= "* well^1, here we are./%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	}
	if(con == 30 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.msg[0]= "* so./"
	    GS.msg[1]= "* your journey\'s&  almost over^1, huh?/"
	    GS.msg[2]= "\\E0* you must really&  wanna go home./"
	    GS.msg[3]= "\\E1* hey^1.&* i know the feeling^1,&  buddo./"
	    GS.msg[4]= "\\E0* though.../"
	    GS.msg[5]= "\\E1* maybe sometimes it\'s&  better to take what\'s&  given to you./"
	    GS.msg[6]= "\\E0* down here you\'ve&  already got food^1,&  drink^1, friends.../"
	    GS.msg[7]= "* is what you have&  to do.../"
	    GS.msg[8]= "\\E1* really worth it?/%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 31
	}
	if(con == 31 and not instance_exists(782/* OBJ_WRITER */)) {
	    sans.sprite_index= 1362/* spr_sans_u */
	    con= 32
	    $Alarm4.start((80) / 30.0)
	}
	if(con == 33 and not instance_exists(782/* OBJ_WRITER */)) {
	    sans.sprite_index= 1363/* spr_sans_r */
	    GS.faceemotion= 3
	    GS.msg[0]= "* .../"
	    GS.msg[1]= "\\E1* ah^1, forget it./"
	    GS.msg[2]= "\\E0* i\'m rootin\' for&  ya^1, kid./%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 34
	}
	if(con == 34 and not instance_exists(782/* OBJ_WRITER */)) {
	    sans.sprite_index= 1362/* spr_sans_u */
	    con= 34.5
	    $Alarm4.start((80) / 30.0)
	}
	if(con == 35.5 and not instance_exists(782/* OBJ_WRITER */)) {
	    sans.sprite_index= 1363/* spr_sans_r */
	    GS.faceemotion= 0
	    GS.msg[0]= "* hey./"
	    GS.msg[1]= "\\E1* let me tell you&  a story./"
	    GS.msg[2]= "\\E0* so i\'m a sentry in&  snowdin forest^1, right?/"
	    GS.msg[3]= "* i sit out there&  and watch for humans^1.&* it\'s kind of boring./"
	    GS.msg[4]= "\\E2* fortunately^1, deep in&  the forest.../"
	    GS.msg[5]= "\\E0* there\'s this HUGE&  locked door./"
	    GS.msg[6]= "* and it\'s perfect&  for practicing&  knock knock jokes./"
	    GS.msg[7]= "* so one day^1, i\'m&  knocking \'em out^1,&  like usual./"
	    GS.msg[8]= "* i knock on the&  door and say&  " + chr(ord('"')) + "knock knock." + chr(ord('"')) + "/"
	    GS.msg[9]= "* and suddenly^1, from&  the other side.../"
	    GS.msg[10]= "\\E1* i hear a woman\'s&  voice./"
	    GS.msg[11]= "\\Tt*\\E0 " + chr(ord('"')) + "who is there?" + chr(ord('"')) + " /"
	    GS.msg[12]= "\\Ts*\\E1 so^1, naturally^1, I&  respond:/"
	    GS.msg[13]= "\\E0* " + chr(ord('"')) + "dishes." + chr(ord('"')) + "/"
	    GS.msg[14]= "\\Tt* " + chr(ord('"')) + "dishes who?" + chr(ord('"')) + "/"
	    GS.msg[15]= "\\Ts*\\E2 " + chr(ord('"')) + "dishes a very&  bad joke." + chr(ord('"')) + "/"
	    GS.msg[16]= "\\E0* then she just&  howls with laughter./"
	    GS.msg[17]= "\\E1* like it\'s the best&  joke she\'s heard&  in a hundred years./"
	    GS.msg[18]= "\\E0* so I keep \'em&  coming^1, and she keeps&  laughing./"
	    GS.msg[19]= "\\E1* she\'s the best&  audience i\'ve ever&  had./"
	    GS.msg[20]= "\\E0* then^1, after a&  dozen of \'em^1,&  SHE knocks and says.../"
	    GS.msg[21]= "\\Tt* " + chr(ord('"')) + "Knock knock!" + chr(ord('"')) + "/"
	    GS.msg[22]= "\\Ts* \\E1i say " + chr(ord('"')) + "whos&  there?" + chr(ord('"')) + "/"
	    GS.msg[23]= "\\Tt* \\E0" + chr(ord('"')) + "old lady!" + chr(ord('"')) + "/"
	    GS.msg[24]= "\\Ts*\\E1 " + chr(ord('"')) + "old lady who?" + chr(ord('"')) + "/"
	    GS.msg[25]= "\\Tt*\\E2 " + chr(ord('"')) + "oh! I did not&  know you could&  yodel!" + chr(ord('"')) + "/"
	    GS.msg[26]= "\\Ts*\\E1 wow./"
	    GS.msg[27]= "\\E2* needless to say^1,&  this woman was&  extremely good./"
	    GS.msg[28]= "\\E0* we kept telling&  each other jokes&  for hours./"
	    GS.msg[29]= "\\E0* eventually^1, i had&  to leave./"
	    GS.msg[30]= "\\E2* papyrus gets kind&  of cranky without&  his bedtime story./"
	    GS.msg[31]= "\\E0* but she told me&  to come by again^1,&  and so i did./"
	    GS.msg[32]= "\\E0* then i did again^1.&* and again^1.&* it\'s a thing now./"
	    GS.msg[33]= "* telling bad jokes&  through the door./"
	    GS.msg[34]= "\\E1* it rules./%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 36
	}
	if(con == 36 and not instance_exists(782/* OBJ_WRITER */)) {
	    sans.sprite_index= 1362/* spr_sans_u */
	    con= 37
	    $Alarm4.start((80) / 30.0)
	}
	if(con == 38 and not instance_exists(782/* OBJ_WRITER */)) {
	    sans.sprite_index= 1363/* spr_sans_r */
	    GS.faceemotion= 1
	    GS.msg[0]= "* .../"
	    GS.msg[1]= "\\E0* one day^1, though^1, i&  noticed she wasn\'t&  laughing very much./"
	    GS.msg[2]= "* i asked her what&  was up./"
	    GS.msg[3]= "* then she told me&  something strange./"
	    GS.msg[4]= "* \\Tt" + chr(ord('"')) + "if a human ever&  comes through this&  door.../" + chr(ord('"')) + ""
	    GS.msg[5]= "* " + chr(ord('"')) + "... could you please^1,&  please promise&  something?" + chr(ord('"')) + "/"
	    GS.msg[6]= "* " + chr(ord('"')) + "watch over them^1,&  and protect them^1,&  will you not?" + chr(ord('"')) + "/"
	    GS.msg[7]= "\\E0*\\Ts now^1, i hate making&  promises./"
	    GS.msg[8]= "\\E1* and this woman^1,&  i don\'t even know&  her name./"
	    GS.msg[9]= "\\E3* but.../"
	    GS.msg[10]= "\\E1* someone who sincerely&  likes bad jokes.../"
	    GS.msg[11]= "\\E2* has an integrity&  you can\'t say&  " + chr(ord('"')) + "no" + chr(ord('"')) + " to./%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 39
	}
	if(con == 39 and not instance_exists(782/* OBJ_WRITER */)) {
	    sans.sprite_index= 1362/* spr_sans_u */
	    con= 40
	    $Alarm4.start((83) / 30.0)
	    vol= caster_get_volume(GS.currentsong)
	    vol2= caster_get_volume(GS.currentsong)
	}
	if(con == 40) {
	    if(vol > 0) vol-= 0.01
	    caster_set_volume(GS.currentsong, vol)
	}
	if(con == 41 and not instance_exists(782/* OBJ_WRITER */)) {
	    sans.sprite_index= 1363/* spr_sans_r */
	    caster_pause(GS.currentsong)
	    GS.faceemotion= 1
	    GS.msg[0]= "\\E1* do you get what&  i\'m saying?/"
	    GS.msg[1]= "\\E0* that promise i made&  to her.../"
	    GS.msg[2]= "\\E1* you know what would&  have happened if she&  hadn\'t said anything?/"
	    GS.msg[3]= "\\E3* ... buddy./%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 42
	}
	if(con == 42 and not instance_exists(782/* OBJ_WRITER */)) {
	    sans.sprite_index= 1362/* spr_sans_u */
	    con= 43
	    $Alarm4.start((60) / 30.0)
	}
	if(con == 44 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.faceemotion= 4
	    GS.typer= 21
	    GS.msg[0]= "* ... You\'d be dead&  where you stand./%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 45
	}
	if(con == 45 and not instance_exists(782/* OBJ_WRITER */)) {
	    caster_resume(GS.currentsong)
	    con= 46
	    $Alarm4.start((60) / 30.0)
	}
	if(con == 46) {
	    if(vol < vol2) vol+= 0.01
	    caster_set_volume(GS.currentsong, vol)
	}
	if(con == 47 and not instance_exists(782/* OBJ_WRITER */)) {
	    sans.sprite_index= 1363/* spr_sans_r */
	    GS.faceemotion= 1
	    GS.typer= 17
	    GS.msg[0]= "\\E3* .../"
	    GS.msg[1]= "\\E1* hey^1, lighten up^1,&  bucko!/"
	    GS.msg[2]= "\\E2* i\'m just joking&  with you./"
	    GS.msg[3]= "\\E1* besides.../"
	    GS.msg[4]= "\\E0* haven\'t i done a&  great job protecting&  you?/"
	    GS.msg[5]= "* i mean^1, look at&  your/"
	    GS.msg[6]= "\\E2* you haven\'t died&  a single time./"
	    ini_open("undertale.ini")
	    ddd= ini_read_real("General", "Gameover", 0)
	    GS.msg[7]= "\\E0* that\'s right^1, isn\'t&  it?/"
	    GS.msg[8]= "\\E2* well^1, chalk it&  up to my great&  skills./%%"
	    if(ddd > 0) {
	        GS.msg[7]= "\\E0* hey^1, what\'s that&  look supposed to&  mean?/"
	        GS.msg[8]= "\\E1* am i wrong...?/%%"
	    }
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 48
	}
	if(con == 48 and not instance_exists(782/* OBJ_WRITER */)) {
	    sans.sprite_index= 1362/* spr_sans_u */
	    con= 49
	    $Alarm4.start((90) / 30.0)
	}
	if(con == 50) {
	    sans.sprite_index= 1363/* spr_sans_r */
	    GS.faceemotion= 3
	    GS.msg[0]= "* heh./%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 51
	}
	if(con == 51 and not instance_exists(782/* OBJ_WRITER */)) {
	    sans.sprite_index= 1362/* spr_sans_u */
	    con= 51.1
	    $Alarm4.start((40) / 30.0)
	}
	if(con == 51.1) {
	    sans.image_speed= 0.2
	    sans.y-= 2
	}
	if(con == 52.1) {
	    sans.image_speed= 0
	    sans.frame= 0
	    con= 51.2
	    $Alarm4.start((20) / 30.0)
	}
	if(con == 52.2) {
	    sans.sprite_index= 1363/* spr_sans_r */
	    con= 51.3
	    $Alarm4.start((20) / 30.0)
	}
	if(con == 52.3) {
	    sans.sprite_index= 1353/* spr_sans_d */
	    con= 52
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 53) {
	    GS.faceemotion= 2
	    GS.msg[0]= "* well^1, that\'s all./"
	    GS.msg[1]= "\\E1* take care of&  yourself^1, kid./"
	    GS.msg[2]= "\\E0* \'cause someone really&  cares about you./%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 54
	}
	if(con == 54 and not instance_exists(782/* OBJ_WRITER */)) {
	    sans.sprite_index= 1367/* spr_sans_l */
	    sans.image_speed= 0.2
	    sans.velocity.x= -3
	    con= 55
	    $Alarm4.start((80) / 30.0)
	}
	if(con == 56) {
	    con= 57
	    $Alarm4.start((40) / 30.0)
	}
	if(con == 57) view_xview[0]++
	if(con == 58) {
	    view_xview[0]= idealx
	    GS.facing= 0
	    view_object[0]= 1570
	    obj_mainchara.cutscene= 0
	    GS.interact= 0
	    con= 59
	    GS.flag[413]= 2
	    instance_destroy()
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
