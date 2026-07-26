# Auto-converted from GameMaker: obj_papyrus7
extends CharacterBody2D

func _ready():
	if(GS.plot > 66) instance_destroy()
	else  {
	    conversation= 0
	    scale.y= 999
	    sans= instance_create(820, 60, 1033/* obj_sans_actor */)
	    papyrus= instance_create(820, 90, 1032/* obj_papyrus_actor */)
	    papyrus.sprite_index= 1334/* spr_papyrus_lt */
	    sans.sprite_index= 1353/* spr_sans_d */
	}
	look= 0
	spinagain= 0
	murder= 0
	if(scr_murderlv() >= 5 and GS.flag[27] == 0) murder= 1
	scale.y= 4

func _gm_event_2_4():
	conversation++

func _on_destroy():
	// obj_cosmeticblcon
	with(1337) instance_destroy()

func _process(delta: float):
	if(conversation == 1) {
	    fade= instance_create(0, 0, 92/* obj_musfadeout */)
	    fade.fadespeed= 0.5
	    GS.currentsong= caster_load("music/papyrus.ogg")
	    caster_loop(GS.currentsong, 0.6, 1)
	    myinteract= 3
	    GS.msc= 0
	    GS.msc= 0
	    GS.typer= 19
	    GS.facechoice= 4
	    GS.faceemotion= 1
	    GS.interact= 1
	    papyrus.sprite_index= papyrus.ltsprite
	    sans.sprite_index= sans.ltsprite
	    obj_mainchara.cutscene= 1
	    camera= view_xview[0]
	    conversation= 1.5
	}
	if(conversation == 1.5) {
	    if(view_xview[0] < camera + 119)
	        view_xview[0]+= 3
	    else  conversation= 2
	}
	if(conversation == 2 and not instance_exists(782/* OBJ_WRITER */)) {
	    conversation= 3
	    xxblcon= instance_create(papyrus.x + 3, papyrus.y - 12, 1337/* obj_cosmeticblcon */)
	    $Alarm0.start((30) / 30.0)
	    $Alarm4.start((40) / 30.0)
	}
	if(conversation == 4) {
	    GS.msc= 0
	    GS.typer= 19
	    GS.facechoice= 4
	    GS.faceemotion= 4
	    GS.interact= 1
	    GS.msg[0]= "HUMAN!/"
	    GS.msg[1]= "THIS IS YOUR FINAL&AND MOST DANGEROUS&CHALLENGE!/"
	    GS.msg[2]= "BEHOLD^1!&THE GAUNTLET OF&DEADLY TERROR!/%%"
	    mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	    conversation= 6
	}
	if(conversation == 6 and not instance_exists(782/* OBJ_WRITER */)) {
	    dtrapa= instance_create(x + 20, y, 952/* obj_dtrapfire */)
	    dcannon= scr_marker(x + 170, 240, 1196)
	    dcannon.velocity.y= -0.7
	    with(dcannon) z_index= 4000
	    dspear1= scr_marker(x + 100, 310, 1194)
	    dspear1.scale.y= -1
	    dspear1.velocity.y= -0.9
	    with(dspear1) z_index= 4000
	    dspear2= scr_marker(x + 100, -60, 1194)
	    dspear2.velocity.y= 0.9
	    dspike= scr_marker(x + 20, -100, 1197)
	    dspike.velocity.y= 1.2
	    ddog= scr_marker(x + 170, -90, 1195)
	    ddog.velocity.y= 1.2
	    ddog.image_speed= 0.1
	    conversation= 6.1
	    $Alarm4.start((60) / 30.0)
	}
	if(conversation == 7.1) {
	    obj_npc_marker.velocity.y= 0
	    conversation= 7
	    $Alarm4.start((30) / 30.0)
	}
	if(conversation == 8) {
	    GS.msg[0]= "WHEN I SAY THE&WORD^1, IT WILL&FULLY ACTIVATE!!!/"
	    GS.msg[1]= "CANNONS WILL FIRE^1!&SPIKES WILL SWING^1!&BLADES WILL SLICE^1!/"
	    GS.msg[2]= "EACH PART WILL&SWING VIOLENTLY&UP AND DOWN!/"
	    GS.msg[3]= "ONLY THE TINIEST&CHANCE OF VICTORY&WILL REMAIN!!!/"
	    GS.msg[4]= "ARE YOU READY!?/"
	    GS.msg[5]= "BECAUSE!/"
	    GS.msg[6]= "I!/"
	    GS.msg[7]= "AM!/"
	    GS.msg[8]= "ABOUT!/"
	    GS.msg[9]= "TO DO IT!/%%"
	    mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	    conversation= 9
	}
	if(conversation == 9 and not instance_exists(782/* OBJ_WRITER */)) {
	    $Alarm4.start((120) / 30.0)
	    conversation= 10
	}
	if(conversation == 11) {
	    papyrus.sprite_index= papyrus.rtsprite
	    sans.sprite_index= sans.dtsprite
	    GS.typer= 17
	    GS.facechoice= 3
	    GS.faceemotion= 1
	    GS.msg[0]= " %"
	    GS.msg[1]= "* well^1?&* what\'s the holdup?/"
	    scr_papface(2, 1)
	    GS.msg[3]= "HOLDUP!^1?&WHAT HOLDUP!?/"
	    GS.msg[4]= "I\'M..^1.&I\'M ABOUT TO&ACTIVATE IT NOW!/%%"
	    mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	    conversation= 12
	}
	if(conversation == 12 and not instance_exists(782/* OBJ_WRITER */)) {
	    papyrus.sprite_index= papyrus.ltsprite
	    sans.sprite_index= sans.ltsprite
	    conversation= 13
	    $Alarm4.start((120) / 30.0)
	}
	if(conversation == 14) {
	    GS.typer= 17
	    GS.facechoice= 3
	    GS.faceemotion= 1
	    GS.msg[0]= " %"
	    GS.msg[1]= "* that^1, uh^1, doesn\'t look&  very activated./"
	    scr_papface(2, 1)
	    GS.msg[3]= "WELL!!!/"
	    GS.msg[4]= "THIS CHALLENGE!!!/"
	    GS.msg[5]= "\\E3IT SEEMS.../"
	    GS.msg[6]= "MAYBE..^1. TOO EASY&TO DEFEAT THE&HUMAN WITH./"
	    GS.msg[7]= "\\E1YEAH^1!&WE CAN\'T USE&THIS ONE!!!/"
	    GS.msg[8]= "I AM A SKELETON&WITH STANDARDS!!!/"
	    GS.msg[9]= "MY PUZZLES ARE&VERY FAIR!/"
	    GS.msg[10]= "AND MY TRAPS ARE&EXPERTLY COOKED!/"
	    GS.msg[11]= "BUT THIS METHOD&IS TOO DIRECT^1!&NO CLASS AT ALL!/"
	    GS.msg[12]= "\\E0AWAY IT GOES!/%%"
	    if(murder == 1) {
	        GS.msg[3]= "WELL!!!/"
	        GS.msg[4]= "\\E3... THEY\'RE PROBABLY&GOING TO WALK&THROUGH IT./"
	        GS.msg[5]= "AND IT WON\'T BE&ANY FUN AT ALL./"
	        scr_sansface(6, 0)
	        GS.msg[7]= "* hmmm...&* so this human thing&  was a bust^1, huh?/"
	        scr_papface(8, 3)
	        GS.msg[9]= "WELL^1. I MEAN^1.&I\'M EXCITED TO&CAPTURE THEM./"
	        GS.msg[10]= "\\E0SO I\'LL BECOME&A FAMOUS ROYAL&GUARDSMAN!!!/"
	        GS.msg[11]= "\\E3BUT ALL THE TIME&I PUT INTO THESE&PUZZLES.../"
	        GS.msg[12]= "IT\'S KIND OF LIKE&THROWING A&BIRTHDAY PARTY.../"
	        scr_sansface(13, 2)
	        GS.msg[14]= "* without traps and fire?/"
	        scr_papface(15, 4)
	        GS.msg[16]= "EXACTLY!^1!&IT\'S POINTLESS!!!/"
	        GS.msg[17]= "\\E3MAYBE YOU WERE&RIGHT TO BE LAZY&ABOUT PUZZLES./"
	        scr_sansface(18, 1)
	        GS.msg[19]= "* me^1?&* right about something^1?&* really?/"
	        scr_papface(20, 3)
	        GS.msg[21]= ".../"
	        GS.msg[22]= "\\E0YEAH!^1!&WHAT AM I SAYING!/"
	        GS.msg[23]= "YOU\'RE STILL&COMPLETELY WRONG!/"
	        GS.msg[24]= "I JUST HAVE THE&WRONG AUDIENCE!/"
	        GS.msg[25]= "THINK ABOUT HOW&MUCH FUN UNDYNE&WOULD HAVE HERE!/"
	        GS.msg[26]= "FLAMES^1, VIOLENCE^1.&IT\'S RIGHT UP HER&ALLEY!/"
	        GS.msg[27]= "SO I WON\'T WASTE&THIS PUZZLE ON&YOU./"
	        GS.msg[28]= "I JUST HAVE TO&APPRECIATE.../"
	        GS.msg[29]= "THE FRIEND I&ALREADY HAVE!!!/%%"
	    }
	    mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	    conversation= 15
	}
	if(conversation == 15 and not instance_exists(782/* OBJ_WRITER */)) {
	    dtrapa.$Alarm1.start((1) / 30.0)
	    $Alarm4.start((60) / 30.0)
	    conversation= 15.5
	    dcannon.velocity.y= 2
	    dspear1.velocity.y= 2
	    dspear2.velocity.y= -2
	    dspike.velocity.y= -2
	    ddog.velocity.y= -2
	}
	if(conversation == 16.5) {
	    with(dcannon) instance_destroy()
	    with(dspear1) instance_destroy()
	    with(dspear2) instance_destroy()
	    with(dspike) instance_destroy()
	    with(ddog) instance_destroy()
	    GS.faceemotion= 3
	    papyrus.sprite_index= papyrus.rtsprite
	    GS.msg[0]= "PHEW!/%%"
	    conversation= 15.7
	    mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	}
	if(conversation == 15.7 and not instance_exists(782/* OBJ_WRITER */)) {
	    xxblcon= instance_create(papyrus.x + 3, papyrus.y - 12, 1337/* obj_cosmeticblcon */)
	    $Alarm0.start((30) / 30.0)
	    conversation= 16
	    $Alarm4.start((40) / 30.0)
	}
	if(conversation == 17) {
	    papyrus.sprite_index= papyrus.ltsprite
	    GS.faceemotion= 1
	    GS.msg[0]= "WHAT ARE YOU&LOOKING AT!?/"
	    GS.msg[1]= "THIS WAS ANOTHER&DECISIVE VICTORY&FOR PAPYRUS!!/"
	    GS.msg[2]= "NYEH!!/"
	    GS.msg[3]= "HEH!!/"
	    GS.msg[4]= ".../"
	    GS.msg[5]= "\\E3HEH???/%%"
	    if(murder == 1) {
	        GS.msg[0]= "A VALUABLE LIFE&LESSON!!!/"
	        GS.msg[1]= "NYEH HEH HEH!!!/%%"
	    }
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    conversation= 18
	}
	if(conversation == 18 and not instance_exists(782/* OBJ_WRITER */)) {
	    conversation= 19
	    instance_create(0, 0, 92/* obj_musfadeout */)
	    papyrus.npcdir= 1
	    papyrus.velocity.x= 4
	    $Alarm4.start((30) / 30.0)
	}
	if(conversation == 20) {
	    if(view_xview[0] > camera)
	        view_xview[0]-= 3
	    else  conversation= 21
	}
	if(conversation == 21) {
	    flowey= instance_create(80, 120, 1339/* obj_stalkerflowey */)
	    obj_mainchara.cutscene= 0
	    GS.currentsong= caster_load("music/snowy.ogg")
	    caster_loop(GS.currentsong, 1, 0.95)
	    GS.plot= 67
	    GS.interact= 0
	    instance_create(sans.x, sans.y, 1022/* obj_sans_room */)
	    with(sans) instance_destroy()
	    with(papyrus) instance_destroy()
	    instance_destroy()
	}

func _on_alarm_0_timeout():
	if(conversation == 0) conversation= 1

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
