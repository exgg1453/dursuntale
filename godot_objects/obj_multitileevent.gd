# Auto-converted from GameMaker: obj_multitileevent
extends Node2D

func _ready():
	con= 0
	if(GS.plot > 167) instance_destroy()
	else  con= 1

func _gm_event_2_4():
	con++

func _process(delta: float):
	if(con == 1) {
	    GS.phasing= 1
	    GS.flag[17]= 1
	    GS.interact= 1
	    obj_mainchara.x= 140
	    obj_mainchara.y= -20
	    obj_mainchara.velocity.y= 3
	    con= 2
	    turntimer= 0
	}
	if(con == 2) {
	    turntimer++
	    if(turntimer > 15) {
	        turntimer= 0
	        GS.facing++
	        if(GS.facing > 3) GS.facing= 0
	    }
	    if(obj_mainchara.y > 100) {
	        con= 3
	        obj_mainchara.velocity.y= 0
	        $Alarm4.start((23) / 30.0)
	        mett= instance_create(140, -20, 1206/* obj_mettaton_flightdress */)
	        mett.velocity.y= 3
	    }
	}
	if(con == 4) {
	    mett.velocity.y= 0
	    con= 5
	    $Alarm4.start((20) / 30.0)
	}
	if(con == 6) {
	    GS.msc= 0
	    GS.typer= 27
	    GS.facechoice= 0
	    GS.msg[0]= "* OH NO!&* WHATEVER SHALL I DO?/"
	    GS.msg[1]= "* MY LOVE HAS BEEN CAST AWAY&  INTO THE DUNGEON./"
	    GS.msg[2]= "* A DUNGEON WITH A PUZZLE SO&  DASTARDLY^1, MY PARAMOUR WILL&  SURELY PERISH!/%%"
	    dia= instance_create(0, 0, 779/* obj_dialoguer */)
	    dia.side= 1
	    con= 7
	}
	if(con == 7 and not instance_exists(782/* OBJ_WRITER */)) {
	    view_object[0]= -4
	    obj_mainchara.cutscene= 1
	    view_xview[0]+= 5
	    if(view_xview[0] >= 96) {
	        view_xview[0]= 100
	        con= 8
	        $Alarm4.start((15) / 30.0)
	    }
	}
	if(con == 9) {
	    GS.msg[0]= "* O, HEAVENS HAVE MERCY!&* THE HORRIBLE COLORED TILE&  MAZE!/"
	    GS.msg[1]= "* EACH COLORED TILE HAS ITS&  OWN SADISTIC FUNCTION./"
	    GS.msg[2]= "* FOR EXAMPLE, A GREEN TILE&  SOUNDS A NOISE, AND THEN&  YOU MUST FIGHT A MONSTER./"
	    GS.msg[3]= "* RED TILES WILL...&* ACTUALLY, WAIT A SECOND./"
	    GS.msg[4]= "* DIDN\'T WE SEE THIS PUZZLE&  ABOUT A HUNDRED ROOMS&  AGO?/"
	    GS.msg[5]= "* THAT\'S RIGHT.&* YOU REMEMBER ALL THE&  RULES, DON\'T YOU?/"
	    GS.msg[6]= "* GREAT...&* THEN I WON\'T WASTE YOUR&  TIME REPEATING THEM!!/%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 10
	}
	if(con == 10 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 11
	    $Alarm4.start((40) / 30.0)
	}
	if(con == 12) {
	    GS.msg[0]= "* OH, AND YOU\'D BETTER HURRY./"
	    GS.msg[1]= "\\W* BECAUSE IF YOU DON\'T GET&  THROUGH IN \\Y30 SECONDS\\W.../%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 13
	}
	if(con == 13 and not instance_exists(782/* OBJ_WRITER */)) {
	    view_xview[0]-= 5
	    if(view_xview[0] <= 4) {
	        view_xview[0]= 0
	        con= 14
	        $Alarm4.start((20) / 30.0)
	    }
	}
	if(con == 15) {
	    snd_play(106/* snd_noise */)
	    flame1= instance_create(40, 20, 1200/* obj_flamedrawer */)
	    flame2= instance_create(1160, 20, 1200/* obj_flamedrawer */)
	    con= 16
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 17) {
	    GS.msg[0]= "* YOU\'LL BE INCINERATED BY&  THESE JETS OF FIRE!!/"
	    GS.msg[1]= "* AHAHAHAHAHAHA!&* AHAHA... HA... HA!/"
	    GS.msg[2]= "* MY POOR LOVE!&* I\'M SO FILLED WITH GRIEF,&  I CAN\'T STOP LAUGHING!/"
	    GS.msg[3]= "* GOOD LUCK, DARLING!/%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 18
	}
	if(con == 18 and not instance_exists(782/* OBJ_WRITER */)) {
	    racesong= caster_load("music/operatile.ogg")
	    // obj_mettaton_flightdress
	    with(1206) {
	        middle= 1
	        event_user(1)
	    }
	    caster_play(racesong, 1, 1)
	    cooltimer= 900
	    instance_create(0, 0, 1209/* obj_tilehud */)
	    flavor= 0
	    GS.phasing= 0
	    obj_mainchara.cutscene= 0
	    view_object[0]= 1570
	    GS.interact= 0
	    con= 20
	}
	if(con == 20) {
	    if(not instance_exists(1212/* obj_tileguy */) and obj_mainchara.x > get_viewport_rect().size.x / 2) {
	        GS.interact= 1
	        con= 75
	    }
	    cooltimer--
	    if(cooltimer == 0) con= 30
	}
	if(con == 30) {
	    // obj_insidiousconveyor
	    with(1211) {
	        collide= 0
	        active= -1
	    }
	    obj_tileguytileparent.grey= 1
	    // obj_mettaton_flightdress
	    with(1206) middle= 2
	    GS.facing= 2
	    obj_mainchara.visible= 1
	    GS.interact= 1
	    if(instance_exists(1212/* obj_tileguy */)) {
	        // obj_tileguy
	        with(1212) instance_destroy()
	    }
	    if(flame1.x < view_xview[0] - 20)
	        flame1.x= view_xview[0] - 20
	    if(flame2.x > view_xview[0] + view_wview[0])
	        flame2.x= view_xview[0] + view_wview[0]
	    con= 31
	    $Alarm4.start((60) / 30.0)
	}
	if(con == 31) {
	    GS.interact= 1
	    GS.facing= 2
	}
	if(con == 32) {
	    // obj_tilehud
	    with(1209) finished= 1
	    GS.typer= 27
	    GS.facechoice= 0
	    GS.msc= 0
	    GS.msg[0]= "* OOOOH, I\'M SO SORRY!&* LOOKS LIKE YOU\'RE OUT OF&  TIME!!!/%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 33
	}
	if(con == 33 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 34
	    $Alarm4.start((40) / 30.0)
	}
	if(con == 34) {
	    if(flame1.x < obj_mainchara.x - 20) flame1.x+= 2
	    if(flame2.x > obj_mainchara.x + 20) flame2.x-= 2
	}
	if(con == 35) {
	    GS.msg[0]= "* HERE COME THE FLAMES, DARLING!/%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 36
	}
	if(con == 36 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 37
	    $Alarm4.start((40) / 30.0)
	}
	if(con == 37 and not instance_exists(782/* OBJ_WRITER */)) {
	    if(flame1.x < obj_mainchara.x - 20) flame1.x++
	    if(flame2.x > obj_mainchara.x + 20) flame2.x--
	}
	if(con == 38) {
	    GS.msg[0]= "* THEY\'RE CLOSING IN!/%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 39
	}
	if(con == 39 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 40
	    $Alarm4.start((40) / 30.0)
	}
	if(con == 40 and not instance_exists(782/* OBJ_WRITER */)) {
	    if(flame1.x < obj_mainchara.x - 20)
	        flame1.x+= 0.5
	    if(flame2.x > obj_mainchara.x + 20)
	        flame2.x-= 0.5
	}
	if(con == 41) {
	    GS.msg[0]= "* GETTING!&* CLOSER!&* OH MY!/%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 42
	}
	if(con == 42 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 43
	    $Alarm4.start((40) / 30.0)
	}
	if(con == 43 and not instance_exists(782/* OBJ_WRITER */)) {
	    if(flame1.x < obj_mainchara.x - 20)
	        flame1.x+= 0.5
	    if(flame2.x > obj_mainchara.x + 20)
	        flame2.x-= 0.5
	}
	if(con == 44) {
	    GS.msg[0]= "* ANY MINUTE NOW!!!/%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 45
	}
	if(con == 45 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 46
	    $Alarm4.start((90) / 30.0)
	}
	if(con == 46 and not instance_exists(782/* OBJ_WRITER */)) {
	    if(flame1.x < obj_mainchara.x - 20)
	        flame1.x+= 0.5
	    if(flame2.x > obj_mainchara.x + 20)
	        flame2.x-= 0.5
	}
	if(con == 47) {
	    GS.msg[0]= "* ...&* ...&* (ROBOTIC COUGH)/%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 48
	}
	if(con == 48 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 49
	    $Alarm4.start((20) / 30.0)
	}
	if(con == 50) {
	    GS.typer= 5
	    GS.facechoice= 0
	    GS.faceemotion= 6
	    snd_play(104/* snd_phone */)
	    GS.msg[0]= "* Ring.../"
	    GS.msg[1]= "* \\TS \\F6 \\TA %"
	    GS.msg[2]= "* Watch out!^1!&* I\'ll save you!!/"
	    GS.msg[3]= "* I\'m hacking into the&  firewall right now!/%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 51
	}
	if(con == 51 and not instance_exists(782/* OBJ_WRITER */)) {
	    snd_play(106/* snd_noise */)
	    with(flame1) instance_destroy()
	    with(flame2) instance_destroy()
	    con= 52
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 53) {
	    GS.facechoice= 0
	    GS.typer= 27
	    GS.msg[0]= "* OH NO!!!&* HOW COULD THIS HAPPEN???/"
	    GS.msg[1]= "* FOILED AGAIN BY THE BRILLIANT&  DOCTOR ALPHYS!!/%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 54
	}
	if(con == 54 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 55
	    $Alarm4.start((90) / 30.0)
	}
	if(con == 56) {
	    GS.faceemotion= 5
	    GS.facechoice= 0
	    GS.typer= 27
	    GS.msg[0]= "* THA-%"
	    GS.msg[1]= "\\TS \\F6 \\TA %"
	    GS.msg[2]= "\\E6* That\'s right!/"
	    GS.msg[3]= "\\E6* Come on^1, Mettaton^1,&  give up already!/"
	    GS.msg[4]= "* You\'ll never be&  able to defeat&  us.../"
	    GS.msg[5]= "\\E0* Not as long as&  we work together!/"
	    GS.msg[6]= "\\E6* Your puzzle\'s over..&* Now go home and&  leave us alone!/"
	    GS.msg[7]= "\\TS \\F0 \\TM %"
	    GS.msg[8]= "* PUZZLE^1?&* OVER?/"
	    GS.msg[9]= "* ALPHYS^1, DARLING^1, WHAT ARE YOU&  TALKING ABOUT...?/"
	    GS.msg[10]= "* DID YOU FORGET WHAT THE&  GREEN TILES DO?/"
	    GS.msg[11]= "* THEY MAKE A SOUND, THEN&  YOU HAVE TO FIGHT A MONSTER./"
	    GS.msg[12]= "* WELL, DARLING...&* THAT MONSTER.../"
	    GS.msg[13]= "* IS ME!!/%%"
	    if(GS.flag[289] == 0) {
	        GS.msg[12]= "* WELL, DARLING...!/"
	        GS.msg[13]= "* WELL, WELL, WELL./"
	        GS.msg[14]= "* WELLY WELL WELL./"
	        GS.msg[15]= "* WELL WELLY WELL WELL,&  WELL WELL WELLY./"
	        GS.msg[16]= "* YOU NEVER STEPPED ON A&  GREEN TILE./"
	        GS.msg[17]= "* .../"
	        GS.msg[18]= "* AND NOW YOU\'RE GOING TO DIE./%%"
	    }
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 55.1
	}
	if(con == 55.1 and not instance_exists(782/* OBJ_WRITER */)) {
	    caster_free(racesong)
	    con= 56.1
	    $Alarm4.start((20) / 30.0)
	    mett.velocity.y= 3
	    snd_play(30/* snd_break2 */)
	}
	if(con == 57.1 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 58
	    GS.battlegroup= 57
	    GS.mercy= 1
	    instance_create(0, 0, 142/* obj_battler */)
	    talkedto= 0
	    $Alarm4.start((32) / 30.0)
	}
	if(con == 58 and GS.interact == 0) GS.interact= 1
	if(con == 59) {
	    if(instance_exists(1206/* obj_mettaton_flightdress */)) {
	        // obj_mettaton_flightdress
	        with(1206) instance_destroy()
	    }
	    obj_mainchara.cutscene= 0
	    view_object[0]= 1570
	    GS.interact= 1
	    if(GS.interact == 0) GS.interact= 1
	    con= 60
	    $Alarm4.start((15) / 30.0)
	}
	if(con == 60) GS.interact= 1
	if(con == 61) {
	    GS.mercy= 0
	    if(GS.interact == 0) GS.interact= 1
	    GS.typer= 5
	    GS.facechoice= 0
	    GS.faceemotion= 0
	    GS.msc= 690
	    GS.facing= 0
	    snd_play(104/* snd_phone */)
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 62
	}
	if(con == 62 and not instance_exists(782/* OBJ_WRITER */)) {
	    if(instance_exists(1570/* obj_mainchara */) and obj_mainchara.x >= 340)
	        flowey= instance_create(100, 120, 1339/* obj_stalkerflowey */)
	    GS.mercy= 0
	    GS.border= 0
	    GS.currentsong= caster_load("music/anothermedium.ogg")
	    caster_loop(GS.currentsong, 1, 1)
	    GS.interact= 0
	    GS.flag[17]= 0
	    GS.plot= 168
	    instance_destroy()
	}
	if(con == 75) {
	    // obj_mettaton_flightdress
	    with(1206) middle= 2
	    obj_mettaton_flightdress.sing= -1
	    caster_free(-3)
	    obj_tileguytileparent.grey= 1
	    snd_play(26/* snd_dumbvictory */)
	    GS.interact= 1
	    con= 76
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 76) GS.interact= 1
	if(con == 77) {
	    // obj_tilehud
	    with(1209) finished= 1
	    GS.typer= 27
	    GS.facechoice= 0
	    GS.msc= 0
	    GS.flag[278]= 1
	    GS.msg[0]= "* CONGRATULATIONS!/"
	    GS.msg[1]= "* YOU MADE IT THROUGH THE&  PUZZLE!!!/"
	    GS.msg[2]= "* AND NOW, WITHOUT FURTHER ADO,&  THE FLAMES WILL BE DEACTIVATED!/%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 78
	}
	if(con == 78 and not instance_exists(782/* OBJ_WRITER */)) {
	    snd_play(106/* snd_noise */)
	    with(flame1) instance_destroy()
	    with(flame2) instance_destroy()
	    con= 79
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 80) {
	    GS.facechoice= 0
	    GS.typer= 27
	    GS.msc= 0
	    GS.msg[0]= "* NO!&* MORE!&* FIRE!/"
	    GS.msg[1]= "* ... BUT IT\'S AS THE PHRASE&  GOES./"
	    GS.msg[2]= "* " + chr(ord('"')) + "OUT OF THE FIRE, AND INTO&  THE FRYING PAN." + chr(ord('"')) + "/"
	    GS.msg[3]= "* THAT\'S RIGHT, DARLING!/"
	    GS.msg[4]= "* EVEN IF YOU MANAGE TO BEAT&  THE HEAT.../"
	    GS.msg[5]= "* YOU\'LL NEVER BE ABLE TO&  WITHSTAND MY HOT METAL&  BODY!/"
	    GS.msg[6]= "* PREPARE YOURSELF FOR MY %%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 81
	}
	if(con == 81 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.typer= 5
	    GS.facechoice= 0
	    GS.faceemotion= 6
	    snd_play(104/* snd_phone */)
	    GS.msg[0]= "* Ring.../"
	    GS.msg[1]= "* \\TS \\F6 \\TA %"
	    GS.msg[2]= "* Watch out!^1!&* I\'ll save you!!/"
	    GS.msg[3]= "* Flames^1, deactivate!!/"
	    GS.msg[4]= "* .../"
	    GS.msg[5]= "\\E3* ... huh?/"
	    GS.msg[6]= "\\TS \\F0 \\TM %"
	    GS.msg[7]= "* THE HUMAN FINISHED THE PUZZLE./"
	    GS.msg[8]= "* I ALREADY TURNED OFF THE&  FLAMES./"
	    GS.msg[9]= "* IN FACT, I WAS ABOUT TO&  FIGHT THE HUMAN./"
	    GS.msg[10]= "\\TS \\F6 \\TA %"
	    GS.msg[11]= "* Wh-wh-what?&* TH-THAT puzzle?/"
	    GS.msg[12]= "\\E5* I mean, uhh.../"
	    GS.msg[13]= "\\E6* Great job!&* We\'ve got him on&  the ropes^1, now!/"
	    GS.msg[14]= "\\TS \\F0 \\TM %"
	    GS.msg[15]= "* ON THE ROPES^1?&* HA!/"
	    GS.msg[16]= "* I ONLY DEACTIVATED THE&  FLAMES KNOWING THAT ALPHYS&  WOULD HAVE ANYWAY./"
	    GS.msg[17]= "* ... NOW, WHERE WERE WE?/"
	    GS.msg[18]= "* OH YES./"
	    GS.msg[19]= "* I WAS GOING TO ERADICATE&  YOU!/%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 55.1
	}

func _gm_event_7_0():
	if(con >= 20) {
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
