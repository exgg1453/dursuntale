# Auto-converted from GameMaker: obj_undynebattle2
# GM parent: obj_monsterparent
extends Node2D

func _ready():
	scr_monstersetup(0, 0, 0, 0, 0)
	image_speed= 0
	// obj_battlebg
	with(185) instance_destroy()
	part1= 274
	mypart1= _spawn("part1", x, y)
	$Alarm9.start((8) / 30.0)
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
	encourage= 0
	criticize= 0
	hug= 0
	con= 0
	blconx= x + 150
	blcony= y + 10
	GS.faceemotion= 7
	turnt= 0
	ht= 150
	wd= 150

func _gm_event_1_0():
	if(mercymod > 10 and GS.monsterhp[myself] == GS.monstermaxhp[myself])
	    GS.goldreward[3]+= 10
	scr_monsterdefeat(0, 0, 0, 0, 0)
	with(mypart1) instance_destroy()

func _gm_event_2_9():
	mypart1.parent= GS.monsterinstance[myself]

func _gm_event_2_6():
	blcon= instance_create(blconx, blcony, 187/* obj_blconwdflowey */)
	gg= floor(random(3))
	mycommand= round(random(100))
	GS.msg[0]= "..."
	if(turnt == 0) GS.msg[0]= "Show me what&you\'ve got!"
	if(turnt == 1) GS.msg[0]= "Do your worst!"
	if(turnt == 2) GS.msg[0]= "What\'s the&matter, scared?"
	if(turnt == 3) GS.msg[0]= "\\E6What the hell&is the holdup?"
	if(turnt == 4) GS.msg[0]= "COME ON ALREADY!"
	if(turnt == 5) GS.msg[0]= "IT\'S GETTING&HOT IN HERE!"
	turnt++
	GS.msg[1]= "%%%"
	GS.typer= 41
	blconwd= instance_create(blcon.x + 25, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	GS.border= 17
	obj_heart.x= round((GS.idealborder[0] + GS.idealborder[1]) / 2) - 8
	obj_heart.y= round((GS.idealborder[2] + GS.idealborder[3]) / 2) - 8

func _gm_event_2_5():
	with(blconwd) instance_destroy()
	with(blcon) instance_destroy()
	talked= 0
	GS.mnfight= 2

func _gm_event_2_4():
	con++

func _gm_event_2_3():
	if(con == 19) {
	    con= 20
	    dmgwriter= instance_create(x, y - 24, 189/* obj_dmgwriter */)
	    GS.damage= 1
	    with(dmgwriter) dmg= 1
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
	    GS.faceemotion= 6
	    caster_stop(GS.batmusic)
	    con= 15
	    GS.hurtanim[myself]= 99
	}
	if(GS.hurtanim[myself] == 2 and con == 20) {
	    with(dmgwriter) $Alarm2.start((15) / 30.0)
	    con= 20.1
	    GS.myfight= 0
	    GS.mnfight= 99
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
	    if(attacked == 0 and mycommand >= 0)
	        GS.msg[0]= "* Undyne is letting you make&  the first attack."
	    attacked= 1
	    GS.turntimer= -1
	    GS.mnfight= 3
	    whatiheard= -1
	}
	if(GS.myfight == 2 and whatiheard != -1 and GS.heard == 0) {
	    if(whatiheard == 0) {
	        GS.msc= 0
	        GS.msg[0]= "* UNDYNE - ATK 41 DEF 21&* This time^1, don\'t hold&  anything back!/^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	        whatiheard= 9
	    }
	    if(whatiheard == 3) {
	        con= 80
	        GS.msc= 0
	        GS.msg[0]= "* You pretend to swing at&  UNDYNE with all your might./%%"
	        encourage= 0
	        criticize++
	        hug= 0
	        mercymod= -200
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    GS.heard= 1
	}
	if(con == 0) {
	    obj_heart.x= -200
	    con= 1
	    $Alarm4.start((20) / 30.0)
	}
	if(con == 1) {
	    GS.myfight= 0
	    GS.mnfight= 99
	    obj_heart.x= -200
	}
	if(con == 2) con= 4.1
	if(con == 4.1) {
	    GS.typer= 39
	    GS.msc= 0
	    GS.msg[0]= "I\'ve been&defeated..^1.&My house is in&shambles.../"
	    GS.msg[1]= "I even failed to&befriend you./"
	    GS.msg[2]= "That\'s it./"
	    GS.msg[3]= "\\E8I don\'t care if&you\'re my guest&anymore./"
	    GS.msg[4]= "\\E6One final rematch^1!&All out on both&sides!!!/"
	    GS.msg[5]= "IT\'S THE ONLY WAY&I CAN REGAIN MY&LOST PRIDE!!!/"
	    GS.msg[6]= "NOW COME ON^1!&HIT ME WITH&ALL YOU\'VE GOT!&NGAHHHH!!!/%%"
	    scr_blcon_x(blconx, blcony)
	    obj_heart.x= -200
	    con= 4.2
	}
	if(con == 4.2) scr_textskip()
	if(con == 4.2 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.faceemotion= 8
	    GS.msg[0]= "* Undyne is letting you make&  the first attack."
	    GS.mnfight= 3
	    GS.myfight= 0
	    con= 5
	}
	if(con == 15) {
	    wht= scr_marker(-2, -2, 999)
	    wht.z_index= -99999
	    wht.image_speed= 0
	    wht.scale.x= 400
	    wht.scale.y= 400
	    wht.modulate.a= 0
	    con= 16
	}
	if(con == 16) {
	    wht.modulate.a+= 0.02
	    if(wht.modulate.a >= 1) {
	        con= 17
	        $Alarm4.start((45) / 30.0)
	    }
	}
	if(con == 18) {
	    with(wht) instance_destroy()
	    con= 19
	    shudder= 8
	    $Alarm3.start((1) / 30.0)
	    GS.hurtanim[myself]= 3
	}
	if(con == 20.1) {
	    con= 20.2
	    $Alarm4.start((70) / 30.0)
	}
	if(con == 21.2) {
	    GS.msc= 0
	    GS.typer= 39
	    GS.msg[0]= "What./"
	    GS.msg[1]= "\\E2That\'s the best&you can manage?/"
	    GS.msg[2]= "\\E3Even attacking at&full force.../"
	    GS.msg[3]= "You just can\'t&muster any intent&to hurt me^1,&huh?/"
	    GS.msg[4]= "\\E4.../"
	    GS.msg[5]= "\\E7Heh^1, you know&what?/%%"
	    scr_blcon_x(blconx, blcony)
	    con= 23
	}
	if(con == 23) scr_textskip()
	if(con == 23 and not instance_exists(782/* OBJ_WRITER */)) {
	    mypart1.off= 1
	    if(mypart1.noanim == 1) con= 24
	}
	if(con == 24) {
	    GS.msc= 0
	    GS.typer= 39
	    GS.msg[0]= "I don\'t actually&want to hurt you&either./"
	    GS.msg[1]= "At first^1, I hated&your stupid&saccharine&schtick^1, but.../"
	    GS.msg[2]= "\\E3The way you hit&me right now^1,&it.../"
	    GS.msg[3]= "\\E4Reminded me of&someone I used&to train with./"
	    GS.msg[4]= "\\E7Now I know you&aren\'t just some&wimpy loser./"
	    GS.msg[5]= "\\E9You\'re a wimpy&loser with a&big heart!/"
	    GS.msg[6]= "\\E4Just like him.../"
	    GS.msg[7]= "\\E7.../"
	    GS.msg[8]= "\\E3Listen^1, human./"
	    GS.msg[9]= "\\E2It seems that you&and ASGORE are&fated to fight./"
	    GS.msg[10]= "\\E3But knowing him.../"
	    GS.msg[11]= "\\E4He probably&doesn\'t want to./"
	    GS.msg[12]= "\\E2Talk to him./"
	    GS.msg[13]= "\\E1I\'m sure you can&persuade him to&let you go home./"
	    GS.msg[14]= "\\E3Eventually^1, some&mean human will&fall down here.../"
	    GS.msg[15]= "\\E3And I\'ll take&THEIR soul instead./"
	    GS.msg[16]= "\\E1That makes sense^1,&right^1?&Fuhuhu./"
	    GS.msg[17]= "\\E2Oh^1, and if you&DO hurt ASGORE.../"
	    GS.msg[18]= "\\E7I\'ll take the&human souls..^1.&Cross the barrier.../"
	    GS.msg[19]= "\\E6And beat the&hell out of you!/"
	    GS.msg[20]= "\\E9That\'s what friends&are for^1, right?/"
	    GS.msg[21]= "\\E9Fuhuhu!/"
	    GS.msg[22]= "\\E9Now let\'s get the&hell out of this&flaming house!/%%"
	    scr_blcon_x(blconx - 70, blcony)
	    con= 25
	}
	if(con == 25) scr_textskip()
	if(con == 25 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 26
	    $Alarm4.start((15) / 30.0)
	}
	if(con == 27) {
	    instance_create(0, 0, 149/* obj_unfader */)
	    con= 28
	    $Alarm4.start((12) / 30.0)
	}
	if(con == 29) {
	    ini_open("undertale.ini")
	    udhd= ini_read_real("Undyne", "UD", 0)
	    ini_write_real("Undyne", "UD", udhd + 1)
	    ini_close()
	    GS.phasing= 0
	    GS.flag[17]= 0
	    GS.mercy= 0
	    instance_create(0, 0, 148/* obj_persistentfader */)
	    GS.flag[389]= 3
	    get_tree().change_scene_to_file("res://godot_rooms/117.tscn")
	}
	if(con == 80 and not instance_exists(782/* OBJ_WRITER */)) {
	    snd_play(44/* snd_laz */)
	    GS.damage= 1
	    GS.hurtanim[myself]= 1
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
