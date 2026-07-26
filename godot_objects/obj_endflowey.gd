# Auto-converted from GameMaker: obj_endflowey
extends Node2D

func _ready():
	$Alarm4.start((80) / 30.0)
	con= 0
	flowey= 1
	fimg= 0
	facetype= 0

func _gm_event_2_4():
	con++

func _process(delta: float):
	if(con == 1) {
	    ini_open("undertale.ini")
	    AF= ini_read_real("Flowey", "AF", 0)
	    AK= ini_read_real("Flowey", "AK", 0)
	    NK= ini_read_real("Flowey", "NK", 0)
	    IK= ini_read_real("Flowey", "IK", 0)
	    CK= ini_read_real("Flowey", "CK", 0)
	    CHANGE= ini_read_real("Flowey", "CHANGE", 0)
	    EX= ini_read_real("Flowey", "EX", 0)
	    truename= ini_read_real("Flowey", "truename", 0)
	    ini_close()
	    if(EX == 0) con= 100
	    if(EX == 1) con= 110
	    if(EX == 2) con= 120
	    if(EX == 3) con= 130
	    if(EX >= 4) con= 140
	    if(GS.flag[476] == 1) GS.kills++
	    if((NK > 0 or CHANGE > 0) and CHANGE < 2 and GS.kills >= 1)
	        con= 70
	    if(IK > 0 and CHANGE == 0 and GS.kills == 0) con= 60
	    if(AK == 0 and IK > 0 and GS.flag[476] == 1 and GS.kills == 1)
	        con= 30
	    if(NK == 0 and IK == 0 and GS.kills >= 1) con= 50
	    if(NK == 0 and IK == 0 and GS.flag[45] != 4 and GS.flag[67] <= 0 and GS.flag[350] != 1 and GS.flag[425] == 0 and GS.kills <= 0)
	        con= 10
	    if(AF == 0 and GS.flag[45] != 4 and GS.flag[67] <= 0 and GS.flag[350] != 1 and GS.flag[425] == 0 and GS.flag[389] >= 3 and GS.flag[493] >= 10 and GS.kills <= 0)
	        con= 20
	    if(truename == 1) con= 80
	}
	if(con == 10) {
	    ini_open("undertale.ini")
	    ini_write_real("Flowey", "NK", 1)
	    ini_close()
	    GS.msc= 0
	    GS.typer= 68
	    GS.msg[0]= "\\E0Why...?/"
	    GS.msg[1]= "Why did you let me go? /"
	    GS.msg[2]= "\\E7Don\'t you realize that&being nice.../"
	    GS.msg[3]= "\\E1... just makes you&get hurt?/"
	    GS.msg[4]= "\\E0Look at your/"
	    GS.msg[5]= "\\E9You made all these&great friends.../"
	    GS.msg[6]= "\\E0But now^1, you\'ll probably&never see them again./"
	    GS.msg[7]= "\\E9Not to mention how&much they\'ve been&set back by you./"
	    GS.msg[8]= "\\E6Hurts^1, doesn\'t it?/"
	    GS.msg[9]= "\\E7If you had just gone&through without caring&about anyone.../"
	    GS.msg[10]= "\\E6You wouldn\'t have to&feel bad now./"
	    GS.msg[11]= "\\E0So I don\'t get it./"
	    GS.msg[12]= "\\E7If you really did&everything the right&way../"
	    GS.msg[13]= "\\E0Why did things still&end up like this?/"
	    GS.msg[14]= "\\E6Why...?/"
	    GS.msg[15]= "\\E5Is life really&that unfair?/"
	    GS.msg[16]= "\\E9.../"
	    GS.msg[17]= "\\E0Say./"
	    GS.msg[18]= "\\E9What if I told you.../"
	    GS.msg[19]= "\\E0I knew some way&to get you a better&ending?/"
	    GS.msg[20]= "\\E9You\'ll have to load&your SAVE file, and.../"
	    if(not file_exists("file0"))
	        GS.msg[20]= "\\E9You\'ll have to&start over^1, and.../"
	    if(GS.flag[389] >= 3)
	        GS.msg[21]= "\\E0Well, in the meantime^1,&why don\'t you go see&Dr. Alphys?/"
	    else 
	        GS.msg[21]= "\\E0Well^1, in the meantime^1,&why don\'t you go see&Undyne?/"
	    if(GS.flag[88] < 4)
	        GS.msg[21]= "\\E0Well^1, in the meantime^1,&why don\'t you go see&Papyrus^1, then Undyne?/"
	    GS.msg[22]= "\\E9It seems like you&could have been&better friends./"
	    GS.msg[23]= "Who knows..^1. maybe&she\'s got the key&to your happiness...?/"
	    GS.msg[24]= "\\E4See you soon./%%"
	    instance_create(60, 60, 782/* OBJ_WRITER */)
	    con= 2
	}
	if(con == 20) {
	    ini_open("undertale.ini")
	    ini_write_real("Flowey", "AF", 1)
	    ini_close()
	    GS.msc= 0
	    GS.typer= 68
	    GS.msg[0]= "But^1, despite everything^1,&your happy ending&didn\'t come./"
	    GS.msg[1]= "\\E5Why...?/"
	    GS.msg[2]= "\\E4I know why./"
	    GS.msg[3]= "\\E4Go to Dr. Alphys./"
	    GS.msg[4]= "\\E5Your date with her&has really just&begun./%%"
	    instance_create(60, 60, 782/* OBJ_WRITER */)
	    con= 2
	}
	if(con == 30) {
	    ini_open("undertale.ini")
	    ini_write_real("Flowey", "AK", 1)
	    ini_close()
	    GS.msc= 0
	    GS.typer= 68
	    GS.msg[0]= "So you went the&whole way through&without killing.../"
	    GS.msg[1]= "\\E5And then you decided&to kill ASGORE?/"
	    GS.msg[2]= "\\E6What the hell is&WRONG with you?/"
	    GS.msg[3]= "\\E4You COMPLETELY missed&the point./"
	    GS.msg[4]= "\\E2Are you trolling me?/"
	    GS.msg[5]= "\\E0Because./"
	    GS.msg[6]= "\\E4No./"
	    GS.msg[7]= "\\E5You are only&trolling your/"
	    GS.msg[8]= "\\E6What a waste of&everybody\'s time./"
	    GS.msg[9]= "\\E7All you had to&do was make friends./"
	    GS.msg[10]= "With Papyrus^1, Undyne^1,&and then Alphys./"
	    GS.msg[11]= "\\E2But you were too&busy messing it up!/%%"
	    instance_create(60, 60, 782/* OBJ_WRITER */)
	    con= 2
	}
	if(con == 50) {
	    facetype= 1
	    ini_open("undertale.ini")
	    ini_write_real("Flowey", "IK", 1)
	    ini_close()
	    GS.msc= 0
	    GS.typer= 68
	    GS.msg[0]= "Hey./"
	    GS.msg[1]= "Since you defeated me./"
	    GS.msg[2]= "I\'ve been thinking./"
	    GS.msg[3]= "\\E3Is killing things&really necessary?/"
	    GS.msg[4]= "\\E1I.../"
	    GS.msg[5]= "\\E3I honestly don\'t&know anymore./"
	    GS.msg[6]= "\\E0I have a request&for you./"
	    GS.msg[7]= "\\E4Prove to me.../"
	    GS.msg[8]= "\\E5Prove to me you&are strong enough&to survive./"
	    GS.msg[9]= "\\E6Get here from&the beginning./"
	    GS.msg[10]= "\\E0Without killing a&single thing.../"
	    if(GS.flag[476] == 0)
	        GS.msg[11]= "\\E4... and I won\'t&kill the king./"
	    else  GS.msg[11]= "\\E4... and^1, maybe.../"
	    GS.msg[12]= "\\E7Then you\'ll have&your so-called&" + chr(ord('"')) + "happy ending." + chr(ord('"')) + "/"
	    GS.msg[13]= "\\E6So^1, what will&it be?/"
	    GS.msg[14]= "\\E5Will you prove&yourself?/"
	    GS.msg[15]= "\\E8Or will I get to&watch you suffer...?/"
	    GS.msg[16]= "Either way^1, I\'m&interested!!!/"
	    GS.msg[17]= "\\E4Hee hee hee.../%%"
	    instance_create(60, 60, 782/* OBJ_WRITER */)
	    con= 2
	}
	if(con == 60) {
	    facetype= 1
	    ini_open("undertale.ini")
	    ini_write_real("Flowey", "CHANGE", 1)
	    ini_close()
	    GS.msc= 0
	    GS.typer= 68
	    GS.msg[0]= "Interesting.../"
	    GS.msg[1]= "\\E6So^1, even with&everything you did.../"
	    GS.msg[2]= "\\E5The outcome\'s still&the same./"
	    GS.msg[3]= "\\E9In the end^1, your&choices were an&illusion./"
	    GS.msg[4]= "\\E9NOTHING you do&really matters!/"
	    GS.msg[5]= "\\E8Hee hee hee!/"
	    GS.msg[6]= "\\E8.../"
	    GS.msg[7]= "\\E0Well./"
	    GS.msg[8]= "\\E6You DID do what&I told you./"
	    GS.msg[9]= "\\E5I guess it\'s up&to me to get you a&REAL happy ending./"
	    GS.msg[10]= "\\E0For starters^1, you&can\'t do it by&your/"
	    GS.msg[11]= "Papyrus^1, Undyne^1,&Alphys..^1. these guys./"
	    GS.msg[12]= "\\E4Are you friends with&all of them yet?/"
	    GS.msg[13]= "\\E5Maybe you should go&back and..^1. " + chr(ord('"')) + "hang" + chr(ord('"')) + "&with them./"
	    GS.msg[14]= "\\E4The power of&friendship.../"
	    GS.msg[15]= "That always saves&the day^1, right?/%%"
	    instance_create(60, 60, 782/* OBJ_WRITER */)
	    con= 2
	}
	if(con == 70) {
	    facetype= 1
	    ini_open("undertale.ini")
	    ini_write_real("Flowey", "CHANGE", 2)
	    ini_close()
	    GS.msc= 0
	    GS.typer= 68
	    GS.msg[0]= "\\E0So^1, killing people&is ACTUALLY fine...?/"
	    GS.msg[1]= "\\E4Sure./"
	    GS.msg[2]= "I\'m glad we agree on&the value of a life./"
	    GS.msg[3]= "I\'ve learned SO&MUCH from you./"
	    GS.msg[4]= "\\E0Though..^1. are you&REALLY gonna keep&doing things halfway?/"
	    GS.msg[5]= "\\E8The amount of people&you killed.../"
	    GS.msg[6]= "\\E9It\'s honestly&DISAPPOINTING./"
	    GS.msg[7]= "\\E8You IDIOT./"
	    GS.msg[8]= "\\E4You really can\'t do&ANYTHING right./%%"
	    instance_create(60, 60, 782/* OBJ_WRITER */)
	    con= 2
	}
	if(con == 80) {
	    facetype= 1
	    ini_open("undertale.ini")
	    ini_write_real("Flowey", "SPECIALK", 1)
	    ini_close()
	    GS.msc= 0
	    GS.typer= 68
	    GS.msg[0]= "Why^1, " + GS.charname + "...?/"
	    GS.msg[1]= "\\E3Why?/"
	    GS.msg[2]= "\\E1WHY?/"
	    GS.msg[3]= "\\E8We were on our way&to REAL victory.../"
	    GS.msg[4]= "\\E9On our way to making&up for LAST time!/"
	    GS.msg[5]= "\\E2Why\'d you have to&SCREW IT UP?/"
	    GS.msg[6]= "\\E5Hahaha.../"
	    GS.msg[7]= "\\E9Is this REVENGE?/"
	    if(GS.kills <= 3)
	        GS.msg[8]= "\\E1Making me watch you&act so pure and&happy^1, while I...?/"
	    else 
	        GS.msg[8]= "\\E1Making me watch you&live out your life^1,&while I...?/"
	    GS.msg[9]= "\\E1.../"
	    GS.msg[10]= "\\E7No./"
	    GS.msg[11]= "\\E8NO./"
	    GS.msg[12]= "I KNOW what you\'re&doing./"
	    GS.msg[13]= "You just want to see&what it\'s all like./"
	    GS.msg[14]= "Before we TEAR IT&AWAY from them./"
	    GS.msg[15]= "Ahahaha.../"
	    GS.msg[16]= "\\E9Genius^1, " + GS.charname + "./"
	    GS.msg[17]= "\\E4Well^1, I\'ll let you&mess around./"
	    GS.msg[18]= "\\E8I know you\'ll come&back eventually./"
	    GS.msg[19]= "\\E9And when that time&comes.../"
	    GS.msg[20]= "\\E4" + GS.charname + "./"
	    GS.msg[21]= "\\E4I\'ll be waiting&for you./%%"
	    instance_create(60, 60, 782/* OBJ_WRITER */)
	    con= 2
	}
	if(con == 100) {
	    facetype= 1
	    ini_open("undertale.ini")
	    ini_write_real("Flowey", "EX", 1)
	    ini_close()
	    GS.msc= 0
	    GS.typer= 68
	    GS.msg[0]= "Why do you keep&coming back here?/"
	    GS.msg[1]= "\\E5Oh^1, I get it^1.&You wanna be friends^1,&huh...?/"
	    GS.msg[2]= "\\E8You\'re PATHETIC./"
	    GS.msg[3]= "\\E8You REALLY think I&want to be friends&with YOU?/"
	    GS.msg[4]= "\\E5Heh.../"
	    GS.msg[5]= "\\E9You really DON\'T&get it^1, do you?/"
	    GS.msg[6]= "\\E5There\'s only one&person I could care&about anymore./"
	    GS.msg[7]= "\\E6And even then^1, I&couldn\'t TRULY care&about them./"
	    GS.msg[8]= "\\E5I just like to think&there\'s someone out&there.../"
	    GS.msg[9]= "Someone that I&won\'t get tired of./"
	    GS.msg[10]= "\\E8Someone like ME./"
	    GS.msg[11]= "\\E8.../"
	    GS.msg[12]= "\\E0Say./"
	    GS.msg[13]= "\\E4Quit looking at me&with that stupid&expression./"
	    GS.msg[14]= "You\'re pissing me&off./%%"
	    instance_create(60, 60, 782/* OBJ_WRITER */)
	    con= 2
	}
	if(con == 110) {
	    facetype= 1
	    ini_open("undertale.ini")
	    ini_write_real("Flowey", "EX", 2)
	    ini_close()
	    GS.msc= 0
	    GS.typer= 68
	    GS.msg[0]= "\\E0So you\'re here&again./"
	    GS.msg[1]= "\\E2What\'s wrong with&you?/"
	    GS.msg[2]= "\\E4Are you trying to&start the Flowey&Fan Club?/"
	    GS.msg[3]= "\\E5Because if you&want to join THAT.../"
	    GS.msg[4]= "\\E4You\'ll have to&talk to Papyrus./"
	    GS.msg[5]= "\\E6Yeah^1, he started&one./"
	    GS.msg[6]= "\\E5A few different&times^1, anyway./"
	    GS.msg[7]= "\\E0I won\'t lie./"
	    GS.msg[8]= "\\E4He\'s one of the&better characters&to mess around with./"
	    GS.msg[9]= "\\E5Took me a long&time to get bored&of that one./"
	    GS.msg[10]= "\\E7... Yeah./"
	    GS.msg[11]= "\\E4Talk to him&about it./%%"
	    instance_create(60, 60, 782/* OBJ_WRITER */)
	    con= 2
	}
	if(con == 120) {
	    facetype= 1
	    ini_open("undertale.ini")
	    ini_write_real("Flowey", "EX", 3)
	    ini_close()
	    GS.msc= 0
	    GS.typer= 68
	    GS.msg[0]= "\\E0So./"
	    GS.msg[1]= "\\E4Did you start the&Flowey Fan Club?/"
	    GS.msg[2]= "\\E5Ha^1.&I\'m just kidding./"
	    GS.msg[3]= "\\E9I was watching^1.&I know you didn\'t./"
	    GS.msg[4]= "\\E5But I don\'t care^1.&Really./"
	    GS.msg[5]= "\\E6He probably would&have invited his&garbage brother./"
	    GS.msg[6]= "\\E4You know^1.&Smiley Trashbag./"
	    GS.msg[7]= "\\E0.../"
	    GS.msg[8]= "\\E4Say./"
	    GS.msg[9]= "If I have ONE piece&of advice for you.../"
	    GS.msg[10]= "\\E9DON\'T./"
	    GS.msg[11]= "Let his brother./"
	    GS.msg[12]= "Find out ANYTHING&about you./"
	    GS.msg[13]= "\\E6He\'ll..^1. well.../"
	    GS.msg[14]= "\\E5Let\'s just say./"
	    GS.msg[15]= "\\E9He\'s caused me more&than my fair share&of resets./"
	    GS.msg[16]= "\\E4Stay away from&that guy./%%"
	    instance_create(60, 60, 782/* OBJ_WRITER */)
	    con= 2
	}
	if(con == 130) {
	    facetype= 1
	    ini_open("undertale.ini")
	    ini_write_real("Flowey", "EX", 4)
	    ini_close()
	    GS.msc= 0
	    GS.typer= 68
	    GS.msg[0]= "\\E0Why do you keep&coming back here?/"
	    GS.msg[1]= "You don\'t REALLY&want to be friends^1,&do you...?/"
	    GS.msg[2]= ".../"
	    GS.msg[3]= "\\E4No^1. I get it./"
	    GS.msg[4]= "You\'re just like me^1,&aren\'t you?/"
	    GS.msg[5]= "You don\'t care about&anyone./"
	    GS.msg[6]= "\\E4You\'re just bored./"
	    GS.msg[7]= "You just want to&see what I\'ll say./"
	    GS.msg[8]= "\\E5So you can laugh&and throw me away&like a broken toy./"
	    GS.msg[9]= "\\E8Well^1, TOO BAD!/"
	    GS.msg[10]= "\\E9I\'m not LIKE everybody&else./"
	    GS.msg[11]= "\\E9So, from now on.../"
	    GS.msg[12]= "\\E4You\'re not getting&ANYTHING./%%"
	    instance_create(60, 60, 782/* OBJ_WRITER */)
	    con= 2
	}
	if(con == 140) {
	    facetype= 1
	    ini_open("undertale.ini")
	    ini_write_real("Flowey", "EX", 5)
	    ini_close()
	    GS.typer= 68
	    GS.msc= 0
	    GS.msg[0]= ".../"
	    GS.msg[1]= "\\E4Don\'t you have&anything BETTER to do?/%%"
	    instance_create(60, 60, 782/* OBJ_WRITER */)
	    con= 2
	}
	if(con == 2 and not instance_exists(782/* OBJ_WRITER */)) {
	    flowey= 3
	    con= 3
	    $Alarm4.start((100) / 30.0)
	}
	if(con == 4) get_tree().change_scene_to_file("res://godot_rooms/323.tscn")

func _on_outside_room():
	if(flowey == 1) {
	    draw_sprite_ext(647/* spr_flowey_riseanim2 */, fimg, 140, 140, 1, 1, 0, 16777215, 1)
	    if(fimg < 8) fimg+= 0.5
	    else  flowey= 2
	}
	if(flowey == 2) {
	    draw_sprite_ext(647/* spr_flowey_riseanim2 */, fimg, 140, 140, 1, 1, 0, 16777215, 1)
	    if(facetype == 0)
	        draw_sprite_ext(644/* spr_floweyface_l */, GS.faceemotion, 140, 140, 1, 1, 0, 16777215, 1)
	    if(facetype == 1)
	        draw_sprite_ext(645/* spr_floweyface_l2 */, GS.faceemotion, 140, 140, 1, 1, 0, 16777215, 1)
	}
	if(flowey == 3) {
	    draw_sprite_ext(623/* spr_flowey_riseanim */, fimg, 140, 140, 1, 1, 0, 16777215, 1)
	    if(fimg > 0) fimg-= 0.5
	    else  flowey= 4
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
